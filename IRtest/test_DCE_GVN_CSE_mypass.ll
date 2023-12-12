; ModuleID = '../test.ll'
source_filename = "mod"

@instrew_baseaddr = external global i64, !absolute_symbol !0
@llvm.used = appending global [3 x ptr] [ptr @instrew_baseaddr, ptr @syscall, ptr @cpuid], section "llvm.metadata"

declare void @syscall(ptr addrspace(1))

declare { i64, i64 } @cpuid(i32, i32)

; Function Attrs: null_pointer_is_valid
define hhvmcc { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } @S0_hhvm(i64 %0, ptr addrspace(1) noalias nocapture align 16 dereferenceable(400) %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, i64 %7, i64 %8, i64 %9, i64 %10, i64 %11, i64 %12, i64 %13) #0 {
  br label %.split

.split:                                           ; preds = %14
  %15 = inttoptr i64 %3 to ptr
  %16 = getelementptr i64, ptr %15, i64 -1
  store i64 %13, ptr %16, align 4
  %17 = getelementptr i8, ptr %15, i64 -12
  store i32 0, ptr %17, align 1
  %18 = getelementptr i64, ptr %15, i64 -7
  store i64 10, ptr %18, align 1
  %19 = getelementptr i64, ptr %15, i64 -8
  store i64 20, ptr %19, align 1
  %20 = getelementptr i64, ptr %15, i64 -9
  store i64 30, ptr %20, align 1
  br label %.preheader

.preheader:                                       ; preds = %.split, %42
  %.08 = phi i64 [ 0, %.split ], [ %43, %42 ]
  br label %45

21:                                               ; preds = %42
  %22 = getelementptr i64, ptr %15, i64 -6
  %23 = getelementptr i64, ptr %15, i64 -5
  %24 = getelementptr i64, ptr %15, i64 -4
  store i64 30, ptr %22, align 4
  store i64 20, ptr %23, align 4
  store i64 10, ptr %24, align 4
  %25 = load i64, ptr %16, align 4
  %26 = getelementptr i64, ptr %15, i64 1
  %27 = ptrtoint ptr %26 to i64
  %28 = load i64, ptr %15, align 4
  %29 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } undef, i64 %28, 0
  %30 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %29, i64 0, 8
  %31 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %30, i64 9, 5
  %32 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %31, i64 19, 4
  %33 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %32, i64 %2, 1
  %34 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %33, i64 %27, 13
  %35 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %34, i64 %25, 11
  %36 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %35, i64 %5, 3
  %37 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %36, i64 %4, 2
  %38 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %37, i64 %8, 6
  %39 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %38, i64 %9, 7
  %40 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %39, i64 %11, 9
  %41 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %40, i64 %12, 10
  ret { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %41

42:                                               ; preds = %50
  %43 = add nuw nsw i64 %.08, 1
  %44 = icmp ugt i64 %.08, 8
  br i1 %44, label %21, label %.preheader

45:                                               ; preds = %.preheader, %50
  %46 = phi i64 [ 0, %.preheader ], [ %51, %50 ]
  %reass.mul = mul nuw nsw i64 %.08, 48024000
  %47 = add nuw nsw i64 %reass.mul, 140501931139136
  %48 = inttoptr i64 %47 to ptr
  %49 = getelementptr i64, ptr %48, i64 %.08
  store i64 %46, ptr %49, align 8
  br label %53

50:                                               ; preds = %53
  %51 = add nuw nsw i64 %46, 1
  %52 = icmp ugt i64 %46, 18
  br i1 %52, label %42, label %45

53:                                               ; preds = %45, %53
  %54 = phi i64 [ 0, %45 ], [ %58, %53 ]
  %55 = mul nuw nsw i64 %46, %.08
  %56 = mul nuw nsw i64 %55, %54
  %57 = getelementptr i64, ptr %15, i64 -3
  store i64 %56, ptr %57, align 1
  %58 = add nuw nsw i64 %54, 1
  %59 = icmp ugt i64 %54, 28
  br i1 %59, label %50, label %53
}

attributes #0 = { null_pointer_is_valid }

!llvm.module.flags = !{!1}

!0 = !{i64 -1, i64 -1}
!1 = !{i32 1, !"override-stack-alignment", i32 8}
