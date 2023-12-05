#include "GEPRestorePass.h"
#include "ScopDetectionDiagnostic.h"
#include "ScopInfo.h"
#include <cassert>
#include <llvm/ADT/ArrayRef.h>
#include <llvm/ADT/BitmaskEnum.h>
#include <llvm/ADT/iterator.h>
#include <llvm/Analysis/ScalarEvolution.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/DerivedTypes.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/InstIterator.h>
#include <llvm/IR/InstrTypes.h>
#include <llvm/IR/Instruction.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/PassManager.h>
#include <llvm/IR/Type.h>
#include <llvm/IR/Value.h>
#include <llvm/Support/Casting.h>
#include <vector>
#include <stack>
using namespace llvm;
//仅作分析，不进行处理
struct RestoreGEP{
  GetElementPtrInst* GEP = nullptr;  //相关的GEP指令
  IntToPtrInst* ComputeITP= nullptr; //相关inttoptr指令
  ConstantInt* baseAddr = nullptr;   //数组基地址
  unsigned bitWidth;          //元素大小
  PHINode* PhiIndex = nullptr;       //最高一级索引对应的phi节点
  std::vector<unsigned> index;       //获取到的维度大小
  RestoreGEP(GetElementPtrInst* gep, IntToPtrInst* ITP,unsigned bitwidth):GEP(gep),ComputeITP(ITP),bitWidth(bitwidth){};
};

std::vector<RestoreGEP*> RestoreGEPs;
std::set<Instruction*> EraseInsts;

void analyzeAddrIndex(RestoreGEP* RG);

void analyzeAddrIndex(RestoreGEP* RG){
  std::queue<Value*> values;
  values.push(RG->ComputeITP);
  while(1){
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

      for(int i=0;i<b->getNumOperands();i++){
        if(ConstantInt* cst = dyn_cast<ConstantInt>(b->getOperand(i))){
          //存储值？貌似直接存储ConstantInt就行，修改baseAddr类型
          if(isBase) {
            RG->baseAddr = cst;
            continue;
          }
          RG->index.push_back(cst->getZExtValue());
        }
        else{
          values.push(b->getOperand(i));
          EraseInsts.insert(dyn_cast<Instruction>(b->getOperand(i)));
        }
      }
      continue;
    }
    else if(ZExtInst* zt = dyn_cast<ZExtInst>(I)){
      if(values.empty()){
        RG->PhiIndex = dyn_cast<PHINode>(zt->getOperand(0));
        break;
      }
    }
    else{
      //只可能出现以上三种情况，如果出现其他情况，需要更新代码，或者说程序出现了错误
      llvm::outs()<<*I<<"\n";
      assert("Wrong Expr\n");
    }
  }
  //根据获取到的信息分析索引值
  assert(RG->baseAddr!=nullptr && "baseAddr Analysis failed\n");
  assert(!RG->index.empty() && "index Analysis failed\n");
  assert(RG->PhiIndex != nullptr && "phi index analysis failed\n");
  //整数类型
  assert(RG->bitWidth%8==0);
  unsigned ByteSize = RG->bitWidth/8;
  assert(ByteSize != 0);
  RG->index[0]/=ByteSize;
  for(int i = 1;i<RG->index.size();i++){
    RG->index[i]/=RG->index[i-1]*ByteSize;
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
        if(dyn_cast<BinaryOperator>(pi->getOperand(0))){
          RestoreGEP* newRestoreGEP= new RestoreGEP(i,pi,i->getResultElementType()->getIntegerBitWidth());
          RestoreGEPs.push_back(newRestoreGEP);
        }
      }
    }
    I++;
  }

  for(auto item: RestoreGEPs){
    GetElementPtrInst* GEP = item->GEP;
    IntToPtrInst* ITP = item->ComputeITP;
    EraseInsts.insert(GEP);
    EraseInsts.insert(ITP);
    analyzeAddrIndex(item);
    //获取最高级索引
    const SCEV* scev = SE.getSCEV(item->PhiIndex);
    item->index.push_back(SE.getUnsignedRangeMax(scev).getZExtValue()+1);
    //插入构建好的GEP指令
    ConstantInt
    ArrayRef<Value*> IdxList(item->index);
    //GetElementPtrInst::Create(GEP->getPointerOperandType(),item->baseAddr,)
//TODO
    //    GEP->replaceAllUsesWith();
/**
    llvm::outs()<<"GEP result:"<<*item->baseAddr;
      llvm::outs()<<item->index.size();
      for(auto i: item->index){
      llvm::outs()<<'['<<i<<']';
      }
      llvm::outs()<<"\n";
**/
  }
  //删除原有的指令
  for(auto item: RestoreGEPs){
    delete item;
  }

  return PreservedAnalyses::none();
}


