#include <cstdio>
#include <fstream>
#include <ios>
#include <llvm/Analysis/AliasAnalysis.h>
#include <llvm/Analysis/AssumptionCache.h>
#include <llvm/Analysis/CGSCCPassManager.h>
#include <llvm/Analysis/LoopAnalysisManager.h>
#include <llvm/Analysis/LoopInfo.h>
#include <llvm/Analysis/OptimizationRemarkEmitter.h>
#include <llvm/Analysis/RegionInfo.h>
#include <llvm/Analysis/TargetTransformInfo.h>
#include <llvm/IR/DataLayout.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/InstIterator.h>
#include <llvm/IR/Instruction.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/PassManager.h>
#include <llvm/IR/Type.h>
#include <llvm/IR/Use.h>
#include <llvm/IR/Value.h>
#include <llvm/IRReader/IRReader.h>
#include <llvm/Passes/PassBuilder.h>
#include <llvm/Support/Casting.h>
#include <llvm/Support/InitLLVM.h>
#include <llvm/Support/SourceMgr.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/Transforms/Scalar/DCE.h>
#include <llvm/Transforms/Scalar/EarlyCSE.h>
#include <llvm/Transforms/Scalar/LoopPassManager.h>
#include <llvm/Transforms/Utils/Mem2Reg.h>
#include <llvm/Transforms/Scalar/GVN.h>
#include <memory>
#include <queue>
#include <system_error>
#include <iostream>
#include <map>
#include <vector>
#include <set>
/** Analysis tools **/
std::string get_name(llvm::Value* value);

void PrintInstDFG(llvm::Instruction* Inst, std::fstream& file);
void PrintFunctionPHIDFG(llvm::Function* Func, std::fstream& file);
void PrintModulePHIDFG(llvm::Module* Mod, std::fstream& file); 


/**Transform tools**/

//TODO

int main(int argc, char **argv){
  // Load .ll
  llvm::InitLLVM X(argc ,argv);
  llvm::SMDiagnostic Err;
  std::unique_ptr<llvm::LLVMContext> Ctx = std::make_unique<llvm::LLVMContext>();
  //std::unique_ptr<llvm::Module> Mod = llvm::parseIRFile("./afterInstru.ll",Err,*Ctx);
  std::unique_ptr<llvm::Module> Mod = llvm::parseIRFile("./test.ll",Err,*Ctx);
   /**
  // Print PHI DDG to analyze
  std::fstream file;
  file.open("DCEPHIdfg.dot",std::ios::out);
  PrintModulePHIDFG(&(*Mod),file);
  file.close();
  **/
  
  llvm::PassBuilder pb;
  llvm::FunctionPassManager fpm;
  llvm::ModulePassManager mpm;

  llvm::FunctionAnalysisManager fam;
  llvm::ModuleAnalysisManager mam;
  
  pb.registerModuleAnalyses(mam);
  pb.registerFunctionAnalyses(fam);

  mam.registerPass([&]{return llvm::FunctionAnalysisManagerModuleProxy(fam);});
  fam.registerPass([&]{return llvm::ModuleAnalysisManagerFunctionProxy(mam);});
  fam.registerPass([&]{return llvm::PassInstrumentationAnalysis();});
  
  // Add Pass
  fpm.addPass(llvm::DCEPass());
  fpm.addPass(llvm::PromotePass());
  //fpm.addPass(llvm::EarlyCSEPass(true));
  //实现关于GEP的fpm.addPass(llvm::PromotePass());

  mpm.addPass(llvm::createModuleToFunctionPassAdaptor(std::move(fpm)));
  mpm.run(*Mod,mam);

  // Print the Module
  Mod->print(llvm::outs(),nullptr);
  Mod.reset();

  return 0;
}


// Get the name of the Value
std::string get_name(llvm::Value* value){
  std::string name;
  llvm::raw_string_ostream OS(name);
  value->printAsOperand(OS,false);
  return OS.str();
}

// Print DFG of the Instruction
// Attention: the Instruction should not be the instruction like store, br, .etc.
// and you need to code other codes to keep the print format.
void PrintInstDFG(llvm::Instruction* Inst, std::fstream& file){
  //std::cout<<"printing Inst DFG\n";
  std::map<llvm::Instruction*,std::vector<llvm::Instruction*>> inst_map;
  std::queue<llvm::Instruction*> insts;
  std::set<llvm::Instruction*> insts_set;
  //llvm::Value* V;
  llvm::Instruction* I;
  insts.push(Inst);
  while(!insts.empty()){
    I = insts.front();
    insts.pop();

    auto op = I->operands().begin();
    auto op_end = I->operands().end();
    while(op!=op_end){
     if(auto op_I = llvm::dyn_cast<llvm::Instruction>(op->get())){
        if(inst_map.find(op_I)==inst_map.end()){
          inst_map[op_I] = std::vector<llvm::Instruction*>() ;
        }
        else if(std::count(inst_map[op_I].begin(),inst_map[op_I].end(),I)){
          op++;
          continue;
        }
        insts_set.insert(I);
        insts_set.insert(op_I);
        inst_map[op_I].push_back(I);
        insts.push(op_I);
      }
      op++;
    }
    // Attention: Check the overlapping
    llvm::Value* V = (llvm::Value*)I;
    for(auto U : V->users()){
      if(auto user_I = llvm::dyn_cast<llvm::Instruction>(U)){
        if(inst_map.find(I)==inst_map.end()){
          inst_map[I] = std::vector<llvm::Instruction*>();
        }
        else if(std::count(inst_map[I].begin(),inst_map[I].end(),user_I)){
          continue;
        }
        insts_set.insert(I);
        insts_set.insert(user_I);
        inst_map[I].push_back(user_I);
        insts.push(user_I);
      }
    }
  }
  // print DFG to .dot
  std::vector<llvm::Instruction*> insts_set2vec(insts_set.begin(),insts_set.end());
  for(int i = 0;i<insts_set2vec.size();i++){
    llvm::outs()<<i<<"[label=\""<<*insts_set2vec[i]<<"\"];\n";
  }
  for(auto it : inst_map){
    for(int i=0;i<it.second.size();i++){
    llvm::outs()<<std::find(insts_set2vec.begin(),insts_set2vec.end(),it.first)-insts_set2vec.begin()<<"->"<<std::find(insts_set2vec.begin(),insts_set2vec.end(),it.second[i])-insts_set2vec.begin()<<";\n";
    }
  }
}


// Print DFG of all PHI node in a function
void PrintFunctionPHIDFG(llvm::Function* Func, std::fstream& file){
  //std::cout<<"PrintFunctionPHIDFG\n";
  llvm::outs()<<"subgraph cluster_"<<Func->getName().data()<<" {\n";
  llvm::inst_iterator I = llvm::inst_begin(Func);
  llvm::inst_iterator E = llvm::inst_end(Func);
  while(I!=E){
    if(I->getOpcode() == llvm::Instruction::PHI && get_name(&(*I))=="%39"){
      llvm::Instruction* Inst = &(*I);
      PrintInstDFG(Inst, file);
    }
   I++; 
  }
  llvm::outs()<<"}\n";
}

// Print DFG of all PHI node in a module
void PrintModulePHIDFG(llvm::Module* Mod,std::fstream& file){
  //std::cout<<"PrintModulePHIDFG\n";
  llvm::outs()<<"digraph "<<"PHIdfg"<<" {\n";
  for(auto &F:Mod->getFunctionList()){
    PrintFunctionPHIDFG(&F,file);
  }
  llvm::outs()<<"}\n";
}


