; ModuleID = './afterInstru.ll'
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
  %18 = getelementptr i8, ptr %15, i64 -28
  store i32 10, ptr %18, align 1
  %19 = getelementptr i64, ptr %15, i64 -4
  store i32 20, ptr %19, align 1
  %20 = getelementptr i8, ptr %15, i64 -36
  store i32 30, ptr %20, align 1
  br label %.preheader

.preheader:                                       ; preds = %.split, %41
  %indvars.iv18 = phi i32 [ 0, %.split ], [ %indvars.iv.next19, %41 ]
  %indvars.iv = phi i32 [ 0, %.split ], [ %indvars.iv.next, %41 ]
  %.015 = phi i32 [ 0, %.split ], [ %42, %41 ]
  br label %44

21:                                               ; preds = %41
  %22 = sext i32 29 to i64
  %23 = zext i32 undef to i64
  %24 = load i64, ptr %16, align 4
  %25 = getelementptr i64, ptr %15, i64 1
  %26 = ptrtoint ptr %25 to i64
  %27 = load i64, ptr %15, align 4
  %28 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } undef, i64 %27, 0
  %29 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %28, i64 0, 8
  %30 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %29, i64 %22, 5
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

41:                                               ; preds = %49
  %42 = add nuw nsw i32 %.015, 1
  %43 = icmp ugt i32 %42, 9
  %indvars.iv.next = add nuw nsw i32 %indvars.iv, 435
  %indvars.iv.next19 = add nuw nsw i32 %indvars.iv18, 82650
  br i1 %43, label %21, label %.preheader

44:                                               ; preds = %.preheader, %49
  %indvars.iv16 = phi i32 [ 0, %.preheader ], [ %indvars.iv.next17, %49 ]
  %.0313 = phi i32 [ 0, %.preheader ], [ %50, %49 ]
  %45 = sext i32 %.015 to i64
  %reass.mul = mul nsw i64 %45, 24012000
  %46 = add nsw i64 %reass.mul, 139916665430080
  %47 = inttoptr i64 %46 to ptr
  %48 = getelementptr i32, ptr %47, i64 %45
  store i32 %.0313, ptr %48, align 4
  br label %.temp.branch

49:                                               ; preds = %.temp.branch
  %50 = add nuw nsw i32 %.0313, 1
  %51 = icmp ugt i32 %50, 19
  %indvars.iv.next17 = add nuw nsw i32 %indvars.iv16, %indvars.iv
  br i1 %51, label %41, label %44

.temp.branch:                                     ; preds = %44, %.temp.branch
  %.0411 = phi i32 [ 0, %44 ], [ %52, %.temp.branch ]
  %52 = add nuw nsw i32 %.0411, 1
  br i1 true, label %49, label %.temp.branch
}

attributes #0 = { null_pointer_is_valid }

!llvm.module.flags = !{!1}

!0 = !{i64 -1, i64 -1}
!1 = !{i32 1, !"override-stack-alignment", i32 8}
