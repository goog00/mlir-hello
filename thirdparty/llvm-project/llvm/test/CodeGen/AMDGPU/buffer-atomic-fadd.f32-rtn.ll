; NOTE: Assertions have been autogenerated by utils/update_mir_test_checks.py
; RUN: llc -march=amdgcn -mcpu=gfx90a -verify-machineinstrs -stop-after=amdgpu-isel < %s | FileCheck -check-prefix=GFX90A_GFX940 %s
; RUN: llc -march=amdgcn -mcpu=gfx940 -verify-machineinstrs -stop-after=amdgpu-isel < %s | FileCheck -check-prefix=GFX90A_GFX940 %s
; RUN: llc -march=amdgcn -mcpu=gfx1100 -verify-machineinstrs -stop-after=amdgpu-isel < %s | FileCheck -check-prefix=GFX11 %s

define amdgpu_ps float @buffer_atomic_fadd_f32_offset_rtn(float %val, <4 x i32> inreg %rsrc, i32 inreg %soffset) {
  ; GFX90A_GFX940-LABEL: name: buffer_atomic_fadd_f32_offset_rtn
  ; GFX90A_GFX940: bb.0 (%ir-block.0):
  ; GFX90A_GFX940-NEXT:   liveins: $vgpr0, $sgpr0, $sgpr1, $sgpr2, $sgpr3, $sgpr4
  ; GFX90A_GFX940-NEXT: {{  $}}
  ; GFX90A_GFX940-NEXT:   [[COPY:%[0-9]+]]:sgpr_32 = COPY $sgpr4
  ; GFX90A_GFX940-NEXT:   [[COPY1:%[0-9]+]]:sgpr_32 = COPY $sgpr3
  ; GFX90A_GFX940-NEXT:   [[COPY2:%[0-9]+]]:sgpr_32 = COPY $sgpr2
  ; GFX90A_GFX940-NEXT:   [[COPY3:%[0-9]+]]:sgpr_32 = COPY $sgpr1
  ; GFX90A_GFX940-NEXT:   [[COPY4:%[0-9]+]]:sgpr_32 = COPY $sgpr0
  ; GFX90A_GFX940-NEXT:   [[COPY5:%[0-9]+]]:vgpr_32 = COPY $vgpr0
  ; GFX90A_GFX940-NEXT:   [[REG_SEQUENCE:%[0-9]+]]:sgpr_128 = REG_SEQUENCE [[COPY4]], %subreg.sub0, [[COPY3]], %subreg.sub1, [[COPY2]], %subreg.sub2, [[COPY1]], %subreg.sub3
  ; GFX90A_GFX940-NEXT:   [[BUFFER_ATOMIC_ADD_F32_OFFSET_RTN:%[0-9]+]]:vgpr_32 = BUFFER_ATOMIC_ADD_F32_OFFSET_RTN [[COPY5]], killed [[REG_SEQUENCE]], [[COPY]], 0, 1, implicit $exec :: (volatile dereferenceable load store (s32), align 1, addrspace 4)
  ; GFX90A_GFX940-NEXT:   $vgpr0 = COPY [[BUFFER_ATOMIC_ADD_F32_OFFSET_RTN]]
  ; GFX90A_GFX940-NEXT:   SI_RETURN_TO_EPILOG $vgpr0
  ; GFX11-LABEL: name: buffer_atomic_fadd_f32_offset_rtn
  ; GFX11: bb.0 (%ir-block.0):
  ; GFX11-NEXT:   liveins: $vgpr0, $sgpr0, $sgpr1, $sgpr2, $sgpr3, $sgpr4
  ; GFX11-NEXT: {{  $}}
  ; GFX11-NEXT:   [[COPY:%[0-9]+]]:sgpr_32 = COPY $sgpr4
  ; GFX11-NEXT:   [[COPY1:%[0-9]+]]:sgpr_32 = COPY $sgpr3
  ; GFX11-NEXT:   [[COPY2:%[0-9]+]]:sgpr_32 = COPY $sgpr2
  ; GFX11-NEXT:   [[COPY3:%[0-9]+]]:sgpr_32 = COPY $sgpr1
  ; GFX11-NEXT:   [[COPY4:%[0-9]+]]:sgpr_32 = COPY $sgpr0
  ; GFX11-NEXT:   [[COPY5:%[0-9]+]]:vgpr_32 = COPY $vgpr0
  ; GFX11-NEXT:   [[REG_SEQUENCE:%[0-9]+]]:sgpr_128 = REG_SEQUENCE [[COPY4]], %subreg.sub0, [[COPY3]], %subreg.sub1, [[COPY2]], %subreg.sub2, [[COPY1]], %subreg.sub3
  ; GFX11-NEXT:   [[BUFFER_ATOMIC_ADD_F32_OFFSET_RTN:%[0-9]+]]:vgpr_32 = BUFFER_ATOMIC_ADD_F32_OFFSET_RTN [[COPY5]], killed [[REG_SEQUENCE]], [[COPY]], 0, 1, implicit $exec :: (volatile dereferenceable load store (s32), align 1, addrspace 4)
  ; GFX11-NEXT:   $vgpr0 = COPY [[BUFFER_ATOMIC_ADD_F32_OFFSET_RTN]]
  ; GFX11-NEXT:   SI_RETURN_TO_EPILOG $vgpr0
  %ret = call float @llvm.amdgcn.raw.buffer.atomic.fadd.f32(float %val, <4 x i32> %rsrc, i32 0, i32 %soffset, i32 0)
  ret float %ret
}

define amdgpu_ps float @buffer_atomic_fadd_f32_offen_rtn(float %val, <4 x i32> inreg %rsrc, i32 %voffset, i32 inreg %soffset) {
  ; GFX90A_GFX940-LABEL: name: buffer_atomic_fadd_f32_offen_rtn
  ; GFX90A_GFX940: bb.0 (%ir-block.0):
  ; GFX90A_GFX940-NEXT:   liveins: $vgpr0, $sgpr0, $sgpr1, $sgpr2, $sgpr3, $vgpr1, $sgpr4
  ; GFX90A_GFX940-NEXT: {{  $}}
  ; GFX90A_GFX940-NEXT:   [[COPY:%[0-9]+]]:sgpr_32 = COPY $sgpr4
  ; GFX90A_GFX940-NEXT:   [[COPY1:%[0-9]+]]:vgpr_32 = COPY $vgpr1
  ; GFX90A_GFX940-NEXT:   [[COPY2:%[0-9]+]]:sgpr_32 = COPY $sgpr3
  ; GFX90A_GFX940-NEXT:   [[COPY3:%[0-9]+]]:sgpr_32 = COPY $sgpr2
  ; GFX90A_GFX940-NEXT:   [[COPY4:%[0-9]+]]:sgpr_32 = COPY $sgpr1
  ; GFX90A_GFX940-NEXT:   [[COPY5:%[0-9]+]]:sgpr_32 = COPY $sgpr0
  ; GFX90A_GFX940-NEXT:   [[COPY6:%[0-9]+]]:vgpr_32 = COPY $vgpr0
  ; GFX90A_GFX940-NEXT:   [[REG_SEQUENCE:%[0-9]+]]:sgpr_128 = REG_SEQUENCE [[COPY5]], %subreg.sub0, [[COPY4]], %subreg.sub1, [[COPY3]], %subreg.sub2, [[COPY2]], %subreg.sub3
  ; GFX90A_GFX940-NEXT:   [[BUFFER_ATOMIC_ADD_F32_OFFEN_RTN:%[0-9]+]]:vgpr_32 = BUFFER_ATOMIC_ADD_F32_OFFEN_RTN [[COPY6]], [[COPY1]], killed [[REG_SEQUENCE]], [[COPY]], 0, 1, implicit $exec :: (volatile dereferenceable load store (s32), align 1, addrspace 4)
  ; GFX90A_GFX940-NEXT:   $vgpr0 = COPY [[BUFFER_ATOMIC_ADD_F32_OFFEN_RTN]]
  ; GFX90A_GFX940-NEXT:   SI_RETURN_TO_EPILOG $vgpr0
  ; GFX11-LABEL: name: buffer_atomic_fadd_f32_offen_rtn
  ; GFX11: bb.0 (%ir-block.0):
  ; GFX11-NEXT:   liveins: $vgpr0, $sgpr0, $sgpr1, $sgpr2, $sgpr3, $vgpr1, $sgpr4
  ; GFX11-NEXT: {{  $}}
  ; GFX11-NEXT:   [[COPY:%[0-9]+]]:sgpr_32 = COPY $sgpr4
  ; GFX11-NEXT:   [[COPY1:%[0-9]+]]:vgpr_32 = COPY $vgpr1
  ; GFX11-NEXT:   [[COPY2:%[0-9]+]]:sgpr_32 = COPY $sgpr3
  ; GFX11-NEXT:   [[COPY3:%[0-9]+]]:sgpr_32 = COPY $sgpr2
  ; GFX11-NEXT:   [[COPY4:%[0-9]+]]:sgpr_32 = COPY $sgpr1
  ; GFX11-NEXT:   [[COPY5:%[0-9]+]]:sgpr_32 = COPY $sgpr0
  ; GFX11-NEXT:   [[COPY6:%[0-9]+]]:vgpr_32 = COPY $vgpr0
  ; GFX11-NEXT:   [[REG_SEQUENCE:%[0-9]+]]:sgpr_128 = REG_SEQUENCE [[COPY5]], %subreg.sub0, [[COPY4]], %subreg.sub1, [[COPY3]], %subreg.sub2, [[COPY2]], %subreg.sub3
  ; GFX11-NEXT:   [[BUFFER_ATOMIC_ADD_F32_OFFEN_RTN:%[0-9]+]]:vgpr_32 = BUFFER_ATOMIC_ADD_F32_OFFEN_RTN [[COPY6]], [[COPY1]], killed [[REG_SEQUENCE]], [[COPY]], 0, 1, implicit $exec :: (volatile dereferenceable load store (s32), align 1, addrspace 4)
  ; GFX11-NEXT:   $vgpr0 = COPY [[BUFFER_ATOMIC_ADD_F32_OFFEN_RTN]]
  ; GFX11-NEXT:   SI_RETURN_TO_EPILOG $vgpr0
  %ret = call float @llvm.amdgcn.raw.buffer.atomic.fadd.f32(float %val, <4 x i32> %rsrc, i32 %voffset, i32 %soffset, i32 0)
  ret float %ret
}

define amdgpu_ps float @buffer_atomic_fadd_f32_idxen_rtn(float %val, <4 x i32> inreg %rsrc, i32 %vindex, i32 inreg %soffset) {
  ; GFX90A_GFX940-LABEL: name: buffer_atomic_fadd_f32_idxen_rtn
  ; GFX90A_GFX940: bb.0 (%ir-block.0):
  ; GFX90A_GFX940-NEXT:   liveins: $vgpr0, $sgpr0, $sgpr1, $sgpr2, $sgpr3, $vgpr1, $sgpr4
  ; GFX90A_GFX940-NEXT: {{  $}}
  ; GFX90A_GFX940-NEXT:   [[COPY:%[0-9]+]]:sgpr_32 = COPY $sgpr4
  ; GFX90A_GFX940-NEXT:   [[COPY1:%[0-9]+]]:vgpr_32 = COPY $vgpr1
  ; GFX90A_GFX940-NEXT:   [[COPY2:%[0-9]+]]:sgpr_32 = COPY $sgpr3
  ; GFX90A_GFX940-NEXT:   [[COPY3:%[0-9]+]]:sgpr_32 = COPY $sgpr2
  ; GFX90A_GFX940-NEXT:   [[COPY4:%[0-9]+]]:sgpr_32 = COPY $sgpr1
  ; GFX90A_GFX940-NEXT:   [[COPY5:%[0-9]+]]:sgpr_32 = COPY $sgpr0
  ; GFX90A_GFX940-NEXT:   [[COPY6:%[0-9]+]]:vgpr_32 = COPY $vgpr0
  ; GFX90A_GFX940-NEXT:   [[REG_SEQUENCE:%[0-9]+]]:sgpr_128 = REG_SEQUENCE [[COPY5]], %subreg.sub0, [[COPY4]], %subreg.sub1, [[COPY3]], %subreg.sub2, [[COPY2]], %subreg.sub3
  ; GFX90A_GFX940-NEXT:   [[BUFFER_ATOMIC_ADD_F32_IDXEN_RTN:%[0-9]+]]:vgpr_32 = BUFFER_ATOMIC_ADD_F32_IDXEN_RTN [[COPY6]], [[COPY1]], killed [[REG_SEQUENCE]], [[COPY]], 0, 1, implicit $exec :: (volatile dereferenceable load store (s32), align 1, addrspace 4)
  ; GFX90A_GFX940-NEXT:   $vgpr0 = COPY [[BUFFER_ATOMIC_ADD_F32_IDXEN_RTN]]
  ; GFX90A_GFX940-NEXT:   SI_RETURN_TO_EPILOG $vgpr0
  ; GFX11-LABEL: name: buffer_atomic_fadd_f32_idxen_rtn
  ; GFX11: bb.0 (%ir-block.0):
  ; GFX11-NEXT:   liveins: $vgpr0, $sgpr0, $sgpr1, $sgpr2, $sgpr3, $vgpr1, $sgpr4
  ; GFX11-NEXT: {{  $}}
  ; GFX11-NEXT:   [[COPY:%[0-9]+]]:sgpr_32 = COPY $sgpr4
  ; GFX11-NEXT:   [[COPY1:%[0-9]+]]:vgpr_32 = COPY $vgpr1
  ; GFX11-NEXT:   [[COPY2:%[0-9]+]]:sgpr_32 = COPY $sgpr3
  ; GFX11-NEXT:   [[COPY3:%[0-9]+]]:sgpr_32 = COPY $sgpr2
  ; GFX11-NEXT:   [[COPY4:%[0-9]+]]:sgpr_32 = COPY $sgpr1
  ; GFX11-NEXT:   [[COPY5:%[0-9]+]]:sgpr_32 = COPY $sgpr0
  ; GFX11-NEXT:   [[COPY6:%[0-9]+]]:vgpr_32 = COPY $vgpr0
  ; GFX11-NEXT:   [[REG_SEQUENCE:%[0-9]+]]:sgpr_128 = REG_SEQUENCE [[COPY5]], %subreg.sub0, [[COPY4]], %subreg.sub1, [[COPY3]], %subreg.sub2, [[COPY2]], %subreg.sub3
  ; GFX11-NEXT:   [[BUFFER_ATOMIC_ADD_F32_IDXEN_RTN:%[0-9]+]]:vgpr_32 = BUFFER_ATOMIC_ADD_F32_IDXEN_RTN [[COPY6]], [[COPY1]], killed [[REG_SEQUENCE]], [[COPY]], 0, 1, implicit $exec :: (volatile dereferenceable load store (s32), align 1, addrspace 4)
  ; GFX11-NEXT:   $vgpr0 = COPY [[BUFFER_ATOMIC_ADD_F32_IDXEN_RTN]]
  ; GFX11-NEXT:   SI_RETURN_TO_EPILOG $vgpr0
  %ret = call float @llvm.amdgcn.struct.buffer.atomic.fadd.f32(float %val, <4 x i32> %rsrc, i32 %vindex, i32 0, i32 %soffset, i32 0)
  ret float %ret
}

define amdgpu_ps float @buffer_atomic_fadd_f32_bothen_rtn(float %val, <4 x i32> inreg %rsrc, i32 %vindex, i32 %voffset, i32 inreg %soffset) {
  ; GFX90A_GFX940-LABEL: name: buffer_atomic_fadd_f32_bothen_rtn
  ; GFX90A_GFX940: bb.0 (%ir-block.0):
  ; GFX90A_GFX940-NEXT:   liveins: $vgpr0, $sgpr0, $sgpr1, $sgpr2, $sgpr3, $vgpr1, $vgpr2, $sgpr4
  ; GFX90A_GFX940-NEXT: {{  $}}
  ; GFX90A_GFX940-NEXT:   [[COPY:%[0-9]+]]:sgpr_32 = COPY $sgpr4
  ; GFX90A_GFX940-NEXT:   [[COPY1:%[0-9]+]]:vgpr_32 = COPY $vgpr2
  ; GFX90A_GFX940-NEXT:   [[COPY2:%[0-9]+]]:vgpr_32 = COPY $vgpr1
  ; GFX90A_GFX940-NEXT:   [[COPY3:%[0-9]+]]:sgpr_32 = COPY $sgpr3
  ; GFX90A_GFX940-NEXT:   [[COPY4:%[0-9]+]]:sgpr_32 = COPY $sgpr2
  ; GFX90A_GFX940-NEXT:   [[COPY5:%[0-9]+]]:sgpr_32 = COPY $sgpr1
  ; GFX90A_GFX940-NEXT:   [[COPY6:%[0-9]+]]:sgpr_32 = COPY $sgpr0
  ; GFX90A_GFX940-NEXT:   [[COPY7:%[0-9]+]]:vgpr_32 = COPY $vgpr0
  ; GFX90A_GFX940-NEXT:   [[REG_SEQUENCE:%[0-9]+]]:sgpr_128 = REG_SEQUENCE [[COPY6]], %subreg.sub0, [[COPY5]], %subreg.sub1, [[COPY4]], %subreg.sub2, [[COPY3]], %subreg.sub3
  ; GFX90A_GFX940-NEXT:   [[REG_SEQUENCE1:%[0-9]+]]:vreg_64_align2 = REG_SEQUENCE [[COPY2]], %subreg.sub0, [[COPY1]], %subreg.sub1
  ; GFX90A_GFX940-NEXT:   [[BUFFER_ATOMIC_ADD_F32_BOTHEN_RTN:%[0-9]+]]:vgpr_32 = BUFFER_ATOMIC_ADD_F32_BOTHEN_RTN [[COPY7]], killed [[REG_SEQUENCE1]], killed [[REG_SEQUENCE]], [[COPY]], 0, 1, implicit $exec :: (volatile dereferenceable load store (s32), align 1, addrspace 4)
  ; GFX90A_GFX940-NEXT:   $vgpr0 = COPY [[BUFFER_ATOMIC_ADD_F32_BOTHEN_RTN]]
  ; GFX90A_GFX940-NEXT:   SI_RETURN_TO_EPILOG $vgpr0
  ; GFX11-LABEL: name: buffer_atomic_fadd_f32_bothen_rtn
  ; GFX11: bb.0 (%ir-block.0):
  ; GFX11-NEXT:   liveins: $vgpr0, $sgpr0, $sgpr1, $sgpr2, $sgpr3, $vgpr1, $vgpr2, $sgpr4
  ; GFX11-NEXT: {{  $}}
  ; GFX11-NEXT:   [[COPY:%[0-9]+]]:sgpr_32 = COPY $sgpr4
  ; GFX11-NEXT:   [[COPY1:%[0-9]+]]:vgpr_32 = COPY $vgpr2
  ; GFX11-NEXT:   [[COPY2:%[0-9]+]]:vgpr_32 = COPY $vgpr1
  ; GFX11-NEXT:   [[COPY3:%[0-9]+]]:sgpr_32 = COPY $sgpr3
  ; GFX11-NEXT:   [[COPY4:%[0-9]+]]:sgpr_32 = COPY $sgpr2
  ; GFX11-NEXT:   [[COPY5:%[0-9]+]]:sgpr_32 = COPY $sgpr1
  ; GFX11-NEXT:   [[COPY6:%[0-9]+]]:sgpr_32 = COPY $sgpr0
  ; GFX11-NEXT:   [[COPY7:%[0-9]+]]:vgpr_32 = COPY $vgpr0
  ; GFX11-NEXT:   [[REG_SEQUENCE:%[0-9]+]]:sgpr_128 = REG_SEQUENCE [[COPY6]], %subreg.sub0, [[COPY5]], %subreg.sub1, [[COPY4]], %subreg.sub2, [[COPY3]], %subreg.sub3
  ; GFX11-NEXT:   [[REG_SEQUENCE1:%[0-9]+]]:vreg_64 = REG_SEQUENCE [[COPY2]], %subreg.sub0, [[COPY1]], %subreg.sub1
  ; GFX11-NEXT:   [[BUFFER_ATOMIC_ADD_F32_BOTHEN_RTN:%[0-9]+]]:vgpr_32 = BUFFER_ATOMIC_ADD_F32_BOTHEN_RTN [[COPY7]], killed [[REG_SEQUENCE1]], killed [[REG_SEQUENCE]], [[COPY]], 0, 1, implicit $exec :: (volatile dereferenceable load store (s32), align 1, addrspace 4)
  ; GFX11-NEXT:   $vgpr0 = COPY [[BUFFER_ATOMIC_ADD_F32_BOTHEN_RTN]]
  ; GFX11-NEXT:   SI_RETURN_TO_EPILOG $vgpr0
  %ret = call float @llvm.amdgcn.struct.buffer.atomic.fadd.f32(float %val, <4 x i32> %rsrc, i32 %vindex, i32 %voffset, i32 %soffset, i32 0)
  ret float %ret
}

declare float @llvm.amdgcn.raw.buffer.atomic.fadd.f32(float, <4 x i32>, i32, i32, i32 immarg)
declare float @llvm.amdgcn.struct.buffer.atomic.fadd.f32(float, <4 x i32>, i32, i32, i32, i32 immarg)