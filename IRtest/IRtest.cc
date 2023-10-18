#include <fstream>
#include <llvm/IR/Function.h>
#include <llvm/IR/InstIterator.h>
#include <llvm/IR/Instruction.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/Type.h>
#include <llvm/IRReader/IRReader.h>
#include <llvm/Support/InitLLVM.h>
#include <llvm/Support/SourceMgr.h>
#include <memory>
#include <system_error>

/** Analysis tools **/

void PrintInstDFG(llvm::Instruction* Inst);// PrintDFG of the node N
void PrintFunctionPHIDFG(llvm::Function* Func, std::fstream& file);
void PrintModulePHIDFG(llvm::Module* Mod, std::fstream& file); 

// Print DFG of the Instruction
// Attention: the Instruction should not be the instruction like store, br, .etc.
// and you need to code other codes to keep the print format.
void PrintInstDFG(llvm::Instruction* Inst){
  unsigned int type = Inst->getOpcode();
  if(type == llvm::Instruction::Br || type == llvm::Instruction::Store){
    llvm::errs()<<"[By]wrong print\n";
    return;
  }
  // TODO
}


// Print DFG of all PHI node in a function
void PrintFunctionPHIDFG(llvm::Function* Func, std::fstream& file){
  file<<"subgraph cluster_"<<Func->getName().data()<<" {"<<std::endl;
  llvm::inst_iterator I = llvm::inst_begin(Func);
  llvm::inst_iterator E = llvm::inst_end(Func);
  while(I!=E){
    if(I->getOpcode() == llvm::Instruction::PHI){
      llvm::Instruction* Inst = &(*I);
      PrintInstDFG(Inst);
    }
  }
  file<<"}"<<std::endl;
}

// Print DFG of all PHI node in a module
void PrintModulePHIDFG(llvm::Module* Mod,std::fstream& file){
  file<<"diagraph "<<Mod->getName().data()<<" {"<<std::endl;
  for(auto &F:Mod->getFunctionList()){
    PrintFunctionPHIDFG(&F,file);
  }
  file<<"}"<<std::endl;
}
int main(int argc, char **argv){
  // Load .ll
  llvm::InitLLVM X(argc ,argv);
  llvm::SMDiagnostic Err;
  std::unique_ptr<llvm::LLVMContext> Ctx = std::make_unique<llvm::LLVMContext>();
  std::unique_ptr<llvm::Module> Mod = llvm::parseIRFile("./afterInstru.ll",Err,*Ctx);

  return 0;
}
