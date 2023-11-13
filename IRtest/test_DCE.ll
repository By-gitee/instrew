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
  %22 = phi i64 [ %6, %14 ]
  %23 = phi i64 [ %7, %14 ]
  %24 = phi i64 [ %3, %14 ]
  %25 = phi i64 [ %13, %14 ]
  %26 = inttoptr i64 %24 to ptr
  %27 = getelementptr i64, ptr %26, i64 -1
  store i64 %25, ptr %27, align 4
  %28 = ptrtoint ptr %27 to i64
  %29 = inttoptr i64 %28 to ptr
  %30 = getelementptr i8, ptr %29, i64 -4
  store i32 0, ptr %30, align 1
  %31 = getelementptr i8, ptr %29, i64 -20
  store i32 10, ptr %31, align 1
  %32 = getelementptr i8, ptr %29, i64 -24
  store i32 20, ptr %32, align 1
  %33 = getelementptr i8, ptr %29, i64 -28
  store i32 30, ptr %33, align 1
  %34 = getelementptr i8, ptr %29, i64 -8
  store i32 0, ptr %34, align 1
  br label %35

35:                                               ; preds = %133, %21
  %36 = phi i64 [ %134, %133 ], [ %22, %21 ]
  %37 = phi i64 [ %135, %133 ], [ %23, %21 ]
  %38 = phi i64 [ %136, %133 ], [ %28, %21 ]
  %39 = phi i64 [ %137, %133 ], [ %28, %21 ]
  %40 = inttoptr i64 %39 to ptr
  %41 = getelementptr i8, ptr %40, i64 -8
  %42 = load i32, ptr %41, align 1
  %43 = zext i32 %42 to i64
  %44 = getelementptr i8, ptr %40, i64 -20
  %45 = load i32, ptr %44, align 1
  %46 = sub i32 %42, %45
  %47 = icmp slt i32 %46, 0
  %48 = icmp slt i32 %42, %45
  %49 = icmp ne i1 %47, %48
  %50 = icmp ne i1 %47, %49
  %51 = xor i1 %50, true
  br i1 %51, label %52, label %66

52:                                               ; preds = %35
  %53 = phi i64 [ %36, %35 ]
  %54 = phi i64 [ %37, %35 ]
  %55 = phi i64 [ %38, %35 ]
  %56 = phi i64 [ %43, %35 ]
  %57 = trunc i64 %56 to i32
  %58 = xor i32 %57, %57
  %59 = zext i32 %58 to i64
  %60 = inttoptr i64 %55 to ptr
  %61 = getelementptr i64, ptr %60, i64 1
  %62 = load i64, ptr %60, align 4
  %63 = getelementptr i64, ptr %61, i64 1
  %64 = ptrtoint ptr %63 to i64
  %65 = load i64, ptr %61, align 4
  br label %193

66:                                               ; preds = %35
  %67 = phi i64 [ %36, %35 ]
  %68 = phi i64 [ %37, %35 ]
  %69 = phi i64 [ %38, %35 ]
  %70 = phi i64 [ %39, %35 ]
  %71 = inttoptr i64 %70 to ptr
  %72 = getelementptr i8, ptr %71, i64 -12
  store i32 0, ptr %72, align 1
  br label %73

73:                                               ; preds = %183, %66
  %74 = phi i64 [ %184, %183 ], [ %67, %66 ]
  %75 = phi i64 [ %185, %183 ], [ %68, %66 ]
  %76 = phi i64 [ %186, %183 ], [ %69, %66 ]
  %77 = phi i64 [ %187, %183 ], [ %70, %66 ]
  %78 = inttoptr i64 %77 to ptr
  %79 = getelementptr i8, ptr %78, i64 -12
  %80 = load i32, ptr %79, align 1
  %81 = getelementptr i8, ptr %78, i64 -24
  %82 = load i32, ptr %81, align 1
  %83 = sub i32 %80, %82
  %84 = icmp slt i32 %83, 0
  %85 = icmp slt i32 %80, %82
  %86 = icmp ne i1 %84, %85
  %87 = icmp ne i1 %84, %86
  %88 = xor i1 %87, true
  br i1 %88, label %89, label %94

89:                                               ; preds = %73
  %90 = phi i64 [ %74, %73 ]
  %91 = phi i64 [ %75, %73 ]
  %92 = phi i64 [ %76, %73 ]
  %93 = phi i64 [ %77, %73 ]
  br label %133

94:                                               ; preds = %73
  %95 = phi i64 [ %76, %73 ]
  %96 = phi i64 [ %77, %73 ]
  %97 = inttoptr i64 %96 to ptr
  %98 = getelementptr i8, ptr %97, i64 -12
  %99 = load i32, ptr %98, align 1
  %100 = zext i32 %99 to i64
  %101 = getelementptr i8, ptr %97, i64 -8
  %102 = load i32, ptr %101, align 1
  %103 = sext i32 %102 to i64
  %104 = mul i64 %103, 24000000
  %105 = add i64 139916665430080, %104
  %106 = getelementptr i8, ptr %97, i64 -8
  %107 = load i32, ptr %106, align 1
  %108 = sext i32 %107 to i64
  %109 = mul i64 %108, 12000
  %110 = add i64 %105, %109
  %111 = getelementptr i8, ptr %97, i64 -8
  %112 = load i32, ptr %111, align 1
  %113 = sext i32 %112 to i64
  %114 = inttoptr i64 %110 to ptr
  %115 = getelementptr i32, ptr %114, i64 %113
  store i32 %99, ptr %115, align 1
  %116 = getelementptr i8, ptr %97, i64 -16
  store i32 0, ptr %116, align 1
  br label %117

117:                                              ; preds = %.temp.branch, %94
  %118 = phi i64 [ %177, %.temp.branch ], [ %100, %94 ]
  %119 = phi i64 [ %172, %.temp.branch ], [ %113, %94 ]
  %120 = phi i64 [ %149, %.temp.branch ], [ %95, %94 ]
  %121 = phi i64 [ %150, %.temp.branch ], [ %96, %94 ]
  %122 = inttoptr i64 %121 to ptr
  %123 = getelementptr i8, ptr %122, i64 -16
  %124 = load i32, ptr %123, align 1
  %125 = getelementptr i8, ptr %122, i64 -28
  %126 = load i32, ptr %125, align 1
  %127 = sub i32 %124, %126
  %128 = icmp slt i32 %127, 0
  %129 = icmp slt i32 %124, %126
  %130 = icmp ne i1 %128, %129
  %131 = icmp ne i1 %128, %130
  %132 = xor i1 %131, true
  br i1 %132, label %143, label %148

133:                                              ; preds = %89
  %134 = phi i64 [ %90, %89 ]
  %135 = phi i64 [ %91, %89 ]
  %136 = phi i64 [ %92, %89 ]
  %137 = phi i64 [ %93, %89 ]
  %138 = inttoptr i64 %137 to ptr
  %139 = getelementptr i8, ptr %138, i64 -8
  %140 = load i32, ptr %139, align 1
  %141 = add i32 %140, 1
  %142 = getelementptr i8, ptr %138, i64 -8
  store i32 %141, ptr %142, align 1
  br label %35

143:                                              ; preds = %117
  %144 = phi i64 [ %118, %117 ]
  %145 = phi i64 [ %119, %117 ]
  %146 = phi i64 [ %120, %117 ]
  %147 = phi i64 [ %121, %117 ]
  br label %183

148:                                              ; preds = %117
  %149 = phi i64 [ %120, %117 ]
  %150 = phi i64 [ %121, %117 ]
  %151 = inttoptr i64 %150 to ptr
  %152 = getelementptr i8, ptr %151, i64 -8
  %153 = load i32, ptr %152, align 1
  %154 = getelementptr i8, ptr %151, i64 -12
  %155 = load i32, ptr %154, align 1
  %156 = mul i32 %153, %155
  %157 = getelementptr i8, ptr %151, i64 -16
  %158 = load i32, ptr %157, align 1
  %159 = mul i32 %156, %158
  %160 = getelementptr i8, ptr %151, i64 -8
  %161 = load i32, ptr %160, align 1
  %162 = sext i32 %161 to i64
  %163 = mul i64 %162, 24000000
  %164 = add i64 139916665430080, %163
  %165 = getelementptr i8, ptr %151, i64 -12
  %166 = load i32, ptr %165, align 1
  %167 = sext i32 %166 to i64
  %168 = mul i64 %167, 12000
  %169 = add i64 %164, %168
  %170 = getelementptr i8, ptr %151, i64 -16
  %171 = load i32, ptr %170, align 1
  %172 = sext i32 %171 to i64
  %173 = inttoptr i64 %169 to ptr
  %174 = getelementptr i32, ptr %173, i64 %172
  %175 = load i32, ptr %174, align 1
  %176 = add i32 %159, %175
  %177 = zext i32 %176 to i64
  %178 = getelementptr i32, ptr %173, i64 %172
  store i32 %176, ptr %178, align 1
  br label %.temp.branch

.temp.branch:                                     ; preds = %148
  %179 = getelementptr i8, ptr %151, i64 -16
  %180 = load i32, ptr %179, align 1
  %181 = add i32 %180, 1
  %182 = getelementptr i8, ptr %151, i64 -16
  store i32 %181, ptr %182, align 1
  br label %117

183:                                              ; preds = %143
  %184 = phi i64 [ %144, %143 ]
  %185 = phi i64 [ %145, %143 ]
  %186 = phi i64 [ %146, %143 ]
  %187 = phi i64 [ %147, %143 ]
  %188 = inttoptr i64 %187 to ptr
  %189 = getelementptr i8, ptr %188, i64 -12
  %190 = load i32, ptr %189, align 1
  %191 = add i32 %190, 1
  %192 = getelementptr i8, ptr %188, i64 -12
  store i32 %191, ptr %192, align 1
  br label %73

193:                                              ; preds = %52
  %194 = phi i1 [ undef, %52 ]
  %195 = phi i1 [ undef, %52 ]
  %196 = phi i1 [ undef, %52 ]
  %197 = phi i8 [ undef, %52 ]
  %198 = phi i1 [ undef, %52 ]
  %199 = phi i1 [ undef, %52 ]
  %200 = phi i64 [ %62, %52 ]
  %201 = phi i64 [ %64, %52 ]
  %202 = phi i64 [ %53, %52 ]
  %203 = phi i64 [ %54, %52 ]
  %204 = phi i64 [ %59, %52 ]
  %205 = phi i64 [ %65, %52 ]
  store i1 %199, ptr addrspace(1) %15, align 1
  store i1 %198, ptr addrspace(1) %16, align 1
  store i8 %197, ptr addrspace(1) %17, align 1
  store i1 %196, ptr addrspace(1) %18, align 1
  store i1 %195, ptr addrspace(1) %19, align 1
  store i1 %194, ptr addrspace(1) %20, align 1
  %206 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } undef, i64 %205, 0
  %207 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %206, i64 %204, 8
  %208 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %207, i64 %203, 5
  %209 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %208, i64 %202, 4
  %210 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %209, i64 %2, 1
  %211 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %210, i64 %201, 13
  %212 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %211, i64 %200, 11
  %213 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %212, i64 %5, 3
  %214 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %213, i64 %4, 2
  %215 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %214, i64 %8, 6
  %216 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %215, i64 %9, 7
  %217 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %216, i64 %11, 9
  %218 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %217, i64 %12, 10
  ret { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %218
}

attributes #0 = { null_pointer_is_valid }

!llvm.module.flags = !{!1}

!0 = !{i64 -1, i64 -1}
!1 = !{i32 1, !"override-stack-alignment", i32 8}
