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
#include <llvm/IR/InstrTypes.h>
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
int NumPromoteGEP = 0;
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
static bool GEPpromoteMemToRegister(Function &F, DominatorTree &DT,AssumptionCache &AC);//还挺难的，需要进一步看代码实现过程
void GEPpromoteMemToReg(ArrayRef<GetElementPtrInst*> GEPs,DominatorTree &DT,AssumptionCache *AC);
bool rewriteSingleStoreGEP(GetElementPtrInst *GEP, GEPInfo &Info,
                           LargeBlockInfo &LBI, const DataLayout &DL,
                           DominatorTree &DT, AssumptionCache *AC);
void addAssumeNonNull(AssumptionCache *AC, LoadInst *LI);
bool promoteSingleBlockAllocaGEP(GetElementPtrInst *GEP, const GEPInfo &Info,
                                     LargeBlockInfo &LBI,
                                     const DataLayout &DL,
                                     DominatorTree &DT,
                                     AssumptionCache *AC);

bool promoteSingleBlockAllocaGEP(GetElementPtrInst *GEP, const GEPInfo &Info,
                                     LargeBlockInfo &LBI,
                                     const DataLayout &DL,
                                     DominatorTree &DT,
                                     AssumptionCache *AC){
  using StoresByIndexTy = SmallVector<std::pair<unsigned, StoreInst *>, 64>;
  StoresByIndexTy StoresByIndex;

  for (User *U : GEP->users())
    if (StoreInst *SI = dyn_cast<StoreInst>(U))
      StoresByIndex.push_back(std::make_pair(LBI.getInstructionIndex(SI), SI));

  // Sort the stores by their index, making it efficient to do a lookup with a
  // binary search.
  llvm::sort(StoresByIndex, less_first());

  // Walk all of the loads from this alloca, replacing them with the nearest
  // store above them, if any.
  for (User *U : make_early_inc_range(GEP->users())) {
    LoadInst *LI = dyn_cast<LoadInst>(U);
    if (!LI)
      continue;

    unsigned LoadIdx = LBI.getInstructionIndex(LI);

    // Find the nearest store that has a lower index than this load.
    StoresByIndexTy::iterator I = llvm::lower_bound(
        StoresByIndex,
        std::make_pair(LoadIdx, static_cast<StoreInst *>(nullptr)),
        less_first());
    Value *ReplVal;
    if (I == StoresByIndex.begin()) {
      if (StoresByIndex.empty())
        // If there are no stores, the load takes the undef value.
        ReplVal = UndefValue::get(LI->getType());
      else
        // There is no store before this load, bail out (load may be affected
        // by the following stores - see main comment).
        return false;
    } else {
      // Otherwise, there was a store before this load, the load takes its
      // value.
      ReplVal = std::prev(I)->second->getOperand(0);
    }

    // Note, if the load was marked as nonnull we don't want to lose that
    // information when we erase it. So we preserve it with an assume.
    if (AC && LI->getMetadata(LLVMContext::MD_nonnull) &&
        !isKnownNonZero(ReplVal, DL, 0, AC, LI, &DT))
      addAssumeNonNull(AC, LI);

    // If the replacement value is the load, this must occur in unreachable
    // code.
    if (ReplVal == LI)
      ReplVal = PoisonValue::get(LI->getType());

    LI->replaceAllUsesWith(ReplVal);
    LI->eraseFromParent();
    LBI.deleteValue(LI);
  }

  // Remove the (now dead) stores and alloca.alloc（GEP）不删除
  while (!GEP->use_empty()) {
    StoreInst *SI = cast<StoreInst>(GEP->user_back());
    SI->eraseFromParent();
    LBI.deleteValue(SI);
  }
  //暂时不可以删除GEP

  return true;
}



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
  if (!Info.UsingBlocks.empty()){
    return false; // If not, we'll have to fall back for the remainder.
  }
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
        ++NumPromoteGEP;
        ++NumSingelStoreGEP;
        continue;
      }
    }
/////////////Begin from here
    if(Info.OnlyUsedInOneBlock &&
       promoteSingleBlockAllocaGEP(GEP,Info,LBI,SQ.DL,DT,AC)){
      RemoveFromGEPsList(GEPNum);
      ++NumPromoteGEP;
      continue;
    }

    if(BBNumbers.empty()){
      unsigned ID = 0;
      for(auto& BB:F){
        BBNumbers[&BB] = ID++;
      }
    }
//TODO:step1
/**
    // Keep the reverse mapping of the 'Allocas' array for the rename pass.
    GEPLookup[GEPs[GEPNum]] = GEPNum;

    // Unique the set of defining blocks for efficient lookup.
    SmallPtrSet<BasicBlock *, 32> DefBlocks(Info.DefiningBlocks.begin(),
                                            Info.DefiningBlocks.end());

    // Determine which blocks the value is live in.  These are blocks which lead
    // to uses.
    SmallPtrSet<BasicBlock *, 32> LiveInBlocks;
    ComputeLiveInBlocks(GEP, Info, DefBlocks, LiveInBlocks);

    // At this point, we're committed to promoting the alloca using IDF's, and
    // the standard SSA construction algorithm.  Determine which blocks need phi
    // nodes and see if we can optimize out some work by avoiding insertion of
    // dead phi nodes.
    IDF.setLiveInBlocks(LiveInBlocks);
    IDF.setDefiningBlocks(DefBlocks);
    SmallVector<BasicBlock *, 32> PHIBlocks;
    IDF.calculate(PHIBlocks);
    llvm::sort(PHIBlocks, [this](BasicBlock *A, BasicBlock *B) {
      return BBNumbers.find(A)->second < BBNumbers.find(B)->second;
    });

    unsigned CurrentVersion = 0;
    for (BasicBlock *BB : PHIBlocks)
      QueuePhiNode(BB, GEPNum, CurrentVersion);
  }

  if (GEPs.empty())
    return; // All of the allocas must have been trivial!

  LBI.clear();
**/
// TODO:step2    
/**
  // Set the incoming values for the basic block to be null values for all of
  // the alloca's.  We do this in case there is a load of a value that has not
  // been stored yet.  In this case, it will get this null value.
  RenamePassData::ValVector Values(GEPs.size());
  for (unsigned i = 0, e = GEPs.size(); i != e; ++i)
    Values[i] = UndefValue::get(GEPs[i]->getResultElementType());

  // When handling debug info, treat all incoming values as if they have unknown
  // locations until proven otherwise.
  RenamePassData::LocationVector Locations(GEPs.size());

  // Walks all basic blocks in the function performing the SSA rename algorithm
  // and inserting the phi nodes we marked as necessary
  std::vector<RenamePassData> RenamePassWorkList;
  RenamePassWorkList.emplace_back(&F.front(), nullptr, std::move(Values),
                                  std::move(Locations));
  do {
    RenamePassData RPD = std::move(RenamePassWorkList.back());
    RenamePassWorkList.pop_back();
    // RenamePass may add new worklist entries.
    RenamePass(RPD.BB, RPD.Pred, RPD.Values, RPD.Locations, RenamePassWorkList);
  } while (!RenamePassWorkList.empty());

  // The renamer uses the Visited set to avoid infinite loops.  Clear it now.
  Visited.clear();

  // Remove the allocas themselves from the function.
  for (Instruction *G : GEPs) {
    // If there are any uses of the alloca instructions left, they must be in
    // unreachable basic blocks that were not processed by walking the dominator
    // tree. Just delete the users now.
    if (!G->use_empty())
      G->replaceAllUsesWith(PoisonValue::get(G->getType()));
    G->eraseFromParent();
  }
**/
//TODO:step3
    /**
    // Loop over all of the PHI nodes and see if there are any that we can get
  // rid of because they merge all of the same incoming values.  This can
  // happen due to undef values coming into the PHI nodes.  This process is
  // iterative, because eliminating one PHI node can cause others to be removed.
  bool EliminatedAPHI = true;
  while (EliminatedAPHI) {
    EliminatedAPHI = false;

    // Iterating over NewPhiNodes is deterministic, so it is safe to try to
    // simplify and RAUW them as we go.  If it was not, we could add uses to
    // the values we replace with in a non-deterministic order, thus creating
    // non-deterministic def->use chains.
    for (DenseMap<std::pair<unsigned, unsigned>, PHINode *>::iterator
             I = NewPhiNodes.begin(),
             E = NewPhiNodes.end();
         I != E;) {
      PHINode *PN = I->second;

      // If this PHI node merges one value and/or undefs, get the value.
      if (Value *V = simplifyInstruction(PN, SQ)) {
        PN->replaceAllUsesWith(V);
        PN->eraseFromParent();
        NewPhiNodes.erase(I++);
        EliminatedAPHI = true;
        continue;
      }
      ++I;
    }
  }

  // At this point, the renamer has added entries to PHI nodes for all reachable
  // code.  Unfortunately, there may be unreachable blocks which the renamer
  // hasn't traversed.  If this is the case, the PHI nodes may not
  // have incoming values for all predecessors.  Loop over all PHI nodes we have
  // created, inserting undef values if they are missing any incoming values.
  for (DenseMap<std::pair<unsigned, unsigned>, PHINode *>::iterator
           I = NewPhiNodes.begin(),
           E = NewPhiNodes.end();
       I != E; ++I) {
    // We want to do this once per basic block.  As such, only process a block
    // when we find the PHI that is the first entry in the block.
    PHINode *SomePHI = I->second;
    BasicBlock *BB = SomePHI->getParent();
    if (&BB->front() != SomePHI)
      continue;

    // Only do work here if there the PHI nodes are missing incoming values.  We
    // know that all PHI nodes that were inserted in a block will have the same
    // number of incoming values, so we can just check any of them.
    if (SomePHI->getNumIncomingValues() == getNumPreds(BB))
      continue;

    // Get the preds for BB.
    SmallVector<BasicBlock *, 16> Preds(predecessors(BB));

    // Ok, now we know that all of the PHI nodes are missing entries for some
    // basic blocks.  Start by sorting the incoming predecessors for efficient
    // access.
    auto CompareBBNumbers = [this](BasicBlock *A, BasicBlock *B) {
      return BBNumbers.find(A)->second < BBNumbers.find(B)->second;
    };
    llvm::sort(Preds, CompareBBNumbers);

    // Now we loop through all BB's which have entries in SomePHI and remove
    // them from the Preds list.
    for (unsigned i = 0, e = SomePHI->getNumIncomingValues(); i != e; ++i) {
      // Do a log(n) search of the Preds list for the entry we want.
      SmallVectorImpl<BasicBlock *>::iterator EntIt = llvm::lower_bound(
          Preds, SomePHI->getIncomingBlock(i), CompareBBNumbers);
      assert(EntIt != Preds.end() && *EntIt == SomePHI->getIncomingBlock(i) &&
             "PHI node has entry for a block which is not a predecessor!");

      // Remove the entry
      Preds.erase(EntIt);
    }

    // At this point, the blocks left in the preds list must have dummy
    // entries inserted into every PHI nodes for the block.  Update all the phi
    // nodes in this block that we are inserting (there could be phis before
    // mem2reg runs).
    unsigned NumBadPreds = SomePHI->getNumIncomingValues();
    BasicBlock::iterator BBI = BB->begin();
    while ((SomePHI = dyn_cast<PHINode>(BBI++)) &&
           SomePHI->getNumIncomingValues() == NumBadPreds) {
      Value *UndefVal = UndefValue::get(SomePHI->getType());
      for (BasicBlock *Pred : Preds)
        SomePHI->addIncoming(UndefVal, Pred);
    }
    **/
  }
  NewPhiNodes.clear();
}

void GEPpromoteMemToReg(ArrayRef<GetElementPtrInst*> GEPs, DominatorTree &DT, AssumptionCache *AC){
  if(GEPs.empty())  return;
  GEPpromoteMem2Reg(GEPs,DT,AC).run();
}

static bool GEPpromoteMemToRegister(Function &F, DominatorTree &DT, AssumptionCache &AC){
  std::vector<GetElementPtrInst*> GEPs;
  bool Changed = false;
  // alloc只在入口块中含有，但是GEP并不是，所以需要遍历所有的基本快
  for(auto& BB:F){ 
    while(true){
      GEPs.clear();
      NumPromoteGEP = 0;

      for(BasicBlock::iterator I=BB.begin(),E=--BB.end();I!=E;++I){
        if(GetElementPtrInst* GEP = dyn_cast<GetElementPtrInst>(I)){ // Use GEP
                                                                     // But there is a question "Is GEP's situation the same as alloc?"
          if(isGEPPromotable(GEP)){ 
            //llvm::outs()<<"push:"<<*GEP<<"\n";
            GEPs.push_back(GEP);
          }
        }
      }
      if(NumPromoteGEP + 1 == GEPs.size())  {
        //目前仅仅实现了SingleStore情况
        //所以 + 1临时用于debug
        //后期需要删除
        //llvm::outs()<<"can brea\n";
        break;
      }
      //llvm::outs()<<"GEPs size:"<<GEPs.size()<<"\n";//临时加的，后面记得删掉
      GEPpromoteMemToReg(GEPs,DT,&AC);
      break;//临时加的，后面记得删掉
            //忽略NumPromoted
      Changed = true;
    }
    break;//临时加的，后面记得删掉
  }
  return Changed;
}

bool isGEPPromotable(const GetElementPtrInst *GEP){  
  // 这里由于我们限制了GEP的使用场景
  // （仅仅适用于模拟堆栈操作的部分）
  // 所以这里对于load和store类型的判断暂且删除
  // (GEP从栈中拿出来都是i8，存的时候都用i32，但是不影响代码的正确性)
  for(const User *U : GEP->users()){    
    if (const LoadInst *LI = dyn_cast<LoadInst>(U)) {
      if (LI->isVolatile())
        return false;
    } else if (const StoreInst *SI = dyn_cast<StoreInst>(U)) {
      if (SI->getValueOperand() == GEP)
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


