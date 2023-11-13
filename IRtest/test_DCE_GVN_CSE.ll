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
  %27 = getelementptr i8, ptr %22, i64 -8
  store i32 0, ptr %27, align 1
  br label %28

28:                                               ; preds = %72, %14
  %29 = phi i32 [ %62, %72 ], [ 20, %14 ]
  %30 = phi i32 [ %.pre, %72 ], [ 10, %14 ]
  %31 = phi i32 [ %74, %72 ], [ 0, %14 ]
  %32 = phi i64 [ %64, %72 ], [ %6, %14 ]
  %33 = phi i64 [ %65, %72 ], [ %7, %14 ]
  %34 = sub i32 %31, %30
  %35 = icmp slt i32 %34, 0
  %36 = icmp slt i32 %31, %30
  %37 = icmp ne i1 %35, %36
  %38 = icmp ne i1 %35, %37
  %39 = xor i1 %38, true
  br i1 %39, label %40, label %59

40:                                               ; preds = %28
  %41 = getelementptr i64, ptr %22, i64 1
  %42 = load i64, ptr %22, align 4
  %43 = getelementptr i64, ptr %41, i64 1
  %44 = ptrtoint ptr %43 to i64
  %45 = load i64, ptr %41, align 4
  store i1 undef, ptr addrspace(1) %15, align 1
  store i1 undef, ptr addrspace(1) %16, align 1
  store i8 undef, ptr addrspace(1) %17, align 1
  store i1 undef, ptr addrspace(1) %18, align 1
  store i1 undef, ptr addrspace(1) %19, align 1
  store i1 undef, ptr addrspace(1) %20, align 1
  %46 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } undef, i64 %45, 0
  %47 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %46, i64 0, 8
  %48 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %47, i64 %33, 5
  %49 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %48, i64 %32, 4
  %50 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %49, i64 %2, 1
  %51 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %50, i64 %44, 13
  %52 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %51, i64 %42, 11
  %53 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %52, i64 %5, 3
  %54 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %53, i64 %4, 2
  %55 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %54, i64 %8, 6
  %56 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %55, i64 %9, 7
  %57 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %56, i64 %11, 9
  %58 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %57, i64 %12, 10
  ret { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %58

59:                                               ; preds = %28
  %60 = getelementptr i8, ptr %22, i64 -12
  store i32 0, ptr %60, align 1
  br label %61

61:                                               ; preds = %97, %59
  %62 = phi i32 [ %.pre2, %97 ], [ %29, %59 ]
  %63 = phi i32 [ %99, %97 ], [ 0, %59 ]
  %64 = phi i64 [ %88, %97 ], [ %32, %59 ]
  %65 = phi i64 [ %89, %97 ], [ %33, %59 ]
  %66 = sub i32 %63, %62
  %67 = icmp slt i32 %66, 0
  %68 = icmp slt i32 %63, %62
  %69 = icmp ne i1 %67, %68
  %70 = icmp ne i1 %67, %69
  %71 = xor i1 %70, true
  br i1 %71, label %72, label %75

72:                                               ; preds = %61
  %73 = load i32, ptr %27, align 1
  %74 = add i32 %73, 1
  store i32 %74, ptr %27, align 1
  %.pre = load i32, ptr %24, align 1
  br label %28

75:                                               ; preds = %61
  %76 = zext i32 %63 to i64
  %77 = load i32, ptr %27, align 1
  %78 = sext i32 %77 to i64
  %79 = mul i64 %78, 24000000
  %80 = add i64 139916665430080, %79
  %81 = mul i64 %78, 12000
  %82 = add i64 %80, %81
  %83 = inttoptr i64 %82 to ptr
  %84 = getelementptr i32, ptr %83, i64 %78
  store i32 %63, ptr %84, align 1
  %85 = getelementptr i8, ptr %22, i64 -16
  store i32 0, ptr %85, align 1
  br label %86

86:                                               ; preds = %.temp.branch, %75
  %87 = phi i32 [ %117, %.temp.branch ], [ 0, %75 ]
  %88 = phi i64 [ %115, %.temp.branch ], [ %76, %75 ]
  %89 = phi i64 [ %110, %.temp.branch ], [ %78, %75 ]
  %90 = load i32, ptr %26, align 1
  %91 = sub i32 %87, %90
  %92 = icmp slt i32 %91, 0
  %93 = icmp slt i32 %87, %90
  %94 = icmp ne i1 %92, %93
  %95 = icmp ne i1 %92, %94
  %96 = xor i1 %95, true
  br i1 %96, label %97, label %.temp.branch

97:                                               ; preds = %86
  %98 = load i32, ptr %60, align 1
  %99 = add i32 %98, 1
  store i32 %99, ptr %60, align 1
  %.pre2 = load i32, ptr %25, align 1
  br label %61

.temp.branch:                                     ; preds = %86
  %100 = load i32, ptr %27, align 1
  %101 = load i32, ptr %60, align 1
  %102 = mul i32 %100, %101
  %103 = mul i32 %102, %87
  %104 = sext i32 %100 to i64
  %105 = mul i64 %104, 24000000
  %106 = add i64 139916665430080, %105
  %107 = sext i32 %101 to i64
  %108 = mul i64 %107, 12000
  %109 = add i64 %106, %108
  %110 = sext i32 %87 to i64
  %111 = inttoptr i64 %109 to ptr
  %112 = getelementptr i32, ptr %111, i64 %110
  %113 = load i32, ptr %112, align 1
  %114 = add i32 %103, %113
  %115 = zext i32 %114 to i64
  store i32 %114, ptr %112, align 1
  %116 = load i32, ptr %85, align 1
  %117 = add i32 %116, 1
  store i32 %117, ptr %85, align 1
  br label %86
}

attributes #0 = { null_pointer_is_valid }

!llvm.module.flags = !{!1}

!0 = !{i64 -1, i64 -1}
!1 = !{i32 1, !"override-stack-alignment", i32 8}
