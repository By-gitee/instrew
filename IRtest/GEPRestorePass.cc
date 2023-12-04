#include "GEPRestorePass.h"
#include "ScopDetectionDiagnostic.h"
#include "ScopInfo.h"
#include <cassert>
#include <llvm/ADT/iterator.h>
#include <llvm/Analysis/ScalarEvolution.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/InstIterator.h>
#include <llvm/IR/InstrTypes.h>
#include <llvm/IR/Instruction.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/PassManager.h>
#include <llvm/Support/Casting.h>
#include <vector>
#include <stack>
using namespace llvm;

struct RestoreGEP{
  GetElementPtrInst* GEP = nullptr;
  IntToPtrInst* ComputeITP= nullptr;
  unsigned baseAddr = 0;
  std::vector<unsigned> index;
  RestoreGEP(GetElementPtrInst* gep, IntToPtrInst* ITP):GEP(gep),ComputeITP(ITP){};
};

std::vector<RestoreGEP*> RestoreGEPs;
std::set<Instruction*> EraseInsts;

void analyzeAddrIndex(RestoreGEP* RG);

void analyzeAddrIndex(RestoreGEP* RG){
  std::queue<Value*> values;
  values.push(RG->ComputeITP);
  while(!values.empty()){
    Value* I = values.front();
    values.pop();

    if(IntToPtrInst* i2p = dyn_cast<IntToPtrInst>(I)){
      values.push(i2p->getOperand(0));
      continue;
    }
    else if(BinaryOperator* b = dyn_cast<BinaryOperator>(I)){
      //判断oprand是否是常数，如果是不用push，记录到index或者baseAddr中
      //如果不是，就需要push到队列里面，根据不同的计算类型来判断是基地址还是偏移量
      if(b->getOpcode()!=BinaryOperator::Add && b->getOpcode()!=BinaryOperator::Mul){
        llvm::outs()<<*b<<"\n";
        assert("Wrong BinaryOperator Expr\n");
      }
       bool isBase = (b->getOpcode()==BinaryOperator::Add)?true:false;
       if(ConstantInt* cst = dyn_cast<ConstantInt>(b->getOperand(0))){
         //存储值？貌似直接存储ConstantInt就行，修改baseAddr类型
// TODO         RG->baseAddr = cst->getValue();
       }
       else{
         values.push(b->getOperand(0));
         continue;
       }
       //对mul也这么操作
   }
    else if(ZExtInst* zt = dyn_cast<ZExtInst>(I)){
      // 说明是末尾了，如果说这是最后一个也就是说size == 1？（再思考）
      // 就直接读取它的最大取值范围作为数组最后一级的大小
    }
    else{
      llvm::outs()<<*I<<"\n";
      assert("Wrong Expr\n");
    }
  }
}


PreservedAnalyses GEPRestorePass::run(Function &F, FunctionAnalysisManager &AM){
  auto &SE = AM.getResult<ScalarEvolutionAnalysis>(F);
  auto I = llvm::inst_begin(F);
  auto E = llvm::inst_end(F);
  while(I!=E){
    Instruction* inst = &(*I);
    if(GetElementPtrInst* i = dyn_cast<GetElementPtrInst>(inst)){
      if(IntToPtrInst* pi = dyn_cast<IntToPtrInst>(I->getPrevNode())){
        RestoreGEP newRestoreGEP(i,pi);
        RestoreGEPs.push_back(&newRestoreGEP);
      }
    }
    I++;
  }
  for(auto &item: RestoreGEPs){
    GetElementPtrInst* GEP = item->GEP;
    IntToPtrInst* ITP = item->ComputeITP;
    EraseInsts.insert(GEP);
    EraseInsts.insert(ITP);
    analyzeAddrIndex(item);
    //    llvm::outs()<<*item->ComputeITP->getOperand(0)<<"\n";
    //    const SCEV* scev = SE.getSCEV(item->ComputeITP->getOperand(0));
    //    scev->print(llvm::outs());
  }
  /** 
    llvm::outs()<<*i<<"\n";
    const SCEV* scev = SE.getSCEV(i);  
    scev->print(llvm::outs());
    llvm::outs()<<" max:"<<SE.getUnsignedRangeMax(scev)<<"\n";
    llvm::outs()<<" here:"<<*i->getOperand(0);
    llvm::outs()<<"\n";
   **/
  return PreservedAnalyses::none();
}


