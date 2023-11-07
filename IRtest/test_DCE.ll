; ModuleID = './test.ll'
source_filename = "./test.ll"
target triple = "x86_64-unknown-linux-gnu"

define dso_local noundef i32 @main() {
  br label %1

1:                                                ; preds = %5, %0
  %.01 = phi i32 [ 0, %0 ], [ %4, %5 ]
  %.0 = phi i32 [ 0, %0 ], [ %6, %5 ]
  %2 = icmp slt i32 %.0, 10
  br i1 %2, label %3, label %7

3:                                                ; preds = %1
  %4 = add nsw i32 %.01, %.0
  br label %5

5:                                                ; preds = %3
  %6 = add nsw i32 %.0, 1
  br label %1

7:                                                ; preds = %1
  ret i32 0
}
[Bydebug]DbgUsers is emptyQ
[Bydebug]DbgUsers is emptyQ
[Bydebug]DbgInfos?
[Bydebug]DbgInfos?
[Bydebug]DbgInfos?
[Bydebug]DbgInfos?
