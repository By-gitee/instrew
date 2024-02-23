#include "GEPRestorePass.h"
#include "CodeGen/IslAst.h"
#include "ScopDetectionDiagnostic.h"
#include "ScopInfo.h"
#include <cassert>
#include <cstdio>
#include <llvm/ADT/APInt.h>
#include <llvm/ADT/ArrayRef.h>
#include <llvm/ADT/BitmaskEnum.h>
#include <llvm/ADT/StringExtras.h>
#include <llvm/ADT/iterator.h>
#include <llvm/Analysis/ScalarEvolution.h>
#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Constant.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/DerivedTypes.h>
#include <llvm/IR/Dominators.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/GlobalVariable.h>
#include <llvm/IR/InstIterator.h>
#include <llvm/IR/InstrTypes.h>
#include <llvm/IR/Instruction.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/IntrinsicInst.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Metadata.h>
#include <llvm/IR/PassManager.h>
#include <llvm/IR/Type.h>
#include <llvm/IR/Value.h>
#include <llvm/Support/Casting.h>
#include <llvm/Support/PointerLikeTypeTraits.h>
#include <llvm/Support/TypeSize.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/Transforms/Utils/LoopUtils.h>
#include <vector>
#include <string>
#include <stack>
using namespace llvm;

struct RestoreGEP{
  GetElementPtrInst* GEP = nullptr;  //相关的GEP指令
  IntToPtrInst* ComputeITP= nullptr; //相关inttoptr指令
  Value* baseAddr = nullptr;   //数组基地址
  Type* elementType = nullptr;       //元素类型
  std::vector<unsigned> dimSize;     //获取到的维度大小
  std::vector<Value*> index;         //数组各维度索引，目前实际值均为PHINode*，但是也有可能是常数 FIXME
  RestoreGEP(GetElementPtrInst* gep, IntToPtrInst* ITP,Type* type):GEP(gep),ComputeITP(ITP),elementType(type){};
};

std::vector<RestoreGEP*> RestoreGEPs;
std::map<ConstantInt*,GlobalVariable*> AddrGV;
std::set<Instruction*> EraseInsts;
std::vector<InsertValueInst*> InsertValInsts; 
std::map<Value*,Value*> Stores;
BasicBlock* RestoreExitBlock;

void analyzeAddrIndex(RestoreGEP *RG, ScalarEvolution &SE);
void insertNewGEP(RestoreGEP *RG, LLVMContext &Ctx);
bool isArg(Function* F,Value* v);

bool isArg(Function* F,Value* v){
  Function::arg_iterator i = F->arg_begin();
  Function::arg_iterator e = F->arg_end();
  while(i!=e){
    if(i == v){
      return true;
    }
    i++;
  }
  return false;
}
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
  /**
  if(AddrGV.count(RG->baseAddr)==0){
 GlobalVariable* arrayBase= new GlobalVariable(*(RG->GEP->getParent()->getParent()->getParent()),Type::getInt64Ty(Ctx),false,GlobalVariable::LinkageTypes::ExternalLinkage,RG->baseAddr);

//    GlobalVariable* arrayBase= new GlobalVariable(Type::getInt64Ty(Ctx),false,GlobalVariable::LinkageTypes::ExternalLinkage);
    llvm::Metadata* lim = llvm::ConstantAsMetadata::get(RG->baseAddr);
    llvm::MDNode* node = llvm::MDNode::get(Ctx,{lim,lim});
    arrayBase->setMetadata("absolute_symbol",node);

    std::string arrName = "arr" + itostr(AddrGV.size());
    arrayBase->setName(arrName);
    AddrGV[RG->baseAddr] = arrayBase;
  }
**/
  Value* ptr = nullptr;
  Type* i64 = llvm::Type::getInt64Ty(Ctx);
  PointerType* ptrTy = PointerType::get(i64,64); 
  if(ConstantInt* cst = dyn_cast<ConstantInt>(RG->baseAddr)){
  Constant* intVal = ConstantInt::get(i64,cst->getZExtValue());
  ptr = ConstantExpr::getIntToPtr(intVal,ptrTy);
  }
  else{
    ptr = ConstantExpr::getIntToPtr((ConstantInt*)RG->baseAddr,ptrTy);
  }
  //assert(0);
  //根据指针、索引、类型插入GEP指令i
  //而且需要replace
  std::vector<Value*> GEPindex;
  GEPindex.push_back(ConstantInt::get(Type::getInt64Ty(Ctx),0));
  for(int i=RG->index.size()-1;i>=0;i--){
    GEPindex.push_back(RG->index[i]);
  }
  ArrayRef<Value*> idXList(GEPindex);

  //创建新的GEP
  llvm::outs()<<*ptr<<"\n";
//  GetElementPtrInst* newGEP = GetElementPtrInst::CreateInBounds(ty,AddrGV[RG->baseAddr],idXList,"",RG->GEP);
  GetElementPtrInst* newGEP = GetElementPtrInst::CreateInBounds(ty,ptr,idXList,"",RG->GEP);
  //更换之前GEP所有的Use
  RG->GEP->replaceAllUsesWith(newGEP);
}

void analyzeAddrIndex(RestoreGEP *RG, ScalarEvolution &SE){
  std::queue<Value*> values;
  values.push(RG->ComputeITP);

  //先写入最低维度索引值，不过实际上这里可以不是zext，而是一个固定的值
  //因为常常有计算向某个特定位置写入值 FIXME
  Value* Index = nullptr;
  llvm::outs()<<"analyze"<<*RG->GEP<<"\n";
  llvm::outs()<<"analyze"<<*RG->GEP->getOperand(1)<<"\n";
  if(ZExtInst* zext = dyn_cast<ZExtInst>(RG->GEP->getOperand(1))){
    Index = zext;
    PHINode* phi = dyn_cast<PHINode>(zext->getOperand(0));
    assert(phi!=nullptr && "Not Phi");
    RG->index.push_back(zext);
  }
  else if(SExtInst* sext = dyn_cast<SExtInst>(RG->GEP->getOperand(1))){
    Index = sext;
    PHINode* phi = dyn_cast<PHINode>(sext->getOperand(0));
    //assert(phi!=nullptr && "Not Phi");
    RG->index.push_back(sext);
  }
  else if( ConstantInt* constantIndex = dyn_cast<ConstantInt>(RG->GEP->getOperand(1))){
    Index = constantIndex;
    RG->index.push_back(constantIndex);
  }
  assert(Index!=nullptr && "Not ZExt");

 
  while(1){
    Value* I = values.front();
    values.pop();
    llvm::outs()<<"[]"<<*I<<"\n";
    if(IntToPtrInst* i2p = dyn_cast<IntToPtrInst>(I)){
      values.push(i2p->getOperand(0));
      continue;
    }
    else if(BinaryOperator* b = dyn_cast<BinaryOperator>(I)){
      //判断oprand是否是常数，如果是不用push，记录到index或者baseAddr中
      //如果不是，就需要push到队列里面，根据不同的计算类型来判断是基地址还是偏移量
      if(b->getOpcode()!=BinaryOperator::Add && b->getOpcode()!=BinaryOperator::Mul){
        assert("Wrong BinaryOperator Expr\n");
      }
      bool isBase = (b->getOpcode()==BinaryOperator::Add)?true:false;

      values.push(b->getOperand(0));

      if(ConstantInt* cst = dyn_cast<ConstantInt>(b->getOperand(1))){
        if(isBase){
          RG->baseAddr = cst;
        }
        else{
          RG->dimSize.push_back(cst->getZExtValue());
        }
      }
      else if(isArg(b->getParent()->getParent(),b->getOperand(1))&&isBase){
        RG->baseAddr = b->getOperand(1);
      }
      else{
        values.push(b->getOperand(1));
      }
      EraseInsts.insert(b);
      /**
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
        }
        EraseInsts.insert(b);
      }
      **/
      continue;
    }
    else if(ZExtInst* zt = dyn_cast<ZExtInst>(I)){
      if(values.empty()){
        PHINode* Phi = dyn_cast<PHINode>(zt->getOperand(0));
        assert(Phi!=nullptr && "Not Phi");
        RG->index.push_back(zt);
        break;
      }
      RG->index.push_back(zt);
    }
    else if(SExtInst* st = dyn_cast<SExtInst>(I)){
      RG->index.push_back(st);
      if(values.empty()){
        break;
      }
    }
    else{
      //只可能出现以上三种情况，如果出现其他情况，需要更新代码，或者说程序出现了错误
      assert(0 && "Wrong Expr\n");
    }
  }

  llvm::outs()<<*RG->GEP<<"\n";
  //根据获取到的信息分析索引值
  assert(RG->baseAddr!=nullptr && "baseAddr Analysis failed\n");
  assert(!RG->dimSize.empty() && "index Analysis failed\n");
  assert(!RG->index.empty() && "phi index analysis failed\n");
  assert(RG->dimSize.size()+1==RG->index.size() && "Unmatch index & dimSize size");

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
//    printf("restore1\n");
    RG->dimSize.push_back(SE.getUnsignedRangeMax(scev).getZExtValue()+1);
  //  printf("restore2\n");
  }
  else{
    //FIXME:实现其他元素类型
    assert("Unsupported Element Type\n");
  }
  llvm::outs()<<"END\n";
}


PreservedAnalyses GEPRestorePass::run(Function &F, FunctionAnalysisManager &AM){
  auto &SE = AM.getResult<ScalarEvolutionAnalysis>(F);
  auto I = llvm::inst_begin(F);
  auto E = llvm::inst_end(F);
  while(I!=E){
    Instruction* inst = &(*I);
    if(GetElementPtrInst* i = dyn_cast<GetElementPtrInst>(inst)){
      if(I->getPrevNode()==nullptr){
        I++;
        continue;
      }
      if(IntToPtrInst* pi = dyn_cast<IntToPtrInst>(I->getPrevNode())){
        if(dyn_cast<BinaryOperator>(pi->getOperand(0))){
          RestoreGEP* newRestoreGEP= new RestoreGEP(i,pi,i->getResultElementType());
          RestoreGEPs.push_back(newRestoreGEP);
        }
      }
    }
    else if(InsertValueInst* iv = dyn_cast<InsertValueInst>(inst)){
      InsertValInsts.push_back(iv);
    }
    else if(inst->getOpcode()==Instruction::Ret){
      RestoreExitBlock=inst->getParent();
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

  // 删除原有冗余的指令
  for(auto &inst:EraseInsts){
    if(inst->use_empty()){
    inst->eraseFromParent();
  }
  }
  for(auto item: RestoreGEPs){
    delete item;
  }

  I = llvm::inst_begin(F);
  E = llvm::inst_end(F);
  while(I!=E){
    Instruction* inst = &(*I);
    if(StoreInst* s = dyn_cast<StoreInst>(inst)){
      Stores[s->getOperand(0)]=s->getOperand(1);
    }
    I++;
  }
/**
  // 恢复非参数最终的返回指令
  for(InsertValueInst* iv : InsertValInsts){
    llvm::outs()<<"=="<<*iv->getOperand(1)<<"\n";
    Value* operand = iv->getOperand(1);
    Instruction* i=dyn_cast<Instruction>(operand);
    if(i==nullptr)continue;

    std::queue<Instruction*> insts;
    Instruction* oldValue;
    insts.push(i);
    while(!insts.empty()){
      Instruction* inst = insts.front();
      insts.pop();

      unsigned int op = inst->getOpcode();
      if(op==Instruction::Load || op == Instruction::PtrToInt){
        continue;
      }
      
      if(Stores.count(inst)!=0){//说明有store操作，找到了存储的地方
        if(GetElementPtrInst* gep2inst = dyn_cast<GetElementPtrInst>(Stores[inst])){
          std::vector<Value*> GEPindex;
          for(int x=1;x<gep2inst->getNumOperands();x++){
      //      const SCEV* scev = SE.getSCEV(gep2inst->getOperand(x));
      //      APInt api = SE.getSignedRangeMax(scev);
      //      Constant* stant = ConstantInt::get(Type::getInt64Ty(gep2inst->getContext()),api);
            GEPindex.push_back(gep2inst->getOperand(x));
          }
          ArrayRef<Value*> IdXList(GEPindex);
          ArrayType* vt = dyn_cast<ArrayType>(gep2inst->getSourceElementType());
          if(vt){
            GetElementPtrInst* newGEP = GetElementPtrInst::CreateInBounds(vt,gep2inst->getOperand(0),IdXList,"",&RestoreExitBlock->front());
            LoadInst* load = new LoadInst(inst->getType(),newGEP,"",newGEP->getNextNode());
      for(Instruction& I :*RestoreExitBlock){
        I.replaceUsesOfWith(oldValue,load);
      }

          }
            break;
        }
      }
      if(inst->getNumOperands()==1){//没有store操作，那就继续顺着找，遇到多操作数就不沿着往上找了
        if(Instruction* inst_oprand = dyn_cast<Instruction>(inst->getOperand(0))){
          insts.push(inst_oprand);
          oldValue = inst_oprand;
        }
      }
      
    }
    
  }
**/
  PreservedAnalyses PA = PreservedAnalyses::none();
  return PA;
}


