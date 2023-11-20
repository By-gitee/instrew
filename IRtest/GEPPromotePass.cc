#include "GEPPromotePass.h"
#include <cassert>
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
#include <llvm/Support/raw_ostream.h>

using namespace llvm;

static int NumSingelStoreGEP = 0;//NumSingleStore for GEP

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
      // 能够实现PHI节点之间传递的识别吗->已实现

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
  void RemoveFromGEPsList(unsigned &GEPIdx) {
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
bool rewriteSingleStoreGEP(GetElementPtrInst *GEP, GEPInfo &Info,
                                     LargeBlockInfo &LBI, const DataLayout &DL,
                                     DominatorTree &DT, AssumptionCache *AC);
void addAssumeNonNull(AssumptionCache *AC, LoadInst *LI);



void addAssumeNonNull(AssumptionCache *AC, LoadInst *LI){
    Function *AssumeIntrinsic =
          Intrinsic::getDeclaration(LI->getModule(), Intrinsic::assume);
    ICmpInst *LoadNotNull = new ICmpInst(ICmpInst::ICMP_NE, LI,
                                       Constant::getNullValue(LI->getType()));
    LoadNotNull->insertAfter(LI);
    CallInst *CI = CallInst::Create(AssumeIntrinsic, {LoadNotNull});
    CI->insertAfter(LoadNotNull);
    AC->registerAssumption(cast<AssumeInst>(CI));
}

bool rewriteSingleStoreGEP(GetElementPtrInst *GEP, GEPInfo &Info,
                                     LargeBlockInfo &LBI, const DataLayout &DL,
                                     DominatorTree &DT, AssumptionCache *AC) {
 StoreInst *OnlyStore = Info.OnlyStore;
  bool StoringGlobalVal = !isa<Instruction>(OnlyStore->getOperand(0));
  BasicBlock *StoreBB = OnlyStore->getParent();
  int StoreIndex = -1;

  Info.UsingBlocks.clear();

  for (User *U : make_early_inc_range(GEP->users())) {
    Instruction *UserInst = cast<Instruction>(U);
    if (UserInst == OnlyStore)
      continue;
    LoadInst *LI = cast<LoadInst>(UserInst);

    if (!StoringGlobalVal) { 
      if (LI->getParent() == StoreBB) {
        if (StoreIndex == -1)
          StoreIndex = LBI.getInstructionIndex(OnlyStore);

        if (unsigned(StoreIndex) > LBI.getInstructionIndex(LI)) {
          Info.UsingBlocks.push_back(StoreBB);
          continue;
        }
      } else if (!DT.dominates(StoreBB, LI->getParent())) {
        Info.UsingBlocks.push_back(LI->getParent());
        continue;
      }
    }

    Value *ReplVal = OnlyStore->getOperand(0);
    
    if (ReplVal == LI)
      ReplVal = PoisonValue::get(LI->getType());

    // If the load was marked as nonnull we don't want to lose
    // that information when we erase this Load. So we preserve
    // it with an assume.
    if (AC && LI->getMetadata(LLVMContext::MD_nonnull) &&
        !isKnownNonZero(ReplVal, DL, 0, AC, LI, &DT))
      addAssumeNonNull(AC, LI);

    // 这一步是必要的
    LI->replaceAllUsesWith(ReplVal);
    // load也应当被删除
    LI->eraseFromParent();
    LBI.deleteValue(LI);
  }

  // Finally, after the scan, check to see if the store is all that is left.
  if (!Info.UsingBlocks.empty())
    return false; // If not, we'll have to fall back for the remainder.
  
  // store以及GEP指令暂时不能够删除，留作后续分析
  //Info.OnlyStore->eraseFromParent();
  //LBI.deleteValue(Info.OnlyStore);

  //GEP->eraseFromParent();
  return true;
}

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
    //原函数中调用这一函数是为了删除Alloc中非load和非store指令
    //因为真正和内存操作相关的是load和store
    //通过暂且的分析来看，这一优化和GEP无关
    //removeIntrinsicUsers(GEP);

    //判断use_empty没有必要
    //因为在目前的优化下GEP仅剩第一次指令
    //不可删除，要用来做函数参数
    
    Info.AnalyzeGEP(GEP);

    if(Info.DefiningBlocks.size() == 1){
      if(rewriteSingleStoreGEP(GEP,Info,LBI,SQ.DL,DT,AC)){
        RemoveFromGEPsList(GEPNum);
        ++NumSingelStoreGEP;
        continue;
      }
    }

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
        if(isGEPPromotable(GEP)){ 
          llvm::outs()<<"push:"<<*GEP<<"\n";
          GEPs.push_back(GEP);
      }
    }
    }
    if(GEPs.empty())  break;

    GEPpromoteMemToReg(GEPs,DT,&AC);
    // 忽略NumPromoted
    Changed = true;
  }
  return Changed;
}

bool isGEPPromotable(const GetElementPtrInst *GEP){  
  //没有把所有的都push进去
  //这并不正确
  //需要debug

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
  return true;
}


