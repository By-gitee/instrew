push:  %23 = getelementptr i8, ptr %22, i64 -4
push:  %24 = getelementptr i8, ptr %22, i64 -20
push:  %25 = getelementptr i8, ptr %22, i64 -24
push:  %26 = getelementptr i8, ptr %22, i64 -28
push:  %27 = getelementptr i8, ptr %22, i64 -8
push:  %55 = getelementptr i8, ptr %22, i64 -12
push:  %77 = getelementptr i8, ptr %22, i64 -16
[Bydebug]-1
[Bydebug]-2
[Bydebug]-3
[Bydebug]-4
[Bydebug]-5
[Bydebug]-6
[Bydebug]-61
[Bydebug]-62
[Bydebug]-63
[Bydebug]-61
[Bydebug]-62
[Bydebug]-63
[Bydebug]-61
[Bydebug]-62
[Bydebug]-63
[Bydebug]-61
[Bydebug]-62
[Bydebug]-63
[Bydebug]-64
[Bydebug]-65
[Bydebug]-66
[Bydebug]-64
[Bydebug]-65
[Bydebug]-66
[Bydebug]-64
[Bydebug]-65
[Bydebug]-66
[Bydebug]-64
[Bydebug]-65
[Bydebug]-66
%14 => <Function Return>
[Bydebug]-6 ValidRegions.size(): 0
[Bydebug]-7
[Bydebug]-7 for
[Bydebug]-71 ValidRegions.size(): 0
[Bydebug]-72 ValidRegions.size(): 0
[Bydebug]-7 for
[Bydebug]-71 ValidRegions.size(): 0
[Bydebug]-7 for
[Bydebug]-71 ValidRegions.size(): 0
[Bydebug]-7 for
[Bydebug]-71 ValidRegions.size(): 0
[Bydebug]-8
[Bydebug]-8 ValidRegions.size(): 0
[Bydebug]-9
[Bydebug]-9 ValidRegions.size(): 0
[Bydebug]-10
[Bydebug]-10 ValidRegions.size(): 0
[Bydebug]-11
[ByDebug]recomput
; ModuleID = './afterInstru.ll'
source_filename = "mod"

@instrew_baseaddr = external global i64, !absolute_symbol !0
@llvm.used = appending global [3 x ptr] [ptr @instrew_baseaddr, ptr @syscall, ptr @cpuid], section "llvm.metadata"

declare void @syscall(ptr addrspace(1))

declare { i64, i64 } @cpuid(i32, i32)

; Function Attrs: mustprogress nofree norecurse nosync nounwind null_pointer_is_valid uwtable
define hhvmcc { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } @S0_hhvm(i64 %0, ptr addrspace(1) noalias nocapture align 16 dereferenceable(400) %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, i64 %7, i64 %8, i64 %9, i64 %10, i64 %11, i64 %12, i64 %13) #0 {
  br label %.split

.split:                                           ; preds = %14
  %15 = inttoptr i64 %3 to ptr
  %16 = getelementptr i64, ptr %15, i64 -1
  store i64 %13, ptr %16, align 4
  br label %.preheader

.preheader:                                       ; preds = %.split, %36
  %.011 = phi i32 [ 0, %.split ], [ %37, %36 ]
  br label %39

17:                                               ; preds = %36
  %.lcssa.lcssa.lcssa = phi i32 [ %.lcssa.lcssa, %36 ]
  %18 = zext i32 %.lcssa.lcssa.lcssa to i64
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

36:                                               ; preds = %47
  %.lcssa.lcssa = phi i32 [ %.lcssa, %47 ]
  %37 = add nuw nsw i32 %.011, 1
  %38 = icmp ugt i32 %37, 9
  br i1 %38, label %17, label %.preheader

39:                                               ; preds = %.preheader, %47
  %.0310 = phi i32 [ 0, %.preheader ], [ %48, %47 ]
  %40 = sext i32 %.011 to i64
  %41 = mul nsw i64 %40, 24000000
  %42 = add nsw i64 %41, 139916665430080
  %43 = mul nsw i64 %40, 12000
  %44 = add nsw i64 %42, %43
  %45 = inttoptr i64 %44 to ptr
  %46 = getelementptr i32, ptr %45, i64 %40
  store i32 %.0310, ptr %46, align 4
  br label %.temp.branch

47:                                               ; preds = %.temp.branch
  %.lcssa = phi i32 [ %59, %.temp.branch ]
  %48 = add nuw nsw i32 %.0310, 1
  %49 = icmp ugt i32 %48, 19
  br i1 %49, label %36, label %39

.temp.branch:                                     ; preds = %39, %.temp.branch
  %.049 = phi i32 [ 0, %39 ], [ %60, %.temp.branch ]
  %50 = mul nuw nsw i32 %.0310, %.011
  %51 = mul nuw nsw i32 %50, %.049
  %52 = sext i32 %.0310 to i64
  %53 = mul nsw i64 %52, 12000
  %54 = add nsw i64 %53, %42
  %55 = sext i32 %.049 to i64
  %56 = inttoptr i64 %54 to ptr
  %57 = getelementptr i32, ptr %56, i64 %55
  %58 = load i32, ptr %57, align 4
  %59 = add i32 %58, %51
  store i32 %59, ptr %57, align 4
  %60 = add nuw nsw i32 %.049, 1
  %61 = icmp ugt i32 %60, 29
  br i1 %61, label %47, label %.temp.branch
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind null_pointer_is_valid uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!1}

!0 = !{i64 -1, i64 -1}
!1 = !{i32 1, !"override-stack-alignment", i32 8}
[Bydebug]ScopInfo is empty.
