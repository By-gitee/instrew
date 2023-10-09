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
  %94 = getelementptr i8, ptr %92, i64 -20
  store i32 1000, ptr %94, align 1
  %95 = getelementptr i8, ptr %92, i64 -24
  store i32 2000, ptr %95, align 1
  %96 = getelementptr i8, ptr %92, i64 -28
  store i32 3000, ptr %96, align 1
  %97 = getelementptr i8, ptr %92, i64 -8
  store i32 0, ptr %97, align 1
  br label %98

98:                                               ; preds = %84, %260
  %99 = phi i64 [ %261, %260 ], [ %85, %84 ]
  %100 = phi i64 [ %262, %260 ], [ %86, %84 ]
  %101 = phi i64 [ %263, %260 ], [ %91, %84 ]
  %102 = phi i64 [ %264, %260 ], [ %91, %84 ]
  %103 = inttoptr i64 %102 to ptr
  %104 = getelementptr i8, ptr %103, i64 -8
  %105 = load i32, ptr %104, align 1
  %106 = zext i32 %105 to i64
  %107 = getelementptr i8, ptr %103, i64 -20
  %108 = load i32, ptr %107, align 1
  %109 = sub i32 %105, %108
  %110 = icmp slt i32 %109, 0
  %111 = icmp eq i32 %105, %108
  %112 = trunc i32 %109 to i8
  %113 = xor i32 %105, %108
  %114 = xor i32 %113, %109
  %115 = and i32 %114, 16
  %116 = icmp ne i32 %115, 0
  %117 = icmp ult i32 %105, %108
  %118 = icmp slt i32 %105, %108
  %119 = icmp ne i1 %110, %118
  %120 = icmp ne i1 %110, %119
  %121 = xor i1 %120, true
  %122 = select i1 %121, i64 140525102567969, i64 140525102567779
  br i1 %121, label %123, label %141

123:                                              ; preds = %98
  %124 = phi i64 [ %99, %98 ]
  %125 = phi i64 [ %100, %98 ]
  %126 = phi i64 [ %101, %98 ]
  %127 = phi i64 [ %106, %98 ]
  %128 = trunc i64 %127 to i32
  %129 = xor i32 %128, %128
  %130 = zext i32 %129 to i64
  %131 = icmp eq i32 %129, 0
  %132 = icmp slt i32 %129, 0
  %133 = trunc i32 %129 to i8
  %134 = inttoptr i64 %126 to ptr
  %135 = getelementptr i64, ptr %134, i64 1
  %136 = ptrtoint ptr %135 to i64
  %137 = load i64, ptr %134, align 4
  %138 = getelementptr i64, ptr %135, i64 1
  %139 = ptrtoint ptr %138 to i64
  %140 = load i64, ptr %135, align 4
  br label %433

141:                                              ; preds = %98
  %142 = phi i64 [ %99, %98 ]
  %143 = phi i64 [ %100, %98 ]
  %144 = phi i64 [ %101, %98 ]
  %145 = phi i64 [ %102, %98 ]
  %146 = inttoptr i64 %145 to ptr
  %147 = getelementptr i8, ptr %146, i64 -12
  store i32 0, ptr %147, align 1
  br label %148

148:                                              ; preds = %408, %141
  %149 = phi i64 [ %142, %141 ], [ %409, %408 ]
  %150 = phi i64 [ %143, %141 ], [ %410, %408 ]
  %151 = phi i64 [ %144, %141 ], [ %411, %408 ]
  %152 = phi i64 [ %145, %141 ], [ %412, %408 ]
  %153 = inttoptr i64 %152 to ptr
  %154 = getelementptr i8, ptr %153, i64 -12
  %155 = load i32, ptr %154, align 1
  %156 = zext i32 %155 to i64
  %157 = getelementptr i8, ptr %153, i64 -24
  %158 = load i32, ptr %157, align 1
  %159 = sub i32 %155, %158
  %160 = icmp slt i32 %159, 0
  %161 = icmp eq i32 %155, %158
  %162 = trunc i32 %159 to i8
  %163 = xor i32 %155, %158
  %164 = xor i32 %163, %159
  %165 = and i32 %164, 16
  %166 = icmp ne i32 %165, 0
  %167 = icmp ult i32 %155, %158
  %168 = icmp slt i32 %155, %158
  %169 = icmp ne i1 %160, %168
  %170 = icmp ne i1 %160, %169
  %171 = xor i1 %170, true
  %172 = select i1 %171, i64 140525102567950, i64 140525102567798
  br i1 %171, label %173, label %178

173:                                              ; preds = %148
  %174 = phi i64 [ %149, %148 ]
  %175 = phi i64 [ %150, %148 ]
  %176 = phi i64 [ %151, %148 ]
  %177 = phi i64 [ %152, %148 ]
  br label %260

178:                                              ; preds = %148
  %179 = phi i64 [ %151, %148 ]
  %180 = phi i64 [ %152, %148 ]
  %181 = inttoptr i64 %180 to ptr
  %182 = getelementptr i8, ptr %181, i64 -12
  %183 = load i32, ptr %182, align 1
  %184 = zext i32 %183 to i64
  %185 = getelementptr i8, ptr %181, i64 -8
  %186 = load i32, ptr %185, align 1
  %187 = sext i32 %186 to i64
  %188 = mul i64 %187, 24000000
  %189 = sext i64 %187 to i128
  %190 = mul i128 %189, 24000000
  %191 = sext i64 %188 to i128
  %192 = icmp ne i128 %190, %191
  %193 = add i64 140525102579776, %188
  %194 = icmp eq i64 %193, 0
  %195 = icmp slt i64 %193, 0
  %196 = trunc i64 %193 to i8
  %197 = xor i64 140525102579776, %188
  %198 = xor i64 %197, %193
  %199 = and i64 %198, 16
  %200 = icmp ne i64 %199, 0
  %201 = icmp ult i64 %193, 140525102579776
  %202 = xor i64 140525102579776, %188
  %203 = xor i64 %202, -1
  %204 = xor i64 %193, 140525102579776
  %205 = and i64 %203, %204
  %206 = icmp slt i64 %205, 0
  %207 = getelementptr i8, ptr %181, i64 -8
  %208 = load i32, ptr %207, align 1
  %209 = sext i32 %208 to i64
  %210 = mul i64 %209, 12000
  %211 = sext i64 %209 to i128
  %212 = mul i128 %211, 12000
  %213 = sext i64 %210 to i128
  %214 = icmp ne i128 %212, %213
  %215 = add i64 %193, %210
  %216 = icmp eq i64 %215, 0
  %217 = icmp slt i64 %215, 0
  %218 = trunc i64 %215 to i8
  %219 = xor i64 %193, %210
  %220 = xor i64 %219, %215
  %221 = and i64 %220, 16
  %222 = icmp ne i64 %221, 0
  %223 = icmp ult i64 %215, %193
  %224 = xor i64 %193, %210
  %225 = xor i64 %224, -1
  %226 = xor i64 %215, %193
  %227 = and i64 %225, %226
  %228 = icmp slt i64 %227, 0
  %229 = getelementptr i8, ptr %181, i64 -8
  %230 = load i32, ptr %229, align 1
  %231 = sext i32 %230 to i64
  %232 = inttoptr i64 %215 to ptr
  %233 = getelementptr i32, ptr %232, i64 %231
  store i32 %183, ptr %233, align 1
  %234 = getelementptr i8, ptr %181, i64 -16
  store i32 0, ptr %234, align 1
  br label %235

235:                                              ; preds = %178, %290
  %236 = phi i64 [ %385, %290 ], [ %184, %178 ]
  %237 = phi i64 [ %377, %290 ], [ %231, %178 ]
  %238 = phi i64 [ %291, %290 ], [ %179, %178 ]
  %239 = phi i64 [ %292, %290 ], [ %180, %178 ]
  %240 = inttoptr i64 %239 to ptr
  %241 = getelementptr i8, ptr %240, i64 -16
  %242 = load i32, ptr %241, align 1
  %243 = zext i32 %242 to i64
  %244 = getelementptr i8, ptr %240, i64 -28
  %245 = load i32, ptr %244, align 1
  %246 = sub i32 %242, %245
  %247 = icmp slt i32 %246, 0
  %248 = icmp eq i32 %242, %245
  %249 = trunc i32 %246 to i8
  %250 = xor i32 %242, %245
  %251 = xor i32 %250, %246
  %252 = and i32 %251, 16
  %253 = icmp ne i32 %252, 0
  %254 = icmp ult i32 %242, %245
  %255 = icmp slt i32 %242, %245
  %256 = icmp ne i1 %247, %255
  %257 = icmp ne i1 %247, %256
  %258 = xor i1 %257, true
  %259 = select i1 %258, i64 140525102567931, i64 140525102567862
  br i1 %258, label %285, label %290

260:                                              ; preds = %173
  %261 = phi i64 [ %174, %173 ]
  %262 = phi i64 [ %175, %173 ]
  %263 = phi i64 [ %176, %173 ]
  %264 = phi i64 [ %177, %173 ]
  %265 = inttoptr i64 %264 to ptr
  %266 = getelementptr i8, ptr %265, i64 -8
  %267 = load i32, ptr %266, align 1
  %268 = zext i32 %267 to i64
  %269 = add i32 %267, 1
  %270 = zext i32 %269 to i64
  %271 = icmp eq i32 %269, 0
  %272 = icmp slt i32 %269, 0
  %273 = trunc i32 %269 to i8
  %274 = xor i32 %267, 1
  %275 = xor i32 %274, %269
  %276 = and i32 %275, 16
  %277 = icmp ne i32 %276, 0
  %278 = icmp ult i32 %269, %267
  %279 = xor i32 %267, 1
  %280 = xor i32 %279, -1
  %281 = xor i32 %269, %267
  %282 = and i32 %280, %281
  %283 = icmp slt i32 %282, 0
  %284 = getelementptr i8, ptr %265, i64 -8
  store i32 %269, ptr %284, align 1
  br label %98

285:                                              ; preds = %235
  %286 = phi i64 [ %236, %235 ]
  %287 = phi i64 [ %237, %235 ]
  %288 = phi i64 [ %238, %235 ]
  %289 = phi i64 [ %239, %235 ]
  br label %408

290:                                              ; preds = %235
  %291 = phi i64 [ %238, %235 ]
  %292 = phi i64 [ %239, %235 ]
  %293 = inttoptr i64 %292 to ptr
  %294 = getelementptr i8, ptr %293, i64 -8
  %295 = load i32, ptr %294, align 1
  %296 = zext i32 %295 to i64
  %297 = getelementptr i8, ptr %293, i64 -12
  %298 = load i32, ptr %297, align 1
  %299 = add i32 %295, %298
  %300 = zext i32 %299 to i64
  %301 = icmp eq i32 %299, 0
  %302 = icmp slt i32 %299, 0
  %303 = trunc i32 %299 to i8
  %304 = xor i32 %295, %298
  %305 = xor i32 %304, %299
  %306 = and i32 %305, 16
  %307 = icmp ne i32 %306, 0
  %308 = icmp ult i32 %299, %295
  %309 = xor i32 %295, %298
  %310 = xor i32 %309, -1
  %311 = xor i32 %299, %295
  %312 = and i32 %310, %311
  %313 = icmp slt i32 %312, 0
  %314 = getelementptr i8, ptr %293, i64 -16
  %315 = load i32, ptr %314, align 1
  %316 = add i32 %299, %315
  %317 = zext i32 %316 to i64
  %318 = icmp eq i32 %316, 0
  %319 = icmp slt i32 %316, 0
  %320 = trunc i32 %316 to i8
  %321 = xor i32 %299, %315
  %322 = xor i32 %321, %316
  %323 = and i32 %322, 16
  %324 = icmp ne i32 %323, 0
  %325 = icmp ult i32 %316, %299
  %326 = xor i32 %299, %315
  %327 = xor i32 %326, -1
  %328 = xor i32 %316, %299
  %329 = and i32 %327, %328
  %330 = icmp slt i32 %329, 0
  %331 = getelementptr i8, ptr %293, i64 -8
  %332 = load i32, ptr %331, align 1
  %333 = sext i32 %332 to i64
  %334 = mul i64 %333, 24000000
  %335 = sext i64 %333 to i128
  %336 = mul i128 %335, 24000000
  %337 = sext i64 %334 to i128
  %338 = icmp ne i128 %336, %337
  %339 = add i64 140525102579776, %334
  %340 = icmp eq i64 %339, 0
  %341 = icmp slt i64 %339, 0
  %342 = trunc i64 %339 to i8
  %343 = xor i64 140525102579776, %334
  %344 = xor i64 %343, %339
  %345 = and i64 %344, 16
  %346 = icmp ne i64 %345, 0
  %347 = icmp ult i64 %339, 140525102579776
  %348 = xor i64 140525102579776, %334
  %349 = xor i64 %348, -1
  %350 = xor i64 %339, 140525102579776
  %351 = and i64 %349, %350
  %352 = icmp slt i64 %351, 0
  %353 = getelementptr i8, ptr %293, i64 -12
  %354 = load i32, ptr %353, align 1
  %355 = sext i32 %354 to i64
  %356 = mul i64 %355, 12000
  %357 = sext i64 %355 to i128
  %358 = mul i128 %357, 12000
  %359 = sext i64 %356 to i128
  %360 = icmp ne i128 %358, %359
  %361 = add i64 %339, %356
  %362 = icmp eq i64 %361, 0
  %363 = icmp slt i64 %361, 0
  %364 = trunc i64 %361 to i8
  %365 = xor i64 %339, %356
  %366 = xor i64 %365, %361
  %367 = and i64 %366, 16
  %368 = icmp ne i64 %367, 0
  %369 = icmp ult i64 %361, %339
  %370 = xor i64 %339, %356
  %371 = xor i64 %370, -1
  %372 = xor i64 %361, %339
  %373 = and i64 %371, %372
  %374 = icmp slt i64 %373, 0
  %375 = getelementptr i8, ptr %293, i64 -16
  %376 = load i32, ptr %375, align 1
  %377 = sext i32 %376 to i64
  %378 = inttoptr i64 %361 to ptr
  %379 = getelementptr i32, ptr %378, i64 %377
  %380 = load i32, ptr %379, align 1
  %381 = mul i32 %316, %380
  %382 = sext i32 %316 to i64
  %383 = sext i32 %380 to i64
  %384 = mul i64 %382, %383
  %385 = zext i32 %381 to i64
  %386 = sext i32 %381 to i64
  %387 = icmp ne i64 %384, %386
  %388 = getelementptr i32, ptr %378, i64 %377
  store i32 %381, ptr %388, align 1
  %389 = getelementptr i8, ptr %293, i64 -16
  %390 = load i32, ptr %389, align 1
  %391 = zext i32 %390 to i64
  %392 = add i32 %390, 1
  %393 = zext i32 %392 to i64
  %394 = icmp eq i32 %392, 0
  %395 = icmp slt i32 %392, 0
  %396 = trunc i32 %392 to i8
  %397 = xor i32 %390, 1
  %398 = xor i32 %397, %392
  %399 = and i32 %398, 16
  %400 = icmp ne i32 %399, 0
  %401 = icmp ult i32 %392, %390
  %402 = xor i32 %390, 1
  %403 = xor i32 %402, -1
  %404 = xor i32 %392, %390
  %405 = and i32 %403, %404
  %406 = icmp slt i32 %405, 0
  %407 = getelementptr i8, ptr %293, i64 -16
  store i32 %392, ptr %407, align 1
  br label %235

408:                                              ; preds = %285
  %409 = phi i64 [ %286, %285 ]
  %410 = phi i64 [ %287, %285 ]
  %411 = phi i64 [ %288, %285 ]
  %412 = phi i64 [ %289, %285 ]
  %413 = inttoptr i64 %412 to ptr
  %414 = getelementptr i8, ptr %413, i64 -12
  %415 = load i32, ptr %414, align 1
  %416 = zext i32 %415 to i64
  %417 = add i32 %415, 1
  %418 = zext i32 %417 to i64
  %419 = icmp eq i32 %417, 0
  %420 = icmp slt i32 %417, 0
  %421 = trunc i32 %417 to i8
  %422 = xor i32 %415, 1
  %423 = xor i32 %422, %417
  %424 = and i32 %423, 16
  %425 = icmp ne i32 %424, 0
  %426 = icmp ult i32 %417, %415
  %427 = xor i32 %415, 1
  %428 = xor i32 %427, -1
  %429 = xor i32 %417, %415
  %430 = and i32 %428, %429
  %431 = icmp slt i32 %430, 0
  %432 = getelementptr i8, ptr %413, i64 -12
  store i32 %417, ptr %432, align 1
  br label %148

433:                                              ; preds = %123
  %434 = phi i1 [ undef, %123 ]
  %435 = phi i1 [ undef, %123 ]
  %436 = phi i1 [ undef, %123 ]
  %437 = phi i8 [ undef, %123 ]
  %438 = phi i1 [ undef, %123 ]
  %439 = phi i1 [ undef, %123 ]
  %440 = phi i64 [ %137, %123 ]
  %441 = phi i64 [ %139, %123 ]
  %442 = phi i64 [ %124, %123 ]
  %443 = phi i64 [ %125, %123 ]
  %444 = phi i64 [ %130, %123 ]
  %445 = phi i64 [ %140, %123 ]
  store i1 %439, ptr addrspace(1) %32, align 1
  store i1 %438, ptr addrspace(1) %33, align 1
  store i8 %437, ptr addrspace(1) %34, align 1
  store i1 %436, ptr addrspace(1) %35, align 1
  store i1 %435, ptr addrspace(1) %36, align 1
  store i1 %434, ptr addrspace(1) %37, align 1
  %446 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } undef, i64 %445, 0
  %447 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %446, i64 %444, 8
  %448 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %447, i64 %443, 5
  %449 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %448, i64 %442, 4
  %450 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %449, i64 %2, 1
  %451 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %450, i64 %441, 13
  %452 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %451, i64 %440, 11
  %453 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %452, i64 %5, 3
  %454 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %453, i64 %4, 2
  %455 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %454, i64 %8, 6
  %456 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %455, i64 %9, 7
  %457 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %456, i64 %11, 9
  %458 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %457, i64 %12, 10
  ret { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %458
}

attributes #0 = { null_pointer_is_valid }

!llvm.module.flags = !{!1}

!0 = !{i64 -1, i64 -1}
!1 = !{i32 1, !"override-stack-alignment", i32 8}
