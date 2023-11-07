#include "GEPPromotePass.h"
#include <llvm/ADT/ArrayRef.h>
#include <llvm/ADT/DenseMap.h>
#include <llvm/ADT/DenseMapInfo.h>
#include <llvm/ADT/SmallPtrSet.h>
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

using namespace llvm;

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

  //TODO
};

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


