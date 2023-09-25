#include "llvm/IR/PassManager.h"

namespace llvm{

class DataProcessPass : public PassInfoMixin<DataProcessPass>{
public:
  PreservedAnalyses run(Function &F, FunctionAnalysisManager &AM);
};

}
