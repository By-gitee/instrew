#include "GEPPromotePass.h"
#include <llvm/IR/Function.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/IntrinsicInst.h>
#include <llvm/IR/PassManager.h>
#include <llvm/Support/Casting.h>
#include <llvm/Analysis/ValueTracking.h>

using namespace llvm;

bool isGEPPromotable(const GetElementPtrInst* GEP);
bool GEPmem2reg();//还挺难的，需要进一步看代码实现过程


PreservedAnalyses GEPPromotePass::run(Function &F,FunctionAnalysisManager &AM){
  return PreservedAnalyses::none();
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


