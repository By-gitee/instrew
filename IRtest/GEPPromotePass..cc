#include "GEPPromotePass.h"
#include <llvm/IR/PassManager.h>

using namespace llvm;

PreservedAnalyses GEPPromotePass::run(Function &F,FunctionAnalysisManager &AM){
  return PreservedAnalyses::none();
}

