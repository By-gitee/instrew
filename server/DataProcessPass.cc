#include "DataProcessPass.h"
#include <llvm/IR/PassManager.h>

using namespace llvm;

PreservedAnalyses DataProcessPass::run(Function &F, FunctionAnalysisManager &AM){
  return PreservedAnalyses::none();
}
