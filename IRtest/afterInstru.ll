; ModuleID = 'mod'
source_filename = "mod"

@instrew_baseaddr = external global i64, !absolute_symbol !0
@llvm.used = appending global [3 x ptr] [ptr @instrew_baseaddr, ptr @syscall, ptr @cpuid], section "llvm.metadata"

declare void @syscall(ptr addrspace(1))

declare { i64, i64 } @cpuid(i32, i32)

; Function Attrs: mustprogress noinline norecurse nounwind optnone uwtable
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
  store i32 10, ptr %94, align 1
  %95 = getelementptr i8, ptr %92, i64 -24
  store i32 20, ptr %95, align 1
  %96 = getelementptr i8, ptr %92, i64 -28
  store i32 30, ptr %96, align 1
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
  %122 = select i1 %121, i64 139916665418274, i64 139916665418083
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
  br label %425

141:                                              ; preds = %98
  %142 = phi i64 [ %99, %98 ]
  %143 = phi i64 [ %100, %98 ]
  %144 = phi i64 [ %101, %98 ]
  %145 = phi i64 [ %102, %98 ]
  %146 = inttoptr i64 %145 to ptr
  %147 = getelementptr i8, ptr %146, i64 -12
  store i32 0, ptr %147, align 1
  br label %148

148:                                              ; preds = %141, %400
  %149 = phi i64 [ %401, %400 ], [ %142, %141 ]
  %150 = phi i64 [ %402, %400 ], [ %143, %141 ]
  %151 = phi i64 [ %403, %400 ], [ %144, %141 ]
  %152 = phi i64 [ %404, %400 ], [ %145, %141 ]
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
  %172 = select i1 %171, i64 139916665418255, i64 139916665418102
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
  %193 = add i64 139916665430080, %188
  %194 = icmp eq i64 %193, 0
  %195 = icmp slt i64 %193, 0
  %196 = trunc i64 %193 to i8
  %197 = xor i64 139916665430080, %188
  %198 = xor i64 %197, %193
  %199 = and i64 %198, 16
  %200 = icmp ne i64 %199, 0
  %201 = icmp ult i64 %193, 139916665430080
  %202 = xor i64 139916665430080, %188
  %203 = xor i64 %202, -1
  %204 = xor i64 %193, 139916665430080
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
  %236 = phi i64 [ %366, %.temp.branch ], [ %184, %178 ]
  %237 = phi i64 [ %361, %.temp.branch ], [ %231, %178 ]
  %238 = phi i64 [ %291, %.temp.branch ], [ %179, %178 ]
  %239 = phi i64 [ %292, %.temp.branch ], [ %180, %178 ]
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
  %259 = select i1 %258, i64 139916665418236, i64 139916665418166
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
  br label %400

290:                                              ; preds = %235
  %291 = phi i64 [ %238, %235 ]
  %292 = phi i64 [ %239, %235 ]
  %293 = inttoptr i64 %292 to ptr
  %294 = getelementptr i8, ptr %293, i64 -8
  %295 = load i32, ptr %294, align 1
  %296 = zext i32 %295 to i64
  %297 = getelementptr i8, ptr %293, i64 -12
  %298 = load i32, ptr %297, align 1
  %299 = mul i32 %295, %298
  %300 = sext i32 %295 to i64
  %301 = sext i32 %298 to i64
  %302 = mul i64 %300, %301
  %303 = zext i32 %299 to i64
  %304 = sext i32 %299 to i64
  %305 = icmp ne i64 %302, %304
  %306 = getelementptr i8, ptr %293, i64 -16
  %307 = load i32, ptr %306, align 1
  %308 = mul i32 %299, %307
  %309 = sext i32 %299 to i64
  %310 = sext i32 %307 to i64
  %311 = mul i64 %309, %310
  %312 = zext i32 %308 to i64
  %313 = sext i32 %308 to i64
  %314 = icmp ne i64 %311, %313
  %315 = getelementptr i8, ptr %293, i64 -8
  %316 = load i32, ptr %315, align 1
  %317 = sext i32 %316 to i64
  %318 = mul i64 %317, 24000000
  %319 = sext i64 %317 to i128
  %320 = mul i128 %319, 24000000
  %321 = sext i64 %318 to i128
  %322 = icmp ne i128 %320, %321
  %323 = add i64 139916665430080, %318
  %324 = icmp eq i64 %323, 0
  %325 = icmp slt i64 %323, 0
  %326 = trunc i64 %323 to i8
  %327 = xor i64 139916665430080, %318
  %328 = xor i64 %327, %323
  %329 = and i64 %328, 16
  %330 = icmp ne i64 %329, 0
  %331 = icmp ult i64 %323, 139916665430080
  %332 = xor i64 139916665430080, %318
  %333 = xor i64 %332, -1
  %334 = xor i64 %323, 139916665430080
  %335 = and i64 %333, %334
  %336 = icmp slt i64 %335, 0
  %337 = getelementptr i8, ptr %293, i64 -12
  %338 = load i32, ptr %337, align 1
  %339 = sext i32 %338 to i64
  %340 = mul i64 %339, 12000
  %341 = sext i64 %339 to i128
  %342 = mul i128 %341, 12000
  %343 = sext i64 %340 to i128
  %344 = icmp ne i128 %342, %343
  %345 = add i64 %323, %340
  %346 = icmp eq i64 %345, 0
  %347 = icmp slt i64 %345, 0
  %348 = trunc i64 %345 to i8
  %349 = xor i64 %323, %340
  %350 = xor i64 %349, %345
  %351 = and i64 %350, 16
  %352 = icmp ne i64 %351, 0
  %353 = icmp ult i64 %345, %323
  %354 = xor i64 %323, %340
  %355 = xor i64 %354, -1
  %356 = xor i64 %345, %323
  %357 = and i64 %355, %356
  %358 = icmp slt i64 %357, 0
  %359 = getelementptr i8, ptr %293, i64 -16
  %360 = load i32, ptr %359, align 1
  %361 = sext i32 %360 to i64
  %362 = inttoptr i64 %345 to ptr
  %363 = getelementptr i32, ptr %362, i64 %361
  %364 = load i32, ptr %363, align 1
  %365 = add i32 %308, %364
  %366 = zext i32 %365 to i64
  %367 = icmp eq i32 %365, 0
  %368 = icmp slt i32 %365, 0
  %369 = trunc i32 %365 to i8
  %370 = xor i32 %308, %364
  %371 = xor i32 %370, %365
  %372 = and i32 %371, 16
  %373 = icmp ne i32 %372, 0
  %374 = icmp ult i32 %365, %308
  %375 = xor i32 %308, %364
  %376 = xor i32 %375, -1
  %377 = xor i32 %365, %308
  %378 = and i32 %376, %377
  %379 = icmp slt i32 %378, 0
  %380 = getelementptr i32, ptr %362, i64 %361
  store i32 %365, ptr %380, align 1
  br label %.temp.branch

.temp.branch:                               ; preds = %290
  %381 = getelementptr i8, ptr %293, i64 -16
  %382 = load i32, ptr %381, align 1
  %383 = zext i32 %382 to i64
  %384 = add i32 %382, 1
  %385 = zext i32 %384 to i64
  %386 = icmp eq i32 %384, 0
  %387 = icmp slt i32 %384, 0
  %388 = trunc i32 %384 to i8
  %389 = xor i32 %382, 1
  %390 = xor i32 %389, %384
  %391 = and i32 %390, 16
  %392 = icmp ne i32 %391, 0
  %393 = icmp ult i32 %384, %382
  %394 = xor i32 %382, 1
  %395 = xor i32 %394, -1
  %396 = xor i32 %384, %382
  %397 = and i32 %395, %396
  %398 = icmp slt i32 %397, 0
  %399 = getelementptr i8, ptr %293, i64 -16
  store i32 %384, ptr %399, align 1
  br label %235

400:                                              ; preds = %285
  %401 = phi i64 [ %286, %285 ]
  %402 = phi i64 [ %287, %285 ]
  %403 = phi i64 [ %288, %285 ]
  %404 = phi i64 [ %289, %285 ]
  %405 = inttoptr i64 %404 to ptr
  %406 = getelementptr i8, ptr %405, i64 -12
  %407 = load i32, ptr %406, align 1
  %408 = zext i32 %407 to i64
  %409 = add i32 %407, 1
  %410 = zext i32 %409 to i64
  %411 = icmp eq i32 %409, 0
  %412 = icmp slt i32 %409, 0
  %413 = trunc i32 %409 to i8
  %414 = xor i32 %407, 1
  %415 = xor i32 %414, %409
  %416 = and i32 %415, 16
  %417 = icmp ne i32 %416, 0
  %418 = icmp ult i32 %409, %407
  %419 = xor i32 %407, 1
  %420 = xor i32 %419, -1
  %421 = xor i32 %409, %407
  %422 = and i32 %420, %421
  %423 = icmp slt i32 %422, 0
  %424 = getelementptr i8, ptr %405, i64 -12
  store i32 %409, ptr %424, align 1
  br label %148

425:                                              ; preds = %123
  %426 = phi i1 [ undef, %123 ]
  %427 = phi i1 [ undef, %123 ]
  %428 = phi i1 [ undef, %123 ]
  %429 = phi i8 [ undef, %123 ]
  %430 = phi i1 [ undef, %123 ]
  %431 = phi i1 [ undef, %123 ]
  %432 = phi i64 [ %137, %123 ]
  %433 = phi i64 [ %139, %123 ]
  %434 = phi i64 [ %124, %123 ]
  %435 = phi i64 [ %125, %123 ]
  %436 = phi i64 [ %130, %123 ]
  %437 = phi i64 [ %140, %123 ]
  store i1 %431, ptr addrspace(1) %32, align 1
  store i1 %430, ptr addrspace(1) %33, align 1
  store i8 %429, ptr addrspace(1) %34, align 1
  store i1 %428, ptr addrspace(1) %35, align 1
  store i1 %427, ptr addrspace(1) %36, align 1
  store i1 %426, ptr addrspace(1) %37, align 1
  %438 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } undef, i64 %437, 0
  %439 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %438, i64 %436, 8
  %440 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %439, i64 %435, 5
  %441 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %440, i64 %434, 4
  %442 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %441, i64 %2, 1
  %443 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %442, i64 %433, 13
  %444 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %443, i64 %432, 11
  %445 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %444, i64 %5, 3
  %446 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %445, i64 %4, 2
  %447 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %446, i64 %8, 6
  %448 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %447, i64 %9, 7
  %449 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %448, i64 %11, 9
  %450 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %449, i64 %12, 10
  ret { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %450
}

attributes #0 = { mustprogress noinline norecurse nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
