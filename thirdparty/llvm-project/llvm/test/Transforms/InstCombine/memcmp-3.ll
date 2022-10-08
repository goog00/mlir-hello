; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; Verify that calls to memcmp with arrays of elements larger than char
; are folded correctly.
; RUN: opt < %s -passes=instcombine -S -data-layout="E" | FileCheck %s --check-prefixes=BE
; RUN: opt < %s -passes=instcombine -S -data-layout="e" | FileCheck %s --check-prefixes=LE

declare i32 @memcmp(i8*, i8*, i64)

; BE representation: { 'a', 'b', 'c', ..., 'f', 'g', 'h' }
; LE representation: { 'b', 'a', 'd', ..., 'e', 'h', 'g' }
@ia16a = constant [4 x i16] [i16 24930, i16 25444, i16 25958, i16 26472]

; Same as the BE representation above except ending in "gg".
@i8a = constant [8 x i8] c"abcdefgg"

; Fold memcmp(ia16a, i8a, N) for N in [0, 8].

define void @fold_memcmp_ia16a_i8a(i32* %pcmp) {
; BE-LABEL: @fold_memcmp_ia16a_i8a(
; BE-NEXT:    store i32 0, i32* [[PCMP:%.*]], align 4
; BE-NEXT:    [[PSTOR1:%.*]] = getelementptr i32, i32* [[PCMP]], i64 1
; BE-NEXT:    store i32 0, i32* [[PSTOR1]], align 4
; BE-NEXT:    [[PSTOR2:%.*]] = getelementptr i32, i32* [[PCMP]], i64 2
; BE-NEXT:    store i32 0, i32* [[PSTOR2]], align 4
; BE-NEXT:    [[PSTOR3:%.*]] = getelementptr i32, i32* [[PCMP]], i64 3
; BE-NEXT:    store i32 0, i32* [[PSTOR3]], align 4
; BE-NEXT:    [[PSTOR4:%.*]] = getelementptr i32, i32* [[PCMP]], i64 4
; BE-NEXT:    store i32 0, i32* [[PSTOR4]], align 4
; BE-NEXT:    [[PSTOR5:%.*]] = getelementptr i32, i32* [[PCMP]], i64 5
; BE-NEXT:    store i32 0, i32* [[PSTOR5]], align 4
; BE-NEXT:    [[PSTOR6:%.*]] = getelementptr i32, i32* [[PCMP]], i64 6
; BE-NEXT:    store i32 0, i32* [[PSTOR6]], align 4
; BE-NEXT:    [[PSTOR7:%.*]] = getelementptr i32, i32* [[PCMP]], i64 7
; BE-NEXT:    store i32 0, i32* [[PSTOR7]], align 4
; BE-NEXT:    [[PSTOR8:%.*]] = getelementptr i32, i32* [[PCMP]], i64 8
; BE-NEXT:    store i32 1, i32* [[PSTOR8]], align 4
; BE-NEXT:    ret void
;
; LE-LABEL: @fold_memcmp_ia16a_i8a(
; LE-NEXT:    store i32 0, i32* [[PCMP:%.*]], align 4
; LE-NEXT:    [[PSTOR1:%.*]] = getelementptr i32, i32* [[PCMP]], i64 1
; LE-NEXT:    store i32 1, i32* [[PSTOR1]], align 4
; LE-NEXT:    [[PSTOR2:%.*]] = getelementptr i32, i32* [[PCMP]], i64 2
; LE-NEXT:    store i32 1, i32* [[PSTOR2]], align 4
; LE-NEXT:    [[PSTOR3:%.*]] = getelementptr i32, i32* [[PCMP]], i64 3
; LE-NEXT:    store i32 1, i32* [[PSTOR3]], align 4
; LE-NEXT:    [[PSTOR4:%.*]] = getelementptr i32, i32* [[PCMP]], i64 4
; LE-NEXT:    store i32 1, i32* [[PSTOR4]], align 4
; LE-NEXT:    [[PSTOR5:%.*]] = getelementptr i32, i32* [[PCMP]], i64 5
; LE-NEXT:    store i32 1, i32* [[PSTOR5]], align 4
; LE-NEXT:    [[PSTOR6:%.*]] = getelementptr i32, i32* [[PCMP]], i64 6
; LE-NEXT:    store i32 1, i32* [[PSTOR6]], align 4
; LE-NEXT:    [[PSTOR7:%.*]] = getelementptr i32, i32* [[PCMP]], i64 7
; LE-NEXT:    store i32 1, i32* [[PSTOR7]], align 4
; LE-NEXT:    [[PSTOR8:%.*]] = getelementptr i32, i32* [[PCMP]], i64 8
; LE-NEXT:    store i32 1, i32* [[PSTOR8]], align 4
; LE-NEXT:    ret void
;
  %p0 = getelementptr [4 x i16], [4 x i16]* @ia16a, i64 0, i64 0
  %p1 = bitcast i16* %p0 to i8*
  %q = getelementptr [8 x i8], [8 x i8]* @i8a, i64 0, i64 0

  %cmp0 = call i32 @memcmp(i8* %p1, i8* %q, i64 0)
  %pstor0 = getelementptr i32, i32* %pcmp, i64 0
  store i32 %cmp0, i32* %pstor0

  %cmp1 = call i32 @memcmp(i8* %p1, i8* %q, i64 1)
  %pstor1 = getelementptr i32, i32* %pcmp, i64 1
  store i32 %cmp1, i32* %pstor1

  %cmp2 = call i32 @memcmp(i8* %p1, i8* %q, i64 2)
  %pstor2 = getelementptr i32, i32* %pcmp, i64 2
  store i32 %cmp2, i32* %pstor2

  %cmp3 = call i32 @memcmp(i8* %p1, i8* %q, i64 3)
  %pstor3 = getelementptr i32, i32* %pcmp, i64 3
  store i32 %cmp3, i32* %pstor3

  %cmp4 = call i32 @memcmp(i8* %p1, i8* %q, i64 4)
  %pstor4 = getelementptr i32, i32* %pcmp, i64 4
  store i32 %cmp4, i32* %pstor4

  %cmp5 = call i32 @memcmp(i8* %p1, i8* %q, i64 5)
  %pstor5 = getelementptr i32, i32* %pcmp, i64 5
  store i32 %cmp5, i32* %pstor5

  %cmp6 = call i32 @memcmp(i8* %p1, i8* %q, i64 6)
  %pstor6 = getelementptr i32, i32* %pcmp, i64 6
  store i32 %cmp6, i32* %pstor6

  %cmp7 = call i32 @memcmp(i8* %p1, i8* %q, i64 7)
  %pstor7 = getelementptr i32, i32* %pcmp, i64 7
  store i32 %cmp7, i32* %pstor7

  %cmp8 = call i32 @memcmp(i8* %p1, i8* %q, i64 8)
  %pstor8 = getelementptr i32, i32* %pcmp, i64 8
  store i32 %cmp8, i32* %pstor8

  ret void
}


; Fold memcmp(ia16a + 1, i8a + 2, N) for N in [0, 6].

define void @fold_memcmp_ia16a_p1_i8a_p1(i32* %pcmp) {
; BE-LABEL: @fold_memcmp_ia16a_p1_i8a_p1(
; BE-NEXT:    store i32 0, i32* [[PCMP:%.*]], align 4
; BE-NEXT:    [[PSTOR1:%.*]] = getelementptr i32, i32* [[PCMP]], i64 1
; BE-NEXT:    store i32 1, i32* [[PSTOR1]], align 4
; BE-NEXT:    [[PSTOR2:%.*]] = getelementptr i32, i32* [[PCMP]], i64 2
; BE-NEXT:    store i32 1, i32* [[PSTOR2]], align 4
; BE-NEXT:    [[PSTOR3:%.*]] = getelementptr i32, i32* [[PCMP]], i64 3
; BE-NEXT:    store i32 1, i32* [[PSTOR3]], align 4
; BE-NEXT:    [[PSTOR4:%.*]] = getelementptr i32, i32* [[PCMP]], i64 4
; BE-NEXT:    store i32 1, i32* [[PSTOR4]], align 4
; BE-NEXT:    [[PSTOR5:%.*]] = getelementptr i32, i32* [[PCMP]], i64 5
; BE-NEXT:    store i32 1, i32* [[PSTOR5]], align 4
; BE-NEXT:    [[PSTOR6:%.*]] = getelementptr i32, i32* [[PCMP]], i64 6
; BE-NEXT:    store i32 1, i32* [[PSTOR6]], align 4
; BE-NEXT:    ret void
;
; LE-LABEL: @fold_memcmp_ia16a_p1_i8a_p1(
; LE-NEXT:    store i32 0, i32* [[PCMP:%.*]], align 4
; LE-NEXT:    [[PSTOR1:%.*]] = getelementptr i32, i32* [[PCMP]], i64 1
; LE-NEXT:    store i32 1, i32* [[PSTOR1]], align 4
; LE-NEXT:    [[PSTOR2:%.*]] = getelementptr i32, i32* [[PCMP]], i64 2
; LE-NEXT:    store i32 1, i32* [[PSTOR2]], align 4
; LE-NEXT:    [[PSTOR3:%.*]] = getelementptr i32, i32* [[PCMP]], i64 3
; LE-NEXT:    store i32 1, i32* [[PSTOR3]], align 4
; LE-NEXT:    [[PSTOR4:%.*]] = getelementptr i32, i32* [[PCMP]], i64 4
; LE-NEXT:    store i32 1, i32* [[PSTOR4]], align 4
; LE-NEXT:    [[PSTOR5:%.*]] = getelementptr i32, i32* [[PCMP]], i64 5
; LE-NEXT:    store i32 1, i32* [[PSTOR5]], align 4
; LE-NEXT:    [[PSTOR6:%.*]] = getelementptr i32, i32* [[PCMP]], i64 6
; LE-NEXT:    store i32 1, i32* [[PSTOR6]], align 4
; LE-NEXT:    ret void
;
  %p0 = getelementptr [4 x i16], [4 x i16]* @ia16a, i64 0, i64 1
  %p1 = bitcast i16* %p0 to i8*
  %q = getelementptr [8 x i8], [8 x i8]* @i8a, i64 0, i64 1

  %cmp0 = call i32 @memcmp(i8* %p1, i8* %q, i64 0)
  %pstor0 = getelementptr i32, i32* %pcmp, i64 0
  store i32 %cmp0, i32* %pstor0

  %cmp1 = call i32 @memcmp(i8* %p1, i8* %q, i64 1)
  %pstor1 = getelementptr i32, i32* %pcmp, i64 1
  store i32 %cmp1, i32* %pstor1

  %cmp2 = call i32 @memcmp(i8* %p1, i8* %q, i64 2)
  %pstor2 = getelementptr i32, i32* %pcmp, i64 2
  store i32 %cmp2, i32* %pstor2

  %cmp3 = call i32 @memcmp(i8* %p1, i8* %q, i64 3)
  %pstor3 = getelementptr i32, i32* %pcmp, i64 3
  store i32 %cmp3, i32* %pstor3

  %cmp4 = call i32 @memcmp(i8* %p1, i8* %q, i64 4)
  %pstor4 = getelementptr i32, i32* %pcmp, i64 4
  store i32 %cmp4, i32* %pstor4

  %cmp5 = call i32 @memcmp(i8* %p1, i8* %q, i64 5)
  %pstor5 = getelementptr i32, i32* %pcmp, i64 5
  store i32 %cmp5, i32* %pstor5

  %cmp6 = call i32 @memcmp(i8* %p1, i8* %q, i64 6)
  %pstor6 = getelementptr i32, i32* %pcmp, i64 6
  store i32 %cmp6, i32* %pstor6

  ret void
}