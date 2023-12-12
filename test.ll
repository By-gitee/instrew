; ModuleID = 'mod'
source_filename = "mod"

@instrew_baseaddr = external global i64, !absolute_symbol !0
@llvm.used = appending global [3 x ptr] [ptr @instrew_baseaddr, ptr @syscall, ptr @cpuid], section "llvm.metadata"

declare void @syscall(ptr addrspace(1))

declare { i64, i64 } @cpuid(i32, i32)

; Function Attrs: null_pointer_is_valid
define hhvmcc { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } @S0_hhvm(i64 %0, ptr addrspace(1) noalias nocapture align 16 dereferenceable(400) %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, i64 %7, i64 %8, i64 %9, i64 %10, i64 %11, i64 %12, i64 %13) #0 {
  %15 = getelementptr i8, ptr addrspace(1) %1, i64 0
  %16 = getelementptr i8, ptr addrspace(1) %1, i64 8
  %17 = getelementptr i8, ptr addrspace(1) %1, i64 16
  %18 = getelementptr i8, ptr addrspace(1) %1, i64 24
  %19 = getelementptr i8, ptr addrspace(1) %1, i64 32
  %20 = getelementptr i8, ptr addrspace(1) %1, i64 40
  %21 = getelementptr i8, ptr addrspace(1) %1, i64 48
  %22 = getelementptr i8, ptr addrspace(1) %1, i64 56
  %23 = getelementptr i8, ptr addrspace(1) %1, i64 64
  %24 = getelementptr i8, ptr addrspace(1) %1, i64 72
  %25 = getelementptr i8, ptr addrspace(1) %1, i64 80
  %26 = getelementptr i8, ptr addrspace(1) %1, i64 88
  %27 = getelementptr i8, ptr addrspace(1) %1, i64 96
  %28 = getelementptr i8, ptr addrspace(1) %1, i64 104
  %29 = getelementptr i8, ptr addrspace(1) %1, i64 112
  %30 = getelementptr i8, ptr addrspace(1) %1, i64 120
  %31 = getelementptr i8, ptr addrspace(1) %1, i64 128
  %32 = getelementptr i8, ptr addrspace(1) %1, i64 136
  %33 = getelementptr i8, ptr addrspace(1) %1, i64 137
  %34 = getelementptr i8, ptr addrspace(1) %1, i64 138
  %35 = getelementptr i8, ptr addrspace(1) %1, i64 139
  %36 = getelementptr i8, ptr addrspace(1) %1, i64 140
  %37 = getelementptr i8, ptr addrspace(1) %1, i64 141
  %38 = getelementptr i8, ptr addrspace(1) %1, i64 142
  %39 = getelementptr i8, ptr addrspace(1) %1, i64 144
  %40 = getelementptr i8, ptr addrspace(1) %1, i64 152
  %41 = getelementptr i8, ptr addrspace(1) %1, i64 160
  %42 = getelementptr i8, ptr addrspace(1) %1, i64 176
  %43 = getelementptr i8, ptr addrspace(1) %1, i64 192
  %44 = getelementptr i8, ptr addrspace(1) %1, i64 208
  %45 = getelementptr i8, ptr addrspace(1) %1, i64 224
  %46 = getelementptr i8, ptr addrspace(1) %1, i64 240
  %47 = getelementptr i8, ptr addrspace(1) %1, i64 256
  %48 = getelementptr i8, ptr addrspace(1) %1, i64 272
  %49 = getelementptr i8, ptr addrspace(1) %1, i64 288
  %50 = getelementptr i8, ptr addrspace(1) %1, i64 304
  %51 = getelementptr i8, ptr addrspace(1) %1, i64 320
  %52 = getelementptr i8, ptr addrspace(1) %1, i64 336
  %53 = getelementptr i8, ptr addrspace(1) %1, i64 352
  %54 = getelementptr i8, ptr addrspace(1) %1, i64 368
  %55 = getelementptr i8, ptr addrspace(1) %1, i64 384
  %56 = getelementptr i8, ptr addrspace(1) %1, i64 400
  %57 = load i64, ptr addrspace(1) %28, align 4
  %58 = load i64, ptr addrspace(1) %29, align 4
  %59 = load i64, ptr addrspace(1) %30, align 4
  %60 = load i64, ptr addrspace(1) %31, align 4
  %61 = load i1, ptr addrspace(1) %32, align 1
  %62 = load i1, ptr addrspace(1) %33, align 1
  %63 = load i8, ptr addrspace(1) %34, align 1
  %64 = load i1, ptr addrspace(1) %35, align 1
  %65 = load i1, ptr addrspace(1) %36, align 1
  %66 = load i1, ptr addrspace(1) %37, align 1
  %67 = load i1, ptr addrspace(1) %38, align 1
  %68 = load <2 x i64>, ptr addrspace(1) %41, align 16
  %69 = load <2 x i64>, ptr addrspace(1) %42, align 16
  %70 = load <2 x i64>, ptr addrspace(1) %43, align 16
  %71 = load <2 x i64>, ptr addrspace(1) %44, align 16
  %72 = load <2 x i64>, ptr addrspace(1) %45, align 16
  %73 = load <2 x i64>, ptr addrspace(1) %46, align 16
  %74 = load <2 x i64>, ptr addrspace(1) %47, align 16
  %75 = load <2 x i64>, ptr addrspace(1) %48, align 16
  %76 = load <2 x i64>, ptr addrspace(1) %49, align 16
  %77 = load <2 x i64>, ptr addrspace(1) %50, align 16
  %78 = load <2 x i64>, ptr addrspace(1) %51, align 16
  %79 = load <2 x i64>, ptr addrspace(1) %52, align 16
  %80 = load <2 x i64>, ptr addrspace(1) %53, align 16
  %81 = load <2 x i64>, ptr addrspace(1) %54, align 16
  %82 = load <2 x i64>, ptr addrspace(1) %55, align 16
  %83 = load <2 x i64>, ptr addrspace(1) %56, align 16
  br label %84

84:                                               ; preds = %14
  %85 = phi i64 [ %6, %14 ]
  %86 = phi i64 [ %7, %14 ]
  %87 = phi i64 [ %3, %14 ]
  %88 = phi i64 [ %13, %14 ]
  %89 = inttoptr i64 %87 to ptr
  %90 = getelementptr i64, ptr %89, i64 -1
  store i64 %88, ptr %90, align 4
  %91 = ptrtoint ptr %90 to i64
  %92 = inttoptr i64 %91 to ptr
  %93 = getelementptr i8, ptr %92, i64 -4
  store i32 0, ptr %93, align 1
  %94 = getelementptr i8, ptr %92, i64 -48
  store i64 10, ptr %94, align 1
  %95 = getelementptr i8, ptr %92, i64 -56
  store i64 20, ptr %95, align 1
  %96 = getelementptr i8, ptr %92, i64 -64
  store i64 30, ptr %96, align 1
  %97 = getelementptr i8, ptr %92, i64 -24
  store i64 0, ptr %97, align 1
  br label %98

98:                                               ; preds = %84, %253
  %99 = phi i64 [ %254, %253 ], [ %85, %84 ]
  %100 = phi i64 [ %255, %253 ], [ %86, %84 ]
  %101 = phi i64 [ %256, %253 ], [ %91, %84 ]
  %102 = phi i64 [ %257, %253 ], [ %91, %84 ]
  %103 = inttoptr i64 %102 to ptr
  %104 = getelementptr i8, ptr %103, i64 -24
  %105 = load i64, ptr %104, align 1
  %106 = getelementptr i8, ptr %103, i64 -48
  %107 = load i64, ptr %106, align 1
  %108 = sub i64 %105, %107
  %109 = icmp slt i64 %108, 0
  %110 = icmp eq i64 %105, %107
  %111 = trunc i64 %108 to i8
  %112 = xor i64 %105, %107
  %113 = xor i64 %112, %108
  %114 = and i64 %113, 16
  %115 = icmp ne i64 %114, 0
  %116 = icmp ult i64 %105, %107
  %117 = icmp slt i64 %105, %107
  %118 = icmp ne i1 %109, %117
  %119 = icmp ne i1 %109, %118
  %120 = xor i1 %119, true
  %121 = select i1 %120, i64 140501931127309, i64 140501931127145
  br i1 %120, label %122, label %140

122:                                              ; preds = %98
  %123 = phi i64 [ %99, %98 ]
  %124 = phi i64 [ %100, %98 ]
  %125 = phi i64 [ %101, %98 ]
  %126 = phi i64 [ %105, %98 ]
  %127 = trunc i64 %126 to i32
  %128 = xor i32 %127, %127
  %129 = zext i32 %128 to i64
  %130 = icmp eq i32 %128, 0
  %131 = icmp slt i32 %128, 0
  %132 = trunc i32 %128 to i8
  %133 = inttoptr i64 %125 to ptr
  %134 = getelementptr i64, ptr %133, i64 1
  %135 = ptrtoint ptr %134 to i64
  %136 = load i64, ptr %133, align 4
  %137 = getelementptr i64, ptr %134, i64 1
  %138 = ptrtoint ptr %137 to i64
  %139 = load i64, ptr %134, align 4
  br label %346

140:                                              ; preds = %98
  %141 = phi i64 [ %99, %98 ]
  %142 = phi i64 [ %100, %98 ]
  %143 = phi i64 [ %101, %98 ]
  %144 = phi i64 [ %102, %98 ]
  %145 = inttoptr i64 %144 to ptr
  %146 = getelementptr i8, ptr %145, i64 -32
  store i64 0, ptr %146, align 1
  br label %147

147:                                              ; preds = %323, %140
  %148 = phi i64 [ %141, %140 ], [ %324, %323 ]
  %149 = phi i64 [ %142, %140 ], [ %325, %323 ]
  %150 = phi i64 [ %143, %140 ], [ %326, %323 ]
  %151 = phi i64 [ %144, %140 ], [ %327, %323 ]
  %152 = inttoptr i64 %151 to ptr
  %153 = getelementptr i8, ptr %152, i64 -32
  %154 = load i64, ptr %153, align 1
  %155 = getelementptr i8, ptr %152, i64 -56
  %156 = load i64, ptr %155, align 1
  %157 = sub i64 %154, %156
  %158 = icmp slt i64 %157, 0
  %159 = icmp eq i64 %154, %156
  %160 = trunc i64 %157 to i8
  %161 = xor i64 %154, %156
  %162 = xor i64 %161, %157
  %163 = and i64 %162, 16
  %164 = icmp ne i64 %163, 0
  %165 = icmp ult i64 %154, %156
  %166 = icmp slt i64 %154, %156
  %167 = icmp ne i1 %158, %166
  %168 = icmp ne i1 %158, %167
  %169 = xor i1 %168, true
  %170 = select i1 %169, i64 140501931127287, i64 140501931127167
  br i1 %169, label %171, label %176

171:                                              ; preds = %147
  %172 = phi i64 [ %148, %147 ]
  %173 = phi i64 [ %149, %147 ]
  %174 = phi i64 [ %150, %147 ]
  %175 = phi i64 [ %151, %147 ]
  br label %253

176:                                              ; preds = %147
  %177 = phi i64 [ %150, %147 ]
  %178 = phi i64 [ %151, %147 ]
  %179 = inttoptr i64 %178 to ptr
  %180 = getelementptr i8, ptr %179, i64 -32
  %181 = load i64, ptr %180, align 1
  %182 = getelementptr i8, ptr %179, i64 -24
  %183 = load i64, ptr %182, align 1
  %184 = mul i64 %183, 48000000
  %185 = sext i64 %183 to i128
  %186 = mul i128 %185, 48000000
  %187 = sext i64 %184 to i128
  %188 = icmp ne i128 %186, %187
  %189 = add i64 140501931139136, %184
  %190 = icmp eq i64 %189, 0
  %191 = icmp slt i64 %189, 0
  %192 = trunc i64 %189 to i8
  %193 = xor i64 140501931139136, %184
  %194 = xor i64 %193, %189
  %195 = and i64 %194, 16
  %196 = icmp ne i64 %195, 0
  %197 = icmp ult i64 %189, 140501931139136
  %198 = xor i64 140501931139136, %184
  %199 = xor i64 %198, -1
  %200 = xor i64 %189, 140501931139136
  %201 = and i64 %199, %200
  %202 = icmp slt i64 %201, 0
  %203 = getelementptr i8, ptr %179, i64 -24
  %204 = load i64, ptr %203, align 1
  %205 = mul i64 %204, 24000
  %206 = sext i64 %204 to i128
  %207 = mul i128 %206, 24000
  %208 = sext i64 %205 to i128
  %209 = icmp ne i128 %207, %208
  %210 = add i64 %189, %205
  %211 = icmp eq i64 %210, 0
  %212 = icmp slt i64 %210, 0
  %213 = trunc i64 %210 to i8
  %214 = xor i64 %189, %205
  %215 = xor i64 %214, %210
  %216 = and i64 %215, 16
  %217 = icmp ne i64 %216, 0
  %218 = icmp ult i64 %210, %189
  %219 = xor i64 %189, %205
  %220 = xor i64 %219, -1
  %221 = xor i64 %210, %189
  %222 = and i64 %220, %221
  %223 = icmp slt i64 %222, 0
  %224 = getelementptr i8, ptr %179, i64 -24
  %225 = load i64, ptr %224, align 1
  %226 = inttoptr i64 %210 to ptr
  %227 = getelementptr i64, ptr %226, i64 %225
  store i64 %181, ptr %227, align 1
  %228 = getelementptr i8, ptr %179, i64 -40
  store i64 0, ptr %228, align 1
  br label %229

229:                                              ; preds = %176, %281
  %230 = phi i64 [ %282, %281 ], [ %181, %176 ]
  %231 = phi i64 [ %283, %281 ], [ %225, %176 ]
  %232 = phi i64 [ %284, %281 ], [ %177, %176 ]
  %233 = phi i64 [ %285, %281 ], [ %178, %176 ]
  %234 = inttoptr i64 %233 to ptr
  %235 = getelementptr i8, ptr %234, i64 -40
  %236 = load i64, ptr %235, align 1
  %237 = getelementptr i8, ptr %234, i64 -64
  %238 = load i64, ptr %237, align 1
  %239 = sub i64 %236, %238
  %240 = icmp slt i64 %239, 0
  %241 = icmp eq i64 %236, %238
  %242 = trunc i64 %239 to i8
  %243 = xor i64 %236, %238
  %244 = xor i64 %243, %239
  %245 = and i64 %244, 16
  %246 = icmp ne i64 %245, 0
  %247 = icmp ult i64 %236, %238
  %248 = icmp slt i64 %236, %238
  %249 = icmp ne i1 %240, %248
  %250 = icmp ne i1 %240, %249
  %251 = xor i1 %250, true
  %252 = select i1 %251, i64 140501931127265, i64 140501931127230
  br i1 %251, label %276, label %281

253:                                              ; preds = %171
  %254 = phi i64 [ %172, %171 ]
  %255 = phi i64 [ %173, %171 ]
  %256 = phi i64 [ %174, %171 ]
  %257 = phi i64 [ %175, %171 ]
  %258 = inttoptr i64 %257 to ptr
  %259 = getelementptr i8, ptr %258, i64 -24
  %260 = load i64, ptr %259, align 1
  %261 = add i64 %260, 1
  %262 = icmp eq i64 %261, 0
  %263 = icmp slt i64 %261, 0
  %264 = trunc i64 %261 to i8
  %265 = xor i64 %260, 1
  %266 = xor i64 %265, %261
  %267 = and i64 %266, 16
  %268 = icmp ne i64 %267, 0
  %269 = icmp ult i64 %261, %260
  %270 = xor i64 %260, 1
  %271 = xor i64 %270, -1
  %272 = xor i64 %261, %260
  %273 = and i64 %271, %272
  %274 = icmp slt i64 %273, 0
  %275 = getelementptr i8, ptr %258, i64 -24
  store i64 %261, ptr %275, align 1
  br label %98

276:                                              ; preds = %229
  %277 = phi i64 [ %230, %229 ]
  %278 = phi i64 [ %231, %229 ]
  %279 = phi i64 [ %232, %229 ]
  %280 = phi i64 [ %233, %229 ]
  br label %323

281:                                              ; preds = %229
  %282 = phi i64 [ %230, %229 ]
  %283 = phi i64 [ %231, %229 ]
  %284 = phi i64 [ %232, %229 ]
  %285 = phi i64 [ %233, %229 ]
  %286 = inttoptr i64 %285 to ptr
  %287 = getelementptr i8, ptr %286, i64 -24
  %288 = load i64, ptr %287, align 1
  %289 = getelementptr i8, ptr %286, i64 -32
  %290 = load i64, ptr %289, align 1
  %291 = mul i64 %288, %290
  %292 = sext i64 %288 to i128
  %293 = sext i64 %290 to i128
  %294 = mul i128 %292, %293
  %295 = sext i64 %291 to i128
  %296 = icmp ne i128 %294, %295
  %297 = getelementptr i8, ptr %286, i64 -40
  %298 = load i64, ptr %297, align 1
  %299 = mul i64 %291, %298
  %300 = sext i64 %291 to i128
  %301 = sext i64 %298 to i128
  %302 = mul i128 %300, %301
  %303 = sext i64 %299 to i128
  %304 = icmp ne i128 %302, %303
  %305 = getelementptr i8, ptr %286, i64 -16
  store i64 %299, ptr %305, align 1
  %306 = getelementptr i8, ptr %286, i64 -40
  %307 = load i64, ptr %306, align 1
  %308 = add i64 %307, 1
  %309 = icmp eq i64 %308, 0
  %310 = icmp slt i64 %308, 0
  %311 = trunc i64 %308 to i8
  %312 = xor i64 %307, 1
  %313 = xor i64 %312, %308
  %314 = and i64 %313, 16
  %315 = icmp ne i64 %314, 0
  %316 = icmp ult i64 %308, %307
  %317 = xor i64 %307, 1
  %318 = xor i64 %317, -1
  %319 = xor i64 %308, %307
  %320 = and i64 %318, %319
  %321 = icmp slt i64 %320, 0
  %322 = getelementptr i8, ptr %286, i64 -40
  store i64 %308, ptr %322, align 1
  br label %229

323:                                              ; preds = %276
  %324 = phi i64 [ %277, %276 ]
  %325 = phi i64 [ %278, %276 ]
  %326 = phi i64 [ %279, %276 ]
  %327 = phi i64 [ %280, %276 ]
  %328 = inttoptr i64 %327 to ptr
  %329 = getelementptr i8, ptr %328, i64 -32
  %330 = load i64, ptr %329, align 1
  %331 = add i64 %330, 1
  %332 = icmp eq i64 %331, 0
  %333 = icmp slt i64 %331, 0
  %334 = trunc i64 %331 to i8
  %335 = xor i64 %330, 1
  %336 = xor i64 %335, %331
  %337 = and i64 %336, 16
  %338 = icmp ne i64 %337, 0
  %339 = icmp ult i64 %331, %330
  %340 = xor i64 %330, 1
  %341 = xor i64 %340, -1
  %342 = xor i64 %331, %330
  %343 = and i64 %341, %342
  %344 = icmp slt i64 %343, 0
  %345 = getelementptr i8, ptr %328, i64 -32
  store i64 %331, ptr %345, align 1
  br label %147

346:                                              ; preds = %122
  %347 = phi i1 [ undef, %122 ]
  %348 = phi i1 [ undef, %122 ]
  %349 = phi i1 [ undef, %122 ]
  %350 = phi i8 [ undef, %122 ]
  %351 = phi i1 [ undef, %122 ]
  %352 = phi i1 [ undef, %122 ]
  %353 = phi i64 [ %136, %122 ]
  %354 = phi i64 [ %138, %122 ]
  %355 = phi i64 [ %123, %122 ]
  %356 = phi i64 [ %124, %122 ]
  %357 = phi i64 [ %129, %122 ]
  %358 = phi i64 [ %139, %122 ]
  store i1 %352, ptr addrspace(1) %32, align 1
  store i1 %351, ptr addrspace(1) %33, align 1
  store i8 %350, ptr addrspace(1) %34, align 1
  store i1 %349, ptr addrspace(1) %35, align 1
  store i1 %348, ptr addrspace(1) %36, align 1
  store i1 %347, ptr addrspace(1) %37, align 1
  %359 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } undef, i64 %358, 0
  %360 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %359, i64 %357, 8
  %361 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %360, i64 %356, 5
  %362 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %361, i64 %355, 4
  %363 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %362, i64 %2, 1
  %364 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %363, i64 %354, 13
  %365 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %364, i64 %353, 11
  %366 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %365, i64 %5, 3
  %367 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %366, i64 %4, 2
  %368 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %367, i64 %8, 6
  %369 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %368, i64 %9, 7
  %370 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %369, i64 %11, 9
  %371 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %370, i64 %12, 10
  ret { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %371
}

attributes #0 = { null_pointer_is_valid }

!llvm.module.flags = !{!1}

!0 = !{i64 -1, i64 -1}
!1 = !{i32 1, !"override-stack-alignment", i32 8}
