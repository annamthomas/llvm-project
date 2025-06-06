; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=ve -mattr=+vpu | FileCheck %s

declare <256 x float> @llvm.vp.merge.v256f32(<256 x i1>, <256 x float>, <256 x float>, i32)
declare <256 x float> @llvm.vp.fsub.v256f32(<256 x float>, <256 x float>, <256 x i1>, i32)

define fastcc <256 x float> @test_vp_fsub_v256f32_vv_merge(<256 x float> %passthru, <256 x float> %i0, <256 x float> %i1, <256 x i1> %m, i32 %n) {
; CHECK-LABEL: test_vp_fsub_v256f32_vv_merge:
; CHECK:       # %bb.0:
; CHECK-NEXT:    and %s0, %s0, (32)0
; CHECK-NEXT:    lvl %s0
; CHECK-NEXT:    pvfsub.up %v0, %v1, %v2, %vm1
; CHECK-NEXT:    b.l.t (, %s10)
  %vr = call <256 x float> @llvm.vp.fsub.v256f32(<256 x float> %i0, <256 x float> %i1, <256 x i1> %m, i32 %n)
  %r0 = call <256 x float> @llvm.vp.merge.v256f32(<256 x i1> %m, <256 x float> %vr, <256 x float> %passthru, i32 %n)
  ret <256 x float> %r0
}

define fastcc <256 x float> @test_vp_fsub_v256f32_rv_merge(<256 x float> %passthru, float %s0, <256 x float> %i1, <256 x i1> %m, i32 %n) {
; CHECK-LABEL: test_vp_fsub_v256f32_rv_merge:
; CHECK:       # %bb.0:
; CHECK-NEXT:    and %s1, %s1, (32)0
; CHECK-NEXT:    lvl %s1
; CHECK-NEXT:    pvfsub.up %v0, %s0, %v1, %vm1
; CHECK-NEXT:    b.l.t (, %s10)
  %xins = insertelement <256 x float> undef, float %s0, i32 0
  %i0 = shufflevector <256 x float> %xins, <256 x float> undef, <256 x i32> zeroinitializer
  %vr = call <256 x float> @llvm.vp.fsub.v256f32(<256 x float> %i0, <256 x float> %i1, <256 x i1> %m, i32 %n)
  %r0 = call <256 x float> @llvm.vp.merge.v256f32(<256 x i1> %m, <256 x float> %vr, <256 x float> %passthru, i32 %n)
  ret <256 x float> %r0
}

define fastcc <256 x float> @test_vp_fsub_v256f32_vr_merge(<256 x float> %passthru, <256 x float> %i0, float %s1, <256 x i1> %m, i32 %n) {
; CHECK-LABEL: test_vp_fsub_v256f32_vr_merge:
; CHECK:       # %bb.0:
; CHECK-NEXT:    and %s1, %s1, (32)0
; CHECK-NEXT:    lea %s2, 256
; CHECK-NEXT:    lvl %s2
; CHECK-NEXT:    vbrd %v2, %s0
; CHECK-NEXT:    lvl %s1
; CHECK-NEXT:    pvfsub.up %v0, %v1, %v2, %vm1
; CHECK-NEXT:    b.l.t (, %s10)
  %yins = insertelement <256 x float> undef, float %s1, i32 0
  %i1 = shufflevector <256 x float> %yins, <256 x float> undef, <256 x i32> zeroinitializer
  %vr = call <256 x float> @llvm.vp.fsub.v256f32(<256 x float> %i0, <256 x float> %i1, <256 x i1> %m, i32 %n)
  %r0 = call <256 x float> @llvm.vp.merge.v256f32(<256 x i1> %m, <256 x float> %vr, <256 x float> %passthru, i32 %n)
  ret <256 x float> %r0
}


declare <256 x double> @llvm.vp.merge.v256f64(<256 x i1>, <256 x double>, <256 x double>, i32)
declare <256 x double> @llvm.vp.fsub.v256f64(<256 x double>, <256 x double>, <256 x i1>, i32)

define fastcc <256 x double> @test_vp_fsub_v256f64_vv_merge(<256 x double> %passthru, <256 x double> %i0, <256 x double> %i1, <256 x i1> %m, i32 %n) {
; CHECK-LABEL: test_vp_fsub_v256f64_vv_merge:
; CHECK:       # %bb.0:
; CHECK-NEXT:    and %s0, %s0, (32)0
; CHECK-NEXT:    lvl %s0
; CHECK-NEXT:    vfsub.d %v0, %v1, %v2, %vm1
; CHECK-NEXT:    b.l.t (, %s10)
  %vr = call <256 x double> @llvm.vp.fsub.v256f64(<256 x double> %i0, <256 x double> %i1, <256 x i1> %m, i32 %n)
  %r0 = call <256 x double> @llvm.vp.merge.v256f64(<256 x i1> %m, <256 x double> %vr, <256 x double> %passthru, i32 %n)
  ret <256 x double> %r0
}

define fastcc <256 x double> @test_vp_fsub_v256f64_rv_merge(<256 x double> %passthru, double %s0, <256 x double> %i1, <256 x i1> %m, i32 %n) {
; CHECK-LABEL: test_vp_fsub_v256f64_rv_merge:
; CHECK:       # %bb.0:
; CHECK-NEXT:    and %s1, %s1, (32)0
; CHECK-NEXT:    lvl %s1
; CHECK-NEXT:    vfsub.d %v0, %s0, %v1, %vm1
; CHECK-NEXT:    b.l.t (, %s10)
  %xins = insertelement <256 x double> undef, double %s0, i32 0
  %i0 = shufflevector <256 x double> %xins, <256 x double> undef, <256 x i32> zeroinitializer
  %vr = call <256 x double> @llvm.vp.fsub.v256f64(<256 x double> %i0, <256 x double> %i1, <256 x i1> %m, i32 %n)
  %r0 = call <256 x double> @llvm.vp.merge.v256f64(<256 x i1> %m, <256 x double> %vr, <256 x double> %passthru, i32 %n)
  ret <256 x double> %r0
}

define fastcc <256 x double> @test_vp_fsub_v256f64_vr_merge(<256 x double> %passthru, <256 x double> %i0, double %s1, <256 x i1> %m, i32 %n) {
; CHECK-LABEL: test_vp_fsub_v256f64_vr_merge:
; CHECK:       # %bb.0:
; CHECK-NEXT:    and %s1, %s1, (32)0
; CHECK-NEXT:    lea %s2, 256
; CHECK-NEXT:    lvl %s2
; CHECK-NEXT:    vbrd %v2, %s0
; CHECK-NEXT:    lvl %s1
; CHECK-NEXT:    vfsub.d %v0, %v1, %v2, %vm1
; CHECK-NEXT:    b.l.t (, %s10)
  %yins = insertelement <256 x double> undef, double %s1, i32 0
  %i1 = shufflevector <256 x double> %yins, <256 x double> undef, <256 x i32> zeroinitializer
  %vr = call <256 x double> @llvm.vp.fsub.v256f64(<256 x double> %i0, <256 x double> %i1, <256 x i1> %m, i32 %n)
  %r0 = call <256 x double> @llvm.vp.merge.v256f64(<256 x i1> %m, <256 x double> %vr, <256 x double> %passthru, i32 %n)
  ret <256 x double> %r0
}
