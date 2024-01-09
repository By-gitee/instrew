Inst MC:48 c1 e0 4 4c 1 ca 48 1 c8 48 89 55 90 48 
Inst MC:48 c1 e0 4 4c 1 ca 48 1 c8 48 89 55 90 48 
Inst MC:73 d6 48 8d d 57 ba 1 0 ba 9c 0 0 0 48 
Inst MC:48 8b 55 8 48 8b 4d 30 80 3a 0 75 18 48 8b 
Inst MC:48 8b 55 8 48 8b 4d 30 80 3a 0 75 18 48 8b 
Inst MC:48 8d bb d0 2 0 0 b8 da 0 0 0 f 5 89 
Inst MC:31 d2 eb dd 48 8d d 45 d7 2 0 ba 25 0 0 
Inst MC:55 48 89 e5 c7 45 fc 0 0 0 0 c7 45 ec a 
==  %29 = load i64, ptr %15, align 4
==i64 0
==i64 29
==  %22 = zext i32 %59 to i64
new load ptr:  %57 = getelementptr inbounds [10 x [2000 x [3000 x i32]]], ptr @arr0, i64 0, i64 %47, i64 %55, i64 %56
old:  %61 = add i32 %60, %56
==i64 %2
==  %30 = ptrtoint ptr %29 to i64
==  %28 = load i64, ptr %16, align 4
==i64 %5
==i64 %4
==i64 %8
==i64 %9
==i64 %11
==i64 %12
[Bydebug]-1
[Bydebug]-2
[Bydebug]-3
[Bydebug]-4
[Bydebug]-5
[Bydebug]-6
判定
Checking region:%14 => <Function Return>
	判定
Checking region:.preheader => %21
	ret1
ret2
ret3
ret4
ret5
    0
  store i32 %.0310, ptr %50, align 4 Here?            isValidAccess - 1
            isValidAccess - 2
            isValidAccess - 3
            isValidAccess - 4
            isValidAccess - 8
            isValidAccess - final
1
            isValidAccess - 1
            isValidAccess - 2
            isValidAccess - 3
            isValidAccess - 4
            isValidAccess - 5
            isValidAccess - 8
            isValidAccess - final
  %60 = load i32, ptr %59, align 4 Here?            isValidAccess - 1
            isValidAccess - 2
            isValidAccess - 3
            isValidAccess - 4
            isValidAccess - 5
            isValidAccess - 8
            isValidAccess - final
1
            isValidAccess - 1
            isValidAccess - 2
            isValidAccess - 3
            isValidAccess - 4
            isValidAccess - 5
            isValidAccess - 8
            isValidAccess - final
  store i32 %61, ptr %59, align 4 Here?            isValidAccess - 1
            isValidAccess - 2
            isValidAccess - 3
            isValidAccess - 4
            isValidAccess - 5
            isValidAccess - 8
            isValidAccess - final
1
            isValidAccess - 1
            isValidAccess - 2
            isValidAccess - 3
            isValidAccess - 4
            isValidAccess - 5
            isValidAccess - 8
            isValidAccess - final
ret6
ret7
happen
%14 => <Function Return>
[Bydebug]-6 ValidRegions.size(): 1
[Bydebug]-7
[Bydebug]-7 for
[Bydebug]-71 ValidRegions.size(): 1
[Bydebug]-72 ValidRegions.size(): 1
[Bydebug]-7 for
[Bydebug]-71 ValidRegions.size(): 1
[Bydebug]-72 ValidRegions.size(): 1
[Bydebug]-73 ValidRegions.size(): 1
[Bydebug]isProfitableRegion - 1
[Bydebug]isProfitableRegion - 2
.preheader => %21: 1 1
[0] .preheader => %21
  [1] %48 => %45
    [2] %54 => %51
[Bydebug]isProfitableRegion - 3
[Bydebug]isProfitableRegion - 4
[Bydebug]-8
[Bydebug]-8 ValidRegions.size(): 1
[Bydebug]-9
[Bydebug]-9 ValidRegions.size(): 1
[Bydebug]-10
[Bydebug]-10 ValidRegions.size(): 1
[Bydebug]-11
[ByDebug]recomput
[Bydebug]recomput 1
Checking region:.preheader => %21
	ret1
ret2
ret3
ret4
ret5
    0
  store i32 %.0310, ptr %50, align 4 Here?            isValidAccess - 1
            isValidAccess - 2
            isValidAccess - 3
            isValidAccess - 4
            isValidAccess - 8
            isValidAccess - final
1
            isValidAccess - 1
            isValidAccess - 2
            isValidAccess - 3
            isValidAccess - 4
            isValidAccess - 5
            isValidAccess - 8
            isValidAccess - final
  %60 = load i32, ptr %59, align 4 Here?            isValidAccess - 1
            isValidAccess - 2
            isValidAccess - 3
            isValidAccess - 4
            isValidAccess - 5
            isValidAccess - 8
            isValidAccess - final
1
            isValidAccess - 1
            isValidAccess - 2
            isValidAccess - 3
            isValidAccess - 4
            isValidAccess - 5
            isValidAccess - 8
            isValidAccess - final
  store i32 %61, ptr %59, align 4 Here?            isValidAccess - 1
            isValidAccess - 2
            isValidAccess - 3
            isValidAccess - 4
            isValidAccess - 5
            isValidAccess - 8
            isValidAccess - final
1
            isValidAccess - 1
            isValidAccess - 2
            isValidAccess - 3
            isValidAccess - 4
            isValidAccess - 5
            isValidAccess - 8
            isValidAccess - final
ret6
ret7
[Bydebug]recomput 2
[Bydebug]recomput 3
[Bydebug]recomput 4
[Bydebug]recomput 5
  IsParallel - 1
	RAW dependences:
		{ Stmt1[i0, i0] -> Stmt2[i0, i0, i0] : 0 <= i0 <= 9 }
	WAR dependences:
		{ Stmt2[i0, i0, i0] -> Stmt1[i0, 1 + i0] : 0 <= i0 <= 9 }
	WAW dependences:
		{ Stmt1[i0, i0] -> Stmt2[i0, i0, i0] : 0 <= i0 <= 9; Stmt2[i0, i0, i0] -> Stmt1[i0, 1 + i0] : 0 <= i0 <= 9; Stmt1last[i0, i1] -> Stmt1last[i0, 1 + i1] : 0 <= i0 <= 9 and 0 <= i1 <= 18; Stmt1last[i0, 19] -> Stmt1last[1 + i0, 0] : 0 <= i0 <= 8; Stmt2last[i0, i1, i2] -> Stmt2last[i0, i1, 1 + i2] : 0 <= i0 <= 9 and 0 <= i1 <= 19 and 0 <= i2 <= 28; Stmt2last[i0, i1, 29] -> Stmt2last[i0, 1 + i1, 0] : 0 <= i0 <= 9 and 0 <= i1 <= 18; Stmt2last[i0, 19, 29] -> Stmt2last[1 + i0, 0, 0] : 0 <= i0 <= 8; Stmt1[i0, i1] -> Stmt1[i0, 1 + i1] : i0 <= 9 and ((0 <= i1 < i0) or (i0 >= 0 and i0 < i1 <= 18)) }
	Reduction dependences:
		{  }
	Transitive closure of reduction dependences:
		{  }
	RAW dependences:
		{ Stmt1[i0, i0] -> Stmt2[i0, i0, i0] : 0 <= i0 <= 9 }
	WAR dependences:
		{ Stmt2[i0, i0, i0] -> Stmt1[i0, 1 + i0] : 0 <= i0 <= 9 }
	WAW dependences:
		{ Stmt1[i0, i0] -> Stmt2[i0, i0, i0] : 0 <= i0 <= 9; Stmt2[i0, i0, i0] -> Stmt1[i0, 1 + i0] : 0 <= i0 <= 9; Stmt1last[i0, i1] -> Stmt1last[i0, 1 + i1] : 0 <= i0 <= 9 and 0 <= i1 <= 18; Stmt1last[i0, 19] -> Stmt1last[1 + i0, 0] : 0 <= i0 <= 8; Stmt2last[i0, i1, i2] -> Stmt2last[i0, i1, 1 + i2] : 0 <= i0 <= 9 and 0 <= i1 <= 19 and 0 <= i2 <= 28; Stmt2last[i0, i1, 29] -> Stmt2last[i0, 1 + i1, 0] : 0 <= i0 <= 9 and 0 <= i1 <= 18; Stmt2last[i0, 19, 29] -> Stmt2last[1 + i0, 0, 0] : 0 <= i0 <= 8; Stmt1[i0, i1] -> Stmt1[i0, 1 + i1] : i0 <= 9 and ((0 <= i1 < i0) or (i0 >= 0 and i0 < i1 <= 18)) }
	Reduction dependences:
		{  }
	Transitive closure of reduction dependences:
		{  }
IsParallel0
  IsParallel - 1
	RAW dependences:
		{ Stmt1[i0, i0] -> Stmt2[i0, i0, i0] : 0 <= i0 <= 9 }
	WAR dependences:
		{ Stmt2[i0, i0, i0] -> Stmt1[i0, 1 + i0] : 0 <= i0 <= 9 }
	WAW dependences:
		{ Stmt1[i0, i0] -> Stmt2[i0, i0, i0] : 0 <= i0 <= 9; Stmt2[i0, i0, i0] -> Stmt1[i0, 1 + i0] : 0 <= i0 <= 9; Stmt1last[i0, i1] -> Stmt1last[i0, 1 + i1] : 0 <= i0 <= 9 and 0 <= i1 <= 18; Stmt1last[i0, 19] -> Stmt1last[1 + i0, 0] : 0 <= i0 <= 8; Stmt2last[i0, i1, i2] -> Stmt2last[i0, i1, 1 + i2] : 0 <= i0 <= 9 and 0 <= i1 <= 19 and 0 <= i2 <= 28; Stmt2last[i0, i1, 29] -> Stmt2last[i0, 1 + i1, 0] : 0 <= i0 <= 9 and 0 <= i1 <= 18; Stmt2last[i0, 19, 29] -> Stmt2last[1 + i0, 0, 0] : 0 <= i0 <= 8; Stmt1[i0, i1] -> Stmt1[i0, 1 + i1] : i0 <= 9 and ((0 <= i1 < i0) or (i0 >= 0 and i0 < i1 <= 18)) }
	Reduction dependences:
		{  }
	Transitive closure of reduction dependences:
		{  }
	RAW dependences:
		{ Stmt1[i0, i0] -> Stmt2[i0, i0, i0] : 0 <= i0 <= 9 }
	WAR dependences:
		{ Stmt2[i0, i0, i0] -> Stmt1[i0, 1 + i0] : 0 <= i0 <= 9 }
	WAW dependences:
		{ Stmt1[i0, i0] -> Stmt2[i0, i0, i0] : 0 <= i0 <= 9; Stmt2[i0, i0, i0] -> Stmt1[i0, 1 + i0] : 0 <= i0 <= 9; Stmt1last[i0, i1] -> Stmt1last[i0, 1 + i1] : 0 <= i0 <= 9 and 0 <= i1 <= 18; Stmt1last[i0, 19] -> Stmt1last[1 + i0, 0] : 0 <= i0 <= 8; Stmt2last[i0, i1, i2] -> Stmt2last[i0, i1, 1 + i2] : 0 <= i0 <= 9 and 0 <= i1 <= 19 and 0 <= i2 <= 28; Stmt2last[i0, i1, 29] -> Stmt2last[i0, 1 + i1, 0] : 0 <= i0 <= 9 and 0 <= i1 <= 18; Stmt2last[i0, 19, 29] -> Stmt2last[1 + i0, 0, 0] : 0 <= i0 <= 8; Stmt1[i0, i1] -> Stmt1[i0, 1 + i1] : i0 <= 9 and ((0 <= i1 < i0) or (i0 >= 0 and i0 < i1 <= 18)) }
	Reduction dependences:
		{  }
	Transitive closure of reduction dependences:
		{  }
IsParallel0
  IsParallel - 1
	RAW dependences:
		{ Stmt1[i0, i0] -> Stmt2[i0, i0, i0] : 0 <= i0 <= 9 }
	WAR dependences:
		{ Stmt2[i0, i0, i0] -> Stmt1[i0, 1 + i0] : 0 <= i0 <= 9 }
	WAW dependences:
		{ Stmt1[i0, i0] -> Stmt2[i0, i0, i0] : 0 <= i0 <= 9; Stmt2[i0, i0, i0] -> Stmt1[i0, 1 + i0] : 0 <= i0 <= 9; Stmt1last[i0, i1] -> Stmt1last[i0, 1 + i1] : 0 <= i0 <= 9 and 0 <= i1 <= 18; Stmt1last[i0, 19] -> Stmt1last[1 + i0, 0] : 0 <= i0 <= 8; Stmt2last[i0, i1, i2] -> Stmt2last[i0, i1, 1 + i2] : 0 <= i0 <= 9 and 0 <= i1 <= 19 and 0 <= i2 <= 28; Stmt2last[i0, i1, 29] -> Stmt2last[i0, 1 + i1, 0] : 0 <= i0 <= 9 and 0 <= i1 <= 18; Stmt2last[i0, 19, 29] -> Stmt2last[1 + i0, 0, 0] : 0 <= i0 <= 8; Stmt1[i0, i1] -> Stmt1[i0, 1 + i1] : i0 <= 9 and ((0 <= i1 < i0) or (i0 >= 0 and i0 < i1 <= 18)) }
	Reduction dependences:
		{  }
	Transitive closure of reduction dependences:
		{  }
  IsParallel - 2
	RAW dependences:
		{ Stmt1[i0, i0] -> Stmt2[i0, i0, i0] : 0 <= i0 <= 9 }
	WAR dependences:
		{ Stmt2[i0, i0, i0] -> Stmt1[i0, 1 + i0] : 0 <= i0 <= 9 }
	WAW dependences:
		{ Stmt1[i0, i0] -> Stmt2[i0, i0, i0] : 0 <= i0 <= 9; Stmt2[i0, i0, i0] -> Stmt1[i0, 1 + i0] : 0 <= i0 <= 9; Stmt1last[i0, i1] -> Stmt1last[i0, 1 + i1] : 0 <= i0 <= 9 and 0 <= i1 <= 18; Stmt1last[i0, 19] -> Stmt1last[1 + i0, 0] : 0 <= i0 <= 8; Stmt2last[i0, i1, i2] -> Stmt2last[i0, i1, 1 + i2] : 0 <= i0 <= 9 and 0 <= i1 <= 19 and 0 <= i2 <= 28; Stmt2last[i0, i1, 29] -> Stmt2last[i0, 1 + i1, 0] : 0 <= i0 <= 9 and 0 <= i1 <= 18; Stmt2last[i0, 19, 29] -> Stmt2last[1 + i0, 0, 0] : 0 <= i0 <= 8; Stmt1[i0, i1] -> Stmt1[i0, 1 + i1] : i0 <= 9 and ((0 <= i1 < i0) or (i0 >= 0 and i0 < i1 <= 18)) }
	Reduction dependences:
		{  }
	Transitive closure of reduction dependences:
		{  }
IsParallel1
  IsParallel - 1
	RAW dependences:
		{ Stmt1[i0, i0] -> Stmt2[i0, i0, i0] : 0 <= i0 <= 9 }
	WAR dependences:
		{ Stmt2[i0, i0, i0] -> Stmt1[i0, 1 + i0] : 0 <= i0 <= 9 }
	WAW dependences:
		{ Stmt1[i0, i0] -> Stmt2[i0, i0, i0] : 0 <= i0 <= 9; Stmt2[i0, i0, i0] -> Stmt1[i0, 1 + i0] : 0 <= i0 <= 9; Stmt1last[i0, i1] -> Stmt1last[i0, 1 + i1] : 0 <= i0 <= 9 and 0 <= i1 <= 18; Stmt1last[i0, 19] -> Stmt1last[1 + i0, 0] : 0 <= i0 <= 8; Stmt2last[i0, i1, i2] -> Stmt2last[i0, i1, 1 + i2] : 0 <= i0 <= 9 and 0 <= i1 <= 19 and 0 <= i2 <= 28; Stmt2last[i0, i1, 29] -> Stmt2last[i0, 1 + i1, 0] : 0 <= i0 <= 9 and 0 <= i1 <= 18; Stmt2last[i0, 19, 29] -> Stmt2last[1 + i0, 0, 0] : 0 <= i0 <= 8; Stmt1[i0, i1] -> Stmt1[i0, 1 + i1] : i0 <= 9 and ((0 <= i1 < i0) or (i0 >= 0 and i0 < i1 <= 18)) }
	Reduction dependences:
		{  }
	Transitive closure of reduction dependences:
		{  }
  IsParallel - 2
	RAW dependences:
		{ Stmt1[i0, i0] -> Stmt2[i0, i0, i0] : 0 <= i0 <= 9 }
	WAR dependences:
		{ Stmt2[i0, i0, i0] -> Stmt1[i0, 1 + i0] : 0 <= i0 <= 9 }
	WAW dependences:
		{ Stmt1[i0, i0] -> Stmt2[i0, i0, i0] : 0 <= i0 <= 9; Stmt2[i0, i0, i0] -> Stmt1[i0, 1 + i0] : 0 <= i0 <= 9; Stmt1last[i0, i1] -> Stmt1last[i0, 1 + i1] : 0 <= i0 <= 9 and 0 <= i1 <= 18; Stmt1last[i0, 19] -> Stmt1last[1 + i0, 0] : 0 <= i0 <= 8; Stmt2last[i0, i1, i2] -> Stmt2last[i0, i1, 1 + i2] : 0 <= i0 <= 9 and 0 <= i1 <= 19 and 0 <= i2 <= 28; Stmt2last[i0, i1, 29] -> Stmt2last[i0, 1 + i1, 0] : 0 <= i0 <= 9 and 0 <= i1 <= 18; Stmt2last[i0, 19, 29] -> Stmt2last[1 + i0, 0, 0] : 0 <= i0 <= 8; Stmt1[i0, i1] -> Stmt1[i0, 1 + i1] : i0 <= 9 and ((0 <= i1 < i0) or (i0 >= 0 and i0 < i1 <= 18)) }
	Reduction dependences:
		{  }
	Transitive closure of reduction dependences:
		{  }
IsParallel1
  IsParallel - 1
	RAW dependences:
		{ Stmt1[i0, i0] -> Stmt2[i0, i0, i0] : 0 <= i0 <= 9 }
	WAR dependences:
		{ Stmt2[i0, i0, i0] -> Stmt1[i0, 1 + i0] : 0 <= i0 <= 9 }
	WAW dependences:
		{ Stmt1[i0, i0] -> Stmt2[i0, i0, i0] : 0 <= i0 <= 9; Stmt2[i0, i0, i0] -> Stmt1[i0, 1 + i0] : 0 <= i0 <= 9; Stmt1last[i0, i1] -> Stmt1last[i0, 1 + i1] : 0 <= i0 <= 9 and 0 <= i1 <= 18; Stmt1last[i0, 19] -> Stmt1last[1 + i0, 0] : 0 <= i0 <= 8; Stmt2last[i0, i1, i2] -> Stmt2last[i0, i1, 1 + i2] : 0 <= i0 <= 9 and 0 <= i1 <= 19 and 0 <= i2 <= 28; Stmt2last[i0, i1, 29] -> Stmt2last[i0, 1 + i1, 0] : 0 <= i0 <= 9 and 0 <= i1 <= 18; Stmt2last[i0, 19, 29] -> Stmt2last[1 + i0, 0, 0] : 0 <= i0 <= 8; Stmt1[i0, i1] -> Stmt1[i0, 1 + i1] : i0 <= 9 and ((0 <= i1 < i0) or (i0 >= 0 and i0 < i1 <= 18)) }
	Reduction dependences:
		{  }
	Transitive closure of reduction dependences:
		{  }
	RAW dependences:
		{ Stmt1[i0, i0] -> Stmt2[i0, i0, i0] : 0 <= i0 <= 9 }
	WAR dependences:
		{ Stmt2[i0, i0, i0] -> Stmt1[i0, 1 + i0] : 0 <= i0 <= 9 }
	WAW dependences:
		{ Stmt1[i0, i0] -> Stmt2[i0, i0, i0] : 0 <= i0 <= 9; Stmt2[i0, i0, i0] -> Stmt1[i0, 1 + i0] : 0 <= i0 <= 9; Stmt1last[i0, i1] -> Stmt1last[i0, 1 + i1] : 0 <= i0 <= 9 and 0 <= i1 <= 18; Stmt1last[i0, 19] -> Stmt1last[1 + i0, 0] : 0 <= i0 <= 8; Stmt2last[i0, i1, i2] -> Stmt2last[i0, i1, 1 + i2] : 0 <= i0 <= 9 and 0 <= i1 <= 19 and 0 <= i2 <= 28; Stmt2last[i0, i1, 29] -> Stmt2last[i0, 1 + i1, 0] : 0 <= i0 <= 9 and 0 <= i1 <= 18; Stmt2last[i0, 19, 29] -> Stmt2last[1 + i0, 0, 0] : 0 <= i0 <= 8; Stmt1[i0, i1] -> Stmt1[i0, 1 + i1] : i0 <= 9 and ((0 <= i1 < i0) or (i0 >= 0 and i0 < i1 <= 18)) }
	Reduction dependences:
		{  }
	Transitive closure of reduction dependences:
		{  }
IsParallel0
  IsParallel - 1
	RAW dependences:
		{ Stmt1[i0, i0] -> Stmt2[i0, i0, i0] : 0 <= i0 <= 9 }
	WAR dependences:
		{ Stmt2[i0, i0, i0] -> Stmt1[i0, 1 + i0] : 0 <= i0 <= 9 }
	WAW dependences:
		{ Stmt1[i0, i0] -> Stmt2[i0, i0, i0] : 0 <= i0 <= 9; Stmt2[i0, i0, i0] -> Stmt1[i0, 1 + i0] : 0 <= i0 <= 9; Stmt1last[i0, i1] -> Stmt1last[i0, 1 + i1] : 0 <= i0 <= 9 and 0 <= i1 <= 18; Stmt1last[i0, 19] -> Stmt1last[1 + i0, 0] : 0 <= i0 <= 8; Stmt2last[i0, i1, i2] -> Stmt2last[i0, i1, 1 + i2] : 0 <= i0 <= 9 and 0 <= i1 <= 19 and 0 <= i2 <= 28; Stmt2last[i0, i1, 29] -> Stmt2last[i0, 1 + i1, 0] : 0 <= i0 <= 9 and 0 <= i1 <= 18; Stmt2last[i0, 19, 29] -> Stmt2last[1 + i0, 0, 0] : 0 <= i0 <= 8; Stmt1[i0, i1] -> Stmt1[i0, 1 + i1] : i0 <= 9 and ((0 <= i1 < i0) or (i0 >= 0 and i0 < i1 <= 18)) }
	Reduction dependences:
		{  }
	Transitive closure of reduction dependences:
		{  }
	RAW dependences:
		{ Stmt1[i0, i0] -> Stmt2[i0, i0, i0] : 0 <= i0 <= 9 }
	WAR dependences:
		{ Stmt2[i0, i0, i0] -> Stmt1[i0, 1 + i0] : 0 <= i0 <= 9 }
	WAW dependences:
		{ Stmt1[i0, i0] -> Stmt2[i0, i0, i0] : 0 <= i0 <= 9; Stmt2[i0, i0, i0] -> Stmt1[i0, 1 + i0] : 0 <= i0 <= 9; Stmt1last[i0, i1] -> Stmt1last[i0, 1 + i1] : 0 <= i0 <= 9 and 0 <= i1 <= 18; Stmt1last[i0, 19] -> Stmt1last[1 + i0, 0] : 0 <= i0 <= 8; Stmt2last[i0, i1, i2] -> Stmt2last[i0, i1, 1 + i2] : 0 <= i0 <= 9 and 0 <= i1 <= 19 and 0 <= i2 <= 28; Stmt2last[i0, i1, 29] -> Stmt2last[i0, 1 + i1, 0] : 0 <= i0 <= 9 and 0 <= i1 <= 18; Stmt2last[i0, 19, 29] -> Stmt2last[1 + i0, 0, 0] : 0 <= i0 <= 8; Stmt1[i0, i1] -> Stmt1[i0, 1 + i1] : i0 <= 9 and ((0 <= i1 < i0) or (i0 >= 0 and i0 < i1 <= 18)) }
	Reduction dependences:
		{  }
	Transitive closure of reduction dependences:
		{  }
IsParallel0
  IsParallel - 1
	RAW dependences:
		{ Stmt1[i0, i0] -> Stmt2[i0, i0, i0] : 0 <= i0 <= 9 }
	WAR dependences:
		{ Stmt2[i0, i0, i0] -> Stmt1[i0, 1 + i0] : 0 <= i0 <= 9 }
	WAW dependences:
		{ Stmt1[i0, i0] -> Stmt2[i0, i0, i0] : 0 <= i0 <= 9; Stmt2[i0, i0, i0] -> Stmt1[i0, 1 + i0] : 0 <= i0 <= 9; Stmt1last[i0, i1] -> Stmt1last[i0, 1 + i1] : 0 <= i0 <= 9 and 0 <= i1 <= 18; Stmt1last[i0, 19] -> Stmt1last[1 + i0, 0] : 0 <= i0 <= 8; Stmt2last[i0, i1, i2] -> Stmt2last[i0, i1, 1 + i2] : 0 <= i0 <= 9 and 0 <= i1 <= 19 and 0 <= i2 <= 28; Stmt2last[i0, i1, 29] -> Stmt2last[i0, 1 + i1, 0] : 0 <= i0 <= 9 and 0 <= i1 <= 18; Stmt2last[i0, 19, 29] -> Stmt2last[1 + i0, 0, 0] : 0 <= i0 <= 8; Stmt1[i0, i1] -> Stmt1[i0, 1 + i1] : i0 <= 9 and ((0 <= i1 < i0) or (i0 >= 0 and i0 < i1 <= 18)) }
	Reduction dependences:
		{  }
	Transitive closure of reduction dependences:
		{  }
	RAW dependences:
		{ Stmt1[i0, i0] -> Stmt2[i0, i0, i0] : 0 <= i0 <= 9 }
	WAR dependences:
		{ Stmt2[i0, i0, i0] -> Stmt1[i0, 1 + i0] : 0 <= i0 <= 9 }
	WAW dependences:
		{ Stmt1[i0, i0] -> Stmt2[i0, i0, i0] : 0 <= i0 <= 9; Stmt2[i0, i0, i0] -> Stmt1[i0, 1 + i0] : 0 <= i0 <= 9; Stmt1last[i0, i1] -> Stmt1last[i0, 1 + i1] : 0 <= i0 <= 9 and 0 <= i1 <= 18; Stmt1last[i0, 19] -> Stmt1last[1 + i0, 0] : 0 <= i0 <= 8; Stmt2last[i0, i1, i2] -> Stmt2last[i0, i1, 1 + i2] : 0 <= i0 <= 9 and 0 <= i1 <= 19 and 0 <= i2 <= 28; Stmt2last[i0, i1, 29] -> Stmt2last[i0, 1 + i1, 0] : 0 <= i0 <= 9 and 0 <= i1 <= 18; Stmt2last[i0, 19, 29] -> Stmt2last[1 + i0, 0, 0] : 0 <= i0 <= 8; Stmt1[i0, i1] -> Stmt1[i0, 1 + i1] : i0 <= 9 and ((0 <= i1 < i0) or (i0 >= 0 and i0 < i1 <= 18)) }
	Reduction dependences:
		{  }
	Transitive closure of reduction dependences:
		{  }
IsParallel0
  IsParallel - 1
	RAW dependences:
		{ Stmt1[i0, i0] -> Stmt2[i0, i0, i0] : 0 <= i0 <= 9 }
	WAR dependences:
		{ Stmt2[i0, i0, i0] -> Stmt1[i0, 1 + i0] : 0 <= i0 <= 9 }
	WAW dependences:
		{ Stmt1[i0, i0] -> Stmt2[i0, i0, i0] : 0 <= i0 <= 9; Stmt2[i0, i0, i0] -> Stmt1[i0, 1 + i0] : 0 <= i0 <= 9; Stmt1last[i0, i1] -> Stmt1last[i0, 1 + i1] : 0 <= i0 <= 9 and 0 <= i1 <= 18; Stmt1last[i0, 19] -> Stmt1last[1 + i0, 0] : 0 <= i0 <= 8; Stmt2last[i0, i1, i2] -> Stmt2last[i0, i1, 1 + i2] : 0 <= i0 <= 9 and 0 <= i1 <= 19 and 0 <= i2 <= 28; Stmt2last[i0, i1, 29] -> Stmt2last[i0, 1 + i1, 0] : 0 <= i0 <= 9 and 0 <= i1 <= 18; Stmt2last[i0, 19, 29] -> Stmt2last[1 + i0, 0, 0] : 0 <= i0 <= 8; Stmt1[i0, i1] -> Stmt1[i0, 1 + i1] : i0 <= 9 and ((0 <= i1 < i0) or (i0 >= 0 and i0 < i1 <= 18)) }
	Reduction dependences:
		{  }
	Transitive closure of reduction dependences:
		{  }
	RAW dependences:
		{ Stmt1[i0, i0] -> Stmt2[i0, i0, i0] : 0 <= i0 <= 9 }
	WAR dependences:
		{ Stmt2[i0, i0, i0] -> Stmt1[i0, 1 + i0] : 0 <= i0 <= 9 }
	WAW dependences:
		{ Stmt1[i0, i0] -> Stmt2[i0, i0, i0] : 0 <= i0 <= 9; Stmt2[i0, i0, i0] -> Stmt1[i0, 1 + i0] : 0 <= i0 <= 9; Stmt1last[i0, i1] -> Stmt1last[i0, 1 + i1] : 0 <= i0 <= 9 and 0 <= i1 <= 18; Stmt1last[i0, 19] -> Stmt1last[1 + i0, 0] : 0 <= i0 <= 8; Stmt2last[i0, i1, i2] -> Stmt2last[i0, i1, 1 + i2] : 0 <= i0 <= 9 and 0 <= i1 <= 19 and 0 <= i2 <= 28; Stmt2last[i0, i1, 29] -> Stmt2last[i0, 1 + i1, 0] : 0 <= i0 <= 9 and 0 <= i1 <= 18; Stmt2last[i0, 19, 29] -> Stmt2last[1 + i0, 0, 0] : 0 <= i0 <= 8; Stmt1[i0, i1] -> Stmt1[i0, 1 + i1] : i0 <= 9 and ((0 <= i1 < i0) or (i0 >= 0 and i0 < i1 <= 18)) }
	Reduction dependences:
		{  }
	Transitive closure of reduction dependences:
		{  }
IsParallel0
Payload is not a nullptr0
Payload is not a nullptr0
1 1<=option
 0<=isInnermost
  Payload is not a nullptr0
0 0
Payload is not a nullptr0
Payload is not a nullptr0
Payload is not a nullptr0
1 1<=option
 1<=isInnermost
  Payload is not a nullptr0
0 0
Payload is not a nullptr0
Payload is not a nullptr1
Payload is not a nullptr1
1 1<=option
 0<=isInnermost
  Payload is not a nullptr1
1 0
Payload is not a nullptr1
Payload is not a nullptr0
Payload is not a nullptr0
1 1<=option
 0<=isInnermost
  Payload is not a nullptr0
0 0
Payload is not a nullptr0
Payload is not a nullptr0
Payload is not a nullptr0
1 1<=option
 1<=isInnermost
  Payload is not a nullptr0
0 0
Payload is not a nullptr0
Payload is not a nullptr0
Payload is not a nullptr0
1 1<=option
 0<=isInnermost
  Payload is not a nullptr0
0 0
Payload is not a nullptr0
Payload is not a nullptr0
Payload is not a nullptr0
1 1<=option
 0<=isInnermost
  Payload is not a nullptr0
0 0
Payload is not a nullptr0
Payload is not a nullptr0
Payload is not a nullptr0
1 1<=option
 1<=isInnermost
  Payload is not a nullptr0
0 0
Payload is not a nullptr0
0==
OMP => 1
OMP => 2
1 1<=option
 0<=isInnermost
  Payload is not a nullptr0
0 0
Payload is not a nullptr0
OMP => 3
Payload is not a nullptr0
0==
OMP => 1
OMP => 2
1 1<=option
 1<=isInnermost
  Payload is not a nullptr0
0 0
Payload is not a nullptr0
OMP => 3
Payload is not a nullptr0
OMP => 4
OMP => 4
0==
OMP => 1
OMP => 2
1 1<=option
 0<=isInnermost
  Payload is not a nullptr1
1 0
Payload is not a nullptr1
0==
OMP => 1
OMP => 2
1 1<=option
 0<=isInnermost
  Payload is not a nullptr0
0 0
Payload is not a nullptr0
OMP => 3
Payload is not a nullptr0
0==
OMP => 1
OMP => 2
1 1<=option
 1<=isInnermost
  Payload is not a nullptr0
0 0
Payload is not a nullptr0
OMP => 3
Payload is not a nullptr0
OMP => 4
OMP => 4
0==
OMP => 1
OMP => 2
1 1<=option
 0<=isInnermost
  Payload is not a nullptr0
0 0
Payload is not a nullptr0
OMP => 3
Payload is not a nullptr0
0==
OMP => 1
OMP => 2
1 1<=option
 0<=isInnermost
  Payload is not a nullptr0
0 0
Payload is not a nullptr0
OMP => 3
Payload is not a nullptr0
0==
OMP => 1
OMP => 2
1 1<=option
 1<=isInnermost
  Payload is not a nullptr0
0 0
Payload is not a nullptr0
OMP => 3
Payload is not a nullptr0
OMP => 4
OMP => 4
OMP => 4
[ByDebug]recomput
[Bydebug]recomput 1
Checking region:.preheader => polly.merge_new_and_old
	ret1
ret2
ret3
ret4
ret5
    0
  store i32 %.0310, ptr %50, align 4 Here?            isValidAccess - 1
            isValidAccess - 2
            isValidAccess - 3
            isValidAccess - 4
            isValidAccess - 8
            isValidAccess - final
1
            isValidAccess - 1
            isValidAccess - 2
            isValidAccess - 3
            isValidAccess - 4
            isValidAccess - 5
            isValidAccess - 8
            isValidAccess - final
  %60 = load i32, ptr %59, align 4 Here?            isValidAccess - 1
            isValidAccess - 2
            isValidAccess - 3
            isValidAccess - 4
            isValidAccess - 5
            isValidAccess - 8
            isValidAccess - final
1
            isValidAccess - 1
            isValidAccess - 2
            isValidAccess - 3
            isValidAccess - 4
            isValidAccess - 5
            isValidAccess - 8
            isValidAccess - final
  store i32 %61, ptr %59, align 4 Here?            isValidAccess - 1
            isValidAccess - 2
            isValidAccess - 3
            isValidAccess - 4
            isValidAccess - 5
            isValidAccess - 8
            isValidAccess - final
1
            isValidAccess - 1
            isValidAccess - 2
            isValidAccess - 3
            isValidAccess - 4
            isValidAccess - 5
            isValidAccess - 8
            isValidAccess - final
ret6
ret7
[Bydebug]recomput 2
[Bydebug]recomput 3
[Bydebug]recomput 4
[Bydebug]recomput 5
; Function Attrs: null_pointer_is_valid
define hhvmcc { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } @S0_hhvm(i64 %0, ptr addrspace(1) noalias nocapture align 16 dereferenceable(400) %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, i64 %7, i64 %8, i64 %9, i64 %10, i64 %11, i64 %12, i64 %13) #0 {
  %.s2a42 = alloca i64, align 8
  %.s2a41 = alloca i64, align 8
  %polly.par.userContext = alloca {}, align 8
  %.s2a = alloca i64, align 8
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
  br label %polly.split_new_and_old

polly.split_new_and_old:                          ; preds = %.split
  br i1 true, label %polly.start, label %.preheader.pre_entry_bb

.preheader.pre_entry_bb:                          ; preds = %polly.split_new_and_old
  br label %.preheader

.preheader:                                       ; preds = %.preheader.pre_entry_bb, %45
  %.011 = phi i32 [ %46, %45 ], [ 0, %.preheader.pre_entry_bb ]
  br label %48

polly.merge_new_and_old:                          ; preds = %polly.exiting, %45
  %.merge = phi i64 [ %.final_reload, %polly.exiting ], [ %49, %45 ]
  %.merge44 = phi i64 [ %.final_reload43, %polly.exiting ], [ %57, %45 ]
  %.merge46 = phi i64 [ %.final_reload45, %polly.exiting ], [ %58, %45 ]
  br label %21

21:                                               ; preds = %polly.merge_new_and_old
  %22 = getelementptr inbounds [10 x [2000 x [3000 x i32]]], ptr @arr0, i64 0, i64 %.merge, i64 %.merge44, i64 %.merge46
  %23 = load i32, ptr %22, align 4
  %24 = zext i32 %23 to i64
  %25 = getelementptr i64, ptr %15, i64 -3
  %26 = getelementptr i8, ptr %15, i64 -20
  %27 = getelementptr i64, ptr %15, i64 -2
  store i32 30, ptr %25, align 4
  store i32 20, ptr %26, align 4
  store i32 10, ptr %27, align 4
  %28 = load i64, ptr %16, align 4
  %29 = getelementptr i64, ptr %15, i64 1
  %30 = ptrtoint ptr %29 to i64
  %31 = load i64, ptr %15, align 4
  %32 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } undef, i64 %31, 0
  %33 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %32, i64 0, 8
  %34 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %33, i64 29, 5
  %35 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %34, i64 %24, 4
  %36 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %35, i64 %2, 1
  %37 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %36, i64 %30, 13
  %38 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %37, i64 %28, 11
  %39 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %38, i64 %5, 3
  %40 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %39, i64 %4, 2
  %41 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %40, i64 %8, 6
  %42 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %41, i64 %9, 7
  %43 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %42, i64 %11, 9
  %44 = insertvalue { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %43, i64 %12, 10
  ret { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 } %44

45:                                               ; preds = %51
  %46 = add nuw nsw i32 %.011, 1
  %47 = icmp ugt i32 %.011, 8
  br i1 %47, label %polly.merge_new_and_old, label %.preheader

48:                                               ; preds = %.preheader, %51
  %.0310 = phi i32 [ 0, %.preheader ], [ %52, %51 ]
  %49 = zext i32 %.011 to i64
  %50 = getelementptr inbounds [10 x [2000 x [3000 x i32]]], ptr @arr0, i64 0, i64 %49, i64 %49, i64 %49
  store i32 %.0310, ptr %50, align 4
  br label %54

51:                                               ; preds = %54
  %52 = add nuw nsw i32 %.0310, 1
  %53 = icmp ugt i32 %.0310, 18
  br i1 %53, label %45, label %48

54:                                               ; preds = %48, %54
  %.049 = phi i32 [ 0, %48 ], [ %62, %54 ]
  %55 = mul nuw nsw i32 %.0310, %.011
  %56 = mul nuw nsw i32 %55, %.049
  %57 = zext i32 %.0310 to i64
  %58 = zext i32 %.049 to i64
  %59 = getelementptr inbounds [10 x [2000 x [3000 x i32]]], ptr @arr0, i64 0, i64 %49, i64 %57, i64 %58
  %60 = load i32, ptr %59, align 4
  %61 = add i32 %60, %56
  store i32 %61, ptr %59, align 4
  %62 = add nuw nsw i32 %.049, 1
  %63 = icmp ugt i32 %.049, 28
  br i1 %63, label %51, label %54

polly.start:                                      ; preds = %polly.split_new_and_old
  br label %polly.loop_preheader

polly.loop_exit:                                  ; preds = %polly.loop_exit18
  br label %polly.parallel.for

polly.parallel.for:                               ; preds = %polly.loop_exit
  call void @GOMP_parallel_loop_runtime_start(ptr @S0_hhvm_polly_subfn, ptr %polly.par.userContext, i32 0, i64 0, i64 10, i64 1)
  call void @S0_hhvm_polly_subfn(ptr %polly.par.userContext)
  call void @GOMP_parallel_end()
  br label %polly.loop_preheader23

polly.loop_exit24:                                ; preds = %polly.loop_exit30
  br label %polly.exiting

polly.exiting:                                    ; preds = %polly.loop_exit24
  %.final_reload = load i64, ptr %.s2a, align 4
  %.final_reload43 = load i64, ptr %.s2a41, align 4
  %.final_reload45 = load i64, ptr %.s2a42, align 4
  br label %polly.merge_new_and_old

polly.loop_header:                                ; preds = %polly.loop_exit18, %polly.loop_preheader
  %polly.indvar = phi i64 [ 0, %polly.loop_preheader ], [ %polly.indvar_next, %polly.loop_exit18 ]
  br label %polly.loop_preheader17

polly.loop_exit18:                                ; preds = %polly.stmt.
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sle i64 %polly.indvar_next, 9
  br i1 %polly.loop_cond, label %polly.loop_header, label %polly.loop_exit

polly.loop_preheader:                             ; preds = %polly.start
  br label %polly.loop_header

polly.loop_header16:                              ; preds = %polly.stmt., %polly.loop_preheader17
  %polly.indvar19 = phi i64 [ 0, %polly.loop_preheader17 ], [ %polly.indvar_next20, %polly.stmt. ]
  br label %polly.stmt.

polly.stmt.:                                      ; preds = %polly.loop_header16
  store i64 %polly.indvar, ptr %.s2a, align 4
  %polly.indvar_next20 = add nsw i64 %polly.indvar19, 1
  %polly.loop_cond21 = icmp sle i64 %polly.indvar_next20, 19
  br i1 %polly.loop_cond21, label %polly.loop_header16, label %polly.loop_exit18

polly.loop_preheader17:                           ; preds = %polly.loop_header
  br label %polly.loop_header16

polly.loop_header22:                              ; preds = %polly.loop_exit30, %polly.loop_preheader23
  %polly.indvar25 = phi i64 [ 0, %polly.loop_preheader23 ], [ %polly.indvar_next26, %polly.loop_exit30 ]
  br label %polly.loop_preheader29

polly.loop_exit30:                                ; preds = %polly.loop_exit36
  %polly.indvar_next26 = add nsw i64 %polly.indvar25, 1
  %polly.loop_cond27 = icmp sle i64 %polly.indvar_next26, 9
  br i1 %polly.loop_cond27, label %polly.loop_header22, label %polly.loop_exit24

polly.loop_preheader23:                           ; preds = %polly.parallel.for
  br label %polly.loop_header22

polly.loop_header28:                              ; preds = %polly.loop_exit36, %polly.loop_preheader29
  %polly.indvar31 = phi i64 [ 0, %polly.loop_preheader29 ], [ %polly.indvar_next32, %polly.loop_exit36 ]
  br label %polly.loop_preheader35

polly.loop_exit36:                                ; preds = %polly.stmt.40
  %polly.indvar_next32 = add nsw i64 %polly.indvar31, 1
  %polly.loop_cond33 = icmp sle i64 %polly.indvar_next32, 19
  br i1 %polly.loop_cond33, label %polly.loop_header28, label %polly.loop_exit30

polly.loop_preheader29:                           ; preds = %polly.loop_header22
  br label %polly.loop_header28

polly.loop_header34:                              ; preds = %polly.stmt.40, %polly.loop_preheader35
  %polly.indvar37 = phi i64 [ 0, %polly.loop_preheader35 ], [ %polly.indvar_next38, %polly.stmt.40 ]
  br label %polly.stmt.40

polly.stmt.40:                                    ; preds = %polly.loop_header34
  store i64 %polly.indvar31, ptr %.s2a41, align 4
  store i64 %polly.indvar37, ptr %.s2a42, align 4
  %polly.indvar_next38 = add nsw i64 %polly.indvar37, 1
  %polly.loop_cond39 = icmp sle i64 %polly.indvar_next38, 29
  br i1 %polly.loop_cond39, label %polly.loop_header34, label %polly.loop_exit36

polly.loop_preheader35:                           ; preds = %polly.loop_header28
  br label %polly.loop_header34
}
opt finish
[Bydebug]ScopInfo is not empty.
