; ModuleID = './afterInstru.ll'
source_filename = "mod"

@instrew_baseaddr = external global i64, !absolute_symbol !0
@llvm.used = appending global [3 x ptr] [ptr @instrew_baseaddr, ptr @syscall, ptr @cpuid], section "llvm.metadata"

declare void @syscall(ptr addrspace(1))

declare { i64, i64 } @cpuid(i32, i32)

; Function Attrs: mustprogress noinline norecurse nounwind optnone uwtable
define hhvmcc { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } @S0_hhvm(i64 %0, ptr addrspace(1) noalias nocapture align 16 dereferenceable(400) %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, i64 %7, i64 %8, i64 %9, i64 %10, i64 %11, i64 %12, i64 %13) #0 {
  %15 = inttoptr i64 %3 to ptr
  %16 = getelementptr i64, ptr %15, i64 -1
  store i64 %13, ptr %16, align 4
  %17 = getelementptr i8, ptr %15, i64 -12
  store i32 0, ptr %17, align 1
  %18 = getelementptr i8, ptr %15, i64 -28
  store i32 10, ptr %18, align 1
  %19 = getelementptr i64, ptr %15, i64 -4
  store i32 20, ptr %19, align 1
  %20 = getelementptr i8, ptr %15, i64 -36
  store i32 30, ptr %20, align 1
  br label %.preheader

.preheader:                                       ; preds = %14, %43
  %.011 = phi i32 [ 0, %14 ], [ %44, %43 ]
  br label %46

21:                                               ; preds = %43
  %22 = zext i32 %66 to i64
  %23 = getelementptr i64, ptr %15, i64 -3
  %24 = getelementptr i8, ptr %15, i64 -20
  %25 = getelementptr i64, ptr %15, i64 -2
  store i32 30, ptr %23, align 4
  store i32 20, ptr %24, align 4
  store i32 10, ptr %25, align 4
  %26 = load i64, ptr %16, align 4
  %27 = getelementptr i64, ptr %15, i64 1
  %28 = ptrtoint ptr %27 to i64
  %29 = load i64, ptr %15, align 4
  %30 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } undef, i64 %29, 0
  %31 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %30, i64 0, 8
  %32 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %31, i64 29, 5
  %33 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %32, i64 %22, 4
  %34 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %33, i64 %2, 1
  %35 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %34, i64 %28, 13
  %36 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %35, i64 %26, 11
  %37 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %36, i64 %5, 3
  %38 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %37, i64 %4, 2
  %39 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %38, i64 %8, 6
  %40 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %39, i64 %9, 7
  %41 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %40, i64 %11, 9
  %42 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %41, i64 %12, 10
  ret { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %42

43:                                               ; preds = %54
  %44 = add nuw nsw i32 %.011, 1
  %45 = icmp ugt i32 %.011, 8
  br i1 %45, label %21, label %.preheader

46:                                               ; preds = %.preheader, %54
  %.0310 = phi i32 [ 0, %.preheader ], [ %55, %54 ]
  %47 = zext i32 %.011 to i64
  %48 = mul nuw nsw i64 %47, 24000000
  %49 = add nuw nsw i64 %48, 139916665430080
  %50 = mul nuw nsw i64 %47, 12000
  %51 = add nuw nsw i64 %49, %50
  %52 = inttoptr i64 %51 to ptr
  %53 = getelementptr i32, ptr %52, i64 %47
  store i32 %.0310, ptr %53, align 4
  br label %.temp.branch

54:                                               ; preds = %.temp.branch
  %55 = add nuw nsw i32 %.0310, 1
  %56 = icmp ugt i32 %.0310, 18
  br i1 %56, label %43, label %46

.temp.branch:                                     ; preds = %46, %.temp.branch
  %.049 = phi i32 [ 0, %46 ], [ %67, %.temp.branch ]
  %57 = mul nuw nsw i32 %.0310, %.011
  %58 = mul nuw nsw i32 %57, %.049
  %59 = zext i32 %.0310 to i64
  %60 = mul nuw nsw i64 %59, 12000
  %61 = add nuw nsw i64 %60, %49
  %62 = zext i32 %.049 to i64
  %63 = inttoptr i64 %61 to ptr
  %64 = getelementptr i32, ptr %63, i64 %62
  %65 = load i32, ptr %64, align 4
  %66 = add i32 %65, %58
  store i32 %66, ptr %64, align 4
  %67 = add nuw nsw i32 %.049, 1
  %68 = icmp ugt i32 %.049, 28
  br i1 %68, label %54, label %.temp.branch
}

attributes #0 = { mustprogress noinline norecurse nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
