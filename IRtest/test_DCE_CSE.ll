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
  br label %21

21:                                               ; preds = %14
  %22 = inttoptr i64 %3 to ptr
  %23 = getelementptr i64, ptr %22, i64 -1
  store i64 %13, ptr %23, align 4
  %24 = ptrtoint ptr %23 to i64
  %25 = getelementptr i8, ptr %23, i64 -4
  store i32 0, ptr %25, align 1
  %26 = getelementptr i8, ptr %23, i64 -20
  store i32 10, ptr %26, align 1
  %27 = getelementptr i8, ptr %23, i64 -24
  store i32 20, ptr %27, align 1
  %28 = getelementptr i8, ptr %23, i64 -28
  store i32 30, ptr %28, align 1
  %29 = getelementptr i8, ptr %23, i64 -8
  store i32 0, ptr %29, align 1
  br label %30

30:                                               ; preds = %101, %21
  %31 = phi i64 [ %57, %101 ], [ %6, %21 ]
  %32 = phi i64 [ %58, %101 ], [ %7, %21 ]
  %33 = phi i64 [ %59, %101 ], [ %24, %21 ]
  %34 = phi i64 [ %60, %101 ], [ %24, %21 ]
  %35 = inttoptr i64 %34 to ptr
  %36 = getelementptr i8, ptr %35, i64 -8
  %37 = load i32, ptr %36, align 1
  %38 = zext i32 %37 to i64
  %39 = getelementptr i8, ptr %35, i64 -20
  %40 = load i32, ptr %39, align 1
  %41 = sub i32 %37, %40
  %42 = icmp slt i32 %41, 0
  %43 = icmp slt i32 %37, %40
  %44 = icmp ne i1 %42, %43
  %45 = icmp ne i1 %42, %44
  %46 = xor i1 %45, true
  br i1 %46, label %47, label %54

47:                                               ; preds = %30
  %48 = inttoptr i64 %33 to ptr
  %49 = getelementptr i64, ptr %48, i64 1
  %50 = load i64, ptr %48, align 4
  %51 = getelementptr i64, ptr %49, i64 1
  %52 = ptrtoint ptr %51 to i64
  %53 = load i64, ptr %49, align 4
  br label %131

54:                                               ; preds = %30
  %55 = getelementptr i8, ptr %35, i64 -12
  store i32 0, ptr %55, align 1
  br label %56

56:                                               ; preds = %127, %54
  %57 = phi i64 [ %86, %127 ], [ %31, %54 ]
  %58 = phi i64 [ %87, %127 ], [ %32, %54 ]
  %59 = phi i64 [ %88, %127 ], [ %33, %54 ]
  %60 = phi i64 [ %89, %127 ], [ %34, %54 ]
  %61 = inttoptr i64 %60 to ptr
  %62 = getelementptr i8, ptr %61, i64 -12
  %63 = load i32, ptr %62, align 1
  %64 = getelementptr i8, ptr %61, i64 -24
  %65 = load i32, ptr %64, align 1
  %66 = sub i32 %63, %65
  %67 = icmp slt i32 %66, 0
  %68 = icmp slt i32 %63, %65
  %69 = icmp ne i1 %67, %68
  %70 = icmp ne i1 %67, %69
  %71 = xor i1 %70, true
  br i1 %71, label %72, label %73

72:                                               ; preds = %56
  br label %101

73:                                               ; preds = %56
  %74 = zext i32 %63 to i64
  %75 = getelementptr i8, ptr %61, i64 -8
  %76 = load i32, ptr %75, align 1
  %77 = sext i32 %76 to i64
  %78 = mul i64 %77, 24000000
  %79 = add i64 139916665430080, %78
  %80 = mul i64 %77, 12000
  %81 = add i64 %79, %80
  %82 = inttoptr i64 %81 to ptr
  %83 = getelementptr i32, ptr %82, i64 %77
  store i32 %63, ptr %83, align 1
  %84 = getelementptr i8, ptr %61, i64 -16
  store i32 0, ptr %84, align 1
  br label %85

85:                                               ; preds = %.temp.branch, %73
  %86 = phi i64 [ %124, %.temp.branch ], [ %74, %73 ]
  %87 = phi i64 [ %119, %.temp.branch ], [ %77, %73 ]
  %88 = phi i64 [ %88, %.temp.branch ], [ %59, %73 ]
  %89 = phi i64 [ %89, %.temp.branch ], [ %60, %73 ]
  %90 = inttoptr i64 %89 to ptr
  %91 = getelementptr i8, ptr %90, i64 -16
  %92 = load i32, ptr %91, align 1
  %93 = getelementptr i8, ptr %90, i64 -28
  %94 = load i32, ptr %93, align 1
  %95 = sub i32 %92, %94
  %96 = icmp slt i32 %95, 0
  %97 = icmp slt i32 %92, %94
  %98 = icmp ne i1 %96, %97
  %99 = icmp ne i1 %96, %98
  %100 = xor i1 %99, true
  br i1 %100, label %105, label %106

101:                                              ; preds = %72
  %102 = getelementptr i8, ptr %61, i64 -8
  %103 = load i32, ptr %102, align 1
  %104 = add i32 %103, 1
  store i32 %104, ptr %102, align 1
  br label %30

105:                                              ; preds = %85
  br label %127

106:                                              ; preds = %85
  %107 = getelementptr i8, ptr %90, i64 -8
  %108 = load i32, ptr %107, align 1
  %109 = getelementptr i8, ptr %90, i64 -12
  %110 = load i32, ptr %109, align 1
  %111 = mul i32 %108, %110
  %112 = mul i32 %111, %92
  %113 = sext i32 %108 to i64
  %114 = mul i64 %113, 24000000
  %115 = add i64 139916665430080, %114
  %116 = sext i32 %110 to i64
  %117 = mul i64 %116, 12000
  %118 = add i64 %115, %117
  %119 = sext i32 %92 to i64
  %120 = inttoptr i64 %118 to ptr
  %121 = getelementptr i32, ptr %120, i64 %119
  %122 = load i32, ptr %121, align 1
  %123 = add i32 %112, %122
  %124 = zext i32 %123 to i64
  store i32 %123, ptr %121, align 1
  br label %.temp.branch

.temp.branch:                                     ; preds = %106
  %125 = load i32, ptr %91, align 1
  %126 = add i32 %125, 1
  store i32 %126, ptr %91, align 1
  br label %85

127:                                              ; preds = %105
  %128 = getelementptr i8, ptr %90, i64 -12
  %129 = load i32, ptr %128, align 1
  %130 = add i32 %129, 1
  store i32 %130, ptr %128, align 1
  br label %56

131:                                              ; preds = %47
  store i1 undef, ptr addrspace(1) %15, align 1
  store i1 undef, ptr addrspace(1) %16, align 1
  store i8 undef, ptr addrspace(1) %17, align 1
  store i1 undef, ptr addrspace(1) %18, align 1
  store i1 undef, ptr addrspace(1) %19, align 1
  store i1 undef, ptr addrspace(1) %20, align 1
  %132 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } undef, i64 %53, 0
  %133 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %132, i64 0, 8
  %134 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %133, i64 %32, 5
  %135 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %134, i64 %31, 4
  %136 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %135, i64 %2, 1
  %137 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %136, i64 %52, 13
  %138 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %137, i64 %50, 11
  %139 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %138, i64 %5, 3
  %140 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %139, i64 %4, 2
  %141 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %140, i64 %8, 6
  %142 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %141, i64 %9, 7
  %143 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %142, i64 %11, 9
  %144 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %143, i64 %12, 10
  ret { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %144
}

attributes #0 = { null_pointer_is_valid }

!llvm.module.flags = !{!1}

!0 = !{i64 -1, i64 -1}
!1 = !{i32 1, !"override-stack-alignment", i32 8}
