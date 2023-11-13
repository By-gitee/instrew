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
  %23 = ptrtoint ptr %22 to i64
  %24 = getelementptr i8, ptr %22, i64 -4
  store i32 0, ptr %24, align 1
  %25 = getelementptr i8, ptr %22, i64 -20
  store i32 10, ptr %25, align 1
  %26 = getelementptr i8, ptr %22, i64 -24
  store i32 20, ptr %26, align 1
  %27 = getelementptr i8, ptr %22, i64 -28
  store i32 30, ptr %27, align 1
  %28 = getelementptr i8, ptr %22, i64 -8
  store i32 0, ptr %28, align 1
  br label %29

29:                                               ; preds = %74, %14
  %30 = phi i32 [ %64, %74 ], [ 20, %14 ]
  %31 = phi i32 [ %.pre, %74 ], [ 10, %14 ]
  %32 = phi i32 [ %76, %74 ], [ 0, %14 ]
  %33 = phi i64 [ %66, %74 ], [ %6, %14 ]
  %34 = phi i64 [ %67, %74 ], [ %7, %14 ]
  %35 = zext i32 %32 to i64
  %36 = sub i32 %32, %31
  %37 = icmp slt i32 %36, 0
  %38 = icmp slt i32 %32, %31
  %39 = icmp ne i1 %37, %38
  %40 = icmp ne i1 %37, %39
  %41 = xor i1 %40, true
  br i1 %41, label %42, label %61

42:                                               ; preds = %29
  %43 = getelementptr i64, ptr %22, i64 1
  %44 = load i64, ptr %22, align 4
  %45 = getelementptr i64, ptr %43, i64 1
  %46 = ptrtoint ptr %45 to i64
  %47 = load i64, ptr %43, align 4
  store i1 undef, ptr addrspace(1) %15, align 1
  store i1 undef, ptr addrspace(1) %16, align 1
  store i8 undef, ptr addrspace(1) %17, align 1
  store i1 undef, ptr addrspace(1) %18, align 1
  store i1 undef, ptr addrspace(1) %19, align 1
  store i1 undef, ptr addrspace(1) %20, align 1
  %48 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } undef, i64 %47, 0
  %49 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %48, i64 0, 8
  %50 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %49, i64 %34, 5
  %51 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %50, i64 %33, 4
  %52 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %51, i64 %2, 1
  %53 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %52, i64 %46, 13
  %54 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %53, i64 %44, 11
  %55 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %54, i64 %5, 3
  %56 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %55, i64 %4, 2
  %57 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %56, i64 %8, 6
  %58 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %57, i64 %9, 7
  %59 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %58, i64 %11, 9
  %60 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %59, i64 %12, 10
  ret { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %60

61:                                               ; preds = %29
  %62 = getelementptr i8, ptr %22, i64 -12
  store i32 0, ptr %62, align 1
  br label %63

63:                                               ; preds = %99, %61
  %64 = phi i32 [ %.pre2, %99 ], [ %30, %61 ]
  %65 = phi i32 [ %101, %99 ], [ 0, %61 ]
  %66 = phi i64 [ %90, %99 ], [ %33, %61 ]
  %67 = phi i64 [ %91, %99 ], [ %34, %61 ]
  %68 = sub i32 %65, %64
  %69 = icmp slt i32 %68, 0
  %70 = icmp slt i32 %65, %64
  %71 = icmp ne i1 %69, %70
  %72 = icmp ne i1 %69, %71
  %73 = xor i1 %72, true
  br i1 %73, label %74, label %77

74:                                               ; preds = %63
  %75 = load i32, ptr %28, align 1
  %76 = add i32 %75, 1
  store i32 %76, ptr %28, align 1
  %.pre = load i32, ptr %25, align 1
  br label %29

77:                                               ; preds = %63
  %78 = zext i32 %65 to i64
  %79 = load i32, ptr %28, align 1
  %80 = sext i32 %79 to i64
  %81 = mul i64 %80, 24000000
  %82 = add i64 139916665430080, %81
  %83 = mul i64 %80, 12000
  %84 = add i64 %82, %83
  %85 = inttoptr i64 %84 to ptr
  %86 = getelementptr i32, ptr %85, i64 %80
  store i32 %65, ptr %86, align 1
  %87 = getelementptr i8, ptr %22, i64 -16
  store i32 0, ptr %87, align 1
  br label %88

88:                                               ; preds = %.temp.branch, %77
  %89 = phi i32 [ %119, %.temp.branch ], [ 0, %77 ]
  %90 = phi i64 [ %117, %.temp.branch ], [ %78, %77 ]
  %91 = phi i64 [ %112, %.temp.branch ], [ %80, %77 ]
  %92 = load i32, ptr %27, align 1
  %93 = sub i32 %89, %92
  %94 = icmp slt i32 %93, 0
  %95 = icmp slt i32 %89, %92
  %96 = icmp ne i1 %94, %95
  %97 = icmp ne i1 %94, %96
  %98 = xor i1 %97, true
  br i1 %98, label %99, label %.temp.branch

99:                                               ; preds = %88
  %100 = load i32, ptr %62, align 1
  %101 = add i32 %100, 1
  store i32 %101, ptr %62, align 1
  %.pre2 = load i32, ptr %26, align 1
  br label %63

.temp.branch:                                     ; preds = %88
  %102 = load i32, ptr %28, align 1
  %103 = load i32, ptr %62, align 1
  %104 = mul i32 %102, %103
  %105 = mul i32 %104, %89
  %106 = sext i32 %102 to i64
  %107 = mul i64 %106, 24000000
  %108 = add i64 139916665430080, %107
  %109 = sext i32 %103 to i64
  %110 = mul i64 %109, 12000
  %111 = add i64 %108, %110
  %112 = sext i32 %89 to i64
  %113 = inttoptr i64 %111 to ptr
  %114 = getelementptr i32, ptr %113, i64 %112
  %115 = load i32, ptr %114, align 1
  %116 = add i32 %105, %115
  %117 = zext i32 %116 to i64
  store i32 %116, ptr %114, align 1
  %118 = load i32, ptr %87, align 1
  %119 = add i32 %118, 1
  store i32 %119, ptr %87, align 1
  br label %88
}

attributes #0 = { null_pointer_is_valid }

!llvm.module.flags = !{!1}

!0 = !{i64 -1, i64 -1}
!1 = !{i32 1, !"override-stack-alignment", i32 8}
