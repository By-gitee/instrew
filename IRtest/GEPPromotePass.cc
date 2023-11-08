#include "GEPPromotePass.h"
#include <llvm/ADT/ArrayRef.h>
#include <llvm/ADT/DenseMap.h>
#include <llvm/ADT/DenseMapInfo.h>
#include <llvm/ADT/SmallPtrSet.h>
#include <llvm/ADT/SmallVector.h>
#include <llvm/Analysis/AliasAnalysis.h>
#include <llvm/Analysis/AssumptionCache.h>
#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Dominators.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/IntrinsicInst.h>
#include <llvm/IR/PassManager.h>
#include <llvm/Support/Casting.h>
#include <llvm/Analysis/ValueTracking.h>
#include <llvm/Analysis/InstructionSimplify.h>
#include <llvm/Analysis//IteratedDominanceFrontier.h>

using namespace llvm;
namespace{

struct GEPInfo{
  SmallVector<BasicBlock *,32> DefiningBlocks;
  SmallVector<BasicBlock *,32> UsingBlocks;

  StoreInst *OnlyStore;
  BasicBlock *OnlyBlock;
  bool OnlyUsedInOneBlock;

  void clear(){
    DefiningBlocks.clear();
    UsingBlocks.clear();
    OnlyStore = nullptr;
    OnlyBlock = nullptr;
    OnlyUsedInOneBlock = true;
  }

  void AnalyzeGEP(GetElementPtrInst *GEP){
    clear();

    // As we scan the uses of the GEP instruction, keep track of stores,
    // and decide whether all of the loads and stores to the alloca are within
    // the same basic block.
    for (User *U : GEP->users()) {
      Instruction *User = cast<Instruction>(U);

      if (StoreInst *SI = dyn_cast<StoreInst>(User)) {
        // Remember the basic blocks which define new values for the alloca
        DefiningBlocks.push_back(SI->getParent());
        OnlyStore = SI;
      } else {
        LoadInst *LI = cast<LoadInst>(User);
        // Otherwise it must be a load instruction, keep track of variable
        // reads.
        UsingBlocks.push_back(LI->getParent());
      }
      // 不过实际上GEP指令的user也可能是一个cast相关的，好消息是cast不影响
      // 坏消息是实际上GEP会通过使用PHI阶段传来传去
      // 能够实现PHI节点之间传递的识别吗

      if (OnlyUsedInOneBlock) {
        if (!OnlyBlock)
          OnlyBlock = User->getParent();
        else if (OnlyBlock != User->getParent())
          OnlyUsedInOneBlock = false;
      }
    }

  }
};

/// This assigns and keeps a per-bb relative ordering of load/store
/// instructions in the block that directly load or store an alloca.
///
/// This functionality is important because it avoids scanning large basic
/// blocks multiple times when promoting many allocas in the same block.
class LargeBlockInfo {
  /// For each instruction that we track, keep the index of the
  /// instruction.
  ///
  /// The index starts out as the number of the instruction from the start of
  /// the block.
  DenseMap<const Instruction *, unsigned> InstNumbers;

public:

  static bool isInterestingInstruction(const Instruction *I) {
    return (isa<LoadInst>(I) && isa<GetElementPtrInst>(I->getOperand(0))) ||
           (isa<StoreInst>(I) && isa<GetElementPtrInst>(I->getOperand(1)));
  }

  /// Get or calculate the index of the specified instruction.
  unsigned getInstructionIndex(const Instruction *I) {
    assert(isInterestingInstruction(I) &&
           "Not a load/store to/from an alloca?");

    // If we already have this instruction number, return it.
    DenseMap<const Instruction *, unsigned>::iterator It = InstNumbers.find(I);
    if (It != InstNumbers.end())
      return It->second;

    // Scan the whole block to get the instruction.  This accumulates
    // information for every interesting instruction in the block, in order to
    // avoid gratuitus rescans.
    const BasicBlock *BB = I->getParent();
    unsigned InstNo = 0;
    for (const Instruction &BBI : *BB)
      if (isInterestingInstruction(&BBI))
        InstNumbers[&BBI] = InstNo++;
    It = InstNumbers.find(I);

    assert(It != InstNumbers.end() && "Didn't insert instruction?");
    return It->second;
  }

  void deleteValue(const Instruction *I) { InstNumbers.erase(I); }

  void clear() { InstNumbers.clear(); }
};

struct RenamePassData {
  using ValVector = std::vector<Value *>;
  using LocationVector = std::vector<DebugLoc>;

  RenamePassData(BasicBlock *B, BasicBlock *P, ValVector V, LocationVector L)
      : BB(B), Pred(P), Values(std::move(V)), Locations(std::move(L)) {}

  BasicBlock *BB;
  BasicBlock *Pred;
  ValVector Values;
  LocationVector Locations;
};

struct GEPpromoteMem2Reg{
  // The GEP Instruction being Promoted
  std::vector<GetElementPtrInst *> GEPs;

  DominatorTree &DT;

  AssumptionCache *AC;

  const SimplifyQuery SQ;//what for??

  DenseMap<GetElementPtrInst*,unsigned> GEPLookup;

  DenseMap<std::pair<unsigned,unsigned>,PHINode*> NewPhiNodes;

  DenseMap<PHINode *,unsigned> PhiToGEPMap;

  SmallPtrSet<BasicBlock*,16> Visited;

  DenseMap<BasicBlock*,unsigned> BBNumbers;

  DenseMap<const BasicBlock*, unsigned> BBNumPreds;

public:
  GEPpromoteMem2Reg(ArrayRef<GetElementPtrInst*> GEPs,DominatorTree &DT, AssumptionCache *AC):
    GEPs(GEPs.begin(),GEPs.end()),DT(DT),AC(AC),SQ(DT.getRoot()->getParent()->getParent()->getDataLayout(),
                                                   nullptr,&DT,AC){}
  void run();

private:
  void RemoveFromAllocasList(unsigned &GEPIdx) {
    GEPs[GEPIdx] = GEPs.back();
    GEPs.pop_back();
    --GEPIdx;
  }

  unsigned getNumPreds(const BasicBlock *BB) {
    unsigned &NP = BBNumPreds[BB];
    if (NP == 0)
      NP = pred_size(BB) + 1;
    return NP - 1;
  }

  void ComputeLiveInBlocks(AllocaInst *AI, GEPInfo &Info,
                           const SmallPtrSetImpl<BasicBlock *> &DefBlocks,
                           SmallPtrSetImpl<BasicBlock *> &LiveInBlocks);
  void RenamePass(BasicBlock *BB, BasicBlock *Pred,
                  RenamePassData::ValVector &IncVals,
                  RenamePassData::LocationVector &IncLocs,
                  std::vector<RenamePassData> &Worklist);
  bool QueuePhiNode(BasicBlock *BB, unsigned AllocaIdx, unsigned &Version);

};
}


bool isGEPPromotable(const GetElementPtrInst* GEP);
bool GEPpromoteMemToRegister(Function &F, DominatorTree &DT,AssumptionCache &AC);//还挺难的，需要进一步看代码实现过程
void GEPpromoteMemToReg(ArrayRef<GetElementPtrInst*> GEPs,DominatorTree &DT,AssumptionCache *AC);

PreservedAnalyses GEPPromotePass::run(Function &F,FunctionAnalysisManager &AM){
  auto &DT = AM.getResult<DominatorTreeAnalysis>(F);
  auto &AC = AM.getResult<AssumptionAnalysis>(F);
  if(!GEPpromoteMemToRegister(F,DT,AC)){
    return PreservedAnalyses::all();
  }

  PreservedAnalyses PA;
  PA.preserveSet<CFGAnalyses>();
  return PA;
}

void GEPpromoteMem2Reg::run(){
  Function &F = *DT.getRoot()->getParent();

  GEPInfo Info;
  LargeBlockInfo LBI;
  ForwardIDFCalculator IDF(DT);

  for(unsigned GEPNum = 0; GEPNum != GEPs.size(); ++GEPNum){
    GetElementPtrInst * GEP = GEPs[GEPNum];

    //TODO:首先完成第一部分，即简单情况下的提升过程
    removeIntrinsicUsers(GEP);

  }

}



void GEPpromoteMemToReg(ArrayRef<GetElementPtrInst*> GEPs, DominatorTree &DT, AssumptionCache *AC){
  if(GEPs.empty())  return;
  GEPpromoteMem2Reg(GEPs,DT,AC).run();
}


bool GEPpromoteMemToRegister(Function &F, DominatorTree &DT, AssumptionCache &AC){
  std::vector<GetElementPtrInst*> GEPs;
  BasicBlock &BB = F.getEntryBlock();
  bool Changed = false;

  while(true){
    GEPs.clear();

    for(BasicBlock::iterator I=BB.begin(),E=--BB.end();I!=E;++I){
      if(GetElementPtrInst* GEP = dyn_cast<GetElementPtrInst>(I)){ // Use GEP
                                                                   // But there is a question "Is GEP's situation the same as alloc?"
        if(isGEPPromotable(GEP)) GEPs.push_back(GEP);
      }
    }

    if(GEPs.empty())  break;

    GEPpromoteMemToReg(GEPs,DT,&AC);
    // 忽略NumPromoted
    Changed = true;
  }
}

bool isGEPPromotable(const GetElementPtrInst *GEP){  
  for(const User *U : GEP->users()){
    if (const LoadInst *LI = dyn_cast<LoadInst>(U)) {
      if (LI->isVolatile() || LI->getType() != GEP->getResultElementType())
        return false;
    } else if (const StoreInst *SI = dyn_cast<StoreInst>(U)) {
      if (SI->getValueOperand() == GEP ||
          SI->getValueOperand()->getType() != GEP->getResultElementType())
        return false; 
      if (SI->isVolatile())
        return false;
    } else if (const IntrinsicInst *II = dyn_cast<IntrinsicInst>(U)) {
      if (!II->isLifetimeStartOrEnd() && !II->isDroppable())
        return false;
    } else if (const BitCastInst *BCI = dyn_cast<BitCastInst>(U)) {
      if (!onlyUsedByLifetimeMarkersOrDroppableInsts(BCI))
        return false;
    } else if (const GetElementPtrInst *GEPI = dyn_cast<GetElementPtrInst>(U)) {
      if (!GEPI->hasAllZeroIndices())
        return false;
      if (!onlyUsedByLifetimeMarkersOrDroppableInsts(GEPI))
        return false;
    } else if (const AddrSpaceCastInst *ASCI = dyn_cast<AddrSpaceCastInst>(U)) {
      if (!onlyUsedByLifetimeMarkers(ASCI))
        return false;
    } else {
      return false;
    }

  }
}


