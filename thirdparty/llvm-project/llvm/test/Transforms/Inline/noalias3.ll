; NOTE: Assertions have been autogenerated by utils/update_test_checks.py UTC_ARGS: --function-signature
; RUN: opt -inline -S < %s | FileCheck %s

define void @caller(i8* %ptr) {
; CHECK-LABEL: define {{[^@]+}}@caller
; CHECK-SAME: (i8* [[PTR:%.*]]) {
; CHECK-NEXT:    [[I_I:%.*]] = load i8, i8* [[PTR]], align 1, !alias.scope !0
; CHECK-NEXT:    ret void
;
  call void @callee(i8* %ptr)
  ret void
}

define void @callee(i8* %ptr) {
; CHECK-LABEL: define {{[^@]+}}@callee
; CHECK-SAME: (i8* [[PTR:%.*]]) {
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[I:%.*]] = load i8, i8* [[PTR]], align 1, !alias.scope !3
; CHECK-NEXT:    br label [[DUMMY:%.*]]
; CHECK:       dummy:
; CHECK-NEXT:    [[I_COPY:%.*]] = phi i8 [ [[I]], [[ENTRY:%.*]] ]
; CHECK-NEXT:    ret void
;
entry:
  %i = load i8, i8* %ptr, !alias.scope !0
  br label %dummy

dummy:
  %i.copy = phi i8 [ %i, %entry ]
  ret void
}

!0 = !{!1}
!1 = distinct !{!1, !2}
!2 = distinct !{!2}