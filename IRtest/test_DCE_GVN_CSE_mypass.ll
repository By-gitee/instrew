  %65 = getelementptr i32, ptr %64, i64 %63
  %64 = inttoptr i64 %62 to ptr
  %62 = add nuw nsw i64 %61, %49
{{139916665430080,+,24000000}<nuw><nsw><%41>,+,12000}<nuw><nsw><%46>  %65 = getelementptr i32, ptr %64, i64 %63
  %64 = inttoptr i64 %62 to ptr
  %62 = add nuw nsw i64 %61, %49
{{139916665430080,+,24000000}<nuw><nsw><%41>,+,12000}<nuw><nsw><%46>  %65 = getelementptr i32, ptr %64, i64 %63
  %64 = inttoptr i64 %62 to ptr
  %62 = add nuw nsw i64 %61, %49
{{139916665430080,+,24000000}<nuw><nsw><%41>,+,12000}<nuw><nsw><%46>[Bydebug]-1
[Bydebug]-2
[Bydebug]-3
[Bydebug]-4
[Bydebug]-5
[Bydebug]-6
判定
Checking region:%14 => <Function Return>
	判定
Checking region:%41 => %22
	ret1
ret2
ret3
ret4
ret5
    0
  store i32 0, ptr %42, align 4 Here?            isValidAccess - 1
            isValidAccess - 2
0
            isValidAccess - 1
            isValidAccess - 2
判定
Checking region:%46 => %43
	ret1
ret2
ret3
ret4
ret5
    0
  store i32 %.0310, ptr %53, align 4 Here?            isValidAccess - 1
            isValidAccess - 2
0
            isValidAccess - 1
            isValidAccess - 2
判定
Checking region:.temp.branch => %55
	ret1
ret2
ret3
ret4
ret5
    0
  %66 = load i32, ptr %65, align 4 Here?            isValidAccess - 1
            isValidAccess - 2
0
            isValidAccess - 1
            isValidAccess - 2
%14 => <Function Return>
[Bydebug]-6 ValidRegions.size(): 0
[Bydebug]-7
[Bydebug]-7 for
[Bydebug]-71 ValidRegions.size(): 0
[Bydebug]-7 for
[Bydebug]-71 ValidRegions.size(): 0
[Bydebug]-7 for
[Bydebug]-71 ValidRegions.size(): 0
[Bydebug]-72 ValidRegions.size(): 0
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
  %17 = getelementptr i8, ptr %15, i64 -12
  store i32 0, ptr %17, align 1
  %18 = getelementptr i8, ptr %15, i64 -28
  store i32 10, ptr %18, align 1
  %19 = getelementptr i64, ptr %15, i64 -4
  store i32 20, ptr %19, align 1
  %20 = getelementptr i8, ptr %15, i64 -36
  store i32 30, ptr %20, align 1
  %21 = getelementptr i64, ptr %15, i64 -2
  store i32 0, ptr %21, align 4
  br label %41

22:                                               ; preds = %43
  %23 = zext i32 %67 to i64
  %24 = load i64, ptr %16, align 4
  %25 = getelementptr i64, ptr %15, i64 1
  %26 = ptrtoint ptr %25 to i64
  %27 = load i64, ptr %15, align 4
  %28 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } undef, i64 %27, 0
  %29 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %28, i64 0, 8
  %30 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %29, i64 29, 5
  %31 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %30, i64 %23, 4
  %32 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %31, i64 %2, 1
  %33 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %32, i64 %26, 13
  %34 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %33, i64 %24, 11
  %35 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %34, i64 %5, 3
  %36 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %35, i64 %4, 2
  %37 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %36, i64 %8, 6
  %38 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %37, i64 %9, 7
  %39 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %38, i64 %11, 9
  %40 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %39, i64 %12, 10
  ret { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %40

41:                                               ; preds = %.split, %43
  %.011 = phi i32 [ 0, %.split ], [ %44, %43 ]
  %42 = getelementptr i8, ptr %15, i64 -20
  store i32 0, ptr %42, align 4
  br label %46

43:                                               ; preds = %55
  %44 = add nuw nsw i32 %.011, 1
  store i32 %44, ptr %21, align 4
  %45 = icmp ugt i32 %.011, 8
  br i1 %45, label %22, label %41

46:                                               ; preds = %41, %55
  %.0310 = phi i32 [ 0, %41 ], [ %56, %55 ]
  %47 = zext i32 %.011 to i64
  %48 = mul nuw nsw i64 %47, 24000000
  %49 = add nuw nsw i64 %48, 139916665430080
  %50 = mul nuw nsw i64 %47, 12000
  %51 = add nuw nsw i64 %49, %50
  %52 = inttoptr i64 %51 to ptr
  %53 = getelementptr i32, ptr %52, i64 %47
  store i32 %.0310, ptr %53, align 4
  %54 = getelementptr i64, ptr %15, i64 -3
  store i32 0, ptr %54, align 4
  br label %.temp.branch

55:                                               ; preds = %.temp.branch
  %56 = add nuw nsw i32 %.0310, 1
  store i32 %56, ptr %42, align 4
  %57 = icmp ugt i32 %.0310, 18
  br i1 %57, label %43, label %46

.temp.branch:                                     ; preds = %46, %.temp.branch
  %.049 = phi i32 [ 0, %46 ], [ %68, %.temp.branch ]
  %58 = mul nuw nsw i32 %.0310, %.011
  %59 = mul nuw nsw i32 %58, %.049
  %60 = zext i32 %.0310 to i64
  %61 = mul nuw nsw i64 %60, 12000
  %62 = add nuw nsw i64 %61, %49
  %63 = zext i32 %.049 to i64
  %64 = inttoptr i64 %62 to ptr
  %65 = getelementptr i32, ptr %64, i64 %63
  %66 = load i32, ptr %65, align 4
  %67 = add i32 %66, %59
  store i32 %67, ptr %65, align 4
  %68 = add nuw nsw i32 %.049, 1
  store i32 %68, ptr %54, align 4
  %69 = icmp ugt i32 %.049, 28
  br i1 %69, label %55, label %.temp.branch
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind null_pointer_is_valid uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!1}

!0 = !{i64 -1, i64 -1}
!1 = !{i32 1, !"override-stack-alignment", i32 8}
[Bydebug]ScopInfo is empty.
