; ModuleID = './afterInstru.ll'
source_filename = "mod"

@instrew_baseaddr = external global i64, !absolute_symbol !0
@llvm.used = appending global [3 x ptr] [ptr @instrew_baseaddr, ptr @syscall, ptr @cpuid], section "llvm.metadata"

declare void @syscall(ptr addrspace(1))

declare { i64, i64 } @cpuid(i32, i32)

; Function Attrs: null_pointer_is_valid
define hhvmcc { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } @S0_hhvm(i64 %0, ptr addrspace(1) noalias nocapture align 16 dereferenceable(400) %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, i64 %7, i64 %8, i64 %9, i64 %10, i64 %11, i64 %12, i64 %13) #0 {
  %15 = getelementptr i8, ptr addrspace(1) %1, i64 136
  %16 = getelementptr i8, ptr addrspace(1) %1, i64 137
  %17 = getelementptr i8, ptr addrspace(1) %1, i64 138
  %18 = getelementptr i8, ptr addrspace(1) %1, i64 139
  %19 = getelementptr i8, ptr addrspace(1) %1, i64 140
  %20 = getelementptr i8, ptr addrspace(1) %1, i64 141
  %21 = inttoptr i64 %3 to ptr
  %22 = getelementptr i64, ptr %21, i64 -1
  store i64 %13, ptr %22, align 4
  %23 = getelementptr i8, ptr %22, i64 -4
  store i32 0, ptr %23, align 1
  %24 = getelementptr i8, ptr %22, i64 -20
  store i32 10, ptr %24, align 1
  %25 = getelementptr i8, ptr %22, i64 -24
  store i32 20, ptr %25, align 1
  %26 = getelementptr i8, ptr %22, i64 -28
  store i32 30, ptr %26, align 1
  br label %27

27:                                               ; preds = %71, %14
  %.0 = phi i32 [ 0, %14 ], [ %72, %71 ]
  %28 = phi i32 [ %61, %71 ], [ 20, %14 ]
  %29 = phi i32 [ 10, %71 ], [ 10, %14 ]
  %30 = phi i32 [ %72, %71 ], [ 0, %14 ]
  %31 = phi i64 [ %63, %71 ], [ %6, %14 ]
  %32 = phi i64 [ %64, %71 ], [ %7, %14 ]
  %33 = sub i32 %30, %29
  %34 = icmp slt i32 %33, 0
  %35 = icmp slt i32 %30, %29
  %36 = icmp ne i1 %34, %35
  %37 = icmp ne i1 %34, %36
  %38 = xor i1 %37, true
  br i1 %38, label %39, label %58

39:                                               ; preds = %27
  %40 = getelementptr i64, ptr %22, i64 1
  %41 = load i64, ptr %22, align 4
  %42 = getelementptr i64, ptr %40, i64 1
  %43 = ptrtoint ptr %42 to i64
  %44 = load i64, ptr %40, align 4
  store i1 undef, ptr addrspace(1) %15, align 1
  store i1 undef, ptr addrspace(1) %16, align 1
  store i8 undef, ptr addrspace(1) %17, align 1
  store i1 undef, ptr addrspace(1) %18, align 1
  store i1 undef, ptr addrspace(1) %19, align 1
  store i1 undef, ptr addrspace(1) %20, align 1
  %45 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } undef, i64 %44, 0
  %46 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %45, i64 0, 8
  %47 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %46, i64 %32, 5
  %48 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %47, i64 %31, 4
  %49 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %48, i64 %2, 1
  %50 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %49, i64 %43, 13
  %51 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %50, i64 %41, 11
  %52 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %51, i64 %5, 3
  %53 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %52, i64 %4, 2
  %54 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %53, i64 %8, 6
  %55 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %54, i64 %9, 7
  %56 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %55, i64 %11, 9
  %57 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %56, i64 %12, 10
  ret { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %57

58:                                               ; preds = %27
  %59 = getelementptr i8, ptr %22, i64 -12
  store i32 0, ptr %59, align 1
  br label %60

60:                                               ; preds = %93, %58
  %61 = phi i32 [ 20, %93 ], [ %28, %58 ]
  %62 = phi i32 [ %95, %93 ], [ 0, %58 ]
  %63 = phi i64 [ %85, %93 ], [ %31, %58 ]
  %64 = phi i64 [ %86, %93 ], [ %32, %58 ]
  %65 = sub i32 %62, %61
  %66 = icmp slt i32 %65, 0
  %67 = icmp slt i32 %62, %61
  %68 = icmp ne i1 %66, %67
  %69 = icmp ne i1 %66, %68
  %70 = xor i1 %69, true
  br i1 %70, label %71, label %73

71:                                               ; preds = %60
  %72 = add i32 %.0, 1
  br label %27

73:                                               ; preds = %60
  %74 = zext i32 %62 to i64
  %75 = sext i32 %.0 to i64
  %76 = mul i64 %75, 24000000
  %77 = add i64 139916665430080, %76
  %78 = mul i64 %75, 12000
  %79 = add i64 %77, %78
  %80 = inttoptr i64 %79 to ptr
  %81 = getelementptr i32, ptr %80, i64 %75
  store i32 %62, ptr %81, align 1
  %82 = getelementptr i8, ptr %22, i64 -16
  store i32 0, ptr %82, align 1
  br label %83

83:                                               ; preds = %.temp.branch, %73
  %84 = phi i32 [ %112, %.temp.branch ], [ 0, %73 ]
  %85 = phi i64 [ %110, %.temp.branch ], [ %74, %73 ]
  %86 = phi i64 [ %105, %.temp.branch ], [ %75, %73 ]
  %87 = sub i32 %84, 30
  %88 = icmp slt i32 %87, 0
  %89 = icmp slt i32 %84, 30
  %90 = icmp ne i1 %88, %89
  %91 = icmp ne i1 %88, %90
  %92 = xor i1 %91, true
  br i1 %92, label %93, label %.temp.branch

93:                                               ; preds = %83
  %94 = load i32, ptr %59, align 1
  %95 = add i32 %94, 1
  store i32 %95, ptr %59, align 1
  br label %60

.temp.branch:                                     ; preds = %83
  %96 = load i32, ptr %59, align 1
  %97 = mul i32 %.0, %96
  %98 = mul i32 %97, %84
  %99 = sext i32 %.0 to i64
  %100 = mul i64 %99, 24000000
  %101 = add i64 139916665430080, %100
  %102 = sext i32 %96 to i64
  %103 = mul i64 %102, 12000
  %104 = add i64 %101, %103
  %105 = sext i32 %84 to i64
  %106 = inttoptr i64 %104 to ptr
  %107 = getelementptr i32, ptr %106, i64 %105
  %108 = load i32, ptr %107, align 1
  %109 = add i32 %98, %108
  %110 = zext i32 %109 to i64
  store i32 %109, ptr %107, align 1
  %111 = load i32, ptr %82, align 1
  %112 = add i32 %111, 1
  store i32 %112, ptr %82, align 1
  br label %83
}

attributes #0 = { null_pointer_is_valid }

!llvm.module.flags = !{!1}

!0 = !{i64 -1, i64 -1}
!1 = !{i32 1, !"override-stack-alignment", i32 8}
