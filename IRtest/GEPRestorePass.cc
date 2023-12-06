#include "GEPRestorePass.h"
#include "ScopDetectionDiagnostic.h"
#include "ScopInfo.h"
#include <cassert>
#include <cstdio>
#include <llvm/ADT/ArrayRef.h>
#include <llvm/ADT/BitmaskEnum.h>
#include <llvm/ADT/iterator.h>
#include <llvm/Analysis/ScalarEvolution.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/DerivedTypes.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/GlobalVariable.h>
#include <llvm/IR/InstIterator.h>
#include <llvm/IR/InstrTypes.h>
#include <llvm/IR/Instruction.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/PassManager.h>
#include <llvm/IR/Type.h>
#include <llvm/IR/Value.h>
#include <llvm/Support/Casting.h>
#include <llvm/Support/TypeSize.h>
#include <vector>
#include <stack>
using namespace llvm;

struct RestoreGEP{
  GetElementPtrInst* GEP = nullptr;  //相关的GEP指令
  IntToPtrInst* ComputeITP= nullptr; //相关inttoptr指令
  ConstantInt* baseAddr = nullptr;   //数组基地址
  Type* elementType = nullptr;       //元素类型
  std::vector<unsigned> dimSize;     //获取到的维度大小
  std::vector<Value*> index;         //数组各维度索引，目前实际值均为PHINode*，但是也有可能是常数 FIXME
  RestoreGEP(GetElementPtrInst* gep, IntToPtrInst* ITP,Type* type):GEP(gep),ComputeITP(ITP),elementType(type){};
};

std::vector<RestoreGEP*> RestoreGEPs;
std::set<Instruction*> EraseInsts;

void analyzeAddrIndex(RestoreGEP *RG, ScalarEvolution &SE);
void insertNewGEP(RestoreGEP *RG, LLVMContext &Ctx);


void insertNewGEP(RestoreGEP *RG,LLVMContext &Ctx){
  //构建GEP数组类型
  //目前仅实现整数数组
  Type* EleType = nullptr;
  if(RG->elementType->getTypeID()==Type::TypeID::IntegerTyID){
    switch(RG->elementType->getIntegerBitWidth()){
    case 8:
      EleType = Type::getInt32Ty(Ctx);
      break;
    case 16:
      EleType = Type::getInt16Ty(Ctx);
      break;
    case 32:
      EleType = Type::getInt32Ty(Ctx);
      break;    
    case 64:
      EleType = Type::getInt64Ty(Ctx);
      break;
    case 128:
      EleType = Type::getInt128Ty(Ctx);
    default:
      EleType = Type::getInt64Ty(Ctx);
    }
  }
  else{
    //FIXME
    assert("unsupported Type\n");
  }

  llvm::ArrayType *ty = llvm::ArrayType::get(EleType,RG->dimSize[0]);
  //构建数组类型
  for(int i=1;i<RG->dimSize.size();i++){
    ty = llvm::ArrayType::get(ty,RG->dimSize[i]);
  }

  //创建全局指针变量
  GlobalVariable arrayBase(Type::getInt64Ty(Ctx),true,GlobalValue::LinkageTypes::ExternalLinkage);
  //TODO : 插入不进去啊
  // RG->GEP->getParent()->getParent()->getParent()->getGlobalList().push_back(&arrayBase);
//  arrayBase.setInitializer(RG->baseAddr);
  //  llvm::outs()<<arrayBase<<"\n";
}

void analyzeAddrIndex(RestoreGEP *RG, ScalarEvolution &SE){
  std::queue<Value*> values;
  values.push(RG->ComputeITP);

  //先写入最低维度索引值，不过实际上这里可以不是zext，而是一个固定的值
  //因为常常有计算向某个特定位置写入值 FIXME
  ZExtInst* zext = dyn_cast<ZExtInst>(RG->GEP->getOperand(1));
  assert(zext!=nullptr && "Not ZExt");
  
  PHINode* phi = dyn_cast<PHINode>(zext->getOperand(0));
  assert(phi!=nullptr && "Not Phi");
  
  RG->index.push_back(phi);

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
          RG->dimSize.push_back(cst->getZExtValue());
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
        PHINode* Phi = dyn_cast<PHINode>(zt->getOperand(0));
        assert(Phi!=nullptr && "Not Phi");
        RG->index.push_back(Phi);
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
  assert(!RG->dimSize.empty() && "index Analysis failed\n");
  assert(!RG->index.empty() && "phi index analysis failed\n");
  assert(RG->dimSize.size()==RG->index.size() && "Unmatch index & dimSize size");

  //目前只有整数部分可以进行分析
  if(RG->elementType->getTypeID()==Type::TypeID::IntegerTyID){
    //根据元素类型分析对应维度大小（第一维度除外的其他维度）
    unsigned bitWidth = RG->elementType->getIntegerBitWidth();
    assert(bitWidth%8==0);

    unsigned ByteSize = bitWidth/8;
    assert(ByteSize != 0);
    RG->dimSize[0]/=ByteSize;
    for(int i = 1;i<RG->dimSize.size();i++){
      RG->dimSize[i]/=RG->dimSize[i-1]*ByteSize;
    }

    //根据phi节点分析得到的取值范围获取第一维度 FIXME:如果是常数类型呢
    //貌似根据同的变量，会判断得到不同的范围
    //一个初步的想法：如果是相同地址，直接取各个phi节点最大范围的最大值
    const SCEV* scev = SE.getSCEV(RG->index.back());
    RG->dimSize.push_back(SE.getUnsignedRangeMax(scev).getZExtValue()+1);
  }
  else{
    //FIXME:实现其他元素类型
    assert("Unsupported Element Type\n");
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
          RestoreGEP* newRestoreGEP= new RestoreGEP(i,pi,i->getResultElementType());
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
    
    //分析GEP数组基地址、索引对应变量以及各维度大小
    analyzeAddrIndex(item,SE);
  
    //插入构建好的GEP指令
    insertNewGEP(item,F.getContext());
  /** 
    //维度分析输出测试
    llvm::outs()<<"GEP result:"<<*item->baseAddr;
    llvm::outs()<<item->dimSize.size();
    for(auto i: item->dimSize){
    llvm::outs()<<'['<<i<<']';
    }
    llvm::outs()<<"\n";
   **/
    //TODO
    //    GEP->replaceAllUsesWith();

  }
  //删除原有的指令
  for(auto item: RestoreGEPs){
    delete item;
  }

  return PreservedAnalyses::none();
}


