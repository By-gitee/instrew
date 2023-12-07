; ModuleID = './afterInstru.ll'
source_filename = "mod"

@instrew_baseaddr = external global i64, !absolute_symbol !0
@llvm.used = appending global [3 x ptr] [ptr @instrew_baseaddr, ptr @syscall, ptr @cpuid], section "llvm.metadata"
@arr0 = dso_local local_unnamed_addr global [10 x [2000 x [3000 x i32]]] zeroinitializer, align 16

declare void @syscall(ptr addrspace(1))

declare { i64, i64 } @cpuid(i32, i32)

; Function Attrs: mustprogress noinline norecurse nounwind optnone uwtable
define hhvmcc { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } @S0_hhvm(i64 %0, ptr addrspace(1) noalias nocapture align 16 dereferenceable(400) %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, i64 %7, i64 %8, i64 %9, i64 %10, i64 %11, i64 %12, i64 %13) #0 {
  br label %.split

.split:                                           ; preds = %14
  %15 = inttoptr i64 %3 to ptr
  br label %.preheader

.preheader:                                       ; preds = %.split, %36
  %.011 = phi i32 [ 0, %.split ], [ %37, %36 ]
  br label %39

17:                                               ; preds = %36
  %18 = zext i32 %51 to i64
  %19 = load i64, ptr %16, align 4
  %20 = getelementptr i64, ptr %15, i64 1
  %21 = ptrtoint ptr %20 to i64
  %22 = load i64, ptr %15, align 4
  %23 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } undef, i64 %22, 0
  %24 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %23, i64 0, 8
  %25 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %24, i64 29, 5
  %26 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %25, i64 %18, 4
  %27 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %26, i64 %2, 1
  %28 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %27, i64 %21, 13
  %29 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %28, i64 %19, 11
  %30 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %29, i64 %5, 3
  %31 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %30, i64 %4, 2
  %32 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %31, i64 %8, 6
  %33 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %32, i64 %9, 7
  %34 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %33, i64 %11, 9
  %35 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %34, i64 %12, 10
  ret { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %35

36:                                               ; preds = %42
  %37 = add nuw nsw i32 %.011, 1
  %38 = icmp ugt i32 %.011, 8
  br i1 %38, label %17, label %.preheader

39:                                               ; preds = %.preheader, %42
  %.0310 = phi i32 [ 0, %.preheader ], [ %43, %42 ]
  %40 = zext i32 %.011 to i64
  %41 = getelementptr inbounds [10 x [2000 x [3000 x i32]]], [10 x [2000 x [3000 x i32]]]* @arr0, i64 0, i32 %.011, i32 %.011, i32 %.011
  store i32 %.0310, ptr %41, align 4
  br label %.temp.branch

42:                                               ; preds = %.temp.branch
  %43 = add nuw nsw i32 %.0310, 1
  %44 = icmp ugt i32 %.0310, 18
  br i1 %44, label %36, label %39

.temp.branch:                                     ; preds = %39, %.temp.branch
  %.049 = phi i32 [ 0, %39 ], [ %52, %.temp.branch ]
  %45 = mul nuw nsw i32 %.0310, %.011
  %46 = mul nuw nsw i32 %45, %.049
  %47 = zext i32 %.0310 to i64
  %48 = zext i32 %.049 to i64
  %49 = getelementptr inbounds [10 x [2000 x [3000 x i32]]], [10 x [2000 x [3000 x i32]]]* @arr0, i64 0, i32 %.049, i32 %.0310, i32 %.011
  %50 = load i32, ptr %49, align 4
  %51 = add i32 %50, %46
  store i32 %51, ptr %49, align 4
  %52 = add nuw nsw i32 %.049, 1
  %53 = icmp ugt i32 %.049, 28
  br i1 %53, label %42, label %.temp.branch
}

attributes #0 = { mustprogress noinline norecurse nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)"}
