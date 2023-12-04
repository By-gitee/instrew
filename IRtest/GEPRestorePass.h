#include "llvm/IR/PassManager.h"

namespace llvm{

class Function;

class GEPRestorePass : public PassInfoMixin<GEPRestorePass>{
public:
  PreservedAnalyses run(Function &F, FunctionAnalysisManager &AM);
};

}
