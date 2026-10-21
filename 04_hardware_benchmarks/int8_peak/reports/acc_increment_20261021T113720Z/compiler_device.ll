; ModuleID = '/root/MOE/C500_int8_02All/04_hardware_benchmarks/int8_peak/int8_mma_peak.cpp'
source_filename = "/root/MOE/C500_int8_02All/04_hardware_benchmarks/int8_peak/int8_mma_peak.cpp"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "mxc-metax-macahca"

%struct.mcDevMallocInfo.0 = type { i32, i32, ptr }

$_Z13mmaPeakKernelILi1EEvPKaS1_Pii = comdat any

$_Z13mmaPeakKernelILi2EEvPKaS1_Pii = comdat any

$_Z13mmaPeakKernelILi4EEvPKaS1_Pii = comdat any

$_Z13mmaPeakKernelILi8EEvPKaS1_Pii = comdat any

$_Z13mmaPeakKernelILi16EEvPKaS1_Pii = comdat any

$_Z13mmaPeakKernelILi17EEvPKaS1_Pii = comdat any

$_Z13mmaPeakKernelILi18EEvPKaS1_Pii = comdat any

$_Z13mmaPeakKernelILi19EEvPKaS1_Pii = comdat any

$_Z13mmaPeakKernelILi20EEvPKaS1_Pii = comdat any

$_Z13mmaPeakKernelILi21EEvPKaS1_Pii = comdat any

$_Z13mmaPeakKernelILi22EEvPKaS1_Pii = comdat any

$_Z13mmaPeakKernelILi23EEvPKaS1_Pii = comdat any

$_Z13mmaPeakKernelILi24EEvPKaS1_Pii = comdat any

$_Z13mmaPeakKernelILi25EEvPKaS1_Pii = comdat any

$_Z13mmaPeakKernelILi26EEvPKaS1_Pii = comdat any

$_Z13mmaPeakKernelILi27EEvPKaS1_Pii = comdat any

$_Z13mmaPeakKernelILi28EEvPKaS1_Pii = comdat any

$_Z13mmaPeakKernelILi29EEvPKaS1_Pii = comdat any

$_Z13mmaPeakKernelILi30EEvPKaS1_Pii = comdat any

$_Z13mmaPeakKernelILi31EEvPKaS1_Pii = comdat any

$_Z13mmaPeakKernelILi32EEvPKaS1_Pii = comdat any

@mcDeviceMemoryInfo = weak protected addrspace(1) externally_initialized global [1 x %struct.mcDevMallocInfo.0] zeroinitializer, align 8
@llvm.compiler.used = appending addrspace(1) global [1 x ptr] [ptr addrspacecast (ptr addrspace(1) @mcDeviceMemoryInfo to ptr)], section "llvm.metadata"

; Function Attrs: mustprogress noreturn nounwind
define weak void @__cxa_pure_virtual() local_unnamed_addr #0 {
entry:
  tail call void @llvm.trap()
  unreachable
}

; Function Attrs: cold noreturn nounwind memory(inaccessiblemem: write)
declare void @llvm.trap() #1

; Function Attrs: mustprogress noreturn nounwind
define weak void @__cxa_deleted_virtual() local_unnamed_addr #0 {
entry:
  tail call void @llvm.trap()
  unreachable
}

; Function Attrs: nounwind
define weak protected void @__mcImplicitDeviceSynchronize() local_unnamed_addr #2 {
entry:
  %0 = tail call ptr addrspace(4) @llvm.mxc.implicitarg.ptr()
  %arrayidx.i.i = getelementptr inbounds i8, ptr addrspace(4) %0, i64 32
  %1 = load i64, ptr addrspace(4) %arrayidx.i.i, align 8, !tbaa !2
  %2 = inttoptr i64 %1 to ptr
  %arrayidx.i32.i = getelementptr inbounds i8, ptr addrspace(4) %0, i64 40
  %3 = load i64, ptr addrspace(4) %arrayidx.i32.i, align 8, !tbaa !2
  %4 = inttoptr i64 %3 to ptr
  %current_counter.i = getelementptr inbounds i8, ptr %4, i64 12
  %thread_counter.i = getelementptr inbounds i8, ptr %4, i64 16
  %5 = load ptr, ptr %thread_counter.i, align 8, !tbaa !6
  %cmp.not.i = icmp eq ptr %5, null
  br i1 %cmp.not.i, label %if.end.i, label %if.then.i

if.then.i:                                        ; preds = %entry
  %6 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.mxc.dispatch.ptr()
  %7 = getelementptr inbounds i8, ptr addrspace(4) %6, i64 12
  %8 = load i32, ptr addrspace(4) %7, align 4, !range !13, !invariant.load !14
  %9 = getelementptr inbounds i8, ptr addrspace(4) %6, i64 4
  %10 = load i32, ptr addrspace(4) %9, align 4, !invariant.load !14
  %conv.i14.i.i = and i32 %10, 65535
  %div.i15.i.i = udiv i32 %8, %conv.i14.i.i
  %mul.i16.i.i = mul i32 %div.i15.i.i, %conv.i14.i.i
  %cmp.i17.i.i = icmp ugt i32 %8, %mul.i16.i.i
  %conv2.i18.i.i = zext i1 %cmp.i17.i.i to i32
  %add.i19.i.i = add nuw i32 %div.i15.i.i, %conv2.i18.i.i
  %11 = getelementptr inbounds i8, ptr addrspace(4) %6, i64 16
  %12 = load i32, ptr addrspace(4) %11, align 4, !range !13, !invariant.load !14
  %13 = lshr i32 %10, 16
  %div.i.i.i = udiv i32 %12, %13
  %mul.i.i.i = mul i32 %div.i.i.i, %13
  %cmp.i.i.i = icmp ugt i32 %12, %mul.i.i.i
  %conv2.i.i.i = zext i1 %cmp.i.i.i to i32
  %add.i.i.i = add nuw i32 %div.i.i.i, %conv2.i.i.i
  %14 = tail call noundef range(i32 0, 2147483647) i32 @llvm.mxc.block.id.z(), !range !15
  %mul.i.i = mul i32 %add.i.i.i, %14
  %15 = tail call noundef range(i32 0, 2147483647) i32 @llvm.mxc.block.id.y(), !range !15
  %mul320.i.i = add i32 %mul.i.i, %15
  %add.i.i = mul i32 %mul320.i.i, %add.i19.i.i
  %16 = tail call noundef range(i32 0, 2147483647) i32 @llvm.mxc.block.id.x(), !range !15
  %add8.i.i = add i32 %add.i.i, %16
  %conv.i.i = zext i32 %add8.i.i to i64
  %arrayidx.i = getelementptr inbounds i32, ptr %5, i64 %conv.i.i
  %17 = tail call i1 @llvm.mxc.is.private(ptr nonnull %arrayidx.i)
  br label %while.cond.i

while.cond.i:                                     ; preds = %while.body.i, %if.then.i
  br i1 %17, label %if.then.i.i, label %if.end.i.i

if.then.i.i:                                      ; preds = %while.cond.i
  %18 = load i32, ptr %arrayidx.i, align 4, !tbaa !16
  br label %_Z9atomicAddPii.exit.i

if.end.i.i:                                       ; preds = %while.cond.i
  %19 = atomicrmw or ptr %arrayidx.i, i32 0 syncscope("device-one-as") monotonic, align 4
  br label %_Z9atomicAddPii.exit.i

_Z9atomicAddPii.exit.i:                           ; preds = %if.end.i.i, %if.then.i.i
  %retval.0.i.i = phi i32 [ %18, %if.then.i.i ], [ %19, %if.end.i.i ]
  %cmp6.i = icmp sgt i32 %retval.0.i.i, 0
  br i1 %cmp6.i, label %while.body.i, label %if.end.i

while.body.i:                                     ; preds = %_Z9atomicAddPii.exit.i
  tail call void @llvm.mxc.sleep(i32 1)
  br label %while.cond.i, !llvm.loop !17

if.end.i:                                         ; preds = %_Z9atomicAddPii.exit.i, %entry
  %20 = tail call i1 @llvm.mxc.is.private(ptr nonnull %current_counter.i)
  br i1 %20, label %if.then.i36.i, label %if.end.i34.i

if.then.i36.i:                                    ; preds = %if.end.i
  %21 = load i32, ptr %current_counter.i, align 4, !tbaa !16
  %add.i37.i = add nsw i32 %21, -1
  store i32 %add.i37.i, ptr %current_counter.i, align 4, !tbaa !16
  br label %_Z9atomicAddPii.exit38.i

if.end.i34.i:                                     ; preds = %if.end.i
  %22 = atomicrmw add ptr %current_counter.i, i32 -1 syncscope("device-one-as") monotonic, align 4
  br label %_Z9atomicAddPii.exit38.i

_Z9atomicAddPii.exit38.i:                         ; preds = %if.end.i34.i, %if.then.i36.i
  %retval.0.i35.i = phi i32 [ %21, %if.then.i36.i ], [ %22, %if.end.i34.i ]
  fence syncscope("device") seq_cst
  %call_deep.i = getelementptr inbounds i8, ptr %4, i64 4
  %23 = load i32, ptr %call_deep.i, align 4, !tbaa !19
  %cmp8.i = icmp eq i32 %23, 0
  br i1 %cmp8.i, label %if.then9.i, label %if.else.i

if.then9.i:                                       ; preds = %_Z9atomicAddPii.exit38.i
  %cmp10.i = icmp slt i32 %retval.0.i35.i, 2
  br i1 %cmp10.i, label %if.then11.i, label %__mcImplicitDeviceSynchronizeImpl.exit

if.then11.i:                                      ; preds = %if.then9.i
  tail call void @llvm.mxc.sleep(i32 30)
  br label %__mcImplicitDeviceSynchronizeImpl.exit

if.else.i:                                        ; preds = %_Z9atomicAddPii.exit38.i
  %parent_wrap13.i = getelementptr inbounds i8, ptr %4, i64 24
  %24 = load ptr, ptr %parent_wrap13.i, align 8, !tbaa !20
  %25 = load i32, ptr %4, align 8, !tbaa !21
  %thread_counter15.i = getelementptr inbounds i8, ptr %24, i64 16
  %26 = load ptr, ptr %thread_counter15.i, align 8, !tbaa !6
  %idxprom.i = zext i32 %25 to i64
  %arrayidx16.i = getelementptr inbounds i32, ptr %26, i64 %idxprom.i
  %cmp17.i = icmp slt i32 %retval.0.i35.i, 2
  br i1 %cmp17.i, label %if.then18.i, label %if.end20.i

if.then18.i:                                      ; preds = %if.else.i
  %mqlwrap_slots.i = getelementptr inbounds i8, ptr %2, i64 24
  %27 = load ptr, ptr %mqlwrap_slots.i, align 8, !tbaa !22
  %sub.ptr.rhs.cast.i = ptrtoint ptr %27 to i64
  %sub.ptr.sub.i = sub i64 %3, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = sdiv exact i64 %sub.ptr.sub.i, 96
  %mqlwrap_slot_mask.i = getelementptr inbounds i8, ptr %2, i64 80
  %28 = load i64, ptr %mqlwrap_slot_mask.i, align 8, !tbaa !24
  %29 = inttoptr i64 %28 to ptr
  %idx.ext.i.i = and i64 %sub.ptr.div.i, 4294967295
  %add.ptr.i.i = getelementptr inbounds i32, ptr %29, i64 %idx.ext.i.i
  %30 = tail call i1 @llvm.mxc.is.private(ptr %add.ptr.i.i)
  br i1 %30, label %if.then.i.i.i, label %if.end.i.i.i

if.then.i.i.i:                                    ; preds = %if.then18.i
  %31 = load i32, ptr %add.ptr.i.i, align 4, !tbaa !16
  %and.i.i.i = and i32 %31, 2147483647
  store i32 %and.i.i.i, ptr %add.ptr.i.i, align 4, !tbaa !16
  br label %if.end20.i

if.end.i.i.i:                                     ; preds = %if.then18.i
  %32 = atomicrmw and ptr %add.ptr.i.i, i32 2147483647 syncscope("device-one-as") monotonic, align 4
  br label %if.end20.i

if.end20.i:                                       ; preds = %if.end.i.i.i, %if.then.i.i.i, %if.else.i
  %33 = tail call i1 @llvm.mxc.is.private(ptr %arrayidx16.i)
  br i1 %33, label %if.then.i41.i, label %if.end.i39.i

if.then.i41.i:                                    ; preds = %if.end20.i
  %34 = load i32, ptr %arrayidx16.i, align 4, !tbaa !16
  %add.i42.i = add nsw i32 %34, -1
  store i32 %add.i42.i, ptr %arrayidx16.i, align 4, !tbaa !16
  br label %__mcImplicitDeviceSynchronizeImpl.exit

if.end.i39.i:                                     ; preds = %if.end20.i
  %35 = atomicrmw add ptr %arrayidx16.i, i32 -1 syncscope("device-one-as") monotonic, align 4
  br label %__mcImplicitDeviceSynchronizeImpl.exit

__mcImplicitDeviceSynchronizeImpl.exit:           ; preds = %if.then9.i, %if.then11.i, %if.then.i41.i, %if.end.i39.i
  ret void
}

; Function Attrs: convergent mustprogress nofree norecurse nounwind memory(argmem: readwrite)
define protected metaxgpu_kernel void @_Z13mmaPeakKernelILi1EEvPKaS1_Pii(ptr addrspace(1) noalias nocapture noundef readonly %a.coerce, ptr addrspace(1) noalias nocapture noundef readonly %b.coerce, ptr addrspace(1) noalias nocapture noundef writeonly %c.coerce, i32 noundef %iterations) local_unnamed_addr #3 comdat {
entry:
  %0 = tail call noundef range(i32 0, 1024) i32 @llvm.mxc.thread.id.x(), !range !25
  %1 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.mxc.dispatch.ptr()
  %2 = getelementptr inbounds i8, ptr addrspace(4) %1, i64 4
  %3 = load i16, ptr addrspace(4) %2, align 4, !range !26, !invariant.load !14
  %rem11 = and i32 %0, 15
  %4 = lshr i32 %0, 2
  %mul13 = and i32 %4, 12
  %mul15 = shl nuw nsw i32 %rem11, 4
  %add17 = or disjoint i32 %mul15, %mul13
  %idx.ext = zext nneg i32 %add17 to i64
  %add.ptr = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %idx.ext
  %5 = load i32, ptr addrspace(1) %add.ptr, align 1
  %add.ptr21 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %idx.ext
  %6 = load i32, ptr addrspace(1) %add.ptr21, align 1
  %cmp25103 = icmp sgt i32 %iterations, 0
  br i1 %cmp25103, label %for.body33, label %for.body52

for.body33:                                       ; preds = %entry, %for.body33
  %iteration.0105 = phi i32 [ %inc46, %for.body33 ], [ 0, %entry ]
  %sums.sroa.0.0104 = phi <4 x i32> [ %7, %for.body33 ], [ zeroinitializer, %entry ]
  %7 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %5, i32 %6, <4 x i32> %sums.sroa.0.0104), !call_argsrelate !27
  %inc46 = add nuw nsw i32 %iteration.0105, 1
  %exitcond.not = icmp eq i32 %inc46, %iterations
  br i1 %exitcond.not, label %for.body52, label %for.body33, !llvm.loop !28

for.body52:                                       ; preds = %for.body33, %entry
  %sums.sroa.0.0.lcssa = phi <4 x i32> [ zeroinitializer, %entry ], [ %7, %for.body33 ]
  %8 = lshr i16 %3, 6
  %conv7 = zext nneg i16 %8 to i64
  %9 = tail call noundef range(i32 0, 2147483647) i32 @llvm.mxc.block.id.x(), !range !15
  %conv = zext nneg i32 %9 to i64
  %mul = mul nuw nsw i64 %conv7, %conv
  %div9100 = lshr i32 %0, 6
  %conv10 = zext nneg i32 %div9100 to i64
  %add = add nuw nsw i64 %mul, %conv10
  %mul56 = shl nuw nsw i64 %add, 8
  %conv70 = zext nneg i32 %rem11 to i64
  %10 = zext nneg i32 %mul13 to i64
  %vecext = extractelement <4 x i32> %sums.sroa.0.0.lcssa, i64 0
  %11 = shl nuw nsw i64 %10, 4
  %add69 = or disjoint i64 %mul56, %11
  %add71 = or disjoint i64 %add69, %conv70
  %arrayidx72 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71
  store i32 %vecext, ptr addrspace(1) %arrayidx72, align 4, !tbaa !16
  %vecext.1 = extractelement <4 x i32> %sums.sroa.0.0.lcssa, i64 1
  %12 = shl nuw nsw i64 %10, 4
  %13 = or disjoint i64 %12, 16
  %add69.1 = or disjoint i64 %mul56, %13
  %add71.1 = or disjoint i64 %add69.1, %conv70
  %arrayidx72.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1
  store i32 %vecext.1, ptr addrspace(1) %arrayidx72.1, align 4, !tbaa !16
  %vecext.2 = extractelement <4 x i32> %sums.sroa.0.0.lcssa, i64 2
  %14 = shl nuw nsw i64 %10, 4
  %15 = or disjoint i64 %14, 32
  %add69.2 = or disjoint i64 %mul56, %15
  %add71.2 = or disjoint i64 %add69.2, %conv70
  %arrayidx72.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2
  store i32 %vecext.2, ptr addrspace(1) %arrayidx72.2, align 4, !tbaa !16
  %vecext.3 = extractelement <4 x i32> %sums.sroa.0.0.lcssa, i64 3
  %16 = shl nuw nsw i64 %10, 4
  %17 = or disjoint i64 %16, 48
  %add69.3 = or disjoint i64 %mul56, %17
  %add71.3 = or disjoint i64 %add69.3, %conv70
  %arrayidx72.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3
  store i32 %vecext.3, ptr addrspace(1) %arrayidx72.3, align 4, !tbaa !16
  ret void
}

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(none)
declare <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32, i32, <4 x i32>) #4

; Function Attrs: mustprogress nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.mxc.thread.id.x() #5

; Function Attrs: mustprogress nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.mxc.block.id.x() #5

; Function Attrs: mustprogress nofree nosync nounwind speculatable willreturn memory(none)
declare align 4 ptr addrspace(4) @llvm.mxc.dispatch.ptr() #5

; Function Attrs: convergent mustprogress nofree norecurse nounwind memory(argmem: readwrite)
define protected metaxgpu_kernel void @_Z13mmaPeakKernelILi2EEvPKaS1_Pii(ptr addrspace(1) noalias nocapture noundef readonly %a.coerce, ptr addrspace(1) noalias nocapture noundef readonly %b.coerce, ptr addrspace(1) noalias nocapture noundef writeonly %c.coerce, i32 noundef %iterations) local_unnamed_addr #3 comdat {
entry:
  %0 = tail call noundef range(i32 0, 1024) i32 @llvm.mxc.thread.id.x(), !range !25
  %1 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.mxc.dispatch.ptr()
  %2 = getelementptr inbounds i8, ptr addrspace(4) %1, i64 4
  %3 = load i16, ptr addrspace(4) %2, align 4, !range !26, !invariant.load !14
  %rem11 = and i32 %0, 15
  %4 = lshr i32 %0, 2
  %mul13 = and i32 %4, 12
  %mul15 = shl nuw nsw i32 %rem11, 4
  %5 = zext nneg i32 %mul15 to i64
  %6 = zext nneg i32 %mul13 to i64
  %7 = or disjoint i64 %5, %6
  %add.ptr = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %7
  %8 = load i32, ptr addrspace(1) %add.ptr, align 1
  %add.ptr21 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %7
  %9 = load i32, ptr addrspace(1) %add.ptr21, align 1
  %10 = or disjoint i64 %5, %6
  %11 = or disjoint i64 %10, 256
  %add.ptr.1 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %11
  %12 = load i32, ptr addrspace(1) %add.ptr.1, align 1
  %add.ptr21.1 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %11
  %13 = load i32, ptr addrspace(1) %add.ptr21.1, align 1
  %cmp25104 = icmp sgt i32 %iterations, 0
  br i1 %cmp25104, label %for.cond30.preheader, label %for.cond49.preheader

for.cond30.preheader:                             ; preds = %entry, %for.cond30.preheader
  %sums.sroa.6.0 = phi <4 x i32> [ %15, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.0.0 = phi <4 x i32> [ %14, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %iteration.0105 = phi i32 [ %inc46, %for.cond30.preheader ], [ 0, %entry ]
  %14 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %8, i32 %9, <4 x i32> %sums.sroa.0.0), !call_argsrelate !27
  %15 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %12, i32 %13, <4 x i32> %sums.sroa.6.0), !call_argsrelate !27
  %inc46 = add nuw nsw i32 %iteration.0105, 1
  %exitcond.not = icmp eq i32 %inc46, %iterations
  br i1 %exitcond.not, label %for.cond49.preheader, label %for.cond30.preheader, !llvm.loop !30

for.cond49.preheader:                             ; preds = %for.cond30.preheader, %entry
  %sums.sroa.6.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %15, %for.cond30.preheader ]
  %sums.sroa.0.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %14, %for.cond30.preheader ]
  %16 = lshr i16 %3, 6
  %conv7 = zext nneg i16 %16 to i64
  %17 = tail call noundef range(i32 0, 2147483647) i32 @llvm.mxc.block.id.x(), !range !15
  %conv = zext nneg i32 %17 to i64
  %mul = mul nuw nsw i64 %conv7, %conv
  %div9100 = lshr i32 %0, 6
  %conv10 = zext nneg i32 %div9100 to i64
  %add = add nuw nsw i64 %mul, %conv10
  %18 = shl nuw nsw i64 %add, 9
  %conv70 = zext nneg i32 %rem11 to i64
  %vecext = extractelement <4 x i32> %sums.sroa.0.1, i64 0
  %19 = shl nuw nsw i64 %6, 4
  %add69 = or disjoint i64 %18, %19
  %add71 = or disjoint i64 %add69, %conv70
  %arrayidx72 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71
  store i32 %vecext, ptr addrspace(1) %arrayidx72, align 4, !tbaa !16
  %vecext.1 = extractelement <4 x i32> %sums.sroa.0.1, i64 1
  %20 = shl nuw nsw i64 %6, 4
  %21 = or disjoint i64 %20, 16
  %add69.1 = or disjoint i64 %18, %21
  %add71.1 = or disjoint i64 %add69.1, %conv70
  %arrayidx72.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1
  store i32 %vecext.1, ptr addrspace(1) %arrayidx72.1, align 4, !tbaa !16
  %vecext.2 = extractelement <4 x i32> %sums.sroa.0.1, i64 2
  %22 = shl nuw nsw i64 %6, 4
  %23 = or disjoint i64 %22, 32
  %add69.2 = or disjoint i64 %18, %23
  %add71.2 = or disjoint i64 %add69.2, %conv70
  %arrayidx72.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2
  store i32 %vecext.2, ptr addrspace(1) %arrayidx72.2, align 4, !tbaa !16
  %vecext.3 = extractelement <4 x i32> %sums.sroa.0.1, i64 3
  %24 = shl nuw nsw i64 %6, 4
  %25 = or disjoint i64 %24, 48
  %add69.3 = or disjoint i64 %18, %25
  %add71.3 = or disjoint i64 %add69.3, %conv70
  %arrayidx72.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3
  store i32 %vecext.3, ptr addrspace(1) %arrayidx72.3, align 4, !tbaa !16
  %mul56.1 = or disjoint i64 %18, 256
  %vecext.1117 = extractelement <4 x i32> %sums.sroa.6.1, i64 0
  %add69.1118 = or disjoint i64 %mul56.1, %19
  %add71.1119 = or disjoint i64 %add69.1118, %conv70
  %arrayidx72.1120 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1119
  store i32 %vecext.1117, ptr addrspace(1) %arrayidx72.1120, align 4, !tbaa !16
  %vecext.1.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 1
  %add69.1.1 = or disjoint i64 %mul56.1, %21
  %add71.1.1 = or disjoint i64 %add69.1.1, %conv70
  %arrayidx72.1.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.1
  store i32 %vecext.1.1, ptr addrspace(1) %arrayidx72.1.1, align 4, !tbaa !16
  %vecext.2.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 2
  %add69.2.1 = or disjoint i64 %mul56.1, %23
  %add71.2.1 = or disjoint i64 %add69.2.1, %conv70
  %arrayidx72.2.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.1
  store i32 %vecext.2.1, ptr addrspace(1) %arrayidx72.2.1, align 4, !tbaa !16
  %vecext.3.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 3
  %add69.3.1 = or disjoint i64 %mul56.1, %25
  %add71.3.1 = or disjoint i64 %add69.3.1, %conv70
  %arrayidx72.3.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.1
  store i32 %vecext.3.1, ptr addrspace(1) %arrayidx72.3.1, align 4, !tbaa !16
  ret void
}

; Function Attrs: convergent mustprogress nofree norecurse nounwind memory(argmem: readwrite)
define protected metaxgpu_kernel void @_Z13mmaPeakKernelILi4EEvPKaS1_Pii(ptr addrspace(1) noalias nocapture noundef readonly %a.coerce, ptr addrspace(1) noalias nocapture noundef readonly %b.coerce, ptr addrspace(1) noalias nocapture noundef writeonly %c.coerce, i32 noundef %iterations) local_unnamed_addr #3 comdat {
entry:
  %0 = tail call noundef range(i32 0, 1024) i32 @llvm.mxc.thread.id.x(), !range !25
  %1 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.mxc.dispatch.ptr()
  %2 = getelementptr inbounds i8, ptr addrspace(4) %1, i64 4
  %3 = load i16, ptr addrspace(4) %2, align 4, !range !26, !invariant.load !14
  %rem11 = and i32 %0, 15
  %4 = lshr i32 %0, 2
  %mul13 = and i32 %4, 12
  %mul15 = shl nuw nsw i32 %rem11, 4
  %5 = zext nneg i32 %mul15 to i64
  %6 = zext nneg i32 %mul13 to i64
  %7 = or disjoint i64 %5, %6
  %add.ptr = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %7
  %8 = load i32, ptr addrspace(1) %add.ptr, align 1
  %add.ptr21 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %7
  %9 = load i32, ptr addrspace(1) %add.ptr21, align 1
  %10 = or disjoint i64 %5, %6
  %11 = or disjoint i64 %10, 256
  %add.ptr.1 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %11
  %12 = load i32, ptr addrspace(1) %add.ptr.1, align 1
  %add.ptr21.1 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %11
  %13 = load i32, ptr addrspace(1) %add.ptr21.1, align 1
  %14 = or disjoint i64 %5, %6
  %15 = or disjoint i64 %14, 512
  %add.ptr.2 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %15
  %16 = load i32, ptr addrspace(1) %add.ptr.2, align 1
  %add.ptr21.2 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %15
  %17 = load i32, ptr addrspace(1) %add.ptr21.2, align 1
  %18 = or disjoint i64 %5, %6
  %19 = or disjoint i64 %18, 768
  %add.ptr.3 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %19
  %20 = load i32, ptr addrspace(1) %add.ptr.3, align 1
  %add.ptr21.3 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %19
  %21 = load i32, ptr addrspace(1) %add.ptr21.3, align 1
  %cmp25104 = icmp sgt i32 %iterations, 0
  br i1 %cmp25104, label %for.cond30.preheader, label %for.cond49.preheader

for.cond30.preheader:                             ; preds = %entry, %for.cond30.preheader
  %sums.sroa.14.0 = phi <4 x i32> [ %25, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.10.0 = phi <4 x i32> [ %24, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.6.0 = phi <4 x i32> [ %23, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.0.0 = phi <4 x i32> [ %22, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %iteration.0105 = phi i32 [ %inc46, %for.cond30.preheader ], [ 0, %entry ]
  %22 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %8, i32 %9, <4 x i32> %sums.sroa.0.0), !call_argsrelate !27
  %23 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %12, i32 %13, <4 x i32> %sums.sroa.6.0), !call_argsrelate !27
  %24 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %16, i32 %17, <4 x i32> %sums.sroa.10.0), !call_argsrelate !27
  %25 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %20, i32 %21, <4 x i32> %sums.sroa.14.0), !call_argsrelate !27
  %inc46 = add nuw nsw i32 %iteration.0105, 1
  %exitcond.not = icmp eq i32 %inc46, %iterations
  br i1 %exitcond.not, label %for.cond49.preheader, label %for.cond30.preheader, !llvm.loop !31

for.cond49.preheader:                             ; preds = %for.cond30.preheader, %entry
  %sums.sroa.14.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %25, %for.cond30.preheader ]
  %sums.sroa.10.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %24, %for.cond30.preheader ]
  %sums.sroa.6.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %23, %for.cond30.preheader ]
  %sums.sroa.0.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %22, %for.cond30.preheader ]
  %26 = lshr i16 %3, 6
  %conv7 = zext nneg i16 %26 to i64
  %27 = tail call noundef range(i32 0, 2147483647) i32 @llvm.mxc.block.id.x(), !range !15
  %conv = zext nneg i32 %27 to i64
  %mul = mul nuw nsw i64 %conv7, %conv
  %div9100 = lshr i32 %0, 6
  %conv10 = zext nneg i32 %div9100 to i64
  %add = add nuw nsw i64 %mul, %conv10
  %28 = shl nuw nsw i64 %add, 10
  %conv70 = zext nneg i32 %rem11 to i64
  %vecext = extractelement <4 x i32> %sums.sroa.0.1, i64 0
  %29 = shl nuw nsw i64 %6, 4
  %add69 = or disjoint i64 %28, %29
  %add71 = or disjoint i64 %add69, %conv70
  %arrayidx72 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71
  store i32 %vecext, ptr addrspace(1) %arrayidx72, align 4, !tbaa !16
  %vecext.1 = extractelement <4 x i32> %sums.sroa.0.1, i64 1
  %30 = shl nuw nsw i64 %6, 4
  %31 = or disjoint i64 %30, 16
  %add69.1 = or disjoint i64 %28, %31
  %add71.1 = or disjoint i64 %add69.1, %conv70
  %arrayidx72.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1
  store i32 %vecext.1, ptr addrspace(1) %arrayidx72.1, align 4, !tbaa !16
  %vecext.2 = extractelement <4 x i32> %sums.sroa.0.1, i64 2
  %32 = shl nuw nsw i64 %6, 4
  %33 = or disjoint i64 %32, 32
  %add69.2 = or disjoint i64 %28, %33
  %add71.2 = or disjoint i64 %add69.2, %conv70
  %arrayidx72.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2
  store i32 %vecext.2, ptr addrspace(1) %arrayidx72.2, align 4, !tbaa !16
  %vecext.3 = extractelement <4 x i32> %sums.sroa.0.1, i64 3
  %34 = shl nuw nsw i64 %6, 4
  %35 = or disjoint i64 %34, 48
  %add69.3 = or disjoint i64 %28, %35
  %add71.3 = or disjoint i64 %add69.3, %conv70
  %arrayidx72.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3
  store i32 %vecext.3, ptr addrspace(1) %arrayidx72.3, align 4, !tbaa !16
  %mul56.1 = or disjoint i64 %28, 256
  %vecext.1118 = extractelement <4 x i32> %sums.sroa.6.1, i64 0
  %add69.1119 = or disjoint i64 %mul56.1, %29
  %add71.1120 = or disjoint i64 %add69.1119, %conv70
  %arrayidx72.1121 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1120
  store i32 %vecext.1118, ptr addrspace(1) %arrayidx72.1121, align 4, !tbaa !16
  %vecext.1.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 1
  %add69.1.1 = or disjoint i64 %mul56.1, %31
  %add71.1.1 = or disjoint i64 %add69.1.1, %conv70
  %arrayidx72.1.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.1
  store i32 %vecext.1.1, ptr addrspace(1) %arrayidx72.1.1, align 4, !tbaa !16
  %vecext.2.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 2
  %add69.2.1 = or disjoint i64 %mul56.1, %33
  %add71.2.1 = or disjoint i64 %add69.2.1, %conv70
  %arrayidx72.2.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.1
  store i32 %vecext.2.1, ptr addrspace(1) %arrayidx72.2.1, align 4, !tbaa !16
  %vecext.3.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 3
  %add69.3.1 = or disjoint i64 %mul56.1, %35
  %add71.3.1 = or disjoint i64 %add69.3.1, %conv70
  %arrayidx72.3.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.1
  store i32 %vecext.3.1, ptr addrspace(1) %arrayidx72.3.1, align 4, !tbaa !16
  %mul56.2 = or disjoint i64 %28, 512
  %vecext.2122 = extractelement <4 x i32> %sums.sroa.10.1, i64 0
  %add69.2123 = or disjoint i64 %mul56.2, %29
  %add71.2124 = or disjoint i64 %add69.2123, %conv70
  %arrayidx72.2125 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2124
  store i32 %vecext.2122, ptr addrspace(1) %arrayidx72.2125, align 4, !tbaa !16
  %vecext.1.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 1
  %add69.1.2 = or disjoint i64 %mul56.2, %31
  %add71.1.2 = or disjoint i64 %add69.1.2, %conv70
  %arrayidx72.1.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.2
  store i32 %vecext.1.2, ptr addrspace(1) %arrayidx72.1.2, align 4, !tbaa !16
  %vecext.2.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 2
  %add69.2.2 = or disjoint i64 %mul56.2, %33
  %add71.2.2 = or disjoint i64 %add69.2.2, %conv70
  %arrayidx72.2.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.2
  store i32 %vecext.2.2, ptr addrspace(1) %arrayidx72.2.2, align 4, !tbaa !16
  %vecext.3.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 3
  %add69.3.2 = or disjoint i64 %mul56.2, %35
  %add71.3.2 = or disjoint i64 %add69.3.2, %conv70
  %arrayidx72.3.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.2
  store i32 %vecext.3.2, ptr addrspace(1) %arrayidx72.3.2, align 4, !tbaa !16
  %mul56.3 = or disjoint i64 %28, 768
  %vecext.3126 = extractelement <4 x i32> %sums.sroa.14.1, i64 0
  %add69.3127 = or disjoint i64 %mul56.3, %29
  %add71.3128 = or disjoint i64 %add69.3127, %conv70
  %arrayidx72.3129 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3128
  store i32 %vecext.3126, ptr addrspace(1) %arrayidx72.3129, align 4, !tbaa !16
  %vecext.1.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 1
  %add69.1.3 = or disjoint i64 %mul56.3, %31
  %add71.1.3 = or disjoint i64 %add69.1.3, %conv70
  %arrayidx72.1.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.3
  store i32 %vecext.1.3, ptr addrspace(1) %arrayidx72.1.3, align 4, !tbaa !16
  %vecext.2.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 2
  %add69.2.3 = or disjoint i64 %mul56.3, %33
  %add71.2.3 = or disjoint i64 %add69.2.3, %conv70
  %arrayidx72.2.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.3
  store i32 %vecext.2.3, ptr addrspace(1) %arrayidx72.2.3, align 4, !tbaa !16
  %vecext.3.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 3
  %add69.3.3 = or disjoint i64 %mul56.3, %35
  %add71.3.3 = or disjoint i64 %add69.3.3, %conv70
  %arrayidx72.3.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.3
  store i32 %vecext.3.3, ptr addrspace(1) %arrayidx72.3.3, align 4, !tbaa !16
  ret void
}

; Function Attrs: convergent mustprogress nofree norecurse nounwind memory(argmem: readwrite)
define protected metaxgpu_kernel void @_Z13mmaPeakKernelILi8EEvPKaS1_Pii(ptr addrspace(1) noalias nocapture noundef readonly %a.coerce, ptr addrspace(1) noalias nocapture noundef readonly %b.coerce, ptr addrspace(1) noalias nocapture noundef writeonly %c.coerce, i32 noundef %iterations) local_unnamed_addr #3 comdat {
entry:
  %0 = tail call noundef range(i32 0, 1024) i32 @llvm.mxc.thread.id.x(), !range !25
  %1 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.mxc.dispatch.ptr()
  %2 = getelementptr inbounds i8, ptr addrspace(4) %1, i64 4
  %3 = load i16, ptr addrspace(4) %2, align 4, !range !26, !invariant.load !14
  %rem11 = and i32 %0, 15
  %4 = lshr i32 %0, 2
  %mul13 = and i32 %4, 12
  %mul15 = shl nuw nsw i32 %rem11, 4
  %5 = zext nneg i32 %mul15 to i64
  %6 = zext nneg i32 %mul13 to i64
  %7 = or disjoint i64 %5, %6
  %add.ptr = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %7
  %8 = load i32, ptr addrspace(1) %add.ptr, align 1
  %add.ptr21 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %7
  %9 = load i32, ptr addrspace(1) %add.ptr21, align 1
  %10 = or disjoint i64 %5, %6
  %11 = or disjoint i64 %10, 256
  %add.ptr.1 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %11
  %12 = load i32, ptr addrspace(1) %add.ptr.1, align 1
  %add.ptr21.1 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %11
  %13 = load i32, ptr addrspace(1) %add.ptr21.1, align 1
  %14 = or disjoint i64 %5, %6
  %15 = or disjoint i64 %14, 512
  %add.ptr.2 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %15
  %16 = load i32, ptr addrspace(1) %add.ptr.2, align 1
  %add.ptr21.2 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %15
  %17 = load i32, ptr addrspace(1) %add.ptr21.2, align 1
  %18 = or disjoint i64 %5, %6
  %19 = or disjoint i64 %18, 768
  %add.ptr.3 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %19
  %20 = load i32, ptr addrspace(1) %add.ptr.3, align 1
  %add.ptr21.3 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %19
  %21 = load i32, ptr addrspace(1) %add.ptr21.3, align 1
  %22 = or disjoint i64 %5, %6
  %23 = or disjoint i64 %22, 1024
  %add.ptr.4 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %23
  %24 = load i32, ptr addrspace(1) %add.ptr.4, align 1
  %add.ptr21.4 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %23
  %25 = load i32, ptr addrspace(1) %add.ptr21.4, align 1
  %26 = or disjoint i64 %5, %6
  %27 = or disjoint i64 %26, 1280
  %add.ptr.5 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %27
  %28 = load i32, ptr addrspace(1) %add.ptr.5, align 1
  %add.ptr21.5 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %27
  %29 = load i32, ptr addrspace(1) %add.ptr21.5, align 1
  %30 = or disjoint i64 %5, %6
  %31 = or disjoint i64 %30, 1536
  %add.ptr.6 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %31
  %32 = load i32, ptr addrspace(1) %add.ptr.6, align 1
  %add.ptr21.6 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %31
  %33 = load i32, ptr addrspace(1) %add.ptr21.6, align 1
  %34 = or disjoint i64 %5, %6
  %35 = or disjoint i64 %34, 1792
  %add.ptr.7 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %35
  %36 = load i32, ptr addrspace(1) %add.ptr.7, align 1
  %add.ptr21.7 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %35
  %37 = load i32, ptr addrspace(1) %add.ptr21.7, align 1
  %cmp25104 = icmp sgt i32 %iterations, 0
  br i1 %cmp25104, label %for.cond30.preheader, label %for.cond49.preheader

for.cond30.preheader:                             ; preds = %entry, %for.cond30.preheader
  %sums.sroa.30.0 = phi <4 x i32> [ %45, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.26.0 = phi <4 x i32> [ %44, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.22.0 = phi <4 x i32> [ %43, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.18.0 = phi <4 x i32> [ %42, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.14.0 = phi <4 x i32> [ %41, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.10.0 = phi <4 x i32> [ %40, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.6.0 = phi <4 x i32> [ %39, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.0.0 = phi <4 x i32> [ %38, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %iteration.0105 = phi i32 [ %inc46, %for.cond30.preheader ], [ 0, %entry ]
  %38 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %8, i32 %9, <4 x i32> %sums.sroa.0.0), !call_argsrelate !27
  %39 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %12, i32 %13, <4 x i32> %sums.sroa.6.0), !call_argsrelate !27
  %40 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %16, i32 %17, <4 x i32> %sums.sroa.10.0), !call_argsrelate !27
  %41 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %20, i32 %21, <4 x i32> %sums.sroa.14.0), !call_argsrelate !27
  %42 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %24, i32 %25, <4 x i32> %sums.sroa.18.0), !call_argsrelate !27
  %43 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %28, i32 %29, <4 x i32> %sums.sroa.22.0), !call_argsrelate !27
  %44 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %32, i32 %33, <4 x i32> %sums.sroa.26.0), !call_argsrelate !27
  %45 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %36, i32 %37, <4 x i32> %sums.sroa.30.0), !call_argsrelate !27
  %inc46 = add nuw nsw i32 %iteration.0105, 1
  %exitcond.not = icmp eq i32 %inc46, %iterations
  br i1 %exitcond.not, label %for.cond49.preheader, label %for.cond30.preheader, !llvm.loop !32

for.cond49.preheader:                             ; preds = %for.cond30.preheader, %entry
  %sums.sroa.30.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %45, %for.cond30.preheader ]
  %sums.sroa.26.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %44, %for.cond30.preheader ]
  %sums.sroa.22.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %43, %for.cond30.preheader ]
  %sums.sroa.18.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %42, %for.cond30.preheader ]
  %sums.sroa.14.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %41, %for.cond30.preheader ]
  %sums.sroa.10.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %40, %for.cond30.preheader ]
  %sums.sroa.6.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %39, %for.cond30.preheader ]
  %sums.sroa.0.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %38, %for.cond30.preheader ]
  %46 = lshr i16 %3, 6
  %conv7 = zext nneg i16 %46 to i64
  %47 = tail call noundef range(i32 0, 2147483647) i32 @llvm.mxc.block.id.x(), !range !15
  %conv = zext nneg i32 %47 to i64
  %mul = mul nuw nsw i64 %conv7, %conv
  %div9100 = lshr i32 %0, 6
  %conv10 = zext nneg i32 %div9100 to i64
  %add = add nuw nsw i64 %mul, %conv10
  %48 = shl nuw nsw i64 %add, 11
  %conv70 = zext nneg i32 %rem11 to i64
  %vecext = extractelement <4 x i32> %sums.sroa.0.1, i64 0
  %49 = shl nuw nsw i64 %6, 4
  %add69 = or disjoint i64 %48, %49
  %add71 = or disjoint i64 %add69, %conv70
  %arrayidx72 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71
  store i32 %vecext, ptr addrspace(1) %arrayidx72, align 4, !tbaa !16
  %vecext.1 = extractelement <4 x i32> %sums.sroa.0.1, i64 1
  %50 = shl nuw nsw i64 %6, 4
  %51 = or disjoint i64 %50, 16
  %add69.1 = or disjoint i64 %48, %51
  %add71.1 = or disjoint i64 %add69.1, %conv70
  %arrayidx72.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1
  store i32 %vecext.1, ptr addrspace(1) %arrayidx72.1, align 4, !tbaa !16
  %vecext.2 = extractelement <4 x i32> %sums.sroa.0.1, i64 2
  %52 = shl nuw nsw i64 %6, 4
  %53 = or disjoint i64 %52, 32
  %add69.2 = or disjoint i64 %48, %53
  %add71.2 = or disjoint i64 %add69.2, %conv70
  %arrayidx72.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2
  store i32 %vecext.2, ptr addrspace(1) %arrayidx72.2, align 4, !tbaa !16
  %vecext.3 = extractelement <4 x i32> %sums.sroa.0.1, i64 3
  %54 = shl nuw nsw i64 %6, 4
  %55 = or disjoint i64 %54, 48
  %add69.3 = or disjoint i64 %48, %55
  %add71.3 = or disjoint i64 %add69.3, %conv70
  %arrayidx72.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3
  store i32 %vecext.3, ptr addrspace(1) %arrayidx72.3, align 4, !tbaa !16
  %mul56.1 = or disjoint i64 %48, 256
  %vecext.1118 = extractelement <4 x i32> %sums.sroa.6.1, i64 0
  %add69.1119 = or disjoint i64 %mul56.1, %49
  %add71.1120 = or disjoint i64 %add69.1119, %conv70
  %arrayidx72.1121 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1120
  store i32 %vecext.1118, ptr addrspace(1) %arrayidx72.1121, align 4, !tbaa !16
  %vecext.1.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 1
  %add69.1.1 = or disjoint i64 %mul56.1, %51
  %add71.1.1 = or disjoint i64 %add69.1.1, %conv70
  %arrayidx72.1.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.1
  store i32 %vecext.1.1, ptr addrspace(1) %arrayidx72.1.1, align 4, !tbaa !16
  %vecext.2.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 2
  %add69.2.1 = or disjoint i64 %mul56.1, %53
  %add71.2.1 = or disjoint i64 %add69.2.1, %conv70
  %arrayidx72.2.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.1
  store i32 %vecext.2.1, ptr addrspace(1) %arrayidx72.2.1, align 4, !tbaa !16
  %vecext.3.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 3
  %add69.3.1 = or disjoint i64 %mul56.1, %55
  %add71.3.1 = or disjoint i64 %add69.3.1, %conv70
  %arrayidx72.3.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.1
  store i32 %vecext.3.1, ptr addrspace(1) %arrayidx72.3.1, align 4, !tbaa !16
  %mul56.2 = or disjoint i64 %48, 512
  %vecext.2122 = extractelement <4 x i32> %sums.sroa.10.1, i64 0
  %add69.2123 = or disjoint i64 %mul56.2, %49
  %add71.2124 = or disjoint i64 %add69.2123, %conv70
  %arrayidx72.2125 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2124
  store i32 %vecext.2122, ptr addrspace(1) %arrayidx72.2125, align 4, !tbaa !16
  %vecext.1.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 1
  %add69.1.2 = or disjoint i64 %mul56.2, %51
  %add71.1.2 = or disjoint i64 %add69.1.2, %conv70
  %arrayidx72.1.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.2
  store i32 %vecext.1.2, ptr addrspace(1) %arrayidx72.1.2, align 4, !tbaa !16
  %vecext.2.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 2
  %add69.2.2 = or disjoint i64 %mul56.2, %53
  %add71.2.2 = or disjoint i64 %add69.2.2, %conv70
  %arrayidx72.2.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.2
  store i32 %vecext.2.2, ptr addrspace(1) %arrayidx72.2.2, align 4, !tbaa !16
  %vecext.3.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 3
  %add69.3.2 = or disjoint i64 %mul56.2, %55
  %add71.3.2 = or disjoint i64 %add69.3.2, %conv70
  %arrayidx72.3.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.2
  store i32 %vecext.3.2, ptr addrspace(1) %arrayidx72.3.2, align 4, !tbaa !16
  %mul56.3 = or disjoint i64 %48, 768
  %vecext.3126 = extractelement <4 x i32> %sums.sroa.14.1, i64 0
  %add69.3127 = or disjoint i64 %mul56.3, %49
  %add71.3128 = or disjoint i64 %add69.3127, %conv70
  %arrayidx72.3129 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3128
  store i32 %vecext.3126, ptr addrspace(1) %arrayidx72.3129, align 4, !tbaa !16
  %vecext.1.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 1
  %add69.1.3 = or disjoint i64 %mul56.3, %51
  %add71.1.3 = or disjoint i64 %add69.1.3, %conv70
  %arrayidx72.1.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.3
  store i32 %vecext.1.3, ptr addrspace(1) %arrayidx72.1.3, align 4, !tbaa !16
  %vecext.2.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 2
  %add69.2.3 = or disjoint i64 %mul56.3, %53
  %add71.2.3 = or disjoint i64 %add69.2.3, %conv70
  %arrayidx72.2.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.3
  store i32 %vecext.2.3, ptr addrspace(1) %arrayidx72.2.3, align 4, !tbaa !16
  %vecext.3.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 3
  %add69.3.3 = or disjoint i64 %mul56.3, %55
  %add71.3.3 = or disjoint i64 %add69.3.3, %conv70
  %arrayidx72.3.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.3
  store i32 %vecext.3.3, ptr addrspace(1) %arrayidx72.3.3, align 4, !tbaa !16
  %mul56.4 = or disjoint i64 %48, 1024
  %vecext.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 0
  %add69.4 = or disjoint i64 %mul56.4, %49
  %add71.4 = or disjoint i64 %add69.4, %conv70
  %arrayidx72.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.4
  store i32 %vecext.4, ptr addrspace(1) %arrayidx72.4, align 4, !tbaa !16
  %vecext.1.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 1
  %add69.1.4 = or disjoint i64 %mul56.4, %51
  %add71.1.4 = or disjoint i64 %add69.1.4, %conv70
  %arrayidx72.1.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.4
  store i32 %vecext.1.4, ptr addrspace(1) %arrayidx72.1.4, align 4, !tbaa !16
  %vecext.2.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 2
  %add69.2.4 = or disjoint i64 %mul56.4, %53
  %add71.2.4 = or disjoint i64 %add69.2.4, %conv70
  %arrayidx72.2.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.4
  store i32 %vecext.2.4, ptr addrspace(1) %arrayidx72.2.4, align 4, !tbaa !16
  %vecext.3.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 3
  %add69.3.4 = or disjoint i64 %mul56.4, %55
  %add71.3.4 = or disjoint i64 %add69.3.4, %conv70
  %arrayidx72.3.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.4
  store i32 %vecext.3.4, ptr addrspace(1) %arrayidx72.3.4, align 4, !tbaa !16
  %mul56.5 = or disjoint i64 %48, 1280
  %vecext.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 0
  %add69.5 = or disjoint i64 %mul56.5, %49
  %add71.5 = or disjoint i64 %add69.5, %conv70
  %arrayidx72.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.5
  store i32 %vecext.5, ptr addrspace(1) %arrayidx72.5, align 4, !tbaa !16
  %vecext.1.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 1
  %add69.1.5 = or disjoint i64 %mul56.5, %51
  %add71.1.5 = or disjoint i64 %add69.1.5, %conv70
  %arrayidx72.1.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.5
  store i32 %vecext.1.5, ptr addrspace(1) %arrayidx72.1.5, align 4, !tbaa !16
  %vecext.2.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 2
  %add69.2.5 = or disjoint i64 %mul56.5, %53
  %add71.2.5 = or disjoint i64 %add69.2.5, %conv70
  %arrayidx72.2.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.5
  store i32 %vecext.2.5, ptr addrspace(1) %arrayidx72.2.5, align 4, !tbaa !16
  %vecext.3.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 3
  %add69.3.5 = or disjoint i64 %mul56.5, %55
  %add71.3.5 = or disjoint i64 %add69.3.5, %conv70
  %arrayidx72.3.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.5
  store i32 %vecext.3.5, ptr addrspace(1) %arrayidx72.3.5, align 4, !tbaa !16
  %mul56.6 = or disjoint i64 %48, 1536
  %vecext.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 0
  %add69.6 = or disjoint i64 %mul56.6, %49
  %add71.6 = or disjoint i64 %add69.6, %conv70
  %arrayidx72.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.6
  store i32 %vecext.6, ptr addrspace(1) %arrayidx72.6, align 4, !tbaa !16
  %vecext.1.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 1
  %add69.1.6 = or disjoint i64 %mul56.6, %51
  %add71.1.6 = or disjoint i64 %add69.1.6, %conv70
  %arrayidx72.1.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.6
  store i32 %vecext.1.6, ptr addrspace(1) %arrayidx72.1.6, align 4, !tbaa !16
  %vecext.2.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 2
  %add69.2.6 = or disjoint i64 %mul56.6, %53
  %add71.2.6 = or disjoint i64 %add69.2.6, %conv70
  %arrayidx72.2.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.6
  store i32 %vecext.2.6, ptr addrspace(1) %arrayidx72.2.6, align 4, !tbaa !16
  %vecext.3.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 3
  %add69.3.6 = or disjoint i64 %mul56.6, %55
  %add71.3.6 = or disjoint i64 %add69.3.6, %conv70
  %arrayidx72.3.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.6
  store i32 %vecext.3.6, ptr addrspace(1) %arrayidx72.3.6, align 4, !tbaa !16
  %mul56.7 = or disjoint i64 %48, 1792
  %vecext.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 0
  %add69.7 = or disjoint i64 %mul56.7, %49
  %add71.7 = or disjoint i64 %add69.7, %conv70
  %arrayidx72.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.7
  store i32 %vecext.7, ptr addrspace(1) %arrayidx72.7, align 4, !tbaa !16
  %vecext.1.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 1
  %add69.1.7 = or disjoint i64 %mul56.7, %51
  %add71.1.7 = or disjoint i64 %add69.1.7, %conv70
  %arrayidx72.1.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.7
  store i32 %vecext.1.7, ptr addrspace(1) %arrayidx72.1.7, align 4, !tbaa !16
  %vecext.2.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 2
  %add69.2.7 = or disjoint i64 %mul56.7, %53
  %add71.2.7 = or disjoint i64 %add69.2.7, %conv70
  %arrayidx72.2.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.7
  store i32 %vecext.2.7, ptr addrspace(1) %arrayidx72.2.7, align 4, !tbaa !16
  %vecext.3.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 3
  %add69.3.7 = or disjoint i64 %mul56.7, %55
  %add71.3.7 = or disjoint i64 %add69.3.7, %conv70
  %arrayidx72.3.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.7
  store i32 %vecext.3.7, ptr addrspace(1) %arrayidx72.3.7, align 4, !tbaa !16
  ret void
}

; Function Attrs: convergent mustprogress nofree norecurse nounwind memory(argmem: readwrite)
define protected metaxgpu_kernel void @_Z13mmaPeakKernelILi16EEvPKaS1_Pii(ptr addrspace(1) noalias nocapture noundef readonly %a.coerce, ptr addrspace(1) noalias nocapture noundef readonly %b.coerce, ptr addrspace(1) noalias noundef writeonly %c.coerce, i32 noundef %iterations) local_unnamed_addr #3 comdat {
entry:
  %0 = tail call noundef range(i32 0, 1024) i32 @llvm.mxc.thread.id.x(), !range !25
  %1 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.mxc.dispatch.ptr()
  %2 = getelementptr inbounds i8, ptr addrspace(4) %1, i64 4
  %3 = load i16, ptr addrspace(4) %2, align 4, !range !26, !invariant.load !14
  %rem11 = and i32 %0, 15
  %4 = lshr i32 %0, 2
  %mul13 = and i32 %4, 12
  %mul15 = shl nuw nsw i32 %rem11, 4
  %5 = zext nneg i32 %mul15 to i64
  %6 = zext nneg i32 %mul13 to i64
  %7 = or disjoint i64 %5, %6
  %add.ptr = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %7
  %8 = load i32, ptr addrspace(1) %add.ptr, align 1
  %add.ptr21 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %7
  %9 = load i32, ptr addrspace(1) %add.ptr21, align 1
  %10 = or disjoint i64 %5, %6
  %11 = or disjoint i64 %10, 256
  %add.ptr.1 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %11
  %12 = load i32, ptr addrspace(1) %add.ptr.1, align 1
  %add.ptr21.1 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %11
  %13 = load i32, ptr addrspace(1) %add.ptr21.1, align 1
  %14 = or disjoint i64 %5, %6
  %15 = or disjoint i64 %14, 512
  %add.ptr.2 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %15
  %16 = load i32, ptr addrspace(1) %add.ptr.2, align 1
  %add.ptr21.2 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %15
  %17 = load i32, ptr addrspace(1) %add.ptr21.2, align 1
  %18 = or disjoint i64 %5, %6
  %19 = or disjoint i64 %18, 768
  %add.ptr.3 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %19
  %20 = load i32, ptr addrspace(1) %add.ptr.3, align 1
  %add.ptr21.3 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %19
  %21 = load i32, ptr addrspace(1) %add.ptr21.3, align 1
  %22 = or disjoint i64 %5, %6
  %23 = or disjoint i64 %22, 1024
  %add.ptr.4 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %23
  %24 = load i32, ptr addrspace(1) %add.ptr.4, align 1
  %add.ptr21.4 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %23
  %25 = load i32, ptr addrspace(1) %add.ptr21.4, align 1
  %26 = or disjoint i64 %5, %6
  %27 = or disjoint i64 %26, 1280
  %add.ptr.5 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %27
  %28 = load i32, ptr addrspace(1) %add.ptr.5, align 1
  %add.ptr21.5 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %27
  %29 = load i32, ptr addrspace(1) %add.ptr21.5, align 1
  %30 = or disjoint i64 %5, %6
  %31 = or disjoint i64 %30, 1536
  %add.ptr.6 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %31
  %32 = load i32, ptr addrspace(1) %add.ptr.6, align 1
  %add.ptr21.6 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %31
  %33 = load i32, ptr addrspace(1) %add.ptr21.6, align 1
  %34 = or disjoint i64 %5, %6
  %35 = or disjoint i64 %34, 1792
  %add.ptr.7 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %35
  %36 = load i32, ptr addrspace(1) %add.ptr.7, align 1
  %add.ptr21.7 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %35
  %37 = load i32, ptr addrspace(1) %add.ptr21.7, align 1
  %38 = or disjoint i64 %5, %6
  %39 = or disjoint i64 %38, 2048
  %add.ptr.8 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %39
  %40 = load i32, ptr addrspace(1) %add.ptr.8, align 1
  %add.ptr21.8 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %39
  %41 = load i32, ptr addrspace(1) %add.ptr21.8, align 1
  %42 = or disjoint i64 %5, %6
  %43 = or disjoint i64 %42, 2304
  %add.ptr.9 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %43
  %44 = load i32, ptr addrspace(1) %add.ptr.9, align 1
  %add.ptr21.9 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %43
  %45 = load i32, ptr addrspace(1) %add.ptr21.9, align 1
  %46 = or disjoint i64 %5, %6
  %47 = or disjoint i64 %46, 2560
  %add.ptr.10 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %47
  %48 = load i32, ptr addrspace(1) %add.ptr.10, align 1
  %add.ptr21.10 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %47
  %49 = load i32, ptr addrspace(1) %add.ptr21.10, align 1
  %50 = or disjoint i64 %5, %6
  %51 = or disjoint i64 %50, 2816
  %add.ptr.11 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %51
  %52 = load i32, ptr addrspace(1) %add.ptr.11, align 1
  %add.ptr21.11 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %51
  %53 = load i32, ptr addrspace(1) %add.ptr21.11, align 1
  %54 = or disjoint i64 %5, %6
  %55 = or disjoint i64 %54, 3072
  %add.ptr.12 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %55
  %56 = load i32, ptr addrspace(1) %add.ptr.12, align 1
  %add.ptr21.12 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %55
  %57 = load i32, ptr addrspace(1) %add.ptr21.12, align 1
  %58 = or disjoint i64 %5, %6
  %59 = or disjoint i64 %58, 3328
  %add.ptr.13 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %59
  %60 = load i32, ptr addrspace(1) %add.ptr.13, align 1
  %add.ptr21.13 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %59
  %61 = load i32, ptr addrspace(1) %add.ptr21.13, align 1
  %62 = or disjoint i64 %5, %6
  %63 = or disjoint i64 %62, 3584
  %add.ptr.14 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %63
  %64 = load i32, ptr addrspace(1) %add.ptr.14, align 1
  %add.ptr21.14 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %63
  %65 = load i32, ptr addrspace(1) %add.ptr21.14, align 1
  %66 = or disjoint i64 %5, %6
  %67 = or disjoint i64 %66, 3840
  %add.ptr.15 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %67
  %68 = load i32, ptr addrspace(1) %add.ptr.15, align 1
  %add.ptr21.15 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %67
  %69 = load i32, ptr addrspace(1) %add.ptr21.15, align 1
  %cmp25104 = icmp sgt i32 %iterations, 0
  br i1 %cmp25104, label %for.cond30.preheader, label %for.cond49.preheader

for.cond30.preheader:                             ; preds = %entry, %for.cond30.preheader
  %sums.sroa.62.0 = phi <4 x i32> [ %85, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.58.0 = phi <4 x i32> [ %84, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.54.0 = phi <4 x i32> [ %83, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.50.0 = phi <4 x i32> [ %82, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.46.0 = phi <4 x i32> [ %81, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.42.0 = phi <4 x i32> [ %80, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.38.0 = phi <4 x i32> [ %79, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.34.0 = phi <4 x i32> [ %78, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.30.0 = phi <4 x i32> [ %77, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.26.0 = phi <4 x i32> [ %76, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.22.0 = phi <4 x i32> [ %75, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.18.0 = phi <4 x i32> [ %74, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.14.0 = phi <4 x i32> [ %73, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.10.0 = phi <4 x i32> [ %72, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.6.0 = phi <4 x i32> [ %71, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.0.0 = phi <4 x i32> [ %70, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %iteration.0105 = phi i32 [ %inc46, %for.cond30.preheader ], [ 0, %entry ]
  %70 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %8, i32 %9, <4 x i32> %sums.sroa.0.0), !call_argsrelate !27
  %71 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %12, i32 %13, <4 x i32> %sums.sroa.6.0), !call_argsrelate !27
  %72 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %16, i32 %17, <4 x i32> %sums.sroa.10.0), !call_argsrelate !27
  %73 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %20, i32 %21, <4 x i32> %sums.sroa.14.0), !call_argsrelate !27
  %74 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %24, i32 %25, <4 x i32> %sums.sroa.18.0), !call_argsrelate !27
  %75 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %28, i32 %29, <4 x i32> %sums.sroa.22.0), !call_argsrelate !27
  %76 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %32, i32 %33, <4 x i32> %sums.sroa.26.0), !call_argsrelate !27
  %77 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %36, i32 %37, <4 x i32> %sums.sroa.30.0), !call_argsrelate !27
  %78 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %40, i32 %41, <4 x i32> %sums.sroa.34.0), !call_argsrelate !27
  %79 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %44, i32 %45, <4 x i32> %sums.sroa.38.0), !call_argsrelate !27
  %80 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %48, i32 %49, <4 x i32> %sums.sroa.42.0), !call_argsrelate !27
  %81 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %52, i32 %53, <4 x i32> %sums.sroa.46.0), !call_argsrelate !27
  %82 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %56, i32 %57, <4 x i32> %sums.sroa.50.0), !call_argsrelate !27
  %83 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %60, i32 %61, <4 x i32> %sums.sroa.54.0), !call_argsrelate !27
  %84 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %64, i32 %65, <4 x i32> %sums.sroa.58.0), !call_argsrelate !27
  %85 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %68, i32 %69, <4 x i32> %sums.sroa.62.0), !call_argsrelate !27
  %inc46 = add nuw nsw i32 %iteration.0105, 1
  %exitcond.not = icmp eq i32 %inc46, %iterations
  br i1 %exitcond.not, label %for.cond49.preheader, label %for.cond30.preheader, !llvm.loop !33

for.cond49.preheader:                             ; preds = %for.cond30.preheader, %entry
  %sums.sroa.62.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %85, %for.cond30.preheader ]
  %sums.sroa.58.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %84, %for.cond30.preheader ]
  %sums.sroa.54.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %83, %for.cond30.preheader ]
  %sums.sroa.50.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %82, %for.cond30.preheader ]
  %sums.sroa.46.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %81, %for.cond30.preheader ]
  %sums.sroa.42.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %80, %for.cond30.preheader ]
  %sums.sroa.38.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %79, %for.cond30.preheader ]
  %sums.sroa.34.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %78, %for.cond30.preheader ]
  %sums.sroa.30.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %77, %for.cond30.preheader ]
  %sums.sroa.26.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %76, %for.cond30.preheader ]
  %sums.sroa.22.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %75, %for.cond30.preheader ]
  %sums.sroa.18.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %74, %for.cond30.preheader ]
  %sums.sroa.14.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %73, %for.cond30.preheader ]
  %sums.sroa.10.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %72, %for.cond30.preheader ]
  %sums.sroa.6.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %71, %for.cond30.preheader ]
  %sums.sroa.0.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %70, %for.cond30.preheader ]
  %86 = lshr i16 %3, 6
  %conv7 = zext nneg i16 %86 to i64
  %87 = tail call noundef range(i32 0, 2147483647) i32 @llvm.mxc.block.id.x(), !range !15
  %conv = zext nneg i32 %87 to i64
  %mul = mul nuw nsw i64 %conv7, %conv
  %div9100 = lshr i32 %0, 6
  %conv10 = zext nneg i32 %div9100 to i64
  %add = add nuw nsw i64 %mul, %conv10
  %88 = shl nuw nsw i64 %add, 12
  %conv70 = zext nneg i32 %rem11 to i64
  %vecext = extractelement <4 x i32> %sums.sroa.0.1, i64 0
  %89 = shl nuw nsw i64 %6, 4
  %add69 = or disjoint i64 %88, %89
  %add71 = or disjoint i64 %add69, %conv70
  %arrayidx72 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71
  store i32 %vecext, ptr addrspace(1) %arrayidx72, align 4, !tbaa !16
  %vecext.1 = extractelement <4 x i32> %sums.sroa.0.1, i64 1
  %90 = shl nuw nsw i64 %6, 4
  %91 = or disjoint i64 %90, 16
  %add69.1 = or disjoint i64 %88, %91
  %add71.1 = or disjoint i64 %add69.1, %conv70
  %arrayidx72.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1
  store i32 %vecext.1, ptr addrspace(1) %arrayidx72.1, align 4, !tbaa !16
  %vecext.2 = extractelement <4 x i32> %sums.sroa.0.1, i64 2
  %92 = shl nuw nsw i64 %6, 4
  %93 = or disjoint i64 %92, 32
  %add69.2 = or disjoint i64 %88, %93
  %add71.2 = or disjoint i64 %add69.2, %conv70
  %arrayidx72.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2
  store i32 %vecext.2, ptr addrspace(1) %arrayidx72.2, align 4, !tbaa !16
  %vecext.3 = extractelement <4 x i32> %sums.sroa.0.1, i64 3
  %94 = shl nuw nsw i64 %6, 4
  %95 = or disjoint i64 %94, 48
  %add69.3 = or disjoint i64 %88, %95
  %add71.3 = or disjoint i64 %add69.3, %conv70
  %arrayidx72.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3
  store i32 %vecext.3, ptr addrspace(1) %arrayidx72.3, align 4, !tbaa !16
  %mul56.1 = or disjoint i64 %88, 256
  %vecext.1118 = extractelement <4 x i32> %sums.sroa.6.1, i64 0
  %add69.1119 = or disjoint i64 %mul56.1, %89
  %add71.1120 = or disjoint i64 %add69.1119, %conv70
  %arrayidx72.1121 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1120
  store i32 %vecext.1118, ptr addrspace(1) %arrayidx72.1121, align 4, !tbaa !16
  %vecext.1.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 1
  %add69.1.1 = or disjoint i64 %mul56.1, %91
  %add71.1.1 = or disjoint i64 %add69.1.1, %conv70
  %arrayidx72.1.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.1
  store i32 %vecext.1.1, ptr addrspace(1) %arrayidx72.1.1, align 4, !tbaa !16
  %vecext.2.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 2
  %add69.2.1 = or disjoint i64 %mul56.1, %93
  %add71.2.1 = or disjoint i64 %add69.2.1, %conv70
  %arrayidx72.2.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.1
  store i32 %vecext.2.1, ptr addrspace(1) %arrayidx72.2.1, align 4, !tbaa !16
  %vecext.3.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 3
  %add69.3.1 = or disjoint i64 %mul56.1, %95
  %add71.3.1 = or disjoint i64 %add69.3.1, %conv70
  %arrayidx72.3.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.1
  store i32 %vecext.3.1, ptr addrspace(1) %arrayidx72.3.1, align 4, !tbaa !16
  %mul56.2 = or disjoint i64 %88, 512
  %vecext.2122 = extractelement <4 x i32> %sums.sroa.10.1, i64 0
  %add69.2123 = or disjoint i64 %mul56.2, %89
  %add71.2124 = or disjoint i64 %add69.2123, %conv70
  %arrayidx72.2125 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2124
  store i32 %vecext.2122, ptr addrspace(1) %arrayidx72.2125, align 4, !tbaa !16
  %vecext.1.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 1
  %add69.1.2 = or disjoint i64 %mul56.2, %91
  %add71.1.2 = or disjoint i64 %add69.1.2, %conv70
  %arrayidx72.1.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.2
  store i32 %vecext.1.2, ptr addrspace(1) %arrayidx72.1.2, align 4, !tbaa !16
  %vecext.2.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 2
  %add69.2.2 = or disjoint i64 %mul56.2, %93
  %add71.2.2 = or disjoint i64 %add69.2.2, %conv70
  %arrayidx72.2.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.2
  store i32 %vecext.2.2, ptr addrspace(1) %arrayidx72.2.2, align 4, !tbaa !16
  %vecext.3.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 3
  %add69.3.2 = or disjoint i64 %mul56.2, %95
  %add71.3.2 = or disjoint i64 %add69.3.2, %conv70
  %arrayidx72.3.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.2
  store i32 %vecext.3.2, ptr addrspace(1) %arrayidx72.3.2, align 4, !tbaa !16
  %mul56.3 = or disjoint i64 %88, 768
  %vecext.3126 = extractelement <4 x i32> %sums.sroa.14.1, i64 0
  %add69.3127 = or disjoint i64 %mul56.3, %89
  %add71.3128 = or disjoint i64 %add69.3127, %conv70
  %arrayidx72.3129 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3128
  store i32 %vecext.3126, ptr addrspace(1) %arrayidx72.3129, align 4, !tbaa !16
  %vecext.1.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 1
  %add69.1.3 = or disjoint i64 %mul56.3, %91
  %add71.1.3 = or disjoint i64 %add69.1.3, %conv70
  %arrayidx72.1.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.3
  store i32 %vecext.1.3, ptr addrspace(1) %arrayidx72.1.3, align 4, !tbaa !16
  %vecext.2.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 2
  %add69.2.3 = or disjoint i64 %mul56.3, %93
  %add71.2.3 = or disjoint i64 %add69.2.3, %conv70
  %arrayidx72.2.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.3
  store i32 %vecext.2.3, ptr addrspace(1) %arrayidx72.2.3, align 4, !tbaa !16
  %vecext.3.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 3
  %add69.3.3 = or disjoint i64 %mul56.3, %95
  %add71.3.3 = or disjoint i64 %add69.3.3, %conv70
  %arrayidx72.3.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.3
  store i32 %vecext.3.3, ptr addrspace(1) %arrayidx72.3.3, align 4, !tbaa !16
  %mul56.4 = or disjoint i64 %88, 1024
  %vecext.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 0
  %add69.4 = or disjoint i64 %mul56.4, %89
  %add71.4 = or disjoint i64 %add69.4, %conv70
  %arrayidx72.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.4
  store i32 %vecext.4, ptr addrspace(1) %arrayidx72.4, align 4, !tbaa !16
  %vecext.1.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 1
  %add69.1.4 = or disjoint i64 %mul56.4, %91
  %add71.1.4 = or disjoint i64 %add69.1.4, %conv70
  %arrayidx72.1.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.4
  store i32 %vecext.1.4, ptr addrspace(1) %arrayidx72.1.4, align 4, !tbaa !16
  %vecext.2.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 2
  %add69.2.4 = or disjoint i64 %mul56.4, %93
  %add71.2.4 = or disjoint i64 %add69.2.4, %conv70
  %arrayidx72.2.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.4
  store i32 %vecext.2.4, ptr addrspace(1) %arrayidx72.2.4, align 4, !tbaa !16
  %vecext.3.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 3
  %add69.3.4 = or disjoint i64 %mul56.4, %95
  %add71.3.4 = or disjoint i64 %add69.3.4, %conv70
  %arrayidx72.3.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.4
  store i32 %vecext.3.4, ptr addrspace(1) %arrayidx72.3.4, align 4, !tbaa !16
  %mul56.5 = or disjoint i64 %88, 1280
  %vecext.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 0
  %add69.5 = or disjoint i64 %mul56.5, %89
  %add71.5 = or disjoint i64 %add69.5, %conv70
  %arrayidx72.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.5
  store i32 %vecext.5, ptr addrspace(1) %arrayidx72.5, align 4, !tbaa !16
  %vecext.1.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 1
  %add69.1.5 = or disjoint i64 %mul56.5, %91
  %add71.1.5 = or disjoint i64 %add69.1.5, %conv70
  %arrayidx72.1.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.5
  store i32 %vecext.1.5, ptr addrspace(1) %arrayidx72.1.5, align 4, !tbaa !16
  %vecext.2.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 2
  %add69.2.5 = or disjoint i64 %mul56.5, %93
  %add71.2.5 = or disjoint i64 %add69.2.5, %conv70
  %arrayidx72.2.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.5
  store i32 %vecext.2.5, ptr addrspace(1) %arrayidx72.2.5, align 4, !tbaa !16
  %vecext.3.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 3
  %add69.3.5 = or disjoint i64 %mul56.5, %95
  %add71.3.5 = or disjoint i64 %add69.3.5, %conv70
  %arrayidx72.3.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.5
  store i32 %vecext.3.5, ptr addrspace(1) %arrayidx72.3.5, align 4, !tbaa !16
  %mul56.6 = or disjoint i64 %88, 1536
  %vecext.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 0
  %add69.6 = or disjoint i64 %mul56.6, %89
  %add71.6 = or disjoint i64 %add69.6, %conv70
  %arrayidx72.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.6
  store i32 %vecext.6, ptr addrspace(1) %arrayidx72.6, align 4, !tbaa !16
  %vecext.1.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 1
  %add69.1.6 = or disjoint i64 %mul56.6, %91
  %add71.1.6 = or disjoint i64 %add69.1.6, %conv70
  %arrayidx72.1.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.6
  store i32 %vecext.1.6, ptr addrspace(1) %arrayidx72.1.6, align 4, !tbaa !16
  %vecext.2.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 2
  %add69.2.6 = or disjoint i64 %mul56.6, %93
  %add71.2.6 = or disjoint i64 %add69.2.6, %conv70
  %arrayidx72.2.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.6
  store i32 %vecext.2.6, ptr addrspace(1) %arrayidx72.2.6, align 4, !tbaa !16
  %vecext.3.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 3
  %add69.3.6 = or disjoint i64 %mul56.6, %95
  %add71.3.6 = or disjoint i64 %add69.3.6, %conv70
  %arrayidx72.3.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.6
  store i32 %vecext.3.6, ptr addrspace(1) %arrayidx72.3.6, align 4, !tbaa !16
  %mul56.7 = or disjoint i64 %88, 1792
  %vecext.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 0
  %add69.7 = or disjoint i64 %mul56.7, %89
  %add71.7 = or disjoint i64 %add69.7, %conv70
  %arrayidx72.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.7
  store i32 %vecext.7, ptr addrspace(1) %arrayidx72.7, align 4, !tbaa !16
  %vecext.1.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 1
  %add69.1.7 = or disjoint i64 %mul56.7, %91
  %add71.1.7 = or disjoint i64 %add69.1.7, %conv70
  %arrayidx72.1.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.7
  store i32 %vecext.1.7, ptr addrspace(1) %arrayidx72.1.7, align 4, !tbaa !16
  %vecext.2.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 2
  %add69.2.7 = or disjoint i64 %mul56.7, %93
  %add71.2.7 = or disjoint i64 %add69.2.7, %conv70
  %arrayidx72.2.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.7
  store i32 %vecext.2.7, ptr addrspace(1) %arrayidx72.2.7, align 4, !tbaa !16
  %vecext.3.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 3
  %add69.3.7 = or disjoint i64 %mul56.7, %95
  %add71.3.7 = or disjoint i64 %add69.3.7, %conv70
  %arrayidx72.3.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.7
  store i32 %vecext.3.7, ptr addrspace(1) %arrayidx72.3.7, align 4, !tbaa !16
  %mul56.8 = or disjoint i64 %88, 2048
  %vecext.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 0
  %add69.8 = or disjoint i64 %mul56.8, %89
  %add71.8 = or disjoint i64 %add69.8, %conv70
  %arrayidx72.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.8
  store i32 %vecext.8, ptr addrspace(1) %arrayidx72.8, align 4, !tbaa !16
  %vecext.1.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 1
  %add69.1.8 = or disjoint i64 %mul56.8, %91
  %add71.1.8 = or disjoint i64 %add69.1.8, %conv70
  %arrayidx72.1.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.8
  store i32 %vecext.1.8, ptr addrspace(1) %arrayidx72.1.8, align 4, !tbaa !16
  %vecext.2.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 2
  %add69.2.8 = or disjoint i64 %mul56.8, %93
  %add71.2.8 = or disjoint i64 %add69.2.8, %conv70
  %arrayidx72.2.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.8
  store i32 %vecext.2.8, ptr addrspace(1) %arrayidx72.2.8, align 4, !tbaa !16
  %vecext.3.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 3
  %add69.3.8 = or disjoint i64 %mul56.8, %95
  %add71.3.8 = or disjoint i64 %add69.3.8, %conv70
  %arrayidx72.3.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.8
  store i32 %vecext.3.8, ptr addrspace(1) %arrayidx72.3.8, align 4, !tbaa !16
  %mul56.9 = or disjoint i64 %88, 2304
  %vecext.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 0
  %add69.9 = or disjoint i64 %mul56.9, %89
  %add71.9 = or disjoint i64 %add69.9, %conv70
  %arrayidx72.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.9
  store i32 %vecext.9, ptr addrspace(1) %arrayidx72.9, align 4, !tbaa !16
  %vecext.1.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 1
  %add69.1.9 = or disjoint i64 %mul56.9, %91
  %add71.1.9 = or disjoint i64 %add69.1.9, %conv70
  %arrayidx72.1.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.9
  store i32 %vecext.1.9, ptr addrspace(1) %arrayidx72.1.9, align 4, !tbaa !16
  %vecext.2.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 2
  %add69.2.9 = or disjoint i64 %mul56.9, %93
  %add71.2.9 = or disjoint i64 %add69.2.9, %conv70
  %arrayidx72.2.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.9
  store i32 %vecext.2.9, ptr addrspace(1) %arrayidx72.2.9, align 4, !tbaa !16
  %vecext.3.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 3
  %add69.3.9 = or disjoint i64 %mul56.9, %95
  %add71.3.9 = or disjoint i64 %add69.3.9, %conv70
  %arrayidx72.3.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.9
  store i32 %vecext.3.9, ptr addrspace(1) %arrayidx72.3.9, align 4, !tbaa !16
  %mul56.10 = or disjoint i64 %88, 2560
  %vecext.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 0
  %add69.10 = or disjoint i64 %mul56.10, %89
  %add71.10 = or disjoint i64 %add69.10, %conv70
  %arrayidx72.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.10
  store i32 %vecext.10, ptr addrspace(1) %arrayidx72.10, align 4, !tbaa !16
  %vecext.1.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 1
  %add69.1.10 = or disjoint i64 %mul56.10, %91
  %add71.1.10 = or disjoint i64 %add69.1.10, %conv70
  %arrayidx72.1.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.10
  store i32 %vecext.1.10, ptr addrspace(1) %arrayidx72.1.10, align 4, !tbaa !16
  %vecext.2.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 2
  %add69.2.10 = or disjoint i64 %mul56.10, %93
  %add71.2.10 = or disjoint i64 %add69.2.10, %conv70
  %arrayidx72.2.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.10
  store i32 %vecext.2.10, ptr addrspace(1) %arrayidx72.2.10, align 4, !tbaa !16
  %vecext.3.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 3
  %add69.3.10 = or disjoint i64 %mul56.10, %95
  %add71.3.10 = or disjoint i64 %add69.3.10, %conv70
  %arrayidx72.3.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.10
  store i32 %vecext.3.10, ptr addrspace(1) %arrayidx72.3.10, align 4, !tbaa !16
  %mul56.11 = or disjoint i64 %88, 2816
  %vecext.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 0
  %add69.11 = or disjoint i64 %mul56.11, %89
  %add71.11 = or disjoint i64 %add69.11, %conv70
  %arrayidx72.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.11
  store i32 %vecext.11, ptr addrspace(1) %arrayidx72.11, align 4, !tbaa !16
  %vecext.1.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 1
  %add69.1.11 = or disjoint i64 %mul56.11, %91
  %add71.1.11 = or disjoint i64 %add69.1.11, %conv70
  %arrayidx72.1.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.11
  store i32 %vecext.1.11, ptr addrspace(1) %arrayidx72.1.11, align 4, !tbaa !16
  %vecext.2.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 2
  %add69.2.11 = or disjoint i64 %mul56.11, %93
  %add71.2.11 = or disjoint i64 %add69.2.11, %conv70
  %arrayidx72.2.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.11
  store i32 %vecext.2.11, ptr addrspace(1) %arrayidx72.2.11, align 4, !tbaa !16
  %vecext.3.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 3
  %add69.3.11 = or disjoint i64 %mul56.11, %95
  %add71.3.11 = or disjoint i64 %add69.3.11, %conv70
  %arrayidx72.3.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.11
  store i32 %vecext.3.11, ptr addrspace(1) %arrayidx72.3.11, align 4, !tbaa !16
  %mul56.12 = or disjoint i64 %88, 3072
  %vecext.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 0
  %add69.12 = or disjoint i64 %mul56.12, %89
  %add71.12 = or disjoint i64 %add69.12, %conv70
  %arrayidx72.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.12
  store i32 %vecext.12, ptr addrspace(1) %arrayidx72.12, align 4, !tbaa !16
  %vecext.1.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 1
  %add69.1.12 = or disjoint i64 %mul56.12, %91
  %add71.1.12 = or disjoint i64 %add69.1.12, %conv70
  %arrayidx72.1.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.12
  store i32 %vecext.1.12, ptr addrspace(1) %arrayidx72.1.12, align 4, !tbaa !16
  %vecext.2.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 2
  %add69.2.12 = or disjoint i64 %mul56.12, %93
  %add71.2.12 = or disjoint i64 %add69.2.12, %conv70
  %arrayidx72.2.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.12
  store i32 %vecext.2.12, ptr addrspace(1) %arrayidx72.2.12, align 4, !tbaa !16
  %vecext.3.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 3
  %add69.3.12 = or disjoint i64 %mul56.12, %95
  %add71.3.12 = or disjoint i64 %add69.3.12, %conv70
  %arrayidx72.3.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.12
  store i32 %vecext.3.12, ptr addrspace(1) %arrayidx72.3.12, align 4, !tbaa !16
  %mul56.13 = or disjoint i64 %88, 3328
  %vecext.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 0
  %add69.13 = or disjoint i64 %mul56.13, %89
  %add71.13 = or disjoint i64 %add69.13, %conv70
  %arrayidx72.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.13
  store i32 %vecext.13, ptr addrspace(1) %arrayidx72.13, align 4, !tbaa !16
  %vecext.1.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 1
  %add69.1.13 = or disjoint i64 %mul56.13, %91
  %add71.1.13 = or disjoint i64 %add69.1.13, %conv70
  %arrayidx72.1.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.13
  store i32 %vecext.1.13, ptr addrspace(1) %arrayidx72.1.13, align 4, !tbaa !16
  %vecext.2.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 2
  %add69.2.13 = or disjoint i64 %mul56.13, %93
  %add71.2.13 = or disjoint i64 %add69.2.13, %conv70
  %arrayidx72.2.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.13
  store i32 %vecext.2.13, ptr addrspace(1) %arrayidx72.2.13, align 4, !tbaa !16
  %vecext.3.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 3
  %add69.3.13 = or disjoint i64 %mul56.13, %95
  %add71.3.13 = or disjoint i64 %add69.3.13, %conv70
  %arrayidx72.3.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.13
  store i32 %vecext.3.13, ptr addrspace(1) %arrayidx72.3.13, align 4, !tbaa !16
  %mul56.14 = or disjoint i64 %88, 3584
  %vecext.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 0
  %add69.14 = or disjoint i64 %mul56.14, %89
  %add71.14 = or disjoint i64 %add69.14, %conv70
  %arrayidx72.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.14
  store i32 %vecext.14, ptr addrspace(1) %arrayidx72.14, align 4, !tbaa !16
  %vecext.1.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 1
  %add69.1.14 = or disjoint i64 %mul56.14, %91
  %add71.1.14 = or disjoint i64 %add69.1.14, %conv70
  %arrayidx72.1.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.14
  store i32 %vecext.1.14, ptr addrspace(1) %arrayidx72.1.14, align 4, !tbaa !16
  %vecext.2.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 2
  %add69.2.14 = or disjoint i64 %mul56.14, %93
  %add71.2.14 = or disjoint i64 %add69.2.14, %conv70
  %arrayidx72.2.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.14
  store i32 %vecext.2.14, ptr addrspace(1) %arrayidx72.2.14, align 4, !tbaa !16
  %vecext.3.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 3
  %add69.3.14 = or disjoint i64 %mul56.14, %95
  %add71.3.14 = or disjoint i64 %add69.3.14, %conv70
  %arrayidx72.3.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.14
  store i32 %vecext.3.14, ptr addrspace(1) %arrayidx72.3.14, align 4, !tbaa !16
  %mul56.15 = or disjoint i64 %88, 3840
  %vecext.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 0
  %add69.15 = or disjoint i64 %mul56.15, %89
  %add71.15 = or disjoint i64 %add69.15, %conv70
  %arrayidx72.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.15
  store i32 %vecext.15, ptr addrspace(1) %arrayidx72.15, align 4, !tbaa !16
  %vecext.1.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 1
  %add69.1.15 = or disjoint i64 %mul56.15, %91
  %add71.1.15 = or disjoint i64 %add69.1.15, %conv70
  %arrayidx72.1.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.15
  store i32 %vecext.1.15, ptr addrspace(1) %arrayidx72.1.15, align 4, !tbaa !16
  %vecext.2.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 2
  %add69.2.15 = or disjoint i64 %mul56.15, %93
  %add71.2.15 = or disjoint i64 %add69.2.15, %conv70
  %arrayidx72.2.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.15
  store i32 %vecext.2.15, ptr addrspace(1) %arrayidx72.2.15, align 4, !tbaa !16
  %vecext.3.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 3
  %add69.3.15 = or disjoint i64 %mul56.15, %95
  %add71.3.15 = or disjoint i64 %add69.3.15, %conv70
  %arrayidx72.3.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.15
  store i32 %vecext.3.15, ptr addrspace(1) %arrayidx72.3.15, align 4, !tbaa !16
  ret void
}

; Function Attrs: convergent mustprogress nofree norecurse nounwind memory(argmem: readwrite)
define protected metaxgpu_kernel void @_Z13mmaPeakKernelILi17EEvPKaS1_Pii(ptr addrspace(1) noalias nocapture noundef readonly %a.coerce, ptr addrspace(1) noalias nocapture noundef readonly %b.coerce, ptr addrspace(1) noalias noundef writeonly %c.coerce, i32 noundef %iterations) local_unnamed_addr #3 comdat {
entry:
  %0 = tail call noundef range(i32 0, 1024) i32 @llvm.mxc.thread.id.x(), !range !25
  %1 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.mxc.dispatch.ptr()
  %2 = getelementptr inbounds i8, ptr addrspace(4) %1, i64 4
  %3 = load i16, ptr addrspace(4) %2, align 4, !range !26, !invariant.load !14
  %rem11 = and i32 %0, 15
  %4 = lshr i32 %0, 2
  %mul13 = and i32 %4, 12
  %mul15 = shl nuw nsw i32 %rem11, 4
  %5 = zext nneg i32 %mul15 to i64
  %6 = zext nneg i32 %mul13 to i64
  %7 = or disjoint i64 %5, %6
  %add.ptr = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %7
  %8 = load i32, ptr addrspace(1) %add.ptr, align 1
  %add.ptr21 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %7
  %9 = load i32, ptr addrspace(1) %add.ptr21, align 1
  %10 = or disjoint i64 %5, %6
  %11 = or disjoint i64 %10, 256
  %add.ptr.1 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %11
  %12 = load i32, ptr addrspace(1) %add.ptr.1, align 1
  %add.ptr21.1 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %11
  %13 = load i32, ptr addrspace(1) %add.ptr21.1, align 1
  %14 = or disjoint i64 %5, %6
  %15 = or disjoint i64 %14, 512
  %add.ptr.2 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %15
  %16 = load i32, ptr addrspace(1) %add.ptr.2, align 1
  %add.ptr21.2 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %15
  %17 = load i32, ptr addrspace(1) %add.ptr21.2, align 1
  %18 = or disjoint i64 %5, %6
  %19 = or disjoint i64 %18, 768
  %add.ptr.3 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %19
  %20 = load i32, ptr addrspace(1) %add.ptr.3, align 1
  %add.ptr21.3 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %19
  %21 = load i32, ptr addrspace(1) %add.ptr21.3, align 1
  %22 = or disjoint i64 %5, %6
  %23 = or disjoint i64 %22, 1024
  %add.ptr.4 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %23
  %24 = load i32, ptr addrspace(1) %add.ptr.4, align 1
  %add.ptr21.4 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %23
  %25 = load i32, ptr addrspace(1) %add.ptr21.4, align 1
  %26 = or disjoint i64 %5, %6
  %27 = or disjoint i64 %26, 1280
  %add.ptr.5 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %27
  %28 = load i32, ptr addrspace(1) %add.ptr.5, align 1
  %add.ptr21.5 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %27
  %29 = load i32, ptr addrspace(1) %add.ptr21.5, align 1
  %30 = or disjoint i64 %5, %6
  %31 = or disjoint i64 %30, 1536
  %add.ptr.6 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %31
  %32 = load i32, ptr addrspace(1) %add.ptr.6, align 1
  %add.ptr21.6 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %31
  %33 = load i32, ptr addrspace(1) %add.ptr21.6, align 1
  %34 = or disjoint i64 %5, %6
  %35 = or disjoint i64 %34, 1792
  %add.ptr.7 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %35
  %36 = load i32, ptr addrspace(1) %add.ptr.7, align 1
  %add.ptr21.7 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %35
  %37 = load i32, ptr addrspace(1) %add.ptr21.7, align 1
  %38 = or disjoint i64 %5, %6
  %39 = or disjoint i64 %38, 2048
  %add.ptr.8 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %39
  %40 = load i32, ptr addrspace(1) %add.ptr.8, align 1
  %add.ptr21.8 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %39
  %41 = load i32, ptr addrspace(1) %add.ptr21.8, align 1
  %42 = or disjoint i64 %5, %6
  %43 = or disjoint i64 %42, 2304
  %add.ptr.9 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %43
  %44 = load i32, ptr addrspace(1) %add.ptr.9, align 1
  %add.ptr21.9 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %43
  %45 = load i32, ptr addrspace(1) %add.ptr21.9, align 1
  %46 = or disjoint i64 %5, %6
  %47 = or disjoint i64 %46, 2560
  %add.ptr.10 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %47
  %48 = load i32, ptr addrspace(1) %add.ptr.10, align 1
  %add.ptr21.10 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %47
  %49 = load i32, ptr addrspace(1) %add.ptr21.10, align 1
  %50 = or disjoint i64 %5, %6
  %51 = or disjoint i64 %50, 2816
  %add.ptr.11 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %51
  %52 = load i32, ptr addrspace(1) %add.ptr.11, align 1
  %add.ptr21.11 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %51
  %53 = load i32, ptr addrspace(1) %add.ptr21.11, align 1
  %54 = or disjoint i64 %5, %6
  %55 = or disjoint i64 %54, 3072
  %add.ptr.12 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %55
  %56 = load i32, ptr addrspace(1) %add.ptr.12, align 1
  %add.ptr21.12 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %55
  %57 = load i32, ptr addrspace(1) %add.ptr21.12, align 1
  %58 = or disjoint i64 %5, %6
  %59 = or disjoint i64 %58, 3328
  %add.ptr.13 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %59
  %60 = load i32, ptr addrspace(1) %add.ptr.13, align 1
  %add.ptr21.13 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %59
  %61 = load i32, ptr addrspace(1) %add.ptr21.13, align 1
  %62 = or disjoint i64 %5, %6
  %63 = or disjoint i64 %62, 3584
  %add.ptr.14 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %63
  %64 = load i32, ptr addrspace(1) %add.ptr.14, align 1
  %add.ptr21.14 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %63
  %65 = load i32, ptr addrspace(1) %add.ptr21.14, align 1
  %66 = or disjoint i64 %5, %6
  %67 = or disjoint i64 %66, 3840
  %add.ptr.15 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %67
  %68 = load i32, ptr addrspace(1) %add.ptr.15, align 1
  %add.ptr21.15 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %67
  %69 = load i32, ptr addrspace(1) %add.ptr21.15, align 1
  %70 = or disjoint i64 %5, %6
  %71 = or disjoint i64 %70, 4096
  %add.ptr.16 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %71
  %72 = load i32, ptr addrspace(1) %add.ptr.16, align 1
  %add.ptr21.16 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %71
  %73 = load i32, ptr addrspace(1) %add.ptr21.16, align 1
  %cmp25104 = icmp sgt i32 %iterations, 0
  br i1 %cmp25104, label %for.cond30.preheader, label %for.cond49.preheader

for.cond30.preheader:                             ; preds = %entry, %for.cond30.preheader
  %sums.sroa.66.0 = phi <4 x i32> [ %90, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.62.0 = phi <4 x i32> [ %89, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.58.0 = phi <4 x i32> [ %88, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.54.0 = phi <4 x i32> [ %87, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.50.0 = phi <4 x i32> [ %86, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.46.0 = phi <4 x i32> [ %85, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.42.0 = phi <4 x i32> [ %84, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.38.0 = phi <4 x i32> [ %83, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.34.0 = phi <4 x i32> [ %82, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.30.0 = phi <4 x i32> [ %81, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.26.0 = phi <4 x i32> [ %80, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.22.0 = phi <4 x i32> [ %79, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.18.0 = phi <4 x i32> [ %78, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.14.0 = phi <4 x i32> [ %77, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.10.0 = phi <4 x i32> [ %76, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.6.0 = phi <4 x i32> [ %75, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.0.0 = phi <4 x i32> [ %74, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %iteration.0105 = phi i32 [ %inc46, %for.cond30.preheader ], [ 0, %entry ]
  %74 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %8, i32 %9, <4 x i32> %sums.sroa.0.0), !call_argsrelate !27
  %75 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %12, i32 %13, <4 x i32> %sums.sroa.6.0), !call_argsrelate !27
  %76 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %16, i32 %17, <4 x i32> %sums.sroa.10.0), !call_argsrelate !27
  %77 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %20, i32 %21, <4 x i32> %sums.sroa.14.0), !call_argsrelate !27
  %78 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %24, i32 %25, <4 x i32> %sums.sroa.18.0), !call_argsrelate !27
  %79 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %28, i32 %29, <4 x i32> %sums.sroa.22.0), !call_argsrelate !27
  %80 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %32, i32 %33, <4 x i32> %sums.sroa.26.0), !call_argsrelate !27
  %81 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %36, i32 %37, <4 x i32> %sums.sroa.30.0), !call_argsrelate !27
  %82 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %40, i32 %41, <4 x i32> %sums.sroa.34.0), !call_argsrelate !27
  %83 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %44, i32 %45, <4 x i32> %sums.sroa.38.0), !call_argsrelate !27
  %84 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %48, i32 %49, <4 x i32> %sums.sroa.42.0), !call_argsrelate !27
  %85 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %52, i32 %53, <4 x i32> %sums.sroa.46.0), !call_argsrelate !27
  %86 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %56, i32 %57, <4 x i32> %sums.sroa.50.0), !call_argsrelate !27
  %87 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %60, i32 %61, <4 x i32> %sums.sroa.54.0), !call_argsrelate !27
  %88 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %64, i32 %65, <4 x i32> %sums.sroa.58.0), !call_argsrelate !27
  %89 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %68, i32 %69, <4 x i32> %sums.sroa.62.0), !call_argsrelate !27
  %90 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %72, i32 %73, <4 x i32> %sums.sroa.66.0), !call_argsrelate !27
  %inc46 = add nuw nsw i32 %iteration.0105, 1
  %exitcond.not = icmp eq i32 %inc46, %iterations
  br i1 %exitcond.not, label %for.cond49.preheader, label %for.cond30.preheader, !llvm.loop !34

for.cond49.preheader:                             ; preds = %for.cond30.preheader, %entry
  %sums.sroa.66.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %90, %for.cond30.preheader ]
  %sums.sroa.62.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %89, %for.cond30.preheader ]
  %sums.sroa.58.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %88, %for.cond30.preheader ]
  %sums.sroa.54.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %87, %for.cond30.preheader ]
  %sums.sroa.50.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %86, %for.cond30.preheader ]
  %sums.sroa.46.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %85, %for.cond30.preheader ]
  %sums.sroa.42.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %84, %for.cond30.preheader ]
  %sums.sroa.38.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %83, %for.cond30.preheader ]
  %sums.sroa.34.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %82, %for.cond30.preheader ]
  %sums.sroa.30.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %81, %for.cond30.preheader ]
  %sums.sroa.26.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %80, %for.cond30.preheader ]
  %sums.sroa.22.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %79, %for.cond30.preheader ]
  %sums.sroa.18.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %78, %for.cond30.preheader ]
  %sums.sroa.14.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %77, %for.cond30.preheader ]
  %sums.sroa.10.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %76, %for.cond30.preheader ]
  %sums.sroa.6.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %75, %for.cond30.preheader ]
  %sums.sroa.0.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %74, %for.cond30.preheader ]
  %91 = lshr i16 %3, 6
  %conv7 = zext nneg i16 %91 to i64
  %92 = tail call noundef range(i32 0, 2147483647) i32 @llvm.mxc.block.id.x(), !range !15
  %conv = zext nneg i32 %92 to i64
  %mul = mul nuw nsw i64 %conv7, %conv
  %div9100 = lshr i32 %0, 6
  %conv10 = zext nneg i32 %div9100 to i64
  %add = add nuw nsw i64 %mul, %conv10
  %conv70 = zext nneg i32 %rem11 to i64
  %mul56 = mul nuw nsw i64 %add, 4352
  %vecext = extractelement <4 x i32> %sums.sroa.0.1, i64 0
  %93 = shl nuw nsw i64 %6, 4
  %add69 = or disjoint i64 %mul56, %93
  %add71 = or disjoint i64 %add69, %conv70
  %arrayidx72 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71
  store i32 %vecext, ptr addrspace(1) %arrayidx72, align 4, !tbaa !16
  %vecext.1 = extractelement <4 x i32> %sums.sroa.0.1, i64 1
  %94 = shl nuw nsw i64 %6, 4
  %95 = or disjoint i64 %94, 16
  %add69.1 = or disjoint i64 %mul56, %95
  %add71.1 = or disjoint i64 %add69.1, %conv70
  %arrayidx72.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1
  store i32 %vecext.1, ptr addrspace(1) %arrayidx72.1, align 4, !tbaa !16
  %vecext.2 = extractelement <4 x i32> %sums.sroa.0.1, i64 2
  %96 = shl nuw nsw i64 %6, 4
  %97 = or disjoint i64 %96, 32
  %add69.2 = or disjoint i64 %mul56, %97
  %add71.2 = or disjoint i64 %add69.2, %conv70
  %arrayidx72.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2
  store i32 %vecext.2, ptr addrspace(1) %arrayidx72.2, align 4, !tbaa !16
  %vecext.3 = extractelement <4 x i32> %sums.sroa.0.1, i64 3
  %98 = shl nuw nsw i64 %6, 4
  %99 = or disjoint i64 %98, 48
  %add69.3 = or disjoint i64 %mul56, %99
  %add71.3 = or disjoint i64 %add69.3, %conv70
  %arrayidx72.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3
  store i32 %vecext.3, ptr addrspace(1) %arrayidx72.3, align 4, !tbaa !16
  %add55.1 = mul nuw nsw i64 %add, 4352
  %mul56.1 = add nuw nsw i64 %add55.1, 256
  %vecext.1118 = extractelement <4 x i32> %sums.sroa.6.1, i64 0
  %add69.1119 = or disjoint i64 %mul56.1, %93
  %add71.1120 = or disjoint i64 %add69.1119, %conv70
  %arrayidx72.1121 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1120
  store i32 %vecext.1118, ptr addrspace(1) %arrayidx72.1121, align 4, !tbaa !16
  %vecext.1.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 1
  %add69.1.1 = or disjoint i64 %mul56.1, %95
  %add71.1.1 = or disjoint i64 %add69.1.1, %conv70
  %arrayidx72.1.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.1
  store i32 %vecext.1.1, ptr addrspace(1) %arrayidx72.1.1, align 4, !tbaa !16
  %vecext.2.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 2
  %add69.2.1 = or disjoint i64 %mul56.1, %97
  %add71.2.1 = or disjoint i64 %add69.2.1, %conv70
  %arrayidx72.2.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.1
  store i32 %vecext.2.1, ptr addrspace(1) %arrayidx72.2.1, align 4, !tbaa !16
  %vecext.3.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 3
  %add69.3.1 = or disjoint i64 %mul56.1, %99
  %add71.3.1 = or disjoint i64 %add69.3.1, %conv70
  %arrayidx72.3.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.1
  store i32 %vecext.3.1, ptr addrspace(1) %arrayidx72.3.1, align 4, !tbaa !16
  %add55.2 = mul nuw nsw i64 %add, 4352
  %mul56.2 = add nuw nsw i64 %add55.2, 512
  %vecext.2122 = extractelement <4 x i32> %sums.sroa.10.1, i64 0
  %add69.2123 = or disjoint i64 %mul56.2, %93
  %add71.2124 = or disjoint i64 %add69.2123, %conv70
  %arrayidx72.2125 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2124
  store i32 %vecext.2122, ptr addrspace(1) %arrayidx72.2125, align 4, !tbaa !16
  %vecext.1.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 1
  %add69.1.2 = or disjoint i64 %mul56.2, %95
  %add71.1.2 = or disjoint i64 %add69.1.2, %conv70
  %arrayidx72.1.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.2
  store i32 %vecext.1.2, ptr addrspace(1) %arrayidx72.1.2, align 4, !tbaa !16
  %vecext.2.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 2
  %add69.2.2 = or disjoint i64 %mul56.2, %97
  %add71.2.2 = or disjoint i64 %add69.2.2, %conv70
  %arrayidx72.2.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.2
  store i32 %vecext.2.2, ptr addrspace(1) %arrayidx72.2.2, align 4, !tbaa !16
  %vecext.3.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 3
  %add69.3.2 = or disjoint i64 %mul56.2, %99
  %add71.3.2 = or disjoint i64 %add69.3.2, %conv70
  %arrayidx72.3.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.2
  store i32 %vecext.3.2, ptr addrspace(1) %arrayidx72.3.2, align 4, !tbaa !16
  %add55.3 = mul nuw nsw i64 %add, 4352
  %mul56.3 = add nuw nsw i64 %add55.3, 768
  %vecext.3126 = extractelement <4 x i32> %sums.sroa.14.1, i64 0
  %add69.3127 = or disjoint i64 %mul56.3, %93
  %add71.3128 = or disjoint i64 %add69.3127, %conv70
  %arrayidx72.3129 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3128
  store i32 %vecext.3126, ptr addrspace(1) %arrayidx72.3129, align 4, !tbaa !16
  %vecext.1.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 1
  %add69.1.3 = or disjoint i64 %mul56.3, %95
  %add71.1.3 = or disjoint i64 %add69.1.3, %conv70
  %arrayidx72.1.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.3
  store i32 %vecext.1.3, ptr addrspace(1) %arrayidx72.1.3, align 4, !tbaa !16
  %vecext.2.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 2
  %add69.2.3 = or disjoint i64 %mul56.3, %97
  %add71.2.3 = or disjoint i64 %add69.2.3, %conv70
  %arrayidx72.2.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.3
  store i32 %vecext.2.3, ptr addrspace(1) %arrayidx72.2.3, align 4, !tbaa !16
  %vecext.3.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 3
  %add69.3.3 = or disjoint i64 %mul56.3, %99
  %add71.3.3 = or disjoint i64 %add69.3.3, %conv70
  %arrayidx72.3.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.3
  store i32 %vecext.3.3, ptr addrspace(1) %arrayidx72.3.3, align 4, !tbaa !16
  %add55.4 = mul nuw nsw i64 %add, 4352
  %mul56.4 = add nuw nsw i64 %add55.4, 1024
  %vecext.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 0
  %add69.4 = or disjoint i64 %mul56.4, %93
  %add71.4 = or disjoint i64 %add69.4, %conv70
  %arrayidx72.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.4
  store i32 %vecext.4, ptr addrspace(1) %arrayidx72.4, align 4, !tbaa !16
  %vecext.1.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 1
  %add69.1.4 = or disjoint i64 %mul56.4, %95
  %add71.1.4 = or disjoint i64 %add69.1.4, %conv70
  %arrayidx72.1.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.4
  store i32 %vecext.1.4, ptr addrspace(1) %arrayidx72.1.4, align 4, !tbaa !16
  %vecext.2.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 2
  %add69.2.4 = or disjoint i64 %mul56.4, %97
  %add71.2.4 = or disjoint i64 %add69.2.4, %conv70
  %arrayidx72.2.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.4
  store i32 %vecext.2.4, ptr addrspace(1) %arrayidx72.2.4, align 4, !tbaa !16
  %vecext.3.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 3
  %add69.3.4 = or disjoint i64 %mul56.4, %99
  %add71.3.4 = or disjoint i64 %add69.3.4, %conv70
  %arrayidx72.3.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.4
  store i32 %vecext.3.4, ptr addrspace(1) %arrayidx72.3.4, align 4, !tbaa !16
  %add55.5 = mul nuw nsw i64 %add, 4352
  %mul56.5 = add nuw nsw i64 %add55.5, 1280
  %vecext.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 0
  %add69.5 = or disjoint i64 %mul56.5, %93
  %add71.5 = or disjoint i64 %add69.5, %conv70
  %arrayidx72.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.5
  store i32 %vecext.5, ptr addrspace(1) %arrayidx72.5, align 4, !tbaa !16
  %vecext.1.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 1
  %add69.1.5 = or disjoint i64 %mul56.5, %95
  %add71.1.5 = or disjoint i64 %add69.1.5, %conv70
  %arrayidx72.1.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.5
  store i32 %vecext.1.5, ptr addrspace(1) %arrayidx72.1.5, align 4, !tbaa !16
  %vecext.2.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 2
  %add69.2.5 = or disjoint i64 %mul56.5, %97
  %add71.2.5 = or disjoint i64 %add69.2.5, %conv70
  %arrayidx72.2.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.5
  store i32 %vecext.2.5, ptr addrspace(1) %arrayidx72.2.5, align 4, !tbaa !16
  %vecext.3.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 3
  %add69.3.5 = or disjoint i64 %mul56.5, %99
  %add71.3.5 = or disjoint i64 %add69.3.5, %conv70
  %arrayidx72.3.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.5
  store i32 %vecext.3.5, ptr addrspace(1) %arrayidx72.3.5, align 4, !tbaa !16
  %add55.6 = mul nuw nsw i64 %add, 4352
  %mul56.6 = add nuw nsw i64 %add55.6, 1536
  %vecext.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 0
  %add69.6 = or disjoint i64 %mul56.6, %93
  %add71.6 = or disjoint i64 %add69.6, %conv70
  %arrayidx72.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.6
  store i32 %vecext.6, ptr addrspace(1) %arrayidx72.6, align 4, !tbaa !16
  %vecext.1.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 1
  %add69.1.6 = or disjoint i64 %mul56.6, %95
  %add71.1.6 = or disjoint i64 %add69.1.6, %conv70
  %arrayidx72.1.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.6
  store i32 %vecext.1.6, ptr addrspace(1) %arrayidx72.1.6, align 4, !tbaa !16
  %vecext.2.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 2
  %add69.2.6 = or disjoint i64 %mul56.6, %97
  %add71.2.6 = or disjoint i64 %add69.2.6, %conv70
  %arrayidx72.2.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.6
  store i32 %vecext.2.6, ptr addrspace(1) %arrayidx72.2.6, align 4, !tbaa !16
  %vecext.3.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 3
  %add69.3.6 = or disjoint i64 %mul56.6, %99
  %add71.3.6 = or disjoint i64 %add69.3.6, %conv70
  %arrayidx72.3.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.6
  store i32 %vecext.3.6, ptr addrspace(1) %arrayidx72.3.6, align 4, !tbaa !16
  %add55.7 = mul nuw nsw i64 %add, 4352
  %mul56.7 = add nuw nsw i64 %add55.7, 1792
  %vecext.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 0
  %add69.7 = or disjoint i64 %mul56.7, %93
  %add71.7 = or disjoint i64 %add69.7, %conv70
  %arrayidx72.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.7
  store i32 %vecext.7, ptr addrspace(1) %arrayidx72.7, align 4, !tbaa !16
  %vecext.1.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 1
  %add69.1.7 = or disjoint i64 %mul56.7, %95
  %add71.1.7 = or disjoint i64 %add69.1.7, %conv70
  %arrayidx72.1.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.7
  store i32 %vecext.1.7, ptr addrspace(1) %arrayidx72.1.7, align 4, !tbaa !16
  %vecext.2.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 2
  %add69.2.7 = or disjoint i64 %mul56.7, %97
  %add71.2.7 = or disjoint i64 %add69.2.7, %conv70
  %arrayidx72.2.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.7
  store i32 %vecext.2.7, ptr addrspace(1) %arrayidx72.2.7, align 4, !tbaa !16
  %vecext.3.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 3
  %add69.3.7 = or disjoint i64 %mul56.7, %99
  %add71.3.7 = or disjoint i64 %add69.3.7, %conv70
  %arrayidx72.3.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.7
  store i32 %vecext.3.7, ptr addrspace(1) %arrayidx72.3.7, align 4, !tbaa !16
  %add55.8 = mul nuw nsw i64 %add, 4352
  %mul56.8 = add nuw nsw i64 %add55.8, 2048
  %vecext.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 0
  %add69.8 = or disjoint i64 %mul56.8, %93
  %add71.8 = or disjoint i64 %add69.8, %conv70
  %arrayidx72.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.8
  store i32 %vecext.8, ptr addrspace(1) %arrayidx72.8, align 4, !tbaa !16
  %vecext.1.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 1
  %add69.1.8 = or disjoint i64 %mul56.8, %95
  %add71.1.8 = or disjoint i64 %add69.1.8, %conv70
  %arrayidx72.1.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.8
  store i32 %vecext.1.8, ptr addrspace(1) %arrayidx72.1.8, align 4, !tbaa !16
  %vecext.2.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 2
  %add69.2.8 = or disjoint i64 %mul56.8, %97
  %add71.2.8 = or disjoint i64 %add69.2.8, %conv70
  %arrayidx72.2.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.8
  store i32 %vecext.2.8, ptr addrspace(1) %arrayidx72.2.8, align 4, !tbaa !16
  %vecext.3.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 3
  %add69.3.8 = or disjoint i64 %mul56.8, %99
  %add71.3.8 = or disjoint i64 %add69.3.8, %conv70
  %arrayidx72.3.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.8
  store i32 %vecext.3.8, ptr addrspace(1) %arrayidx72.3.8, align 4, !tbaa !16
  %add55.9 = mul nuw nsw i64 %add, 4352
  %mul56.9 = add nuw nsw i64 %add55.9, 2304
  %vecext.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 0
  %add69.9 = or disjoint i64 %mul56.9, %93
  %add71.9 = or disjoint i64 %add69.9, %conv70
  %arrayidx72.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.9
  store i32 %vecext.9, ptr addrspace(1) %arrayidx72.9, align 4, !tbaa !16
  %vecext.1.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 1
  %add69.1.9 = or disjoint i64 %mul56.9, %95
  %add71.1.9 = or disjoint i64 %add69.1.9, %conv70
  %arrayidx72.1.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.9
  store i32 %vecext.1.9, ptr addrspace(1) %arrayidx72.1.9, align 4, !tbaa !16
  %vecext.2.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 2
  %add69.2.9 = or disjoint i64 %mul56.9, %97
  %add71.2.9 = or disjoint i64 %add69.2.9, %conv70
  %arrayidx72.2.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.9
  store i32 %vecext.2.9, ptr addrspace(1) %arrayidx72.2.9, align 4, !tbaa !16
  %vecext.3.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 3
  %add69.3.9 = or disjoint i64 %mul56.9, %99
  %add71.3.9 = or disjoint i64 %add69.3.9, %conv70
  %arrayidx72.3.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.9
  store i32 %vecext.3.9, ptr addrspace(1) %arrayidx72.3.9, align 4, !tbaa !16
  %add55.10 = mul nuw nsw i64 %add, 4352
  %mul56.10 = add nuw nsw i64 %add55.10, 2560
  %vecext.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 0
  %add69.10 = or disjoint i64 %mul56.10, %93
  %add71.10 = or disjoint i64 %add69.10, %conv70
  %arrayidx72.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.10
  store i32 %vecext.10, ptr addrspace(1) %arrayidx72.10, align 4, !tbaa !16
  %vecext.1.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 1
  %add69.1.10 = or disjoint i64 %mul56.10, %95
  %add71.1.10 = or disjoint i64 %add69.1.10, %conv70
  %arrayidx72.1.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.10
  store i32 %vecext.1.10, ptr addrspace(1) %arrayidx72.1.10, align 4, !tbaa !16
  %vecext.2.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 2
  %add69.2.10 = or disjoint i64 %mul56.10, %97
  %add71.2.10 = or disjoint i64 %add69.2.10, %conv70
  %arrayidx72.2.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.10
  store i32 %vecext.2.10, ptr addrspace(1) %arrayidx72.2.10, align 4, !tbaa !16
  %vecext.3.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 3
  %add69.3.10 = or disjoint i64 %mul56.10, %99
  %add71.3.10 = or disjoint i64 %add69.3.10, %conv70
  %arrayidx72.3.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.10
  store i32 %vecext.3.10, ptr addrspace(1) %arrayidx72.3.10, align 4, !tbaa !16
  %add55.11 = mul nuw nsw i64 %add, 4352
  %mul56.11 = add nuw nsw i64 %add55.11, 2816
  %vecext.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 0
  %add69.11 = or disjoint i64 %mul56.11, %93
  %add71.11 = or disjoint i64 %add69.11, %conv70
  %arrayidx72.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.11
  store i32 %vecext.11, ptr addrspace(1) %arrayidx72.11, align 4, !tbaa !16
  %vecext.1.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 1
  %add69.1.11 = or disjoint i64 %mul56.11, %95
  %add71.1.11 = or disjoint i64 %add69.1.11, %conv70
  %arrayidx72.1.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.11
  store i32 %vecext.1.11, ptr addrspace(1) %arrayidx72.1.11, align 4, !tbaa !16
  %vecext.2.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 2
  %add69.2.11 = or disjoint i64 %mul56.11, %97
  %add71.2.11 = or disjoint i64 %add69.2.11, %conv70
  %arrayidx72.2.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.11
  store i32 %vecext.2.11, ptr addrspace(1) %arrayidx72.2.11, align 4, !tbaa !16
  %vecext.3.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 3
  %add69.3.11 = or disjoint i64 %mul56.11, %99
  %add71.3.11 = or disjoint i64 %add69.3.11, %conv70
  %arrayidx72.3.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.11
  store i32 %vecext.3.11, ptr addrspace(1) %arrayidx72.3.11, align 4, !tbaa !16
  %add55.12 = mul nuw nsw i64 %add, 4352
  %mul56.12 = add nuw nsw i64 %add55.12, 3072
  %vecext.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 0
  %add69.12 = or disjoint i64 %mul56.12, %93
  %add71.12 = or disjoint i64 %add69.12, %conv70
  %arrayidx72.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.12
  store i32 %vecext.12, ptr addrspace(1) %arrayidx72.12, align 4, !tbaa !16
  %vecext.1.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 1
  %add69.1.12 = or disjoint i64 %mul56.12, %95
  %add71.1.12 = or disjoint i64 %add69.1.12, %conv70
  %arrayidx72.1.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.12
  store i32 %vecext.1.12, ptr addrspace(1) %arrayidx72.1.12, align 4, !tbaa !16
  %vecext.2.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 2
  %add69.2.12 = or disjoint i64 %mul56.12, %97
  %add71.2.12 = or disjoint i64 %add69.2.12, %conv70
  %arrayidx72.2.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.12
  store i32 %vecext.2.12, ptr addrspace(1) %arrayidx72.2.12, align 4, !tbaa !16
  %vecext.3.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 3
  %add69.3.12 = or disjoint i64 %mul56.12, %99
  %add71.3.12 = or disjoint i64 %add69.3.12, %conv70
  %arrayidx72.3.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.12
  store i32 %vecext.3.12, ptr addrspace(1) %arrayidx72.3.12, align 4, !tbaa !16
  %add55.13 = mul nuw nsw i64 %add, 4352
  %mul56.13 = add nuw nsw i64 %add55.13, 3328
  %vecext.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 0
  %add69.13 = or disjoint i64 %mul56.13, %93
  %add71.13 = or disjoint i64 %add69.13, %conv70
  %arrayidx72.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.13
  store i32 %vecext.13, ptr addrspace(1) %arrayidx72.13, align 4, !tbaa !16
  %vecext.1.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 1
  %add69.1.13 = or disjoint i64 %mul56.13, %95
  %add71.1.13 = or disjoint i64 %add69.1.13, %conv70
  %arrayidx72.1.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.13
  store i32 %vecext.1.13, ptr addrspace(1) %arrayidx72.1.13, align 4, !tbaa !16
  %vecext.2.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 2
  %add69.2.13 = or disjoint i64 %mul56.13, %97
  %add71.2.13 = or disjoint i64 %add69.2.13, %conv70
  %arrayidx72.2.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.13
  store i32 %vecext.2.13, ptr addrspace(1) %arrayidx72.2.13, align 4, !tbaa !16
  %vecext.3.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 3
  %add69.3.13 = or disjoint i64 %mul56.13, %99
  %add71.3.13 = or disjoint i64 %add69.3.13, %conv70
  %arrayidx72.3.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.13
  store i32 %vecext.3.13, ptr addrspace(1) %arrayidx72.3.13, align 4, !tbaa !16
  %add55.14 = mul nuw nsw i64 %add, 4352
  %mul56.14 = add nuw nsw i64 %add55.14, 3584
  %vecext.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 0
  %add69.14 = or disjoint i64 %mul56.14, %93
  %add71.14 = or disjoint i64 %add69.14, %conv70
  %arrayidx72.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.14
  store i32 %vecext.14, ptr addrspace(1) %arrayidx72.14, align 4, !tbaa !16
  %vecext.1.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 1
  %add69.1.14 = or disjoint i64 %mul56.14, %95
  %add71.1.14 = or disjoint i64 %add69.1.14, %conv70
  %arrayidx72.1.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.14
  store i32 %vecext.1.14, ptr addrspace(1) %arrayidx72.1.14, align 4, !tbaa !16
  %vecext.2.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 2
  %add69.2.14 = or disjoint i64 %mul56.14, %97
  %add71.2.14 = or disjoint i64 %add69.2.14, %conv70
  %arrayidx72.2.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.14
  store i32 %vecext.2.14, ptr addrspace(1) %arrayidx72.2.14, align 4, !tbaa !16
  %vecext.3.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 3
  %add69.3.14 = or disjoint i64 %mul56.14, %99
  %add71.3.14 = or disjoint i64 %add69.3.14, %conv70
  %arrayidx72.3.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.14
  store i32 %vecext.3.14, ptr addrspace(1) %arrayidx72.3.14, align 4, !tbaa !16
  %add55.15 = mul nuw nsw i64 %add, 4352
  %mul56.15 = add nuw nsw i64 %add55.15, 3840
  %vecext.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 0
  %add69.15 = or disjoint i64 %mul56.15, %93
  %add71.15 = or disjoint i64 %add69.15, %conv70
  %arrayidx72.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.15
  store i32 %vecext.15, ptr addrspace(1) %arrayidx72.15, align 4, !tbaa !16
  %vecext.1.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 1
  %add69.1.15 = or disjoint i64 %mul56.15, %95
  %add71.1.15 = or disjoint i64 %add69.1.15, %conv70
  %arrayidx72.1.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.15
  store i32 %vecext.1.15, ptr addrspace(1) %arrayidx72.1.15, align 4, !tbaa !16
  %vecext.2.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 2
  %add69.2.15 = or disjoint i64 %mul56.15, %97
  %add71.2.15 = or disjoint i64 %add69.2.15, %conv70
  %arrayidx72.2.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.15
  store i32 %vecext.2.15, ptr addrspace(1) %arrayidx72.2.15, align 4, !tbaa !16
  %vecext.3.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 3
  %add69.3.15 = or disjoint i64 %mul56.15, %99
  %add71.3.15 = or disjoint i64 %add69.3.15, %conv70
  %arrayidx72.3.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.15
  store i32 %vecext.3.15, ptr addrspace(1) %arrayidx72.3.15, align 4, !tbaa !16
  %add55.16 = mul nuw nsw i64 %add, 4352
  %mul56.16 = add nuw nsw i64 %add55.16, 4096
  %vecext.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 0
  %add69.16 = or disjoint i64 %mul56.16, %93
  %add71.16 = or disjoint i64 %add69.16, %conv70
  %arrayidx72.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.16
  store i32 %vecext.16, ptr addrspace(1) %arrayidx72.16, align 4, !tbaa !16
  %vecext.1.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 1
  %add69.1.16 = or disjoint i64 %mul56.16, %95
  %add71.1.16 = or disjoint i64 %add69.1.16, %conv70
  %arrayidx72.1.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.16
  store i32 %vecext.1.16, ptr addrspace(1) %arrayidx72.1.16, align 4, !tbaa !16
  %vecext.2.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 2
  %add69.2.16 = or disjoint i64 %mul56.16, %97
  %add71.2.16 = or disjoint i64 %add69.2.16, %conv70
  %arrayidx72.2.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.16
  store i32 %vecext.2.16, ptr addrspace(1) %arrayidx72.2.16, align 4, !tbaa !16
  %vecext.3.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 3
  %add69.3.16 = or disjoint i64 %mul56.16, %99
  %add71.3.16 = or disjoint i64 %add69.3.16, %conv70
  %arrayidx72.3.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.16
  store i32 %vecext.3.16, ptr addrspace(1) %arrayidx72.3.16, align 4, !tbaa !16
  ret void
}

; Function Attrs: convergent mustprogress nofree norecurse nounwind memory(argmem: readwrite)
define protected metaxgpu_kernel void @_Z13mmaPeakKernelILi18EEvPKaS1_Pii(ptr addrspace(1) noalias nocapture noundef readonly %a.coerce, ptr addrspace(1) noalias nocapture noundef readonly %b.coerce, ptr addrspace(1) noalias noundef writeonly %c.coerce, i32 noundef %iterations) local_unnamed_addr #3 comdat {
entry:
  %0 = tail call noundef range(i32 0, 1024) i32 @llvm.mxc.thread.id.x(), !range !25
  %1 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.mxc.dispatch.ptr()
  %2 = getelementptr inbounds i8, ptr addrspace(4) %1, i64 4
  %3 = load i16, ptr addrspace(4) %2, align 4, !range !26, !invariant.load !14
  %rem11 = and i32 %0, 15
  %4 = lshr i32 %0, 2
  %mul13 = and i32 %4, 12
  %mul15 = shl nuw nsw i32 %rem11, 4
  %5 = zext nneg i32 %mul15 to i64
  %6 = zext nneg i32 %mul13 to i64
  %7 = or disjoint i64 %5, %6
  %add.ptr = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %7
  %8 = load i32, ptr addrspace(1) %add.ptr, align 1
  %add.ptr21 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %7
  %9 = load i32, ptr addrspace(1) %add.ptr21, align 1
  %10 = or disjoint i64 %5, %6
  %11 = or disjoint i64 %10, 256
  %add.ptr.1 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %11
  %12 = load i32, ptr addrspace(1) %add.ptr.1, align 1
  %add.ptr21.1 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %11
  %13 = load i32, ptr addrspace(1) %add.ptr21.1, align 1
  %14 = or disjoint i64 %5, %6
  %15 = or disjoint i64 %14, 512
  %add.ptr.2 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %15
  %16 = load i32, ptr addrspace(1) %add.ptr.2, align 1
  %add.ptr21.2 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %15
  %17 = load i32, ptr addrspace(1) %add.ptr21.2, align 1
  %18 = or disjoint i64 %5, %6
  %19 = or disjoint i64 %18, 768
  %add.ptr.3 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %19
  %20 = load i32, ptr addrspace(1) %add.ptr.3, align 1
  %add.ptr21.3 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %19
  %21 = load i32, ptr addrspace(1) %add.ptr21.3, align 1
  %22 = or disjoint i64 %5, %6
  %23 = or disjoint i64 %22, 1024
  %add.ptr.4 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %23
  %24 = load i32, ptr addrspace(1) %add.ptr.4, align 1
  %add.ptr21.4 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %23
  %25 = load i32, ptr addrspace(1) %add.ptr21.4, align 1
  %26 = or disjoint i64 %5, %6
  %27 = or disjoint i64 %26, 1280
  %add.ptr.5 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %27
  %28 = load i32, ptr addrspace(1) %add.ptr.5, align 1
  %add.ptr21.5 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %27
  %29 = load i32, ptr addrspace(1) %add.ptr21.5, align 1
  %30 = or disjoint i64 %5, %6
  %31 = or disjoint i64 %30, 1536
  %add.ptr.6 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %31
  %32 = load i32, ptr addrspace(1) %add.ptr.6, align 1
  %add.ptr21.6 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %31
  %33 = load i32, ptr addrspace(1) %add.ptr21.6, align 1
  %34 = or disjoint i64 %5, %6
  %35 = or disjoint i64 %34, 1792
  %add.ptr.7 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %35
  %36 = load i32, ptr addrspace(1) %add.ptr.7, align 1
  %add.ptr21.7 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %35
  %37 = load i32, ptr addrspace(1) %add.ptr21.7, align 1
  %38 = or disjoint i64 %5, %6
  %39 = or disjoint i64 %38, 2048
  %add.ptr.8 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %39
  %40 = load i32, ptr addrspace(1) %add.ptr.8, align 1
  %add.ptr21.8 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %39
  %41 = load i32, ptr addrspace(1) %add.ptr21.8, align 1
  %42 = or disjoint i64 %5, %6
  %43 = or disjoint i64 %42, 2304
  %add.ptr.9 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %43
  %44 = load i32, ptr addrspace(1) %add.ptr.9, align 1
  %add.ptr21.9 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %43
  %45 = load i32, ptr addrspace(1) %add.ptr21.9, align 1
  %46 = or disjoint i64 %5, %6
  %47 = or disjoint i64 %46, 2560
  %add.ptr.10 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %47
  %48 = load i32, ptr addrspace(1) %add.ptr.10, align 1
  %add.ptr21.10 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %47
  %49 = load i32, ptr addrspace(1) %add.ptr21.10, align 1
  %50 = or disjoint i64 %5, %6
  %51 = or disjoint i64 %50, 2816
  %add.ptr.11 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %51
  %52 = load i32, ptr addrspace(1) %add.ptr.11, align 1
  %add.ptr21.11 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %51
  %53 = load i32, ptr addrspace(1) %add.ptr21.11, align 1
  %54 = or disjoint i64 %5, %6
  %55 = or disjoint i64 %54, 3072
  %add.ptr.12 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %55
  %56 = load i32, ptr addrspace(1) %add.ptr.12, align 1
  %add.ptr21.12 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %55
  %57 = load i32, ptr addrspace(1) %add.ptr21.12, align 1
  %58 = or disjoint i64 %5, %6
  %59 = or disjoint i64 %58, 3328
  %add.ptr.13 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %59
  %60 = load i32, ptr addrspace(1) %add.ptr.13, align 1
  %add.ptr21.13 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %59
  %61 = load i32, ptr addrspace(1) %add.ptr21.13, align 1
  %62 = or disjoint i64 %5, %6
  %63 = or disjoint i64 %62, 3584
  %add.ptr.14 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %63
  %64 = load i32, ptr addrspace(1) %add.ptr.14, align 1
  %add.ptr21.14 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %63
  %65 = load i32, ptr addrspace(1) %add.ptr21.14, align 1
  %66 = or disjoint i64 %5, %6
  %67 = or disjoint i64 %66, 3840
  %add.ptr.15 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %67
  %68 = load i32, ptr addrspace(1) %add.ptr.15, align 1
  %add.ptr21.15 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %67
  %69 = load i32, ptr addrspace(1) %add.ptr21.15, align 1
  %70 = or disjoint i64 %5, %6
  %71 = or disjoint i64 %70, 4096
  %add.ptr.16 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %71
  %72 = load i32, ptr addrspace(1) %add.ptr.16, align 1
  %add.ptr21.16 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %71
  %73 = load i32, ptr addrspace(1) %add.ptr21.16, align 1
  %74 = or disjoint i64 %5, %6
  %75 = or disjoint i64 %74, 4352
  %add.ptr.17 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %75
  %76 = load i32, ptr addrspace(1) %add.ptr.17, align 1
  %add.ptr21.17 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %75
  %77 = load i32, ptr addrspace(1) %add.ptr21.17, align 1
  %cmp25104 = icmp sgt i32 %iterations, 0
  br i1 %cmp25104, label %for.cond30.preheader, label %for.cond49.preheader

for.cond30.preheader:                             ; preds = %entry, %for.cond30.preheader
  %sums.sroa.70.0 = phi <4 x i32> [ %95, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.66.0 = phi <4 x i32> [ %94, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.62.0 = phi <4 x i32> [ %93, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.58.0 = phi <4 x i32> [ %92, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.54.0 = phi <4 x i32> [ %91, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.50.0 = phi <4 x i32> [ %90, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.46.0 = phi <4 x i32> [ %89, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.42.0 = phi <4 x i32> [ %88, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.38.0 = phi <4 x i32> [ %87, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.34.0 = phi <4 x i32> [ %86, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.30.0 = phi <4 x i32> [ %85, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.26.0 = phi <4 x i32> [ %84, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.22.0 = phi <4 x i32> [ %83, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.18.0 = phi <4 x i32> [ %82, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.14.0 = phi <4 x i32> [ %81, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.10.0 = phi <4 x i32> [ %80, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.6.0 = phi <4 x i32> [ %79, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.0.0 = phi <4 x i32> [ %78, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %iteration.0105 = phi i32 [ %inc46, %for.cond30.preheader ], [ 0, %entry ]
  %78 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %8, i32 %9, <4 x i32> %sums.sroa.0.0), !call_argsrelate !27
  %79 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %12, i32 %13, <4 x i32> %sums.sroa.6.0), !call_argsrelate !27
  %80 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %16, i32 %17, <4 x i32> %sums.sroa.10.0), !call_argsrelate !27
  %81 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %20, i32 %21, <4 x i32> %sums.sroa.14.0), !call_argsrelate !27
  %82 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %24, i32 %25, <4 x i32> %sums.sroa.18.0), !call_argsrelate !27
  %83 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %28, i32 %29, <4 x i32> %sums.sroa.22.0), !call_argsrelate !27
  %84 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %32, i32 %33, <4 x i32> %sums.sroa.26.0), !call_argsrelate !27
  %85 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %36, i32 %37, <4 x i32> %sums.sroa.30.0), !call_argsrelate !27
  %86 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %40, i32 %41, <4 x i32> %sums.sroa.34.0), !call_argsrelate !27
  %87 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %44, i32 %45, <4 x i32> %sums.sroa.38.0), !call_argsrelate !27
  %88 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %48, i32 %49, <4 x i32> %sums.sroa.42.0), !call_argsrelate !27
  %89 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %52, i32 %53, <4 x i32> %sums.sroa.46.0), !call_argsrelate !27
  %90 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %56, i32 %57, <4 x i32> %sums.sroa.50.0), !call_argsrelate !27
  %91 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %60, i32 %61, <4 x i32> %sums.sroa.54.0), !call_argsrelate !27
  %92 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %64, i32 %65, <4 x i32> %sums.sroa.58.0), !call_argsrelate !27
  %93 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %68, i32 %69, <4 x i32> %sums.sroa.62.0), !call_argsrelate !27
  %94 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %72, i32 %73, <4 x i32> %sums.sroa.66.0), !call_argsrelate !27
  %95 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %76, i32 %77, <4 x i32> %sums.sroa.70.0), !call_argsrelate !27
  %inc46 = add nuw nsw i32 %iteration.0105, 1
  %exitcond.not = icmp eq i32 %inc46, %iterations
  br i1 %exitcond.not, label %for.cond49.preheader, label %for.cond30.preheader, !llvm.loop !35

for.cond49.preheader:                             ; preds = %for.cond30.preheader, %entry
  %sums.sroa.70.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %95, %for.cond30.preheader ]
  %sums.sroa.66.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %94, %for.cond30.preheader ]
  %sums.sroa.62.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %93, %for.cond30.preheader ]
  %sums.sroa.58.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %92, %for.cond30.preheader ]
  %sums.sroa.54.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %91, %for.cond30.preheader ]
  %sums.sroa.50.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %90, %for.cond30.preheader ]
  %sums.sroa.46.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %89, %for.cond30.preheader ]
  %sums.sroa.42.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %88, %for.cond30.preheader ]
  %sums.sroa.38.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %87, %for.cond30.preheader ]
  %sums.sroa.34.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %86, %for.cond30.preheader ]
  %sums.sroa.30.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %85, %for.cond30.preheader ]
  %sums.sroa.26.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %84, %for.cond30.preheader ]
  %sums.sroa.22.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %83, %for.cond30.preheader ]
  %sums.sroa.18.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %82, %for.cond30.preheader ]
  %sums.sroa.14.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %81, %for.cond30.preheader ]
  %sums.sroa.10.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %80, %for.cond30.preheader ]
  %sums.sroa.6.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %79, %for.cond30.preheader ]
  %sums.sroa.0.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %78, %for.cond30.preheader ]
  %96 = lshr i16 %3, 6
  %conv7 = zext nneg i16 %96 to i64
  %97 = tail call noundef range(i32 0, 2147483647) i32 @llvm.mxc.block.id.x(), !range !15
  %conv = zext nneg i32 %97 to i64
  %mul = mul nuw nsw i64 %conv7, %conv
  %div9100 = lshr i32 %0, 6
  %conv10 = zext nneg i32 %div9100 to i64
  %add = add nuw nsw i64 %mul, %conv10
  %conv70 = zext nneg i32 %rem11 to i64
  %mul56 = mul nuw nsw i64 %add, 4608
  %vecext = extractelement <4 x i32> %sums.sroa.0.1, i64 0
  %98 = shl nuw nsw i64 %6, 4
  %add69 = or disjoint i64 %mul56, %98
  %add71 = or disjoint i64 %add69, %conv70
  %arrayidx72 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71
  store i32 %vecext, ptr addrspace(1) %arrayidx72, align 4, !tbaa !16
  %vecext.1 = extractelement <4 x i32> %sums.sroa.0.1, i64 1
  %99 = shl nuw nsw i64 %6, 4
  %100 = or disjoint i64 %99, 16
  %add69.1 = or disjoint i64 %mul56, %100
  %add71.1 = or disjoint i64 %add69.1, %conv70
  %arrayidx72.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1
  store i32 %vecext.1, ptr addrspace(1) %arrayidx72.1, align 4, !tbaa !16
  %vecext.2 = extractelement <4 x i32> %sums.sroa.0.1, i64 2
  %101 = shl nuw nsw i64 %6, 4
  %102 = or disjoint i64 %101, 32
  %add69.2 = or disjoint i64 %mul56, %102
  %add71.2 = or disjoint i64 %add69.2, %conv70
  %arrayidx72.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2
  store i32 %vecext.2, ptr addrspace(1) %arrayidx72.2, align 4, !tbaa !16
  %vecext.3 = extractelement <4 x i32> %sums.sroa.0.1, i64 3
  %103 = shl nuw nsw i64 %6, 4
  %104 = or disjoint i64 %103, 48
  %add69.3 = or disjoint i64 %mul56, %104
  %add71.3 = or disjoint i64 %add69.3, %conv70
  %arrayidx72.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3
  store i32 %vecext.3, ptr addrspace(1) %arrayidx72.3, align 4, !tbaa !16
  %add55.1 = mul nuw nsw i64 %add, 4608
  %mul56.1 = or disjoint i64 %add55.1, 256
  %vecext.1118 = extractelement <4 x i32> %sums.sroa.6.1, i64 0
  %add69.1119 = or disjoint i64 %mul56.1, %98
  %add71.1120 = or disjoint i64 %add69.1119, %conv70
  %arrayidx72.1121 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1120
  store i32 %vecext.1118, ptr addrspace(1) %arrayidx72.1121, align 4, !tbaa !16
  %vecext.1.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 1
  %add69.1.1 = or disjoint i64 %mul56.1, %100
  %add71.1.1 = or disjoint i64 %add69.1.1, %conv70
  %arrayidx72.1.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.1
  store i32 %vecext.1.1, ptr addrspace(1) %arrayidx72.1.1, align 4, !tbaa !16
  %vecext.2.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 2
  %add69.2.1 = or disjoint i64 %mul56.1, %102
  %add71.2.1 = or disjoint i64 %add69.2.1, %conv70
  %arrayidx72.2.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.1
  store i32 %vecext.2.1, ptr addrspace(1) %arrayidx72.2.1, align 4, !tbaa !16
  %vecext.3.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 3
  %add69.3.1 = or disjoint i64 %mul56.1, %104
  %add71.3.1 = or disjoint i64 %add69.3.1, %conv70
  %arrayidx72.3.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.1
  store i32 %vecext.3.1, ptr addrspace(1) %arrayidx72.3.1, align 4, !tbaa !16
  %add55.2 = mul nuw nsw i64 %add, 4608
  %mul56.2 = add nuw nsw i64 %add55.2, 512
  %vecext.2122 = extractelement <4 x i32> %sums.sroa.10.1, i64 0
  %add69.2123 = or disjoint i64 %mul56.2, %98
  %add71.2124 = or disjoint i64 %add69.2123, %conv70
  %arrayidx72.2125 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2124
  store i32 %vecext.2122, ptr addrspace(1) %arrayidx72.2125, align 4, !tbaa !16
  %vecext.1.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 1
  %add69.1.2 = or disjoint i64 %mul56.2, %100
  %add71.1.2 = or disjoint i64 %add69.1.2, %conv70
  %arrayidx72.1.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.2
  store i32 %vecext.1.2, ptr addrspace(1) %arrayidx72.1.2, align 4, !tbaa !16
  %vecext.2.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 2
  %add69.2.2 = or disjoint i64 %mul56.2, %102
  %add71.2.2 = or disjoint i64 %add69.2.2, %conv70
  %arrayidx72.2.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.2
  store i32 %vecext.2.2, ptr addrspace(1) %arrayidx72.2.2, align 4, !tbaa !16
  %vecext.3.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 3
  %add69.3.2 = or disjoint i64 %mul56.2, %104
  %add71.3.2 = or disjoint i64 %add69.3.2, %conv70
  %arrayidx72.3.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.2
  store i32 %vecext.3.2, ptr addrspace(1) %arrayidx72.3.2, align 4, !tbaa !16
  %add55.3 = mul nuw nsw i64 %add, 4608
  %mul56.3 = add nuw nsw i64 %add55.3, 768
  %vecext.3126 = extractelement <4 x i32> %sums.sroa.14.1, i64 0
  %add69.3127 = or disjoint i64 %mul56.3, %98
  %add71.3128 = or disjoint i64 %add69.3127, %conv70
  %arrayidx72.3129 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3128
  store i32 %vecext.3126, ptr addrspace(1) %arrayidx72.3129, align 4, !tbaa !16
  %vecext.1.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 1
  %add69.1.3 = or disjoint i64 %mul56.3, %100
  %add71.1.3 = or disjoint i64 %add69.1.3, %conv70
  %arrayidx72.1.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.3
  store i32 %vecext.1.3, ptr addrspace(1) %arrayidx72.1.3, align 4, !tbaa !16
  %vecext.2.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 2
  %add69.2.3 = or disjoint i64 %mul56.3, %102
  %add71.2.3 = or disjoint i64 %add69.2.3, %conv70
  %arrayidx72.2.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.3
  store i32 %vecext.2.3, ptr addrspace(1) %arrayidx72.2.3, align 4, !tbaa !16
  %vecext.3.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 3
  %add69.3.3 = or disjoint i64 %mul56.3, %104
  %add71.3.3 = or disjoint i64 %add69.3.3, %conv70
  %arrayidx72.3.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.3
  store i32 %vecext.3.3, ptr addrspace(1) %arrayidx72.3.3, align 4, !tbaa !16
  %add55.4 = mul nuw nsw i64 %add, 4608
  %mul56.4 = add nuw nsw i64 %add55.4, 1024
  %vecext.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 0
  %add69.4 = or disjoint i64 %mul56.4, %98
  %add71.4 = or disjoint i64 %add69.4, %conv70
  %arrayidx72.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.4
  store i32 %vecext.4, ptr addrspace(1) %arrayidx72.4, align 4, !tbaa !16
  %vecext.1.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 1
  %add69.1.4 = or disjoint i64 %mul56.4, %100
  %add71.1.4 = or disjoint i64 %add69.1.4, %conv70
  %arrayidx72.1.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.4
  store i32 %vecext.1.4, ptr addrspace(1) %arrayidx72.1.4, align 4, !tbaa !16
  %vecext.2.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 2
  %add69.2.4 = or disjoint i64 %mul56.4, %102
  %add71.2.4 = or disjoint i64 %add69.2.4, %conv70
  %arrayidx72.2.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.4
  store i32 %vecext.2.4, ptr addrspace(1) %arrayidx72.2.4, align 4, !tbaa !16
  %vecext.3.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 3
  %add69.3.4 = or disjoint i64 %mul56.4, %104
  %add71.3.4 = or disjoint i64 %add69.3.4, %conv70
  %arrayidx72.3.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.4
  store i32 %vecext.3.4, ptr addrspace(1) %arrayidx72.3.4, align 4, !tbaa !16
  %add55.5 = mul nuw nsw i64 %add, 4608
  %mul56.5 = add nuw nsw i64 %add55.5, 1280
  %vecext.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 0
  %add69.5 = or disjoint i64 %mul56.5, %98
  %add71.5 = or disjoint i64 %add69.5, %conv70
  %arrayidx72.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.5
  store i32 %vecext.5, ptr addrspace(1) %arrayidx72.5, align 4, !tbaa !16
  %vecext.1.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 1
  %add69.1.5 = or disjoint i64 %mul56.5, %100
  %add71.1.5 = or disjoint i64 %add69.1.5, %conv70
  %arrayidx72.1.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.5
  store i32 %vecext.1.5, ptr addrspace(1) %arrayidx72.1.5, align 4, !tbaa !16
  %vecext.2.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 2
  %add69.2.5 = or disjoint i64 %mul56.5, %102
  %add71.2.5 = or disjoint i64 %add69.2.5, %conv70
  %arrayidx72.2.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.5
  store i32 %vecext.2.5, ptr addrspace(1) %arrayidx72.2.5, align 4, !tbaa !16
  %vecext.3.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 3
  %add69.3.5 = or disjoint i64 %mul56.5, %104
  %add71.3.5 = or disjoint i64 %add69.3.5, %conv70
  %arrayidx72.3.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.5
  store i32 %vecext.3.5, ptr addrspace(1) %arrayidx72.3.5, align 4, !tbaa !16
  %add55.6 = mul nuw nsw i64 %add, 4608
  %mul56.6 = add nuw nsw i64 %add55.6, 1536
  %vecext.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 0
  %add69.6 = or disjoint i64 %mul56.6, %98
  %add71.6 = or disjoint i64 %add69.6, %conv70
  %arrayidx72.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.6
  store i32 %vecext.6, ptr addrspace(1) %arrayidx72.6, align 4, !tbaa !16
  %vecext.1.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 1
  %add69.1.6 = or disjoint i64 %mul56.6, %100
  %add71.1.6 = or disjoint i64 %add69.1.6, %conv70
  %arrayidx72.1.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.6
  store i32 %vecext.1.6, ptr addrspace(1) %arrayidx72.1.6, align 4, !tbaa !16
  %vecext.2.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 2
  %add69.2.6 = or disjoint i64 %mul56.6, %102
  %add71.2.6 = or disjoint i64 %add69.2.6, %conv70
  %arrayidx72.2.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.6
  store i32 %vecext.2.6, ptr addrspace(1) %arrayidx72.2.6, align 4, !tbaa !16
  %vecext.3.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 3
  %add69.3.6 = or disjoint i64 %mul56.6, %104
  %add71.3.6 = or disjoint i64 %add69.3.6, %conv70
  %arrayidx72.3.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.6
  store i32 %vecext.3.6, ptr addrspace(1) %arrayidx72.3.6, align 4, !tbaa !16
  %add55.7 = mul nuw nsw i64 %add, 4608
  %mul56.7 = add nuw nsw i64 %add55.7, 1792
  %vecext.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 0
  %add69.7 = or disjoint i64 %mul56.7, %98
  %add71.7 = or disjoint i64 %add69.7, %conv70
  %arrayidx72.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.7
  store i32 %vecext.7, ptr addrspace(1) %arrayidx72.7, align 4, !tbaa !16
  %vecext.1.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 1
  %add69.1.7 = or disjoint i64 %mul56.7, %100
  %add71.1.7 = or disjoint i64 %add69.1.7, %conv70
  %arrayidx72.1.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.7
  store i32 %vecext.1.7, ptr addrspace(1) %arrayidx72.1.7, align 4, !tbaa !16
  %vecext.2.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 2
  %add69.2.7 = or disjoint i64 %mul56.7, %102
  %add71.2.7 = or disjoint i64 %add69.2.7, %conv70
  %arrayidx72.2.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.7
  store i32 %vecext.2.7, ptr addrspace(1) %arrayidx72.2.7, align 4, !tbaa !16
  %vecext.3.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 3
  %add69.3.7 = or disjoint i64 %mul56.7, %104
  %add71.3.7 = or disjoint i64 %add69.3.7, %conv70
  %arrayidx72.3.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.7
  store i32 %vecext.3.7, ptr addrspace(1) %arrayidx72.3.7, align 4, !tbaa !16
  %add55.8 = mul nuw nsw i64 %add, 4608
  %mul56.8 = add nuw nsw i64 %add55.8, 2048
  %vecext.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 0
  %add69.8 = or disjoint i64 %mul56.8, %98
  %add71.8 = or disjoint i64 %add69.8, %conv70
  %arrayidx72.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.8
  store i32 %vecext.8, ptr addrspace(1) %arrayidx72.8, align 4, !tbaa !16
  %vecext.1.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 1
  %add69.1.8 = or disjoint i64 %mul56.8, %100
  %add71.1.8 = or disjoint i64 %add69.1.8, %conv70
  %arrayidx72.1.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.8
  store i32 %vecext.1.8, ptr addrspace(1) %arrayidx72.1.8, align 4, !tbaa !16
  %vecext.2.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 2
  %add69.2.8 = or disjoint i64 %mul56.8, %102
  %add71.2.8 = or disjoint i64 %add69.2.8, %conv70
  %arrayidx72.2.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.8
  store i32 %vecext.2.8, ptr addrspace(1) %arrayidx72.2.8, align 4, !tbaa !16
  %vecext.3.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 3
  %add69.3.8 = or disjoint i64 %mul56.8, %104
  %add71.3.8 = or disjoint i64 %add69.3.8, %conv70
  %arrayidx72.3.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.8
  store i32 %vecext.3.8, ptr addrspace(1) %arrayidx72.3.8, align 4, !tbaa !16
  %add55.9 = mul nuw nsw i64 %add, 4608
  %mul56.9 = add nuw nsw i64 %add55.9, 2304
  %vecext.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 0
  %add69.9 = or disjoint i64 %mul56.9, %98
  %add71.9 = or disjoint i64 %add69.9, %conv70
  %arrayidx72.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.9
  store i32 %vecext.9, ptr addrspace(1) %arrayidx72.9, align 4, !tbaa !16
  %vecext.1.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 1
  %add69.1.9 = or disjoint i64 %mul56.9, %100
  %add71.1.9 = or disjoint i64 %add69.1.9, %conv70
  %arrayidx72.1.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.9
  store i32 %vecext.1.9, ptr addrspace(1) %arrayidx72.1.9, align 4, !tbaa !16
  %vecext.2.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 2
  %add69.2.9 = or disjoint i64 %mul56.9, %102
  %add71.2.9 = or disjoint i64 %add69.2.9, %conv70
  %arrayidx72.2.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.9
  store i32 %vecext.2.9, ptr addrspace(1) %arrayidx72.2.9, align 4, !tbaa !16
  %vecext.3.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 3
  %add69.3.9 = or disjoint i64 %mul56.9, %104
  %add71.3.9 = or disjoint i64 %add69.3.9, %conv70
  %arrayidx72.3.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.9
  store i32 %vecext.3.9, ptr addrspace(1) %arrayidx72.3.9, align 4, !tbaa !16
  %add55.10 = mul nuw nsw i64 %add, 4608
  %mul56.10 = add nuw nsw i64 %add55.10, 2560
  %vecext.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 0
  %add69.10 = or disjoint i64 %mul56.10, %98
  %add71.10 = or disjoint i64 %add69.10, %conv70
  %arrayidx72.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.10
  store i32 %vecext.10, ptr addrspace(1) %arrayidx72.10, align 4, !tbaa !16
  %vecext.1.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 1
  %add69.1.10 = or disjoint i64 %mul56.10, %100
  %add71.1.10 = or disjoint i64 %add69.1.10, %conv70
  %arrayidx72.1.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.10
  store i32 %vecext.1.10, ptr addrspace(1) %arrayidx72.1.10, align 4, !tbaa !16
  %vecext.2.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 2
  %add69.2.10 = or disjoint i64 %mul56.10, %102
  %add71.2.10 = or disjoint i64 %add69.2.10, %conv70
  %arrayidx72.2.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.10
  store i32 %vecext.2.10, ptr addrspace(1) %arrayidx72.2.10, align 4, !tbaa !16
  %vecext.3.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 3
  %add69.3.10 = or disjoint i64 %mul56.10, %104
  %add71.3.10 = or disjoint i64 %add69.3.10, %conv70
  %arrayidx72.3.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.10
  store i32 %vecext.3.10, ptr addrspace(1) %arrayidx72.3.10, align 4, !tbaa !16
  %add55.11 = mul nuw nsw i64 %add, 4608
  %mul56.11 = add nuw nsw i64 %add55.11, 2816
  %vecext.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 0
  %add69.11 = or disjoint i64 %mul56.11, %98
  %add71.11 = or disjoint i64 %add69.11, %conv70
  %arrayidx72.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.11
  store i32 %vecext.11, ptr addrspace(1) %arrayidx72.11, align 4, !tbaa !16
  %vecext.1.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 1
  %add69.1.11 = or disjoint i64 %mul56.11, %100
  %add71.1.11 = or disjoint i64 %add69.1.11, %conv70
  %arrayidx72.1.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.11
  store i32 %vecext.1.11, ptr addrspace(1) %arrayidx72.1.11, align 4, !tbaa !16
  %vecext.2.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 2
  %add69.2.11 = or disjoint i64 %mul56.11, %102
  %add71.2.11 = or disjoint i64 %add69.2.11, %conv70
  %arrayidx72.2.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.11
  store i32 %vecext.2.11, ptr addrspace(1) %arrayidx72.2.11, align 4, !tbaa !16
  %vecext.3.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 3
  %add69.3.11 = or disjoint i64 %mul56.11, %104
  %add71.3.11 = or disjoint i64 %add69.3.11, %conv70
  %arrayidx72.3.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.11
  store i32 %vecext.3.11, ptr addrspace(1) %arrayidx72.3.11, align 4, !tbaa !16
  %add55.12 = mul nuw nsw i64 %add, 4608
  %mul56.12 = add nuw nsw i64 %add55.12, 3072
  %vecext.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 0
  %add69.12 = or disjoint i64 %mul56.12, %98
  %add71.12 = or disjoint i64 %add69.12, %conv70
  %arrayidx72.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.12
  store i32 %vecext.12, ptr addrspace(1) %arrayidx72.12, align 4, !tbaa !16
  %vecext.1.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 1
  %add69.1.12 = or disjoint i64 %mul56.12, %100
  %add71.1.12 = or disjoint i64 %add69.1.12, %conv70
  %arrayidx72.1.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.12
  store i32 %vecext.1.12, ptr addrspace(1) %arrayidx72.1.12, align 4, !tbaa !16
  %vecext.2.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 2
  %add69.2.12 = or disjoint i64 %mul56.12, %102
  %add71.2.12 = or disjoint i64 %add69.2.12, %conv70
  %arrayidx72.2.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.12
  store i32 %vecext.2.12, ptr addrspace(1) %arrayidx72.2.12, align 4, !tbaa !16
  %vecext.3.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 3
  %add69.3.12 = or disjoint i64 %mul56.12, %104
  %add71.3.12 = or disjoint i64 %add69.3.12, %conv70
  %arrayidx72.3.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.12
  store i32 %vecext.3.12, ptr addrspace(1) %arrayidx72.3.12, align 4, !tbaa !16
  %add55.13 = mul nuw nsw i64 %add, 4608
  %mul56.13 = add nuw nsw i64 %add55.13, 3328
  %vecext.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 0
  %add69.13 = or disjoint i64 %mul56.13, %98
  %add71.13 = or disjoint i64 %add69.13, %conv70
  %arrayidx72.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.13
  store i32 %vecext.13, ptr addrspace(1) %arrayidx72.13, align 4, !tbaa !16
  %vecext.1.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 1
  %add69.1.13 = or disjoint i64 %mul56.13, %100
  %add71.1.13 = or disjoint i64 %add69.1.13, %conv70
  %arrayidx72.1.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.13
  store i32 %vecext.1.13, ptr addrspace(1) %arrayidx72.1.13, align 4, !tbaa !16
  %vecext.2.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 2
  %add69.2.13 = or disjoint i64 %mul56.13, %102
  %add71.2.13 = or disjoint i64 %add69.2.13, %conv70
  %arrayidx72.2.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.13
  store i32 %vecext.2.13, ptr addrspace(1) %arrayidx72.2.13, align 4, !tbaa !16
  %vecext.3.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 3
  %add69.3.13 = or disjoint i64 %mul56.13, %104
  %add71.3.13 = or disjoint i64 %add69.3.13, %conv70
  %arrayidx72.3.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.13
  store i32 %vecext.3.13, ptr addrspace(1) %arrayidx72.3.13, align 4, !tbaa !16
  %add55.14 = mul nuw nsw i64 %add, 4608
  %mul56.14 = add nuw nsw i64 %add55.14, 3584
  %vecext.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 0
  %add69.14 = or disjoint i64 %mul56.14, %98
  %add71.14 = or disjoint i64 %add69.14, %conv70
  %arrayidx72.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.14
  store i32 %vecext.14, ptr addrspace(1) %arrayidx72.14, align 4, !tbaa !16
  %vecext.1.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 1
  %add69.1.14 = or disjoint i64 %mul56.14, %100
  %add71.1.14 = or disjoint i64 %add69.1.14, %conv70
  %arrayidx72.1.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.14
  store i32 %vecext.1.14, ptr addrspace(1) %arrayidx72.1.14, align 4, !tbaa !16
  %vecext.2.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 2
  %add69.2.14 = or disjoint i64 %mul56.14, %102
  %add71.2.14 = or disjoint i64 %add69.2.14, %conv70
  %arrayidx72.2.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.14
  store i32 %vecext.2.14, ptr addrspace(1) %arrayidx72.2.14, align 4, !tbaa !16
  %vecext.3.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 3
  %add69.3.14 = or disjoint i64 %mul56.14, %104
  %add71.3.14 = or disjoint i64 %add69.3.14, %conv70
  %arrayidx72.3.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.14
  store i32 %vecext.3.14, ptr addrspace(1) %arrayidx72.3.14, align 4, !tbaa !16
  %add55.15 = mul nuw nsw i64 %add, 4608
  %mul56.15 = add nuw nsw i64 %add55.15, 3840
  %vecext.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 0
  %add69.15 = or disjoint i64 %mul56.15, %98
  %add71.15 = or disjoint i64 %add69.15, %conv70
  %arrayidx72.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.15
  store i32 %vecext.15, ptr addrspace(1) %arrayidx72.15, align 4, !tbaa !16
  %vecext.1.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 1
  %add69.1.15 = or disjoint i64 %mul56.15, %100
  %add71.1.15 = or disjoint i64 %add69.1.15, %conv70
  %arrayidx72.1.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.15
  store i32 %vecext.1.15, ptr addrspace(1) %arrayidx72.1.15, align 4, !tbaa !16
  %vecext.2.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 2
  %add69.2.15 = or disjoint i64 %mul56.15, %102
  %add71.2.15 = or disjoint i64 %add69.2.15, %conv70
  %arrayidx72.2.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.15
  store i32 %vecext.2.15, ptr addrspace(1) %arrayidx72.2.15, align 4, !tbaa !16
  %vecext.3.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 3
  %add69.3.15 = or disjoint i64 %mul56.15, %104
  %add71.3.15 = or disjoint i64 %add69.3.15, %conv70
  %arrayidx72.3.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.15
  store i32 %vecext.3.15, ptr addrspace(1) %arrayidx72.3.15, align 4, !tbaa !16
  %add55.16 = mul nuw nsw i64 %add, 4608
  %mul56.16 = add nuw nsw i64 %add55.16, 4096
  %vecext.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 0
  %add69.16 = or disjoint i64 %mul56.16, %98
  %add71.16 = or disjoint i64 %add69.16, %conv70
  %arrayidx72.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.16
  store i32 %vecext.16, ptr addrspace(1) %arrayidx72.16, align 4, !tbaa !16
  %vecext.1.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 1
  %add69.1.16 = or disjoint i64 %mul56.16, %100
  %add71.1.16 = or disjoint i64 %add69.1.16, %conv70
  %arrayidx72.1.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.16
  store i32 %vecext.1.16, ptr addrspace(1) %arrayidx72.1.16, align 4, !tbaa !16
  %vecext.2.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 2
  %add69.2.16 = or disjoint i64 %mul56.16, %102
  %add71.2.16 = or disjoint i64 %add69.2.16, %conv70
  %arrayidx72.2.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.16
  store i32 %vecext.2.16, ptr addrspace(1) %arrayidx72.2.16, align 4, !tbaa !16
  %vecext.3.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 3
  %add69.3.16 = or disjoint i64 %mul56.16, %104
  %add71.3.16 = or disjoint i64 %add69.3.16, %conv70
  %arrayidx72.3.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.16
  store i32 %vecext.3.16, ptr addrspace(1) %arrayidx72.3.16, align 4, !tbaa !16
  %add55.17 = mul nuw nsw i64 %add, 4608
  %mul56.17 = add nuw nsw i64 %add55.17, 4352
  %vecext.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 0
  %add69.17 = or disjoint i64 %mul56.17, %98
  %add71.17 = or disjoint i64 %add69.17, %conv70
  %arrayidx72.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.17
  store i32 %vecext.17, ptr addrspace(1) %arrayidx72.17, align 4, !tbaa !16
  %vecext.1.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 1
  %add69.1.17 = or disjoint i64 %mul56.17, %100
  %add71.1.17 = or disjoint i64 %add69.1.17, %conv70
  %arrayidx72.1.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.17
  store i32 %vecext.1.17, ptr addrspace(1) %arrayidx72.1.17, align 4, !tbaa !16
  %vecext.2.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 2
  %add69.2.17 = or disjoint i64 %mul56.17, %102
  %add71.2.17 = or disjoint i64 %add69.2.17, %conv70
  %arrayidx72.2.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.17
  store i32 %vecext.2.17, ptr addrspace(1) %arrayidx72.2.17, align 4, !tbaa !16
  %vecext.3.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 3
  %add69.3.17 = or disjoint i64 %mul56.17, %104
  %add71.3.17 = or disjoint i64 %add69.3.17, %conv70
  %arrayidx72.3.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.17
  store i32 %vecext.3.17, ptr addrspace(1) %arrayidx72.3.17, align 4, !tbaa !16
  ret void
}

; Function Attrs: convergent mustprogress nofree norecurse nounwind memory(argmem: readwrite)
define protected metaxgpu_kernel void @_Z13mmaPeakKernelILi19EEvPKaS1_Pii(ptr addrspace(1) noalias nocapture noundef readonly %a.coerce, ptr addrspace(1) noalias nocapture noundef readonly %b.coerce, ptr addrspace(1) noalias noundef writeonly %c.coerce, i32 noundef %iterations) local_unnamed_addr #3 comdat {
entry:
  %0 = tail call noundef range(i32 0, 1024) i32 @llvm.mxc.thread.id.x(), !range !25
  %1 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.mxc.dispatch.ptr()
  %2 = getelementptr inbounds i8, ptr addrspace(4) %1, i64 4
  %3 = load i16, ptr addrspace(4) %2, align 4, !range !26, !invariant.load !14
  %rem11 = and i32 %0, 15
  %4 = lshr i32 %0, 2
  %mul13 = and i32 %4, 12
  %mul15 = shl nuw nsw i32 %rem11, 4
  %5 = zext nneg i32 %mul15 to i64
  %6 = zext nneg i32 %mul13 to i64
  %7 = or disjoint i64 %5, %6
  %add.ptr = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %7
  %8 = load i32, ptr addrspace(1) %add.ptr, align 1
  %add.ptr21 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %7
  %9 = load i32, ptr addrspace(1) %add.ptr21, align 1
  %10 = or disjoint i64 %5, %6
  %11 = or disjoint i64 %10, 256
  %add.ptr.1 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %11
  %12 = load i32, ptr addrspace(1) %add.ptr.1, align 1
  %add.ptr21.1 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %11
  %13 = load i32, ptr addrspace(1) %add.ptr21.1, align 1
  %14 = or disjoint i64 %5, %6
  %15 = or disjoint i64 %14, 512
  %add.ptr.2 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %15
  %16 = load i32, ptr addrspace(1) %add.ptr.2, align 1
  %add.ptr21.2 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %15
  %17 = load i32, ptr addrspace(1) %add.ptr21.2, align 1
  %18 = or disjoint i64 %5, %6
  %19 = or disjoint i64 %18, 768
  %add.ptr.3 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %19
  %20 = load i32, ptr addrspace(1) %add.ptr.3, align 1
  %add.ptr21.3 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %19
  %21 = load i32, ptr addrspace(1) %add.ptr21.3, align 1
  %22 = or disjoint i64 %5, %6
  %23 = or disjoint i64 %22, 1024
  %add.ptr.4 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %23
  %24 = load i32, ptr addrspace(1) %add.ptr.4, align 1
  %add.ptr21.4 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %23
  %25 = load i32, ptr addrspace(1) %add.ptr21.4, align 1
  %26 = or disjoint i64 %5, %6
  %27 = or disjoint i64 %26, 1280
  %add.ptr.5 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %27
  %28 = load i32, ptr addrspace(1) %add.ptr.5, align 1
  %add.ptr21.5 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %27
  %29 = load i32, ptr addrspace(1) %add.ptr21.5, align 1
  %30 = or disjoint i64 %5, %6
  %31 = or disjoint i64 %30, 1536
  %add.ptr.6 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %31
  %32 = load i32, ptr addrspace(1) %add.ptr.6, align 1
  %add.ptr21.6 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %31
  %33 = load i32, ptr addrspace(1) %add.ptr21.6, align 1
  %34 = or disjoint i64 %5, %6
  %35 = or disjoint i64 %34, 1792
  %add.ptr.7 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %35
  %36 = load i32, ptr addrspace(1) %add.ptr.7, align 1
  %add.ptr21.7 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %35
  %37 = load i32, ptr addrspace(1) %add.ptr21.7, align 1
  %38 = or disjoint i64 %5, %6
  %39 = or disjoint i64 %38, 2048
  %add.ptr.8 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %39
  %40 = load i32, ptr addrspace(1) %add.ptr.8, align 1
  %add.ptr21.8 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %39
  %41 = load i32, ptr addrspace(1) %add.ptr21.8, align 1
  %42 = or disjoint i64 %5, %6
  %43 = or disjoint i64 %42, 2304
  %add.ptr.9 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %43
  %44 = load i32, ptr addrspace(1) %add.ptr.9, align 1
  %add.ptr21.9 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %43
  %45 = load i32, ptr addrspace(1) %add.ptr21.9, align 1
  %46 = or disjoint i64 %5, %6
  %47 = or disjoint i64 %46, 2560
  %add.ptr.10 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %47
  %48 = load i32, ptr addrspace(1) %add.ptr.10, align 1
  %add.ptr21.10 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %47
  %49 = load i32, ptr addrspace(1) %add.ptr21.10, align 1
  %50 = or disjoint i64 %5, %6
  %51 = or disjoint i64 %50, 2816
  %add.ptr.11 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %51
  %52 = load i32, ptr addrspace(1) %add.ptr.11, align 1
  %add.ptr21.11 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %51
  %53 = load i32, ptr addrspace(1) %add.ptr21.11, align 1
  %54 = or disjoint i64 %5, %6
  %55 = or disjoint i64 %54, 3072
  %add.ptr.12 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %55
  %56 = load i32, ptr addrspace(1) %add.ptr.12, align 1
  %add.ptr21.12 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %55
  %57 = load i32, ptr addrspace(1) %add.ptr21.12, align 1
  %58 = or disjoint i64 %5, %6
  %59 = or disjoint i64 %58, 3328
  %add.ptr.13 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %59
  %60 = load i32, ptr addrspace(1) %add.ptr.13, align 1
  %add.ptr21.13 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %59
  %61 = load i32, ptr addrspace(1) %add.ptr21.13, align 1
  %62 = or disjoint i64 %5, %6
  %63 = or disjoint i64 %62, 3584
  %add.ptr.14 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %63
  %64 = load i32, ptr addrspace(1) %add.ptr.14, align 1
  %add.ptr21.14 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %63
  %65 = load i32, ptr addrspace(1) %add.ptr21.14, align 1
  %66 = or disjoint i64 %5, %6
  %67 = or disjoint i64 %66, 3840
  %add.ptr.15 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %67
  %68 = load i32, ptr addrspace(1) %add.ptr.15, align 1
  %add.ptr21.15 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %67
  %69 = load i32, ptr addrspace(1) %add.ptr21.15, align 1
  %70 = or disjoint i64 %5, %6
  %71 = or disjoint i64 %70, 4096
  %add.ptr.16 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %71
  %72 = load i32, ptr addrspace(1) %add.ptr.16, align 1
  %add.ptr21.16 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %71
  %73 = load i32, ptr addrspace(1) %add.ptr21.16, align 1
  %74 = or disjoint i64 %5, %6
  %75 = or disjoint i64 %74, 4352
  %add.ptr.17 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %75
  %76 = load i32, ptr addrspace(1) %add.ptr.17, align 1
  %add.ptr21.17 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %75
  %77 = load i32, ptr addrspace(1) %add.ptr21.17, align 1
  %78 = or disjoint i64 %5, %6
  %79 = or disjoint i64 %78, 4608
  %add.ptr.18 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %79
  %80 = load i32, ptr addrspace(1) %add.ptr.18, align 1
  %add.ptr21.18 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %79
  %81 = load i32, ptr addrspace(1) %add.ptr21.18, align 1
  %cmp25104 = icmp sgt i32 %iterations, 0
  br i1 %cmp25104, label %for.cond30.preheader, label %for.cond49.preheader

for.cond30.preheader:                             ; preds = %entry, %for.cond30.preheader
  %sums.sroa.74.0 = phi <4 x i32> [ %100, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.70.0 = phi <4 x i32> [ %99, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.66.0 = phi <4 x i32> [ %98, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.62.0 = phi <4 x i32> [ %97, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.58.0 = phi <4 x i32> [ %96, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.54.0 = phi <4 x i32> [ %95, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.50.0 = phi <4 x i32> [ %94, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.46.0 = phi <4 x i32> [ %93, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.42.0 = phi <4 x i32> [ %92, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.38.0 = phi <4 x i32> [ %91, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.34.0 = phi <4 x i32> [ %90, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.30.0 = phi <4 x i32> [ %89, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.26.0 = phi <4 x i32> [ %88, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.22.0 = phi <4 x i32> [ %87, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.18.0 = phi <4 x i32> [ %86, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.14.0 = phi <4 x i32> [ %85, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.10.0 = phi <4 x i32> [ %84, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.6.0 = phi <4 x i32> [ %83, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.0.0 = phi <4 x i32> [ %82, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %iteration.0105 = phi i32 [ %inc46, %for.cond30.preheader ], [ 0, %entry ]
  %82 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %8, i32 %9, <4 x i32> %sums.sroa.0.0), !call_argsrelate !27
  %83 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %12, i32 %13, <4 x i32> %sums.sroa.6.0), !call_argsrelate !27
  %84 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %16, i32 %17, <4 x i32> %sums.sroa.10.0), !call_argsrelate !27
  %85 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %20, i32 %21, <4 x i32> %sums.sroa.14.0), !call_argsrelate !27
  %86 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %24, i32 %25, <4 x i32> %sums.sroa.18.0), !call_argsrelate !27
  %87 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %28, i32 %29, <4 x i32> %sums.sroa.22.0), !call_argsrelate !27
  %88 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %32, i32 %33, <4 x i32> %sums.sroa.26.0), !call_argsrelate !27
  %89 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %36, i32 %37, <4 x i32> %sums.sroa.30.0), !call_argsrelate !27
  %90 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %40, i32 %41, <4 x i32> %sums.sroa.34.0), !call_argsrelate !27
  %91 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %44, i32 %45, <4 x i32> %sums.sroa.38.0), !call_argsrelate !27
  %92 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %48, i32 %49, <4 x i32> %sums.sroa.42.0), !call_argsrelate !27
  %93 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %52, i32 %53, <4 x i32> %sums.sroa.46.0), !call_argsrelate !27
  %94 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %56, i32 %57, <4 x i32> %sums.sroa.50.0), !call_argsrelate !27
  %95 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %60, i32 %61, <4 x i32> %sums.sroa.54.0), !call_argsrelate !27
  %96 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %64, i32 %65, <4 x i32> %sums.sroa.58.0), !call_argsrelate !27
  %97 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %68, i32 %69, <4 x i32> %sums.sroa.62.0), !call_argsrelate !27
  %98 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %72, i32 %73, <4 x i32> %sums.sroa.66.0), !call_argsrelate !27
  %99 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %76, i32 %77, <4 x i32> %sums.sroa.70.0), !call_argsrelate !27
  %100 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %80, i32 %81, <4 x i32> %sums.sroa.74.0), !call_argsrelate !27
  %inc46 = add nuw nsw i32 %iteration.0105, 1
  %exitcond.not = icmp eq i32 %inc46, %iterations
  br i1 %exitcond.not, label %for.cond49.preheader, label %for.cond30.preheader, !llvm.loop !36

for.cond49.preheader:                             ; preds = %for.cond30.preheader, %entry
  %sums.sroa.74.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %100, %for.cond30.preheader ]
  %sums.sroa.70.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %99, %for.cond30.preheader ]
  %sums.sroa.66.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %98, %for.cond30.preheader ]
  %sums.sroa.62.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %97, %for.cond30.preheader ]
  %sums.sroa.58.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %96, %for.cond30.preheader ]
  %sums.sroa.54.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %95, %for.cond30.preheader ]
  %sums.sroa.50.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %94, %for.cond30.preheader ]
  %sums.sroa.46.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %93, %for.cond30.preheader ]
  %sums.sroa.42.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %92, %for.cond30.preheader ]
  %sums.sroa.38.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %91, %for.cond30.preheader ]
  %sums.sroa.34.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %90, %for.cond30.preheader ]
  %sums.sroa.30.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %89, %for.cond30.preheader ]
  %sums.sroa.26.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %88, %for.cond30.preheader ]
  %sums.sroa.22.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %87, %for.cond30.preheader ]
  %sums.sroa.18.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %86, %for.cond30.preheader ]
  %sums.sroa.14.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %85, %for.cond30.preheader ]
  %sums.sroa.10.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %84, %for.cond30.preheader ]
  %sums.sroa.6.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %83, %for.cond30.preheader ]
  %sums.sroa.0.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %82, %for.cond30.preheader ]
  %101 = lshr i16 %3, 6
  %conv7 = zext nneg i16 %101 to i64
  %102 = tail call noundef range(i32 0, 2147483647) i32 @llvm.mxc.block.id.x(), !range !15
  %conv = zext nneg i32 %102 to i64
  %mul = mul nuw nsw i64 %conv7, %conv
  %div9100 = lshr i32 %0, 6
  %conv10 = zext nneg i32 %div9100 to i64
  %add = add nuw nsw i64 %mul, %conv10
  %conv70 = zext nneg i32 %rem11 to i64
  %mul56 = mul nuw nsw i64 %add, 4864
  %vecext = extractelement <4 x i32> %sums.sroa.0.1, i64 0
  %103 = shl nuw nsw i64 %6, 4
  %add69 = or disjoint i64 %mul56, %103
  %add71 = or disjoint i64 %add69, %conv70
  %arrayidx72 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71
  store i32 %vecext, ptr addrspace(1) %arrayidx72, align 4, !tbaa !16
  %vecext.1 = extractelement <4 x i32> %sums.sroa.0.1, i64 1
  %104 = shl nuw nsw i64 %6, 4
  %105 = or disjoint i64 %104, 16
  %add69.1 = or disjoint i64 %mul56, %105
  %add71.1 = or disjoint i64 %add69.1, %conv70
  %arrayidx72.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1
  store i32 %vecext.1, ptr addrspace(1) %arrayidx72.1, align 4, !tbaa !16
  %vecext.2 = extractelement <4 x i32> %sums.sroa.0.1, i64 2
  %106 = shl nuw nsw i64 %6, 4
  %107 = or disjoint i64 %106, 32
  %add69.2 = or disjoint i64 %mul56, %107
  %add71.2 = or disjoint i64 %add69.2, %conv70
  %arrayidx72.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2
  store i32 %vecext.2, ptr addrspace(1) %arrayidx72.2, align 4, !tbaa !16
  %vecext.3 = extractelement <4 x i32> %sums.sroa.0.1, i64 3
  %108 = shl nuw nsw i64 %6, 4
  %109 = or disjoint i64 %108, 48
  %add69.3 = or disjoint i64 %mul56, %109
  %add71.3 = or disjoint i64 %add69.3, %conv70
  %arrayidx72.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3
  store i32 %vecext.3, ptr addrspace(1) %arrayidx72.3, align 4, !tbaa !16
  %add55.1 = mul nuw nsw i64 %add, 4864
  %mul56.1 = add nuw nsw i64 %add55.1, 256
  %vecext.1118 = extractelement <4 x i32> %sums.sroa.6.1, i64 0
  %add69.1119 = or disjoint i64 %mul56.1, %103
  %add71.1120 = or disjoint i64 %add69.1119, %conv70
  %arrayidx72.1121 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1120
  store i32 %vecext.1118, ptr addrspace(1) %arrayidx72.1121, align 4, !tbaa !16
  %vecext.1.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 1
  %add69.1.1 = or disjoint i64 %mul56.1, %105
  %add71.1.1 = or disjoint i64 %add69.1.1, %conv70
  %arrayidx72.1.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.1
  store i32 %vecext.1.1, ptr addrspace(1) %arrayidx72.1.1, align 4, !tbaa !16
  %vecext.2.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 2
  %add69.2.1 = or disjoint i64 %mul56.1, %107
  %add71.2.1 = or disjoint i64 %add69.2.1, %conv70
  %arrayidx72.2.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.1
  store i32 %vecext.2.1, ptr addrspace(1) %arrayidx72.2.1, align 4, !tbaa !16
  %vecext.3.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 3
  %add69.3.1 = or disjoint i64 %mul56.1, %109
  %add71.3.1 = or disjoint i64 %add69.3.1, %conv70
  %arrayidx72.3.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.1
  store i32 %vecext.3.1, ptr addrspace(1) %arrayidx72.3.1, align 4, !tbaa !16
  %add55.2 = mul nuw nsw i64 %add, 4864
  %mul56.2 = add nuw nsw i64 %add55.2, 512
  %vecext.2122 = extractelement <4 x i32> %sums.sroa.10.1, i64 0
  %add69.2123 = or disjoint i64 %mul56.2, %103
  %add71.2124 = or disjoint i64 %add69.2123, %conv70
  %arrayidx72.2125 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2124
  store i32 %vecext.2122, ptr addrspace(1) %arrayidx72.2125, align 4, !tbaa !16
  %vecext.1.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 1
  %add69.1.2 = or disjoint i64 %mul56.2, %105
  %add71.1.2 = or disjoint i64 %add69.1.2, %conv70
  %arrayidx72.1.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.2
  store i32 %vecext.1.2, ptr addrspace(1) %arrayidx72.1.2, align 4, !tbaa !16
  %vecext.2.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 2
  %add69.2.2 = or disjoint i64 %mul56.2, %107
  %add71.2.2 = or disjoint i64 %add69.2.2, %conv70
  %arrayidx72.2.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.2
  store i32 %vecext.2.2, ptr addrspace(1) %arrayidx72.2.2, align 4, !tbaa !16
  %vecext.3.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 3
  %add69.3.2 = or disjoint i64 %mul56.2, %109
  %add71.3.2 = or disjoint i64 %add69.3.2, %conv70
  %arrayidx72.3.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.2
  store i32 %vecext.3.2, ptr addrspace(1) %arrayidx72.3.2, align 4, !tbaa !16
  %add55.3 = mul nuw nsw i64 %add, 4864
  %mul56.3 = add nuw nsw i64 %add55.3, 768
  %vecext.3126 = extractelement <4 x i32> %sums.sroa.14.1, i64 0
  %add69.3127 = or disjoint i64 %mul56.3, %103
  %add71.3128 = or disjoint i64 %add69.3127, %conv70
  %arrayidx72.3129 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3128
  store i32 %vecext.3126, ptr addrspace(1) %arrayidx72.3129, align 4, !tbaa !16
  %vecext.1.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 1
  %add69.1.3 = or disjoint i64 %mul56.3, %105
  %add71.1.3 = or disjoint i64 %add69.1.3, %conv70
  %arrayidx72.1.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.3
  store i32 %vecext.1.3, ptr addrspace(1) %arrayidx72.1.3, align 4, !tbaa !16
  %vecext.2.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 2
  %add69.2.3 = or disjoint i64 %mul56.3, %107
  %add71.2.3 = or disjoint i64 %add69.2.3, %conv70
  %arrayidx72.2.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.3
  store i32 %vecext.2.3, ptr addrspace(1) %arrayidx72.2.3, align 4, !tbaa !16
  %vecext.3.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 3
  %add69.3.3 = or disjoint i64 %mul56.3, %109
  %add71.3.3 = or disjoint i64 %add69.3.3, %conv70
  %arrayidx72.3.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.3
  store i32 %vecext.3.3, ptr addrspace(1) %arrayidx72.3.3, align 4, !tbaa !16
  %add55.4 = mul nuw nsw i64 %add, 4864
  %mul56.4 = add nuw nsw i64 %add55.4, 1024
  %vecext.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 0
  %add69.4 = or disjoint i64 %mul56.4, %103
  %add71.4 = or disjoint i64 %add69.4, %conv70
  %arrayidx72.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.4
  store i32 %vecext.4, ptr addrspace(1) %arrayidx72.4, align 4, !tbaa !16
  %vecext.1.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 1
  %add69.1.4 = or disjoint i64 %mul56.4, %105
  %add71.1.4 = or disjoint i64 %add69.1.4, %conv70
  %arrayidx72.1.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.4
  store i32 %vecext.1.4, ptr addrspace(1) %arrayidx72.1.4, align 4, !tbaa !16
  %vecext.2.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 2
  %add69.2.4 = or disjoint i64 %mul56.4, %107
  %add71.2.4 = or disjoint i64 %add69.2.4, %conv70
  %arrayidx72.2.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.4
  store i32 %vecext.2.4, ptr addrspace(1) %arrayidx72.2.4, align 4, !tbaa !16
  %vecext.3.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 3
  %add69.3.4 = or disjoint i64 %mul56.4, %109
  %add71.3.4 = or disjoint i64 %add69.3.4, %conv70
  %arrayidx72.3.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.4
  store i32 %vecext.3.4, ptr addrspace(1) %arrayidx72.3.4, align 4, !tbaa !16
  %add55.5 = mul nuw nsw i64 %add, 4864
  %mul56.5 = add nuw nsw i64 %add55.5, 1280
  %vecext.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 0
  %add69.5 = or disjoint i64 %mul56.5, %103
  %add71.5 = or disjoint i64 %add69.5, %conv70
  %arrayidx72.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.5
  store i32 %vecext.5, ptr addrspace(1) %arrayidx72.5, align 4, !tbaa !16
  %vecext.1.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 1
  %add69.1.5 = or disjoint i64 %mul56.5, %105
  %add71.1.5 = or disjoint i64 %add69.1.5, %conv70
  %arrayidx72.1.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.5
  store i32 %vecext.1.5, ptr addrspace(1) %arrayidx72.1.5, align 4, !tbaa !16
  %vecext.2.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 2
  %add69.2.5 = or disjoint i64 %mul56.5, %107
  %add71.2.5 = or disjoint i64 %add69.2.5, %conv70
  %arrayidx72.2.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.5
  store i32 %vecext.2.5, ptr addrspace(1) %arrayidx72.2.5, align 4, !tbaa !16
  %vecext.3.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 3
  %add69.3.5 = or disjoint i64 %mul56.5, %109
  %add71.3.5 = or disjoint i64 %add69.3.5, %conv70
  %arrayidx72.3.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.5
  store i32 %vecext.3.5, ptr addrspace(1) %arrayidx72.3.5, align 4, !tbaa !16
  %add55.6 = mul nuw nsw i64 %add, 4864
  %mul56.6 = add nuw nsw i64 %add55.6, 1536
  %vecext.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 0
  %add69.6 = or disjoint i64 %mul56.6, %103
  %add71.6 = or disjoint i64 %add69.6, %conv70
  %arrayidx72.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.6
  store i32 %vecext.6, ptr addrspace(1) %arrayidx72.6, align 4, !tbaa !16
  %vecext.1.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 1
  %add69.1.6 = or disjoint i64 %mul56.6, %105
  %add71.1.6 = or disjoint i64 %add69.1.6, %conv70
  %arrayidx72.1.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.6
  store i32 %vecext.1.6, ptr addrspace(1) %arrayidx72.1.6, align 4, !tbaa !16
  %vecext.2.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 2
  %add69.2.6 = or disjoint i64 %mul56.6, %107
  %add71.2.6 = or disjoint i64 %add69.2.6, %conv70
  %arrayidx72.2.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.6
  store i32 %vecext.2.6, ptr addrspace(1) %arrayidx72.2.6, align 4, !tbaa !16
  %vecext.3.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 3
  %add69.3.6 = or disjoint i64 %mul56.6, %109
  %add71.3.6 = or disjoint i64 %add69.3.6, %conv70
  %arrayidx72.3.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.6
  store i32 %vecext.3.6, ptr addrspace(1) %arrayidx72.3.6, align 4, !tbaa !16
  %add55.7 = mul nuw nsw i64 %add, 4864
  %mul56.7 = add nuw nsw i64 %add55.7, 1792
  %vecext.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 0
  %add69.7 = or disjoint i64 %mul56.7, %103
  %add71.7 = or disjoint i64 %add69.7, %conv70
  %arrayidx72.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.7
  store i32 %vecext.7, ptr addrspace(1) %arrayidx72.7, align 4, !tbaa !16
  %vecext.1.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 1
  %add69.1.7 = or disjoint i64 %mul56.7, %105
  %add71.1.7 = or disjoint i64 %add69.1.7, %conv70
  %arrayidx72.1.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.7
  store i32 %vecext.1.7, ptr addrspace(1) %arrayidx72.1.7, align 4, !tbaa !16
  %vecext.2.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 2
  %add69.2.7 = or disjoint i64 %mul56.7, %107
  %add71.2.7 = or disjoint i64 %add69.2.7, %conv70
  %arrayidx72.2.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.7
  store i32 %vecext.2.7, ptr addrspace(1) %arrayidx72.2.7, align 4, !tbaa !16
  %vecext.3.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 3
  %add69.3.7 = or disjoint i64 %mul56.7, %109
  %add71.3.7 = or disjoint i64 %add69.3.7, %conv70
  %arrayidx72.3.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.7
  store i32 %vecext.3.7, ptr addrspace(1) %arrayidx72.3.7, align 4, !tbaa !16
  %add55.8 = mul nuw nsw i64 %add, 4864
  %mul56.8 = add nuw nsw i64 %add55.8, 2048
  %vecext.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 0
  %add69.8 = or disjoint i64 %mul56.8, %103
  %add71.8 = or disjoint i64 %add69.8, %conv70
  %arrayidx72.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.8
  store i32 %vecext.8, ptr addrspace(1) %arrayidx72.8, align 4, !tbaa !16
  %vecext.1.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 1
  %add69.1.8 = or disjoint i64 %mul56.8, %105
  %add71.1.8 = or disjoint i64 %add69.1.8, %conv70
  %arrayidx72.1.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.8
  store i32 %vecext.1.8, ptr addrspace(1) %arrayidx72.1.8, align 4, !tbaa !16
  %vecext.2.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 2
  %add69.2.8 = or disjoint i64 %mul56.8, %107
  %add71.2.8 = or disjoint i64 %add69.2.8, %conv70
  %arrayidx72.2.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.8
  store i32 %vecext.2.8, ptr addrspace(1) %arrayidx72.2.8, align 4, !tbaa !16
  %vecext.3.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 3
  %add69.3.8 = or disjoint i64 %mul56.8, %109
  %add71.3.8 = or disjoint i64 %add69.3.8, %conv70
  %arrayidx72.3.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.8
  store i32 %vecext.3.8, ptr addrspace(1) %arrayidx72.3.8, align 4, !tbaa !16
  %add55.9 = mul nuw nsw i64 %add, 4864
  %mul56.9 = add nuw nsw i64 %add55.9, 2304
  %vecext.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 0
  %add69.9 = or disjoint i64 %mul56.9, %103
  %add71.9 = or disjoint i64 %add69.9, %conv70
  %arrayidx72.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.9
  store i32 %vecext.9, ptr addrspace(1) %arrayidx72.9, align 4, !tbaa !16
  %vecext.1.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 1
  %add69.1.9 = or disjoint i64 %mul56.9, %105
  %add71.1.9 = or disjoint i64 %add69.1.9, %conv70
  %arrayidx72.1.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.9
  store i32 %vecext.1.9, ptr addrspace(1) %arrayidx72.1.9, align 4, !tbaa !16
  %vecext.2.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 2
  %add69.2.9 = or disjoint i64 %mul56.9, %107
  %add71.2.9 = or disjoint i64 %add69.2.9, %conv70
  %arrayidx72.2.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.9
  store i32 %vecext.2.9, ptr addrspace(1) %arrayidx72.2.9, align 4, !tbaa !16
  %vecext.3.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 3
  %add69.3.9 = or disjoint i64 %mul56.9, %109
  %add71.3.9 = or disjoint i64 %add69.3.9, %conv70
  %arrayidx72.3.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.9
  store i32 %vecext.3.9, ptr addrspace(1) %arrayidx72.3.9, align 4, !tbaa !16
  %add55.10 = mul nuw nsw i64 %add, 4864
  %mul56.10 = add nuw nsw i64 %add55.10, 2560
  %vecext.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 0
  %add69.10 = or disjoint i64 %mul56.10, %103
  %add71.10 = or disjoint i64 %add69.10, %conv70
  %arrayidx72.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.10
  store i32 %vecext.10, ptr addrspace(1) %arrayidx72.10, align 4, !tbaa !16
  %vecext.1.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 1
  %add69.1.10 = or disjoint i64 %mul56.10, %105
  %add71.1.10 = or disjoint i64 %add69.1.10, %conv70
  %arrayidx72.1.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.10
  store i32 %vecext.1.10, ptr addrspace(1) %arrayidx72.1.10, align 4, !tbaa !16
  %vecext.2.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 2
  %add69.2.10 = or disjoint i64 %mul56.10, %107
  %add71.2.10 = or disjoint i64 %add69.2.10, %conv70
  %arrayidx72.2.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.10
  store i32 %vecext.2.10, ptr addrspace(1) %arrayidx72.2.10, align 4, !tbaa !16
  %vecext.3.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 3
  %add69.3.10 = or disjoint i64 %mul56.10, %109
  %add71.3.10 = or disjoint i64 %add69.3.10, %conv70
  %arrayidx72.3.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.10
  store i32 %vecext.3.10, ptr addrspace(1) %arrayidx72.3.10, align 4, !tbaa !16
  %add55.11 = mul nuw nsw i64 %add, 4864
  %mul56.11 = add nuw nsw i64 %add55.11, 2816
  %vecext.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 0
  %add69.11 = or disjoint i64 %mul56.11, %103
  %add71.11 = or disjoint i64 %add69.11, %conv70
  %arrayidx72.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.11
  store i32 %vecext.11, ptr addrspace(1) %arrayidx72.11, align 4, !tbaa !16
  %vecext.1.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 1
  %add69.1.11 = or disjoint i64 %mul56.11, %105
  %add71.1.11 = or disjoint i64 %add69.1.11, %conv70
  %arrayidx72.1.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.11
  store i32 %vecext.1.11, ptr addrspace(1) %arrayidx72.1.11, align 4, !tbaa !16
  %vecext.2.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 2
  %add69.2.11 = or disjoint i64 %mul56.11, %107
  %add71.2.11 = or disjoint i64 %add69.2.11, %conv70
  %arrayidx72.2.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.11
  store i32 %vecext.2.11, ptr addrspace(1) %arrayidx72.2.11, align 4, !tbaa !16
  %vecext.3.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 3
  %add69.3.11 = or disjoint i64 %mul56.11, %109
  %add71.3.11 = or disjoint i64 %add69.3.11, %conv70
  %arrayidx72.3.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.11
  store i32 %vecext.3.11, ptr addrspace(1) %arrayidx72.3.11, align 4, !tbaa !16
  %add55.12 = mul nuw nsw i64 %add, 4864
  %mul56.12 = add nuw nsw i64 %add55.12, 3072
  %vecext.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 0
  %add69.12 = or disjoint i64 %mul56.12, %103
  %add71.12 = or disjoint i64 %add69.12, %conv70
  %arrayidx72.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.12
  store i32 %vecext.12, ptr addrspace(1) %arrayidx72.12, align 4, !tbaa !16
  %vecext.1.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 1
  %add69.1.12 = or disjoint i64 %mul56.12, %105
  %add71.1.12 = or disjoint i64 %add69.1.12, %conv70
  %arrayidx72.1.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.12
  store i32 %vecext.1.12, ptr addrspace(1) %arrayidx72.1.12, align 4, !tbaa !16
  %vecext.2.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 2
  %add69.2.12 = or disjoint i64 %mul56.12, %107
  %add71.2.12 = or disjoint i64 %add69.2.12, %conv70
  %arrayidx72.2.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.12
  store i32 %vecext.2.12, ptr addrspace(1) %arrayidx72.2.12, align 4, !tbaa !16
  %vecext.3.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 3
  %add69.3.12 = or disjoint i64 %mul56.12, %109
  %add71.3.12 = or disjoint i64 %add69.3.12, %conv70
  %arrayidx72.3.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.12
  store i32 %vecext.3.12, ptr addrspace(1) %arrayidx72.3.12, align 4, !tbaa !16
  %add55.13 = mul nuw nsw i64 %add, 4864
  %mul56.13 = add nuw nsw i64 %add55.13, 3328
  %vecext.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 0
  %add69.13 = or disjoint i64 %mul56.13, %103
  %add71.13 = or disjoint i64 %add69.13, %conv70
  %arrayidx72.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.13
  store i32 %vecext.13, ptr addrspace(1) %arrayidx72.13, align 4, !tbaa !16
  %vecext.1.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 1
  %add69.1.13 = or disjoint i64 %mul56.13, %105
  %add71.1.13 = or disjoint i64 %add69.1.13, %conv70
  %arrayidx72.1.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.13
  store i32 %vecext.1.13, ptr addrspace(1) %arrayidx72.1.13, align 4, !tbaa !16
  %vecext.2.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 2
  %add69.2.13 = or disjoint i64 %mul56.13, %107
  %add71.2.13 = or disjoint i64 %add69.2.13, %conv70
  %arrayidx72.2.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.13
  store i32 %vecext.2.13, ptr addrspace(1) %arrayidx72.2.13, align 4, !tbaa !16
  %vecext.3.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 3
  %add69.3.13 = or disjoint i64 %mul56.13, %109
  %add71.3.13 = or disjoint i64 %add69.3.13, %conv70
  %arrayidx72.3.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.13
  store i32 %vecext.3.13, ptr addrspace(1) %arrayidx72.3.13, align 4, !tbaa !16
  %add55.14 = mul nuw nsw i64 %add, 4864
  %mul56.14 = add nuw nsw i64 %add55.14, 3584
  %vecext.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 0
  %add69.14 = or disjoint i64 %mul56.14, %103
  %add71.14 = or disjoint i64 %add69.14, %conv70
  %arrayidx72.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.14
  store i32 %vecext.14, ptr addrspace(1) %arrayidx72.14, align 4, !tbaa !16
  %vecext.1.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 1
  %add69.1.14 = or disjoint i64 %mul56.14, %105
  %add71.1.14 = or disjoint i64 %add69.1.14, %conv70
  %arrayidx72.1.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.14
  store i32 %vecext.1.14, ptr addrspace(1) %arrayidx72.1.14, align 4, !tbaa !16
  %vecext.2.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 2
  %add69.2.14 = or disjoint i64 %mul56.14, %107
  %add71.2.14 = or disjoint i64 %add69.2.14, %conv70
  %arrayidx72.2.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.14
  store i32 %vecext.2.14, ptr addrspace(1) %arrayidx72.2.14, align 4, !tbaa !16
  %vecext.3.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 3
  %add69.3.14 = or disjoint i64 %mul56.14, %109
  %add71.3.14 = or disjoint i64 %add69.3.14, %conv70
  %arrayidx72.3.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.14
  store i32 %vecext.3.14, ptr addrspace(1) %arrayidx72.3.14, align 4, !tbaa !16
  %add55.15 = mul nuw nsw i64 %add, 4864
  %mul56.15 = add nuw nsw i64 %add55.15, 3840
  %vecext.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 0
  %add69.15 = or disjoint i64 %mul56.15, %103
  %add71.15 = or disjoint i64 %add69.15, %conv70
  %arrayidx72.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.15
  store i32 %vecext.15, ptr addrspace(1) %arrayidx72.15, align 4, !tbaa !16
  %vecext.1.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 1
  %add69.1.15 = or disjoint i64 %mul56.15, %105
  %add71.1.15 = or disjoint i64 %add69.1.15, %conv70
  %arrayidx72.1.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.15
  store i32 %vecext.1.15, ptr addrspace(1) %arrayidx72.1.15, align 4, !tbaa !16
  %vecext.2.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 2
  %add69.2.15 = or disjoint i64 %mul56.15, %107
  %add71.2.15 = or disjoint i64 %add69.2.15, %conv70
  %arrayidx72.2.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.15
  store i32 %vecext.2.15, ptr addrspace(1) %arrayidx72.2.15, align 4, !tbaa !16
  %vecext.3.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 3
  %add69.3.15 = or disjoint i64 %mul56.15, %109
  %add71.3.15 = or disjoint i64 %add69.3.15, %conv70
  %arrayidx72.3.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.15
  store i32 %vecext.3.15, ptr addrspace(1) %arrayidx72.3.15, align 4, !tbaa !16
  %add55.16 = mul nuw nsw i64 %add, 4864
  %mul56.16 = add nuw nsw i64 %add55.16, 4096
  %vecext.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 0
  %add69.16 = or disjoint i64 %mul56.16, %103
  %add71.16 = or disjoint i64 %add69.16, %conv70
  %arrayidx72.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.16
  store i32 %vecext.16, ptr addrspace(1) %arrayidx72.16, align 4, !tbaa !16
  %vecext.1.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 1
  %add69.1.16 = or disjoint i64 %mul56.16, %105
  %add71.1.16 = or disjoint i64 %add69.1.16, %conv70
  %arrayidx72.1.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.16
  store i32 %vecext.1.16, ptr addrspace(1) %arrayidx72.1.16, align 4, !tbaa !16
  %vecext.2.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 2
  %add69.2.16 = or disjoint i64 %mul56.16, %107
  %add71.2.16 = or disjoint i64 %add69.2.16, %conv70
  %arrayidx72.2.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.16
  store i32 %vecext.2.16, ptr addrspace(1) %arrayidx72.2.16, align 4, !tbaa !16
  %vecext.3.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 3
  %add69.3.16 = or disjoint i64 %mul56.16, %109
  %add71.3.16 = or disjoint i64 %add69.3.16, %conv70
  %arrayidx72.3.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.16
  store i32 %vecext.3.16, ptr addrspace(1) %arrayidx72.3.16, align 4, !tbaa !16
  %add55.17 = mul nuw nsw i64 %add, 4864
  %mul56.17 = add nuw nsw i64 %add55.17, 4352
  %vecext.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 0
  %add69.17 = or disjoint i64 %mul56.17, %103
  %add71.17 = or disjoint i64 %add69.17, %conv70
  %arrayidx72.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.17
  store i32 %vecext.17, ptr addrspace(1) %arrayidx72.17, align 4, !tbaa !16
  %vecext.1.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 1
  %add69.1.17 = or disjoint i64 %mul56.17, %105
  %add71.1.17 = or disjoint i64 %add69.1.17, %conv70
  %arrayidx72.1.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.17
  store i32 %vecext.1.17, ptr addrspace(1) %arrayidx72.1.17, align 4, !tbaa !16
  %vecext.2.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 2
  %add69.2.17 = or disjoint i64 %mul56.17, %107
  %add71.2.17 = or disjoint i64 %add69.2.17, %conv70
  %arrayidx72.2.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.17
  store i32 %vecext.2.17, ptr addrspace(1) %arrayidx72.2.17, align 4, !tbaa !16
  %vecext.3.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 3
  %add69.3.17 = or disjoint i64 %mul56.17, %109
  %add71.3.17 = or disjoint i64 %add69.3.17, %conv70
  %arrayidx72.3.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.17
  store i32 %vecext.3.17, ptr addrspace(1) %arrayidx72.3.17, align 4, !tbaa !16
  %add55.18 = mul nuw nsw i64 %add, 4864
  %mul56.18 = add nuw nsw i64 %add55.18, 4608
  %vecext.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 0
  %add69.18 = or disjoint i64 %mul56.18, %103
  %add71.18 = or disjoint i64 %add69.18, %conv70
  %arrayidx72.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.18
  store i32 %vecext.18, ptr addrspace(1) %arrayidx72.18, align 4, !tbaa !16
  %vecext.1.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 1
  %add69.1.18 = or disjoint i64 %mul56.18, %105
  %add71.1.18 = or disjoint i64 %add69.1.18, %conv70
  %arrayidx72.1.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.18
  store i32 %vecext.1.18, ptr addrspace(1) %arrayidx72.1.18, align 4, !tbaa !16
  %vecext.2.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 2
  %add69.2.18 = or disjoint i64 %mul56.18, %107
  %add71.2.18 = or disjoint i64 %add69.2.18, %conv70
  %arrayidx72.2.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.18
  store i32 %vecext.2.18, ptr addrspace(1) %arrayidx72.2.18, align 4, !tbaa !16
  %vecext.3.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 3
  %add69.3.18 = or disjoint i64 %mul56.18, %109
  %add71.3.18 = or disjoint i64 %add69.3.18, %conv70
  %arrayidx72.3.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.18
  store i32 %vecext.3.18, ptr addrspace(1) %arrayidx72.3.18, align 4, !tbaa !16
  ret void
}

; Function Attrs: convergent mustprogress nofree norecurse nounwind memory(argmem: readwrite)
define protected metaxgpu_kernel void @_Z13mmaPeakKernelILi20EEvPKaS1_Pii(ptr addrspace(1) noalias nocapture noundef readonly %a.coerce, ptr addrspace(1) noalias nocapture noundef readonly %b.coerce, ptr addrspace(1) noalias noundef writeonly %c.coerce, i32 noundef %iterations) local_unnamed_addr #3 comdat {
entry:
  %0 = tail call noundef range(i32 0, 1024) i32 @llvm.mxc.thread.id.x(), !range !25
  %1 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.mxc.dispatch.ptr()
  %2 = getelementptr inbounds i8, ptr addrspace(4) %1, i64 4
  %3 = load i16, ptr addrspace(4) %2, align 4, !range !26, !invariant.load !14
  %rem11 = and i32 %0, 15
  %4 = lshr i32 %0, 2
  %mul13 = and i32 %4, 12
  %mul15 = shl nuw nsw i32 %rem11, 4
  %5 = zext nneg i32 %mul15 to i64
  %6 = zext nneg i32 %mul13 to i64
  %7 = or disjoint i64 %5, %6
  %add.ptr = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %7
  %8 = load i32, ptr addrspace(1) %add.ptr, align 1
  %add.ptr21 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %7
  %9 = load i32, ptr addrspace(1) %add.ptr21, align 1
  %10 = or disjoint i64 %5, %6
  %11 = or disjoint i64 %10, 256
  %add.ptr.1 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %11
  %12 = load i32, ptr addrspace(1) %add.ptr.1, align 1
  %add.ptr21.1 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %11
  %13 = load i32, ptr addrspace(1) %add.ptr21.1, align 1
  %14 = or disjoint i64 %5, %6
  %15 = or disjoint i64 %14, 512
  %add.ptr.2 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %15
  %16 = load i32, ptr addrspace(1) %add.ptr.2, align 1
  %add.ptr21.2 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %15
  %17 = load i32, ptr addrspace(1) %add.ptr21.2, align 1
  %18 = or disjoint i64 %5, %6
  %19 = or disjoint i64 %18, 768
  %add.ptr.3 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %19
  %20 = load i32, ptr addrspace(1) %add.ptr.3, align 1
  %add.ptr21.3 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %19
  %21 = load i32, ptr addrspace(1) %add.ptr21.3, align 1
  %22 = or disjoint i64 %5, %6
  %23 = or disjoint i64 %22, 1024
  %add.ptr.4 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %23
  %24 = load i32, ptr addrspace(1) %add.ptr.4, align 1
  %add.ptr21.4 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %23
  %25 = load i32, ptr addrspace(1) %add.ptr21.4, align 1
  %26 = or disjoint i64 %5, %6
  %27 = or disjoint i64 %26, 1280
  %add.ptr.5 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %27
  %28 = load i32, ptr addrspace(1) %add.ptr.5, align 1
  %add.ptr21.5 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %27
  %29 = load i32, ptr addrspace(1) %add.ptr21.5, align 1
  %30 = or disjoint i64 %5, %6
  %31 = or disjoint i64 %30, 1536
  %add.ptr.6 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %31
  %32 = load i32, ptr addrspace(1) %add.ptr.6, align 1
  %add.ptr21.6 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %31
  %33 = load i32, ptr addrspace(1) %add.ptr21.6, align 1
  %34 = or disjoint i64 %5, %6
  %35 = or disjoint i64 %34, 1792
  %add.ptr.7 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %35
  %36 = load i32, ptr addrspace(1) %add.ptr.7, align 1
  %add.ptr21.7 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %35
  %37 = load i32, ptr addrspace(1) %add.ptr21.7, align 1
  %38 = or disjoint i64 %5, %6
  %39 = or disjoint i64 %38, 2048
  %add.ptr.8 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %39
  %40 = load i32, ptr addrspace(1) %add.ptr.8, align 1
  %add.ptr21.8 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %39
  %41 = load i32, ptr addrspace(1) %add.ptr21.8, align 1
  %42 = or disjoint i64 %5, %6
  %43 = or disjoint i64 %42, 2304
  %add.ptr.9 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %43
  %44 = load i32, ptr addrspace(1) %add.ptr.9, align 1
  %add.ptr21.9 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %43
  %45 = load i32, ptr addrspace(1) %add.ptr21.9, align 1
  %46 = or disjoint i64 %5, %6
  %47 = or disjoint i64 %46, 2560
  %add.ptr.10 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %47
  %48 = load i32, ptr addrspace(1) %add.ptr.10, align 1
  %add.ptr21.10 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %47
  %49 = load i32, ptr addrspace(1) %add.ptr21.10, align 1
  %50 = or disjoint i64 %5, %6
  %51 = or disjoint i64 %50, 2816
  %add.ptr.11 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %51
  %52 = load i32, ptr addrspace(1) %add.ptr.11, align 1
  %add.ptr21.11 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %51
  %53 = load i32, ptr addrspace(1) %add.ptr21.11, align 1
  %54 = or disjoint i64 %5, %6
  %55 = or disjoint i64 %54, 3072
  %add.ptr.12 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %55
  %56 = load i32, ptr addrspace(1) %add.ptr.12, align 1
  %add.ptr21.12 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %55
  %57 = load i32, ptr addrspace(1) %add.ptr21.12, align 1
  %58 = or disjoint i64 %5, %6
  %59 = or disjoint i64 %58, 3328
  %add.ptr.13 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %59
  %60 = load i32, ptr addrspace(1) %add.ptr.13, align 1
  %add.ptr21.13 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %59
  %61 = load i32, ptr addrspace(1) %add.ptr21.13, align 1
  %62 = or disjoint i64 %5, %6
  %63 = or disjoint i64 %62, 3584
  %add.ptr.14 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %63
  %64 = load i32, ptr addrspace(1) %add.ptr.14, align 1
  %add.ptr21.14 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %63
  %65 = load i32, ptr addrspace(1) %add.ptr21.14, align 1
  %66 = or disjoint i64 %5, %6
  %67 = or disjoint i64 %66, 3840
  %add.ptr.15 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %67
  %68 = load i32, ptr addrspace(1) %add.ptr.15, align 1
  %add.ptr21.15 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %67
  %69 = load i32, ptr addrspace(1) %add.ptr21.15, align 1
  %70 = or disjoint i64 %5, %6
  %71 = or disjoint i64 %70, 4096
  %add.ptr.16 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %71
  %72 = load i32, ptr addrspace(1) %add.ptr.16, align 1
  %add.ptr21.16 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %71
  %73 = load i32, ptr addrspace(1) %add.ptr21.16, align 1
  %74 = or disjoint i64 %5, %6
  %75 = or disjoint i64 %74, 4352
  %add.ptr.17 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %75
  %76 = load i32, ptr addrspace(1) %add.ptr.17, align 1
  %add.ptr21.17 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %75
  %77 = load i32, ptr addrspace(1) %add.ptr21.17, align 1
  %78 = or disjoint i64 %5, %6
  %79 = or disjoint i64 %78, 4608
  %add.ptr.18 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %79
  %80 = load i32, ptr addrspace(1) %add.ptr.18, align 1
  %add.ptr21.18 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %79
  %81 = load i32, ptr addrspace(1) %add.ptr21.18, align 1
  %82 = or disjoint i64 %5, %6
  %83 = or disjoint i64 %82, 4864
  %add.ptr.19 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %83
  %84 = load i32, ptr addrspace(1) %add.ptr.19, align 1
  %add.ptr21.19 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %83
  %85 = load i32, ptr addrspace(1) %add.ptr21.19, align 1
  %cmp25104 = icmp sgt i32 %iterations, 0
  br i1 %cmp25104, label %for.cond30.preheader, label %for.cond49.preheader

for.cond30.preheader:                             ; preds = %entry, %for.cond30.preheader
  %sums.sroa.78.0 = phi <4 x i32> [ %105, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.74.0 = phi <4 x i32> [ %104, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.70.0 = phi <4 x i32> [ %103, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.66.0 = phi <4 x i32> [ %102, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.62.0 = phi <4 x i32> [ %101, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.58.0 = phi <4 x i32> [ %100, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.54.0 = phi <4 x i32> [ %99, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.50.0 = phi <4 x i32> [ %98, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.46.0 = phi <4 x i32> [ %97, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.42.0 = phi <4 x i32> [ %96, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.38.0 = phi <4 x i32> [ %95, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.34.0 = phi <4 x i32> [ %94, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.30.0 = phi <4 x i32> [ %93, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.26.0 = phi <4 x i32> [ %92, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.22.0 = phi <4 x i32> [ %91, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.18.0 = phi <4 x i32> [ %90, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.14.0 = phi <4 x i32> [ %89, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.10.0 = phi <4 x i32> [ %88, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.6.0 = phi <4 x i32> [ %87, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.0.0 = phi <4 x i32> [ %86, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %iteration.0105 = phi i32 [ %inc46, %for.cond30.preheader ], [ 0, %entry ]
  %86 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %8, i32 %9, <4 x i32> %sums.sroa.0.0), !call_argsrelate !27
  %87 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %12, i32 %13, <4 x i32> %sums.sroa.6.0), !call_argsrelate !27
  %88 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %16, i32 %17, <4 x i32> %sums.sroa.10.0), !call_argsrelate !27
  %89 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %20, i32 %21, <4 x i32> %sums.sroa.14.0), !call_argsrelate !27
  %90 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %24, i32 %25, <4 x i32> %sums.sroa.18.0), !call_argsrelate !27
  %91 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %28, i32 %29, <4 x i32> %sums.sroa.22.0), !call_argsrelate !27
  %92 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %32, i32 %33, <4 x i32> %sums.sroa.26.0), !call_argsrelate !27
  %93 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %36, i32 %37, <4 x i32> %sums.sroa.30.0), !call_argsrelate !27
  %94 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %40, i32 %41, <4 x i32> %sums.sroa.34.0), !call_argsrelate !27
  %95 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %44, i32 %45, <4 x i32> %sums.sroa.38.0), !call_argsrelate !27
  %96 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %48, i32 %49, <4 x i32> %sums.sroa.42.0), !call_argsrelate !27
  %97 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %52, i32 %53, <4 x i32> %sums.sroa.46.0), !call_argsrelate !27
  %98 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %56, i32 %57, <4 x i32> %sums.sroa.50.0), !call_argsrelate !27
  %99 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %60, i32 %61, <4 x i32> %sums.sroa.54.0), !call_argsrelate !27
  %100 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %64, i32 %65, <4 x i32> %sums.sroa.58.0), !call_argsrelate !27
  %101 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %68, i32 %69, <4 x i32> %sums.sroa.62.0), !call_argsrelate !27
  %102 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %72, i32 %73, <4 x i32> %sums.sroa.66.0), !call_argsrelate !27
  %103 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %76, i32 %77, <4 x i32> %sums.sroa.70.0), !call_argsrelate !27
  %104 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %80, i32 %81, <4 x i32> %sums.sroa.74.0), !call_argsrelate !27
  %105 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %84, i32 %85, <4 x i32> %sums.sroa.78.0), !call_argsrelate !27
  %inc46 = add nuw nsw i32 %iteration.0105, 1
  %exitcond.not = icmp eq i32 %inc46, %iterations
  br i1 %exitcond.not, label %for.cond49.preheader, label %for.cond30.preheader, !llvm.loop !37

for.cond49.preheader:                             ; preds = %for.cond30.preheader, %entry
  %sums.sroa.78.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %105, %for.cond30.preheader ]
  %sums.sroa.74.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %104, %for.cond30.preheader ]
  %sums.sroa.70.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %103, %for.cond30.preheader ]
  %sums.sroa.66.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %102, %for.cond30.preheader ]
  %sums.sroa.62.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %101, %for.cond30.preheader ]
  %sums.sroa.58.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %100, %for.cond30.preheader ]
  %sums.sroa.54.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %99, %for.cond30.preheader ]
  %sums.sroa.50.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %98, %for.cond30.preheader ]
  %sums.sroa.46.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %97, %for.cond30.preheader ]
  %sums.sroa.42.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %96, %for.cond30.preheader ]
  %sums.sroa.38.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %95, %for.cond30.preheader ]
  %sums.sroa.34.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %94, %for.cond30.preheader ]
  %sums.sroa.30.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %93, %for.cond30.preheader ]
  %sums.sroa.26.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %92, %for.cond30.preheader ]
  %sums.sroa.22.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %91, %for.cond30.preheader ]
  %sums.sroa.18.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %90, %for.cond30.preheader ]
  %sums.sroa.14.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %89, %for.cond30.preheader ]
  %sums.sroa.10.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %88, %for.cond30.preheader ]
  %sums.sroa.6.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %87, %for.cond30.preheader ]
  %sums.sroa.0.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %86, %for.cond30.preheader ]
  %106 = lshr i16 %3, 6
  %conv7 = zext nneg i16 %106 to i64
  %107 = tail call noundef range(i32 0, 2147483647) i32 @llvm.mxc.block.id.x(), !range !15
  %conv = zext nneg i32 %107 to i64
  %mul = mul nuw nsw i64 %conv7, %conv
  %div9100 = lshr i32 %0, 6
  %conv10 = zext nneg i32 %div9100 to i64
  %add = add nuw nsw i64 %mul, %conv10
  %conv70 = zext nneg i32 %rem11 to i64
  %mul56 = mul nuw nsw i64 %add, 5120
  %vecext = extractelement <4 x i32> %sums.sroa.0.1, i64 0
  %108 = shl nuw nsw i64 %6, 4
  %add69 = or disjoint i64 %mul56, %108
  %add71 = or disjoint i64 %add69, %conv70
  %arrayidx72 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71
  store i32 %vecext, ptr addrspace(1) %arrayidx72, align 4, !tbaa !16
  %vecext.1 = extractelement <4 x i32> %sums.sroa.0.1, i64 1
  %109 = shl nuw nsw i64 %6, 4
  %110 = or disjoint i64 %109, 16
  %add69.1 = or disjoint i64 %mul56, %110
  %add71.1 = or disjoint i64 %add69.1, %conv70
  %arrayidx72.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1
  store i32 %vecext.1, ptr addrspace(1) %arrayidx72.1, align 4, !tbaa !16
  %vecext.2 = extractelement <4 x i32> %sums.sroa.0.1, i64 2
  %111 = shl nuw nsw i64 %6, 4
  %112 = or disjoint i64 %111, 32
  %add69.2 = or disjoint i64 %mul56, %112
  %add71.2 = or disjoint i64 %add69.2, %conv70
  %arrayidx72.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2
  store i32 %vecext.2, ptr addrspace(1) %arrayidx72.2, align 4, !tbaa !16
  %vecext.3 = extractelement <4 x i32> %sums.sroa.0.1, i64 3
  %113 = shl nuw nsw i64 %6, 4
  %114 = or disjoint i64 %113, 48
  %add69.3 = or disjoint i64 %mul56, %114
  %add71.3 = or disjoint i64 %add69.3, %conv70
  %arrayidx72.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3
  store i32 %vecext.3, ptr addrspace(1) %arrayidx72.3, align 4, !tbaa !16
  %add55.1 = mul nuw nsw i64 %add, 5120
  %mul56.1 = or disjoint i64 %add55.1, 256
  %vecext.1118 = extractelement <4 x i32> %sums.sroa.6.1, i64 0
  %add69.1119 = or disjoint i64 %mul56.1, %108
  %add71.1120 = or disjoint i64 %add69.1119, %conv70
  %arrayidx72.1121 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1120
  store i32 %vecext.1118, ptr addrspace(1) %arrayidx72.1121, align 4, !tbaa !16
  %vecext.1.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 1
  %add69.1.1 = or disjoint i64 %mul56.1, %110
  %add71.1.1 = or disjoint i64 %add69.1.1, %conv70
  %arrayidx72.1.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.1
  store i32 %vecext.1.1, ptr addrspace(1) %arrayidx72.1.1, align 4, !tbaa !16
  %vecext.2.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 2
  %add69.2.1 = or disjoint i64 %mul56.1, %112
  %add71.2.1 = or disjoint i64 %add69.2.1, %conv70
  %arrayidx72.2.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.1
  store i32 %vecext.2.1, ptr addrspace(1) %arrayidx72.2.1, align 4, !tbaa !16
  %vecext.3.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 3
  %add69.3.1 = or disjoint i64 %mul56.1, %114
  %add71.3.1 = or disjoint i64 %add69.3.1, %conv70
  %arrayidx72.3.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.1
  store i32 %vecext.3.1, ptr addrspace(1) %arrayidx72.3.1, align 4, !tbaa !16
  %add55.2 = mul nuw nsw i64 %add, 5120
  %mul56.2 = or disjoint i64 %add55.2, 512
  %vecext.2122 = extractelement <4 x i32> %sums.sroa.10.1, i64 0
  %add69.2123 = or disjoint i64 %mul56.2, %108
  %add71.2124 = or disjoint i64 %add69.2123, %conv70
  %arrayidx72.2125 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2124
  store i32 %vecext.2122, ptr addrspace(1) %arrayidx72.2125, align 4, !tbaa !16
  %vecext.1.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 1
  %add69.1.2 = or disjoint i64 %mul56.2, %110
  %add71.1.2 = or disjoint i64 %add69.1.2, %conv70
  %arrayidx72.1.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.2
  store i32 %vecext.1.2, ptr addrspace(1) %arrayidx72.1.2, align 4, !tbaa !16
  %vecext.2.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 2
  %add69.2.2 = or disjoint i64 %mul56.2, %112
  %add71.2.2 = or disjoint i64 %add69.2.2, %conv70
  %arrayidx72.2.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.2
  store i32 %vecext.2.2, ptr addrspace(1) %arrayidx72.2.2, align 4, !tbaa !16
  %vecext.3.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 3
  %add69.3.2 = or disjoint i64 %mul56.2, %114
  %add71.3.2 = or disjoint i64 %add69.3.2, %conv70
  %arrayidx72.3.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.2
  store i32 %vecext.3.2, ptr addrspace(1) %arrayidx72.3.2, align 4, !tbaa !16
  %add55.3 = mul nuw nsw i64 %add, 5120
  %mul56.3 = or disjoint i64 %add55.3, 768
  %vecext.3126 = extractelement <4 x i32> %sums.sroa.14.1, i64 0
  %add69.3127 = or disjoint i64 %mul56.3, %108
  %add71.3128 = or disjoint i64 %add69.3127, %conv70
  %arrayidx72.3129 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3128
  store i32 %vecext.3126, ptr addrspace(1) %arrayidx72.3129, align 4, !tbaa !16
  %vecext.1.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 1
  %add69.1.3 = or disjoint i64 %mul56.3, %110
  %add71.1.3 = or disjoint i64 %add69.1.3, %conv70
  %arrayidx72.1.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.3
  store i32 %vecext.1.3, ptr addrspace(1) %arrayidx72.1.3, align 4, !tbaa !16
  %vecext.2.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 2
  %add69.2.3 = or disjoint i64 %mul56.3, %112
  %add71.2.3 = or disjoint i64 %add69.2.3, %conv70
  %arrayidx72.2.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.3
  store i32 %vecext.2.3, ptr addrspace(1) %arrayidx72.2.3, align 4, !tbaa !16
  %vecext.3.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 3
  %add69.3.3 = or disjoint i64 %mul56.3, %114
  %add71.3.3 = or disjoint i64 %add69.3.3, %conv70
  %arrayidx72.3.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.3
  store i32 %vecext.3.3, ptr addrspace(1) %arrayidx72.3.3, align 4, !tbaa !16
  %add55.4 = mul nuw nsw i64 %add, 5120
  %mul56.4 = add nuw nsw i64 %add55.4, 1024
  %vecext.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 0
  %add69.4 = or disjoint i64 %mul56.4, %108
  %add71.4 = or disjoint i64 %add69.4, %conv70
  %arrayidx72.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.4
  store i32 %vecext.4, ptr addrspace(1) %arrayidx72.4, align 4, !tbaa !16
  %vecext.1.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 1
  %add69.1.4 = or disjoint i64 %mul56.4, %110
  %add71.1.4 = or disjoint i64 %add69.1.4, %conv70
  %arrayidx72.1.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.4
  store i32 %vecext.1.4, ptr addrspace(1) %arrayidx72.1.4, align 4, !tbaa !16
  %vecext.2.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 2
  %add69.2.4 = or disjoint i64 %mul56.4, %112
  %add71.2.4 = or disjoint i64 %add69.2.4, %conv70
  %arrayidx72.2.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.4
  store i32 %vecext.2.4, ptr addrspace(1) %arrayidx72.2.4, align 4, !tbaa !16
  %vecext.3.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 3
  %add69.3.4 = or disjoint i64 %mul56.4, %114
  %add71.3.4 = or disjoint i64 %add69.3.4, %conv70
  %arrayidx72.3.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.4
  store i32 %vecext.3.4, ptr addrspace(1) %arrayidx72.3.4, align 4, !tbaa !16
  %add55.5 = mul nuw nsw i64 %add, 5120
  %mul56.5 = add nuw nsw i64 %add55.5, 1280
  %vecext.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 0
  %add69.5 = or disjoint i64 %mul56.5, %108
  %add71.5 = or disjoint i64 %add69.5, %conv70
  %arrayidx72.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.5
  store i32 %vecext.5, ptr addrspace(1) %arrayidx72.5, align 4, !tbaa !16
  %vecext.1.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 1
  %add69.1.5 = or disjoint i64 %mul56.5, %110
  %add71.1.5 = or disjoint i64 %add69.1.5, %conv70
  %arrayidx72.1.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.5
  store i32 %vecext.1.5, ptr addrspace(1) %arrayidx72.1.5, align 4, !tbaa !16
  %vecext.2.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 2
  %add69.2.5 = or disjoint i64 %mul56.5, %112
  %add71.2.5 = or disjoint i64 %add69.2.5, %conv70
  %arrayidx72.2.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.5
  store i32 %vecext.2.5, ptr addrspace(1) %arrayidx72.2.5, align 4, !tbaa !16
  %vecext.3.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 3
  %add69.3.5 = or disjoint i64 %mul56.5, %114
  %add71.3.5 = or disjoint i64 %add69.3.5, %conv70
  %arrayidx72.3.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.5
  store i32 %vecext.3.5, ptr addrspace(1) %arrayidx72.3.5, align 4, !tbaa !16
  %add55.6 = mul nuw nsw i64 %add, 5120
  %mul56.6 = add nuw nsw i64 %add55.6, 1536
  %vecext.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 0
  %add69.6 = or disjoint i64 %mul56.6, %108
  %add71.6 = or disjoint i64 %add69.6, %conv70
  %arrayidx72.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.6
  store i32 %vecext.6, ptr addrspace(1) %arrayidx72.6, align 4, !tbaa !16
  %vecext.1.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 1
  %add69.1.6 = or disjoint i64 %mul56.6, %110
  %add71.1.6 = or disjoint i64 %add69.1.6, %conv70
  %arrayidx72.1.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.6
  store i32 %vecext.1.6, ptr addrspace(1) %arrayidx72.1.6, align 4, !tbaa !16
  %vecext.2.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 2
  %add69.2.6 = or disjoint i64 %mul56.6, %112
  %add71.2.6 = or disjoint i64 %add69.2.6, %conv70
  %arrayidx72.2.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.6
  store i32 %vecext.2.6, ptr addrspace(1) %arrayidx72.2.6, align 4, !tbaa !16
  %vecext.3.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 3
  %add69.3.6 = or disjoint i64 %mul56.6, %114
  %add71.3.6 = or disjoint i64 %add69.3.6, %conv70
  %arrayidx72.3.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.6
  store i32 %vecext.3.6, ptr addrspace(1) %arrayidx72.3.6, align 4, !tbaa !16
  %add55.7 = mul nuw nsw i64 %add, 5120
  %mul56.7 = add nuw nsw i64 %add55.7, 1792
  %vecext.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 0
  %add69.7 = or disjoint i64 %mul56.7, %108
  %add71.7 = or disjoint i64 %add69.7, %conv70
  %arrayidx72.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.7
  store i32 %vecext.7, ptr addrspace(1) %arrayidx72.7, align 4, !tbaa !16
  %vecext.1.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 1
  %add69.1.7 = or disjoint i64 %mul56.7, %110
  %add71.1.7 = or disjoint i64 %add69.1.7, %conv70
  %arrayidx72.1.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.7
  store i32 %vecext.1.7, ptr addrspace(1) %arrayidx72.1.7, align 4, !tbaa !16
  %vecext.2.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 2
  %add69.2.7 = or disjoint i64 %mul56.7, %112
  %add71.2.7 = or disjoint i64 %add69.2.7, %conv70
  %arrayidx72.2.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.7
  store i32 %vecext.2.7, ptr addrspace(1) %arrayidx72.2.7, align 4, !tbaa !16
  %vecext.3.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 3
  %add69.3.7 = or disjoint i64 %mul56.7, %114
  %add71.3.7 = or disjoint i64 %add69.3.7, %conv70
  %arrayidx72.3.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.7
  store i32 %vecext.3.7, ptr addrspace(1) %arrayidx72.3.7, align 4, !tbaa !16
  %add55.8 = mul nuw nsw i64 %add, 5120
  %mul56.8 = add nuw nsw i64 %add55.8, 2048
  %vecext.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 0
  %add69.8 = or disjoint i64 %mul56.8, %108
  %add71.8 = or disjoint i64 %add69.8, %conv70
  %arrayidx72.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.8
  store i32 %vecext.8, ptr addrspace(1) %arrayidx72.8, align 4, !tbaa !16
  %vecext.1.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 1
  %add69.1.8 = or disjoint i64 %mul56.8, %110
  %add71.1.8 = or disjoint i64 %add69.1.8, %conv70
  %arrayidx72.1.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.8
  store i32 %vecext.1.8, ptr addrspace(1) %arrayidx72.1.8, align 4, !tbaa !16
  %vecext.2.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 2
  %add69.2.8 = or disjoint i64 %mul56.8, %112
  %add71.2.8 = or disjoint i64 %add69.2.8, %conv70
  %arrayidx72.2.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.8
  store i32 %vecext.2.8, ptr addrspace(1) %arrayidx72.2.8, align 4, !tbaa !16
  %vecext.3.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 3
  %add69.3.8 = or disjoint i64 %mul56.8, %114
  %add71.3.8 = or disjoint i64 %add69.3.8, %conv70
  %arrayidx72.3.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.8
  store i32 %vecext.3.8, ptr addrspace(1) %arrayidx72.3.8, align 4, !tbaa !16
  %add55.9 = mul nuw nsw i64 %add, 5120
  %mul56.9 = add nuw nsw i64 %add55.9, 2304
  %vecext.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 0
  %add69.9 = or disjoint i64 %mul56.9, %108
  %add71.9 = or disjoint i64 %add69.9, %conv70
  %arrayidx72.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.9
  store i32 %vecext.9, ptr addrspace(1) %arrayidx72.9, align 4, !tbaa !16
  %vecext.1.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 1
  %add69.1.9 = or disjoint i64 %mul56.9, %110
  %add71.1.9 = or disjoint i64 %add69.1.9, %conv70
  %arrayidx72.1.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.9
  store i32 %vecext.1.9, ptr addrspace(1) %arrayidx72.1.9, align 4, !tbaa !16
  %vecext.2.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 2
  %add69.2.9 = or disjoint i64 %mul56.9, %112
  %add71.2.9 = or disjoint i64 %add69.2.9, %conv70
  %arrayidx72.2.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.9
  store i32 %vecext.2.9, ptr addrspace(1) %arrayidx72.2.9, align 4, !tbaa !16
  %vecext.3.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 3
  %add69.3.9 = or disjoint i64 %mul56.9, %114
  %add71.3.9 = or disjoint i64 %add69.3.9, %conv70
  %arrayidx72.3.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.9
  store i32 %vecext.3.9, ptr addrspace(1) %arrayidx72.3.9, align 4, !tbaa !16
  %add55.10 = mul nuw nsw i64 %add, 5120
  %mul56.10 = add nuw nsw i64 %add55.10, 2560
  %vecext.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 0
  %add69.10 = or disjoint i64 %mul56.10, %108
  %add71.10 = or disjoint i64 %add69.10, %conv70
  %arrayidx72.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.10
  store i32 %vecext.10, ptr addrspace(1) %arrayidx72.10, align 4, !tbaa !16
  %vecext.1.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 1
  %add69.1.10 = or disjoint i64 %mul56.10, %110
  %add71.1.10 = or disjoint i64 %add69.1.10, %conv70
  %arrayidx72.1.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.10
  store i32 %vecext.1.10, ptr addrspace(1) %arrayidx72.1.10, align 4, !tbaa !16
  %vecext.2.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 2
  %add69.2.10 = or disjoint i64 %mul56.10, %112
  %add71.2.10 = or disjoint i64 %add69.2.10, %conv70
  %arrayidx72.2.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.10
  store i32 %vecext.2.10, ptr addrspace(1) %arrayidx72.2.10, align 4, !tbaa !16
  %vecext.3.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 3
  %add69.3.10 = or disjoint i64 %mul56.10, %114
  %add71.3.10 = or disjoint i64 %add69.3.10, %conv70
  %arrayidx72.3.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.10
  store i32 %vecext.3.10, ptr addrspace(1) %arrayidx72.3.10, align 4, !tbaa !16
  %add55.11 = mul nuw nsw i64 %add, 5120
  %mul56.11 = add nuw nsw i64 %add55.11, 2816
  %vecext.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 0
  %add69.11 = or disjoint i64 %mul56.11, %108
  %add71.11 = or disjoint i64 %add69.11, %conv70
  %arrayidx72.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.11
  store i32 %vecext.11, ptr addrspace(1) %arrayidx72.11, align 4, !tbaa !16
  %vecext.1.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 1
  %add69.1.11 = or disjoint i64 %mul56.11, %110
  %add71.1.11 = or disjoint i64 %add69.1.11, %conv70
  %arrayidx72.1.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.11
  store i32 %vecext.1.11, ptr addrspace(1) %arrayidx72.1.11, align 4, !tbaa !16
  %vecext.2.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 2
  %add69.2.11 = or disjoint i64 %mul56.11, %112
  %add71.2.11 = or disjoint i64 %add69.2.11, %conv70
  %arrayidx72.2.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.11
  store i32 %vecext.2.11, ptr addrspace(1) %arrayidx72.2.11, align 4, !tbaa !16
  %vecext.3.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 3
  %add69.3.11 = or disjoint i64 %mul56.11, %114
  %add71.3.11 = or disjoint i64 %add69.3.11, %conv70
  %arrayidx72.3.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.11
  store i32 %vecext.3.11, ptr addrspace(1) %arrayidx72.3.11, align 4, !tbaa !16
  %add55.12 = mul nuw nsw i64 %add, 5120
  %mul56.12 = add nuw nsw i64 %add55.12, 3072
  %vecext.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 0
  %add69.12 = or disjoint i64 %mul56.12, %108
  %add71.12 = or disjoint i64 %add69.12, %conv70
  %arrayidx72.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.12
  store i32 %vecext.12, ptr addrspace(1) %arrayidx72.12, align 4, !tbaa !16
  %vecext.1.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 1
  %add69.1.12 = or disjoint i64 %mul56.12, %110
  %add71.1.12 = or disjoint i64 %add69.1.12, %conv70
  %arrayidx72.1.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.12
  store i32 %vecext.1.12, ptr addrspace(1) %arrayidx72.1.12, align 4, !tbaa !16
  %vecext.2.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 2
  %add69.2.12 = or disjoint i64 %mul56.12, %112
  %add71.2.12 = or disjoint i64 %add69.2.12, %conv70
  %arrayidx72.2.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.12
  store i32 %vecext.2.12, ptr addrspace(1) %arrayidx72.2.12, align 4, !tbaa !16
  %vecext.3.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 3
  %add69.3.12 = or disjoint i64 %mul56.12, %114
  %add71.3.12 = or disjoint i64 %add69.3.12, %conv70
  %arrayidx72.3.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.12
  store i32 %vecext.3.12, ptr addrspace(1) %arrayidx72.3.12, align 4, !tbaa !16
  %add55.13 = mul nuw nsw i64 %add, 5120
  %mul56.13 = add nuw nsw i64 %add55.13, 3328
  %vecext.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 0
  %add69.13 = or disjoint i64 %mul56.13, %108
  %add71.13 = or disjoint i64 %add69.13, %conv70
  %arrayidx72.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.13
  store i32 %vecext.13, ptr addrspace(1) %arrayidx72.13, align 4, !tbaa !16
  %vecext.1.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 1
  %add69.1.13 = or disjoint i64 %mul56.13, %110
  %add71.1.13 = or disjoint i64 %add69.1.13, %conv70
  %arrayidx72.1.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.13
  store i32 %vecext.1.13, ptr addrspace(1) %arrayidx72.1.13, align 4, !tbaa !16
  %vecext.2.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 2
  %add69.2.13 = or disjoint i64 %mul56.13, %112
  %add71.2.13 = or disjoint i64 %add69.2.13, %conv70
  %arrayidx72.2.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.13
  store i32 %vecext.2.13, ptr addrspace(1) %arrayidx72.2.13, align 4, !tbaa !16
  %vecext.3.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 3
  %add69.3.13 = or disjoint i64 %mul56.13, %114
  %add71.3.13 = or disjoint i64 %add69.3.13, %conv70
  %arrayidx72.3.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.13
  store i32 %vecext.3.13, ptr addrspace(1) %arrayidx72.3.13, align 4, !tbaa !16
  %add55.14 = mul nuw nsw i64 %add, 5120
  %mul56.14 = add nuw nsw i64 %add55.14, 3584
  %vecext.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 0
  %add69.14 = or disjoint i64 %mul56.14, %108
  %add71.14 = or disjoint i64 %add69.14, %conv70
  %arrayidx72.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.14
  store i32 %vecext.14, ptr addrspace(1) %arrayidx72.14, align 4, !tbaa !16
  %vecext.1.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 1
  %add69.1.14 = or disjoint i64 %mul56.14, %110
  %add71.1.14 = or disjoint i64 %add69.1.14, %conv70
  %arrayidx72.1.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.14
  store i32 %vecext.1.14, ptr addrspace(1) %arrayidx72.1.14, align 4, !tbaa !16
  %vecext.2.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 2
  %add69.2.14 = or disjoint i64 %mul56.14, %112
  %add71.2.14 = or disjoint i64 %add69.2.14, %conv70
  %arrayidx72.2.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.14
  store i32 %vecext.2.14, ptr addrspace(1) %arrayidx72.2.14, align 4, !tbaa !16
  %vecext.3.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 3
  %add69.3.14 = or disjoint i64 %mul56.14, %114
  %add71.3.14 = or disjoint i64 %add69.3.14, %conv70
  %arrayidx72.3.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.14
  store i32 %vecext.3.14, ptr addrspace(1) %arrayidx72.3.14, align 4, !tbaa !16
  %add55.15 = mul nuw nsw i64 %add, 5120
  %mul56.15 = add nuw nsw i64 %add55.15, 3840
  %vecext.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 0
  %add69.15 = or disjoint i64 %mul56.15, %108
  %add71.15 = or disjoint i64 %add69.15, %conv70
  %arrayidx72.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.15
  store i32 %vecext.15, ptr addrspace(1) %arrayidx72.15, align 4, !tbaa !16
  %vecext.1.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 1
  %add69.1.15 = or disjoint i64 %mul56.15, %110
  %add71.1.15 = or disjoint i64 %add69.1.15, %conv70
  %arrayidx72.1.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.15
  store i32 %vecext.1.15, ptr addrspace(1) %arrayidx72.1.15, align 4, !tbaa !16
  %vecext.2.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 2
  %add69.2.15 = or disjoint i64 %mul56.15, %112
  %add71.2.15 = or disjoint i64 %add69.2.15, %conv70
  %arrayidx72.2.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.15
  store i32 %vecext.2.15, ptr addrspace(1) %arrayidx72.2.15, align 4, !tbaa !16
  %vecext.3.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 3
  %add69.3.15 = or disjoint i64 %mul56.15, %114
  %add71.3.15 = or disjoint i64 %add69.3.15, %conv70
  %arrayidx72.3.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.15
  store i32 %vecext.3.15, ptr addrspace(1) %arrayidx72.3.15, align 4, !tbaa !16
  %add55.16 = mul nuw nsw i64 %add, 5120
  %mul56.16 = add nuw nsw i64 %add55.16, 4096
  %vecext.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 0
  %add69.16 = or disjoint i64 %mul56.16, %108
  %add71.16 = or disjoint i64 %add69.16, %conv70
  %arrayidx72.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.16
  store i32 %vecext.16, ptr addrspace(1) %arrayidx72.16, align 4, !tbaa !16
  %vecext.1.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 1
  %add69.1.16 = or disjoint i64 %mul56.16, %110
  %add71.1.16 = or disjoint i64 %add69.1.16, %conv70
  %arrayidx72.1.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.16
  store i32 %vecext.1.16, ptr addrspace(1) %arrayidx72.1.16, align 4, !tbaa !16
  %vecext.2.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 2
  %add69.2.16 = or disjoint i64 %mul56.16, %112
  %add71.2.16 = or disjoint i64 %add69.2.16, %conv70
  %arrayidx72.2.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.16
  store i32 %vecext.2.16, ptr addrspace(1) %arrayidx72.2.16, align 4, !tbaa !16
  %vecext.3.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 3
  %add69.3.16 = or disjoint i64 %mul56.16, %114
  %add71.3.16 = or disjoint i64 %add69.3.16, %conv70
  %arrayidx72.3.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.16
  store i32 %vecext.3.16, ptr addrspace(1) %arrayidx72.3.16, align 4, !tbaa !16
  %add55.17 = mul nuw nsw i64 %add, 5120
  %mul56.17 = add nuw nsw i64 %add55.17, 4352
  %vecext.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 0
  %add69.17 = or disjoint i64 %mul56.17, %108
  %add71.17 = or disjoint i64 %add69.17, %conv70
  %arrayidx72.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.17
  store i32 %vecext.17, ptr addrspace(1) %arrayidx72.17, align 4, !tbaa !16
  %vecext.1.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 1
  %add69.1.17 = or disjoint i64 %mul56.17, %110
  %add71.1.17 = or disjoint i64 %add69.1.17, %conv70
  %arrayidx72.1.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.17
  store i32 %vecext.1.17, ptr addrspace(1) %arrayidx72.1.17, align 4, !tbaa !16
  %vecext.2.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 2
  %add69.2.17 = or disjoint i64 %mul56.17, %112
  %add71.2.17 = or disjoint i64 %add69.2.17, %conv70
  %arrayidx72.2.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.17
  store i32 %vecext.2.17, ptr addrspace(1) %arrayidx72.2.17, align 4, !tbaa !16
  %vecext.3.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 3
  %add69.3.17 = or disjoint i64 %mul56.17, %114
  %add71.3.17 = or disjoint i64 %add69.3.17, %conv70
  %arrayidx72.3.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.17
  store i32 %vecext.3.17, ptr addrspace(1) %arrayidx72.3.17, align 4, !tbaa !16
  %add55.18 = mul nuw nsw i64 %add, 5120
  %mul56.18 = add nuw nsw i64 %add55.18, 4608
  %vecext.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 0
  %add69.18 = or disjoint i64 %mul56.18, %108
  %add71.18 = or disjoint i64 %add69.18, %conv70
  %arrayidx72.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.18
  store i32 %vecext.18, ptr addrspace(1) %arrayidx72.18, align 4, !tbaa !16
  %vecext.1.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 1
  %add69.1.18 = or disjoint i64 %mul56.18, %110
  %add71.1.18 = or disjoint i64 %add69.1.18, %conv70
  %arrayidx72.1.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.18
  store i32 %vecext.1.18, ptr addrspace(1) %arrayidx72.1.18, align 4, !tbaa !16
  %vecext.2.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 2
  %add69.2.18 = or disjoint i64 %mul56.18, %112
  %add71.2.18 = or disjoint i64 %add69.2.18, %conv70
  %arrayidx72.2.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.18
  store i32 %vecext.2.18, ptr addrspace(1) %arrayidx72.2.18, align 4, !tbaa !16
  %vecext.3.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 3
  %add69.3.18 = or disjoint i64 %mul56.18, %114
  %add71.3.18 = or disjoint i64 %add69.3.18, %conv70
  %arrayidx72.3.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.18
  store i32 %vecext.3.18, ptr addrspace(1) %arrayidx72.3.18, align 4, !tbaa !16
  %add55.19 = mul nuw nsw i64 %add, 5120
  %mul56.19 = add nuw nsw i64 %add55.19, 4864
  %vecext.19 = extractelement <4 x i32> %sums.sroa.78.1, i64 0
  %add69.19 = or disjoint i64 %mul56.19, %108
  %add71.19 = or disjoint i64 %add69.19, %conv70
  %arrayidx72.19 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.19
  store i32 %vecext.19, ptr addrspace(1) %arrayidx72.19, align 4, !tbaa !16
  %vecext.1.19 = extractelement <4 x i32> %sums.sroa.78.1, i64 1
  %add69.1.19 = or disjoint i64 %mul56.19, %110
  %add71.1.19 = or disjoint i64 %add69.1.19, %conv70
  %arrayidx72.1.19 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.19
  store i32 %vecext.1.19, ptr addrspace(1) %arrayidx72.1.19, align 4, !tbaa !16
  %vecext.2.19 = extractelement <4 x i32> %sums.sroa.78.1, i64 2
  %add69.2.19 = or disjoint i64 %mul56.19, %112
  %add71.2.19 = or disjoint i64 %add69.2.19, %conv70
  %arrayidx72.2.19 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.19
  store i32 %vecext.2.19, ptr addrspace(1) %arrayidx72.2.19, align 4, !tbaa !16
  %vecext.3.19 = extractelement <4 x i32> %sums.sroa.78.1, i64 3
  %add69.3.19 = or disjoint i64 %mul56.19, %114
  %add71.3.19 = or disjoint i64 %add69.3.19, %conv70
  %arrayidx72.3.19 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.19
  store i32 %vecext.3.19, ptr addrspace(1) %arrayidx72.3.19, align 4, !tbaa !16
  ret void
}

; Function Attrs: convergent mustprogress nofree norecurse nounwind memory(argmem: readwrite)
define protected metaxgpu_kernel void @_Z13mmaPeakKernelILi21EEvPKaS1_Pii(ptr addrspace(1) noalias nocapture noundef readonly %a.coerce, ptr addrspace(1) noalias nocapture noundef readonly %b.coerce, ptr addrspace(1) noalias noundef writeonly %c.coerce, i32 noundef %iterations) local_unnamed_addr #3 comdat {
entry:
  %0 = tail call noundef range(i32 0, 1024) i32 @llvm.mxc.thread.id.x(), !range !25
  %1 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.mxc.dispatch.ptr()
  %2 = getelementptr inbounds i8, ptr addrspace(4) %1, i64 4
  %3 = load i16, ptr addrspace(4) %2, align 4, !range !26, !invariant.load !14
  %rem11 = and i32 %0, 15
  %4 = lshr i32 %0, 2
  %mul13 = and i32 %4, 12
  %mul15 = shl nuw nsw i32 %rem11, 4
  %5 = zext nneg i32 %mul15 to i64
  %6 = zext nneg i32 %mul13 to i64
  %7 = or disjoint i64 %5, %6
  %add.ptr = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %7
  %8 = load i32, ptr addrspace(1) %add.ptr, align 1
  %add.ptr21 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %7
  %9 = load i32, ptr addrspace(1) %add.ptr21, align 1
  %10 = or disjoint i64 %5, %6
  %11 = or disjoint i64 %10, 256
  %add.ptr.1 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %11
  %12 = load i32, ptr addrspace(1) %add.ptr.1, align 1
  %add.ptr21.1 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %11
  %13 = load i32, ptr addrspace(1) %add.ptr21.1, align 1
  %14 = or disjoint i64 %5, %6
  %15 = or disjoint i64 %14, 512
  %add.ptr.2 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %15
  %16 = load i32, ptr addrspace(1) %add.ptr.2, align 1
  %add.ptr21.2 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %15
  %17 = load i32, ptr addrspace(1) %add.ptr21.2, align 1
  %18 = or disjoint i64 %5, %6
  %19 = or disjoint i64 %18, 768
  %add.ptr.3 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %19
  %20 = load i32, ptr addrspace(1) %add.ptr.3, align 1
  %add.ptr21.3 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %19
  %21 = load i32, ptr addrspace(1) %add.ptr21.3, align 1
  %22 = or disjoint i64 %5, %6
  %23 = or disjoint i64 %22, 1024
  %add.ptr.4 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %23
  %24 = load i32, ptr addrspace(1) %add.ptr.4, align 1
  %add.ptr21.4 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %23
  %25 = load i32, ptr addrspace(1) %add.ptr21.4, align 1
  %26 = or disjoint i64 %5, %6
  %27 = or disjoint i64 %26, 1280
  %add.ptr.5 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %27
  %28 = load i32, ptr addrspace(1) %add.ptr.5, align 1
  %add.ptr21.5 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %27
  %29 = load i32, ptr addrspace(1) %add.ptr21.5, align 1
  %30 = or disjoint i64 %5, %6
  %31 = or disjoint i64 %30, 1536
  %add.ptr.6 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %31
  %32 = load i32, ptr addrspace(1) %add.ptr.6, align 1
  %add.ptr21.6 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %31
  %33 = load i32, ptr addrspace(1) %add.ptr21.6, align 1
  %34 = or disjoint i64 %5, %6
  %35 = or disjoint i64 %34, 1792
  %add.ptr.7 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %35
  %36 = load i32, ptr addrspace(1) %add.ptr.7, align 1
  %add.ptr21.7 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %35
  %37 = load i32, ptr addrspace(1) %add.ptr21.7, align 1
  %38 = or disjoint i64 %5, %6
  %39 = or disjoint i64 %38, 2048
  %add.ptr.8 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %39
  %40 = load i32, ptr addrspace(1) %add.ptr.8, align 1
  %add.ptr21.8 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %39
  %41 = load i32, ptr addrspace(1) %add.ptr21.8, align 1
  %42 = or disjoint i64 %5, %6
  %43 = or disjoint i64 %42, 2304
  %add.ptr.9 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %43
  %44 = load i32, ptr addrspace(1) %add.ptr.9, align 1
  %add.ptr21.9 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %43
  %45 = load i32, ptr addrspace(1) %add.ptr21.9, align 1
  %46 = or disjoint i64 %5, %6
  %47 = or disjoint i64 %46, 2560
  %add.ptr.10 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %47
  %48 = load i32, ptr addrspace(1) %add.ptr.10, align 1
  %add.ptr21.10 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %47
  %49 = load i32, ptr addrspace(1) %add.ptr21.10, align 1
  %50 = or disjoint i64 %5, %6
  %51 = or disjoint i64 %50, 2816
  %add.ptr.11 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %51
  %52 = load i32, ptr addrspace(1) %add.ptr.11, align 1
  %add.ptr21.11 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %51
  %53 = load i32, ptr addrspace(1) %add.ptr21.11, align 1
  %54 = or disjoint i64 %5, %6
  %55 = or disjoint i64 %54, 3072
  %add.ptr.12 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %55
  %56 = load i32, ptr addrspace(1) %add.ptr.12, align 1
  %add.ptr21.12 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %55
  %57 = load i32, ptr addrspace(1) %add.ptr21.12, align 1
  %58 = or disjoint i64 %5, %6
  %59 = or disjoint i64 %58, 3328
  %add.ptr.13 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %59
  %60 = load i32, ptr addrspace(1) %add.ptr.13, align 1
  %add.ptr21.13 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %59
  %61 = load i32, ptr addrspace(1) %add.ptr21.13, align 1
  %62 = or disjoint i64 %5, %6
  %63 = or disjoint i64 %62, 3584
  %add.ptr.14 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %63
  %64 = load i32, ptr addrspace(1) %add.ptr.14, align 1
  %add.ptr21.14 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %63
  %65 = load i32, ptr addrspace(1) %add.ptr21.14, align 1
  %66 = or disjoint i64 %5, %6
  %67 = or disjoint i64 %66, 3840
  %add.ptr.15 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %67
  %68 = load i32, ptr addrspace(1) %add.ptr.15, align 1
  %add.ptr21.15 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %67
  %69 = load i32, ptr addrspace(1) %add.ptr21.15, align 1
  %70 = or disjoint i64 %5, %6
  %71 = or disjoint i64 %70, 4096
  %add.ptr.16 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %71
  %72 = load i32, ptr addrspace(1) %add.ptr.16, align 1
  %add.ptr21.16 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %71
  %73 = load i32, ptr addrspace(1) %add.ptr21.16, align 1
  %74 = or disjoint i64 %5, %6
  %75 = or disjoint i64 %74, 4352
  %add.ptr.17 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %75
  %76 = load i32, ptr addrspace(1) %add.ptr.17, align 1
  %add.ptr21.17 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %75
  %77 = load i32, ptr addrspace(1) %add.ptr21.17, align 1
  %78 = or disjoint i64 %5, %6
  %79 = or disjoint i64 %78, 4608
  %add.ptr.18 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %79
  %80 = load i32, ptr addrspace(1) %add.ptr.18, align 1
  %add.ptr21.18 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %79
  %81 = load i32, ptr addrspace(1) %add.ptr21.18, align 1
  %82 = or disjoint i64 %5, %6
  %83 = or disjoint i64 %82, 4864
  %add.ptr.19 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %83
  %84 = load i32, ptr addrspace(1) %add.ptr.19, align 1
  %add.ptr21.19 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %83
  %85 = load i32, ptr addrspace(1) %add.ptr21.19, align 1
  %86 = or disjoint i64 %5, %6
  %87 = or disjoint i64 %86, 5120
  %add.ptr.20 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %87
  %88 = load i32, ptr addrspace(1) %add.ptr.20, align 1
  %add.ptr21.20 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %87
  %89 = load i32, ptr addrspace(1) %add.ptr21.20, align 1
  %cmp25104 = icmp sgt i32 %iterations, 0
  br i1 %cmp25104, label %for.cond30.preheader, label %for.cond49.preheader

for.cond30.preheader:                             ; preds = %entry, %for.cond30.preheader
  %sums.sroa.82.0 = phi <4 x i32> [ %110, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.78.0 = phi <4 x i32> [ %109, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.74.0 = phi <4 x i32> [ %108, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.70.0 = phi <4 x i32> [ %107, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.66.0 = phi <4 x i32> [ %106, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.62.0 = phi <4 x i32> [ %105, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.58.0 = phi <4 x i32> [ %104, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.54.0 = phi <4 x i32> [ %103, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.50.0 = phi <4 x i32> [ %102, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.46.0 = phi <4 x i32> [ %101, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.42.0 = phi <4 x i32> [ %100, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.38.0 = phi <4 x i32> [ %99, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.34.0 = phi <4 x i32> [ %98, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.30.0 = phi <4 x i32> [ %97, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.26.0 = phi <4 x i32> [ %96, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.22.0 = phi <4 x i32> [ %95, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.18.0 = phi <4 x i32> [ %94, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.14.0 = phi <4 x i32> [ %93, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.10.0 = phi <4 x i32> [ %92, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.6.0 = phi <4 x i32> [ %91, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.0.0 = phi <4 x i32> [ %90, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %iteration.0105 = phi i32 [ %inc46, %for.cond30.preheader ], [ 0, %entry ]
  %90 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %8, i32 %9, <4 x i32> %sums.sroa.0.0), !call_argsrelate !27
  %91 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %12, i32 %13, <4 x i32> %sums.sroa.6.0), !call_argsrelate !27
  %92 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %16, i32 %17, <4 x i32> %sums.sroa.10.0), !call_argsrelate !27
  %93 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %20, i32 %21, <4 x i32> %sums.sroa.14.0), !call_argsrelate !27
  %94 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %24, i32 %25, <4 x i32> %sums.sroa.18.0), !call_argsrelate !27
  %95 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %28, i32 %29, <4 x i32> %sums.sroa.22.0), !call_argsrelate !27
  %96 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %32, i32 %33, <4 x i32> %sums.sroa.26.0), !call_argsrelate !27
  %97 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %36, i32 %37, <4 x i32> %sums.sroa.30.0), !call_argsrelate !27
  %98 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %40, i32 %41, <4 x i32> %sums.sroa.34.0), !call_argsrelate !27
  %99 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %44, i32 %45, <4 x i32> %sums.sroa.38.0), !call_argsrelate !27
  %100 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %48, i32 %49, <4 x i32> %sums.sroa.42.0), !call_argsrelate !27
  %101 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %52, i32 %53, <4 x i32> %sums.sroa.46.0), !call_argsrelate !27
  %102 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %56, i32 %57, <4 x i32> %sums.sroa.50.0), !call_argsrelate !27
  %103 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %60, i32 %61, <4 x i32> %sums.sroa.54.0), !call_argsrelate !27
  %104 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %64, i32 %65, <4 x i32> %sums.sroa.58.0), !call_argsrelate !27
  %105 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %68, i32 %69, <4 x i32> %sums.sroa.62.0), !call_argsrelate !27
  %106 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %72, i32 %73, <4 x i32> %sums.sroa.66.0), !call_argsrelate !27
  %107 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %76, i32 %77, <4 x i32> %sums.sroa.70.0), !call_argsrelate !27
  %108 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %80, i32 %81, <4 x i32> %sums.sroa.74.0), !call_argsrelate !27
  %109 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %84, i32 %85, <4 x i32> %sums.sroa.78.0), !call_argsrelate !27
  %110 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %88, i32 %89, <4 x i32> %sums.sroa.82.0), !call_argsrelate !27
  %inc46 = add nuw nsw i32 %iteration.0105, 1
  %exitcond.not = icmp eq i32 %inc46, %iterations
  br i1 %exitcond.not, label %for.cond49.preheader, label %for.cond30.preheader, !llvm.loop !38

for.cond49.preheader:                             ; preds = %for.cond30.preheader, %entry
  %sums.sroa.82.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %110, %for.cond30.preheader ]
  %sums.sroa.78.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %109, %for.cond30.preheader ]
  %sums.sroa.74.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %108, %for.cond30.preheader ]
  %sums.sroa.70.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %107, %for.cond30.preheader ]
  %sums.sroa.66.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %106, %for.cond30.preheader ]
  %sums.sroa.62.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %105, %for.cond30.preheader ]
  %sums.sroa.58.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %104, %for.cond30.preheader ]
  %sums.sroa.54.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %103, %for.cond30.preheader ]
  %sums.sroa.50.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %102, %for.cond30.preheader ]
  %sums.sroa.46.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %101, %for.cond30.preheader ]
  %sums.sroa.42.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %100, %for.cond30.preheader ]
  %sums.sroa.38.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %99, %for.cond30.preheader ]
  %sums.sroa.34.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %98, %for.cond30.preheader ]
  %sums.sroa.30.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %97, %for.cond30.preheader ]
  %sums.sroa.26.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %96, %for.cond30.preheader ]
  %sums.sroa.22.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %95, %for.cond30.preheader ]
  %sums.sroa.18.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %94, %for.cond30.preheader ]
  %sums.sroa.14.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %93, %for.cond30.preheader ]
  %sums.sroa.10.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %92, %for.cond30.preheader ]
  %sums.sroa.6.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %91, %for.cond30.preheader ]
  %sums.sroa.0.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %90, %for.cond30.preheader ]
  %111 = lshr i16 %3, 6
  %conv7 = zext nneg i16 %111 to i64
  %112 = tail call noundef range(i32 0, 2147483647) i32 @llvm.mxc.block.id.x(), !range !15
  %conv = zext nneg i32 %112 to i64
  %mul = mul nuw nsw i64 %conv7, %conv
  %div9100 = lshr i32 %0, 6
  %conv10 = zext nneg i32 %div9100 to i64
  %add = add nuw nsw i64 %mul, %conv10
  %conv70 = zext nneg i32 %rem11 to i64
  %mul56 = mul nuw nsw i64 %add, 5376
  %vecext = extractelement <4 x i32> %sums.sroa.0.1, i64 0
  %113 = shl nuw nsw i64 %6, 4
  %add69 = or disjoint i64 %mul56, %113
  %add71 = or disjoint i64 %add69, %conv70
  %arrayidx72 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71
  store i32 %vecext, ptr addrspace(1) %arrayidx72, align 4, !tbaa !16
  %vecext.1 = extractelement <4 x i32> %sums.sroa.0.1, i64 1
  %114 = shl nuw nsw i64 %6, 4
  %115 = or disjoint i64 %114, 16
  %add69.1 = or disjoint i64 %mul56, %115
  %add71.1 = or disjoint i64 %add69.1, %conv70
  %arrayidx72.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1
  store i32 %vecext.1, ptr addrspace(1) %arrayidx72.1, align 4, !tbaa !16
  %vecext.2 = extractelement <4 x i32> %sums.sroa.0.1, i64 2
  %116 = shl nuw nsw i64 %6, 4
  %117 = or disjoint i64 %116, 32
  %add69.2 = or disjoint i64 %mul56, %117
  %add71.2 = or disjoint i64 %add69.2, %conv70
  %arrayidx72.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2
  store i32 %vecext.2, ptr addrspace(1) %arrayidx72.2, align 4, !tbaa !16
  %vecext.3 = extractelement <4 x i32> %sums.sroa.0.1, i64 3
  %118 = shl nuw nsw i64 %6, 4
  %119 = or disjoint i64 %118, 48
  %add69.3 = or disjoint i64 %mul56, %119
  %add71.3 = or disjoint i64 %add69.3, %conv70
  %arrayidx72.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3
  store i32 %vecext.3, ptr addrspace(1) %arrayidx72.3, align 4, !tbaa !16
  %add55.1 = mul nuw nsw i64 %add, 5376
  %mul56.1 = add nuw nsw i64 %add55.1, 256
  %vecext.1118 = extractelement <4 x i32> %sums.sroa.6.1, i64 0
  %add69.1119 = or disjoint i64 %mul56.1, %113
  %add71.1120 = or disjoint i64 %add69.1119, %conv70
  %arrayidx72.1121 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1120
  store i32 %vecext.1118, ptr addrspace(1) %arrayidx72.1121, align 4, !tbaa !16
  %vecext.1.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 1
  %add69.1.1 = or disjoint i64 %mul56.1, %115
  %add71.1.1 = or disjoint i64 %add69.1.1, %conv70
  %arrayidx72.1.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.1
  store i32 %vecext.1.1, ptr addrspace(1) %arrayidx72.1.1, align 4, !tbaa !16
  %vecext.2.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 2
  %add69.2.1 = or disjoint i64 %mul56.1, %117
  %add71.2.1 = or disjoint i64 %add69.2.1, %conv70
  %arrayidx72.2.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.1
  store i32 %vecext.2.1, ptr addrspace(1) %arrayidx72.2.1, align 4, !tbaa !16
  %vecext.3.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 3
  %add69.3.1 = or disjoint i64 %mul56.1, %119
  %add71.3.1 = or disjoint i64 %add69.3.1, %conv70
  %arrayidx72.3.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.1
  store i32 %vecext.3.1, ptr addrspace(1) %arrayidx72.3.1, align 4, !tbaa !16
  %add55.2 = mul nuw nsw i64 %add, 5376
  %mul56.2 = add nuw nsw i64 %add55.2, 512
  %vecext.2122 = extractelement <4 x i32> %sums.sroa.10.1, i64 0
  %add69.2123 = or disjoint i64 %mul56.2, %113
  %add71.2124 = or disjoint i64 %add69.2123, %conv70
  %arrayidx72.2125 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2124
  store i32 %vecext.2122, ptr addrspace(1) %arrayidx72.2125, align 4, !tbaa !16
  %vecext.1.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 1
  %add69.1.2 = or disjoint i64 %mul56.2, %115
  %add71.1.2 = or disjoint i64 %add69.1.2, %conv70
  %arrayidx72.1.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.2
  store i32 %vecext.1.2, ptr addrspace(1) %arrayidx72.1.2, align 4, !tbaa !16
  %vecext.2.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 2
  %add69.2.2 = or disjoint i64 %mul56.2, %117
  %add71.2.2 = or disjoint i64 %add69.2.2, %conv70
  %arrayidx72.2.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.2
  store i32 %vecext.2.2, ptr addrspace(1) %arrayidx72.2.2, align 4, !tbaa !16
  %vecext.3.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 3
  %add69.3.2 = or disjoint i64 %mul56.2, %119
  %add71.3.2 = or disjoint i64 %add69.3.2, %conv70
  %arrayidx72.3.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.2
  store i32 %vecext.3.2, ptr addrspace(1) %arrayidx72.3.2, align 4, !tbaa !16
  %add55.3 = mul nuw nsw i64 %add, 5376
  %mul56.3 = add nuw nsw i64 %add55.3, 768
  %vecext.3126 = extractelement <4 x i32> %sums.sroa.14.1, i64 0
  %add69.3127 = or disjoint i64 %mul56.3, %113
  %add71.3128 = or disjoint i64 %add69.3127, %conv70
  %arrayidx72.3129 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3128
  store i32 %vecext.3126, ptr addrspace(1) %arrayidx72.3129, align 4, !tbaa !16
  %vecext.1.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 1
  %add69.1.3 = or disjoint i64 %mul56.3, %115
  %add71.1.3 = or disjoint i64 %add69.1.3, %conv70
  %arrayidx72.1.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.3
  store i32 %vecext.1.3, ptr addrspace(1) %arrayidx72.1.3, align 4, !tbaa !16
  %vecext.2.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 2
  %add69.2.3 = or disjoint i64 %mul56.3, %117
  %add71.2.3 = or disjoint i64 %add69.2.3, %conv70
  %arrayidx72.2.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.3
  store i32 %vecext.2.3, ptr addrspace(1) %arrayidx72.2.3, align 4, !tbaa !16
  %vecext.3.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 3
  %add69.3.3 = or disjoint i64 %mul56.3, %119
  %add71.3.3 = or disjoint i64 %add69.3.3, %conv70
  %arrayidx72.3.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.3
  store i32 %vecext.3.3, ptr addrspace(1) %arrayidx72.3.3, align 4, !tbaa !16
  %add55.4 = mul nuw nsw i64 %add, 5376
  %mul56.4 = add nuw nsw i64 %add55.4, 1024
  %vecext.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 0
  %add69.4 = or disjoint i64 %mul56.4, %113
  %add71.4 = or disjoint i64 %add69.4, %conv70
  %arrayidx72.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.4
  store i32 %vecext.4, ptr addrspace(1) %arrayidx72.4, align 4, !tbaa !16
  %vecext.1.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 1
  %add69.1.4 = or disjoint i64 %mul56.4, %115
  %add71.1.4 = or disjoint i64 %add69.1.4, %conv70
  %arrayidx72.1.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.4
  store i32 %vecext.1.4, ptr addrspace(1) %arrayidx72.1.4, align 4, !tbaa !16
  %vecext.2.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 2
  %add69.2.4 = or disjoint i64 %mul56.4, %117
  %add71.2.4 = or disjoint i64 %add69.2.4, %conv70
  %arrayidx72.2.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.4
  store i32 %vecext.2.4, ptr addrspace(1) %arrayidx72.2.4, align 4, !tbaa !16
  %vecext.3.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 3
  %add69.3.4 = or disjoint i64 %mul56.4, %119
  %add71.3.4 = or disjoint i64 %add69.3.4, %conv70
  %arrayidx72.3.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.4
  store i32 %vecext.3.4, ptr addrspace(1) %arrayidx72.3.4, align 4, !tbaa !16
  %add55.5 = mul nuw nsw i64 %add, 5376
  %mul56.5 = add nuw nsw i64 %add55.5, 1280
  %vecext.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 0
  %add69.5 = or disjoint i64 %mul56.5, %113
  %add71.5 = or disjoint i64 %add69.5, %conv70
  %arrayidx72.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.5
  store i32 %vecext.5, ptr addrspace(1) %arrayidx72.5, align 4, !tbaa !16
  %vecext.1.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 1
  %add69.1.5 = or disjoint i64 %mul56.5, %115
  %add71.1.5 = or disjoint i64 %add69.1.5, %conv70
  %arrayidx72.1.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.5
  store i32 %vecext.1.5, ptr addrspace(1) %arrayidx72.1.5, align 4, !tbaa !16
  %vecext.2.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 2
  %add69.2.5 = or disjoint i64 %mul56.5, %117
  %add71.2.5 = or disjoint i64 %add69.2.5, %conv70
  %arrayidx72.2.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.5
  store i32 %vecext.2.5, ptr addrspace(1) %arrayidx72.2.5, align 4, !tbaa !16
  %vecext.3.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 3
  %add69.3.5 = or disjoint i64 %mul56.5, %119
  %add71.3.5 = or disjoint i64 %add69.3.5, %conv70
  %arrayidx72.3.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.5
  store i32 %vecext.3.5, ptr addrspace(1) %arrayidx72.3.5, align 4, !tbaa !16
  %add55.6 = mul nuw nsw i64 %add, 5376
  %mul56.6 = add nuw nsw i64 %add55.6, 1536
  %vecext.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 0
  %add69.6 = or disjoint i64 %mul56.6, %113
  %add71.6 = or disjoint i64 %add69.6, %conv70
  %arrayidx72.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.6
  store i32 %vecext.6, ptr addrspace(1) %arrayidx72.6, align 4, !tbaa !16
  %vecext.1.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 1
  %add69.1.6 = or disjoint i64 %mul56.6, %115
  %add71.1.6 = or disjoint i64 %add69.1.6, %conv70
  %arrayidx72.1.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.6
  store i32 %vecext.1.6, ptr addrspace(1) %arrayidx72.1.6, align 4, !tbaa !16
  %vecext.2.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 2
  %add69.2.6 = or disjoint i64 %mul56.6, %117
  %add71.2.6 = or disjoint i64 %add69.2.6, %conv70
  %arrayidx72.2.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.6
  store i32 %vecext.2.6, ptr addrspace(1) %arrayidx72.2.6, align 4, !tbaa !16
  %vecext.3.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 3
  %add69.3.6 = or disjoint i64 %mul56.6, %119
  %add71.3.6 = or disjoint i64 %add69.3.6, %conv70
  %arrayidx72.3.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.6
  store i32 %vecext.3.6, ptr addrspace(1) %arrayidx72.3.6, align 4, !tbaa !16
  %add55.7 = mul nuw nsw i64 %add, 5376
  %mul56.7 = add nuw nsw i64 %add55.7, 1792
  %vecext.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 0
  %add69.7 = or disjoint i64 %mul56.7, %113
  %add71.7 = or disjoint i64 %add69.7, %conv70
  %arrayidx72.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.7
  store i32 %vecext.7, ptr addrspace(1) %arrayidx72.7, align 4, !tbaa !16
  %vecext.1.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 1
  %add69.1.7 = or disjoint i64 %mul56.7, %115
  %add71.1.7 = or disjoint i64 %add69.1.7, %conv70
  %arrayidx72.1.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.7
  store i32 %vecext.1.7, ptr addrspace(1) %arrayidx72.1.7, align 4, !tbaa !16
  %vecext.2.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 2
  %add69.2.7 = or disjoint i64 %mul56.7, %117
  %add71.2.7 = or disjoint i64 %add69.2.7, %conv70
  %arrayidx72.2.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.7
  store i32 %vecext.2.7, ptr addrspace(1) %arrayidx72.2.7, align 4, !tbaa !16
  %vecext.3.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 3
  %add69.3.7 = or disjoint i64 %mul56.7, %119
  %add71.3.7 = or disjoint i64 %add69.3.7, %conv70
  %arrayidx72.3.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.7
  store i32 %vecext.3.7, ptr addrspace(1) %arrayidx72.3.7, align 4, !tbaa !16
  %add55.8 = mul nuw nsw i64 %add, 5376
  %mul56.8 = add nuw nsw i64 %add55.8, 2048
  %vecext.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 0
  %add69.8 = or disjoint i64 %mul56.8, %113
  %add71.8 = or disjoint i64 %add69.8, %conv70
  %arrayidx72.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.8
  store i32 %vecext.8, ptr addrspace(1) %arrayidx72.8, align 4, !tbaa !16
  %vecext.1.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 1
  %add69.1.8 = or disjoint i64 %mul56.8, %115
  %add71.1.8 = or disjoint i64 %add69.1.8, %conv70
  %arrayidx72.1.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.8
  store i32 %vecext.1.8, ptr addrspace(1) %arrayidx72.1.8, align 4, !tbaa !16
  %vecext.2.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 2
  %add69.2.8 = or disjoint i64 %mul56.8, %117
  %add71.2.8 = or disjoint i64 %add69.2.8, %conv70
  %arrayidx72.2.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.8
  store i32 %vecext.2.8, ptr addrspace(1) %arrayidx72.2.8, align 4, !tbaa !16
  %vecext.3.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 3
  %add69.3.8 = or disjoint i64 %mul56.8, %119
  %add71.3.8 = or disjoint i64 %add69.3.8, %conv70
  %arrayidx72.3.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.8
  store i32 %vecext.3.8, ptr addrspace(1) %arrayidx72.3.8, align 4, !tbaa !16
  %add55.9 = mul nuw nsw i64 %add, 5376
  %mul56.9 = add nuw nsw i64 %add55.9, 2304
  %vecext.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 0
  %add69.9 = or disjoint i64 %mul56.9, %113
  %add71.9 = or disjoint i64 %add69.9, %conv70
  %arrayidx72.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.9
  store i32 %vecext.9, ptr addrspace(1) %arrayidx72.9, align 4, !tbaa !16
  %vecext.1.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 1
  %add69.1.9 = or disjoint i64 %mul56.9, %115
  %add71.1.9 = or disjoint i64 %add69.1.9, %conv70
  %arrayidx72.1.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.9
  store i32 %vecext.1.9, ptr addrspace(1) %arrayidx72.1.9, align 4, !tbaa !16
  %vecext.2.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 2
  %add69.2.9 = or disjoint i64 %mul56.9, %117
  %add71.2.9 = or disjoint i64 %add69.2.9, %conv70
  %arrayidx72.2.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.9
  store i32 %vecext.2.9, ptr addrspace(1) %arrayidx72.2.9, align 4, !tbaa !16
  %vecext.3.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 3
  %add69.3.9 = or disjoint i64 %mul56.9, %119
  %add71.3.9 = or disjoint i64 %add69.3.9, %conv70
  %arrayidx72.3.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.9
  store i32 %vecext.3.9, ptr addrspace(1) %arrayidx72.3.9, align 4, !tbaa !16
  %add55.10 = mul nuw nsw i64 %add, 5376
  %mul56.10 = add nuw nsw i64 %add55.10, 2560
  %vecext.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 0
  %add69.10 = or disjoint i64 %mul56.10, %113
  %add71.10 = or disjoint i64 %add69.10, %conv70
  %arrayidx72.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.10
  store i32 %vecext.10, ptr addrspace(1) %arrayidx72.10, align 4, !tbaa !16
  %vecext.1.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 1
  %add69.1.10 = or disjoint i64 %mul56.10, %115
  %add71.1.10 = or disjoint i64 %add69.1.10, %conv70
  %arrayidx72.1.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.10
  store i32 %vecext.1.10, ptr addrspace(1) %arrayidx72.1.10, align 4, !tbaa !16
  %vecext.2.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 2
  %add69.2.10 = or disjoint i64 %mul56.10, %117
  %add71.2.10 = or disjoint i64 %add69.2.10, %conv70
  %arrayidx72.2.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.10
  store i32 %vecext.2.10, ptr addrspace(1) %arrayidx72.2.10, align 4, !tbaa !16
  %vecext.3.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 3
  %add69.3.10 = or disjoint i64 %mul56.10, %119
  %add71.3.10 = or disjoint i64 %add69.3.10, %conv70
  %arrayidx72.3.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.10
  store i32 %vecext.3.10, ptr addrspace(1) %arrayidx72.3.10, align 4, !tbaa !16
  %add55.11 = mul nuw nsw i64 %add, 5376
  %mul56.11 = add nuw nsw i64 %add55.11, 2816
  %vecext.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 0
  %add69.11 = or disjoint i64 %mul56.11, %113
  %add71.11 = or disjoint i64 %add69.11, %conv70
  %arrayidx72.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.11
  store i32 %vecext.11, ptr addrspace(1) %arrayidx72.11, align 4, !tbaa !16
  %vecext.1.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 1
  %add69.1.11 = or disjoint i64 %mul56.11, %115
  %add71.1.11 = or disjoint i64 %add69.1.11, %conv70
  %arrayidx72.1.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.11
  store i32 %vecext.1.11, ptr addrspace(1) %arrayidx72.1.11, align 4, !tbaa !16
  %vecext.2.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 2
  %add69.2.11 = or disjoint i64 %mul56.11, %117
  %add71.2.11 = or disjoint i64 %add69.2.11, %conv70
  %arrayidx72.2.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.11
  store i32 %vecext.2.11, ptr addrspace(1) %arrayidx72.2.11, align 4, !tbaa !16
  %vecext.3.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 3
  %add69.3.11 = or disjoint i64 %mul56.11, %119
  %add71.3.11 = or disjoint i64 %add69.3.11, %conv70
  %arrayidx72.3.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.11
  store i32 %vecext.3.11, ptr addrspace(1) %arrayidx72.3.11, align 4, !tbaa !16
  %add55.12 = mul nuw nsw i64 %add, 5376
  %mul56.12 = add nuw nsw i64 %add55.12, 3072
  %vecext.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 0
  %add69.12 = or disjoint i64 %mul56.12, %113
  %add71.12 = or disjoint i64 %add69.12, %conv70
  %arrayidx72.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.12
  store i32 %vecext.12, ptr addrspace(1) %arrayidx72.12, align 4, !tbaa !16
  %vecext.1.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 1
  %add69.1.12 = or disjoint i64 %mul56.12, %115
  %add71.1.12 = or disjoint i64 %add69.1.12, %conv70
  %arrayidx72.1.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.12
  store i32 %vecext.1.12, ptr addrspace(1) %arrayidx72.1.12, align 4, !tbaa !16
  %vecext.2.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 2
  %add69.2.12 = or disjoint i64 %mul56.12, %117
  %add71.2.12 = or disjoint i64 %add69.2.12, %conv70
  %arrayidx72.2.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.12
  store i32 %vecext.2.12, ptr addrspace(1) %arrayidx72.2.12, align 4, !tbaa !16
  %vecext.3.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 3
  %add69.3.12 = or disjoint i64 %mul56.12, %119
  %add71.3.12 = or disjoint i64 %add69.3.12, %conv70
  %arrayidx72.3.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.12
  store i32 %vecext.3.12, ptr addrspace(1) %arrayidx72.3.12, align 4, !tbaa !16
  %add55.13 = mul nuw nsw i64 %add, 5376
  %mul56.13 = add nuw nsw i64 %add55.13, 3328
  %vecext.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 0
  %add69.13 = or disjoint i64 %mul56.13, %113
  %add71.13 = or disjoint i64 %add69.13, %conv70
  %arrayidx72.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.13
  store i32 %vecext.13, ptr addrspace(1) %arrayidx72.13, align 4, !tbaa !16
  %vecext.1.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 1
  %add69.1.13 = or disjoint i64 %mul56.13, %115
  %add71.1.13 = or disjoint i64 %add69.1.13, %conv70
  %arrayidx72.1.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.13
  store i32 %vecext.1.13, ptr addrspace(1) %arrayidx72.1.13, align 4, !tbaa !16
  %vecext.2.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 2
  %add69.2.13 = or disjoint i64 %mul56.13, %117
  %add71.2.13 = or disjoint i64 %add69.2.13, %conv70
  %arrayidx72.2.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.13
  store i32 %vecext.2.13, ptr addrspace(1) %arrayidx72.2.13, align 4, !tbaa !16
  %vecext.3.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 3
  %add69.3.13 = or disjoint i64 %mul56.13, %119
  %add71.3.13 = or disjoint i64 %add69.3.13, %conv70
  %arrayidx72.3.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.13
  store i32 %vecext.3.13, ptr addrspace(1) %arrayidx72.3.13, align 4, !tbaa !16
  %add55.14 = mul nuw nsw i64 %add, 5376
  %mul56.14 = add nuw nsw i64 %add55.14, 3584
  %vecext.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 0
  %add69.14 = or disjoint i64 %mul56.14, %113
  %add71.14 = or disjoint i64 %add69.14, %conv70
  %arrayidx72.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.14
  store i32 %vecext.14, ptr addrspace(1) %arrayidx72.14, align 4, !tbaa !16
  %vecext.1.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 1
  %add69.1.14 = or disjoint i64 %mul56.14, %115
  %add71.1.14 = or disjoint i64 %add69.1.14, %conv70
  %arrayidx72.1.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.14
  store i32 %vecext.1.14, ptr addrspace(1) %arrayidx72.1.14, align 4, !tbaa !16
  %vecext.2.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 2
  %add69.2.14 = or disjoint i64 %mul56.14, %117
  %add71.2.14 = or disjoint i64 %add69.2.14, %conv70
  %arrayidx72.2.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.14
  store i32 %vecext.2.14, ptr addrspace(1) %arrayidx72.2.14, align 4, !tbaa !16
  %vecext.3.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 3
  %add69.3.14 = or disjoint i64 %mul56.14, %119
  %add71.3.14 = or disjoint i64 %add69.3.14, %conv70
  %arrayidx72.3.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.14
  store i32 %vecext.3.14, ptr addrspace(1) %arrayidx72.3.14, align 4, !tbaa !16
  %add55.15 = mul nuw nsw i64 %add, 5376
  %mul56.15 = add nuw nsw i64 %add55.15, 3840
  %vecext.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 0
  %add69.15 = or disjoint i64 %mul56.15, %113
  %add71.15 = or disjoint i64 %add69.15, %conv70
  %arrayidx72.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.15
  store i32 %vecext.15, ptr addrspace(1) %arrayidx72.15, align 4, !tbaa !16
  %vecext.1.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 1
  %add69.1.15 = or disjoint i64 %mul56.15, %115
  %add71.1.15 = or disjoint i64 %add69.1.15, %conv70
  %arrayidx72.1.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.15
  store i32 %vecext.1.15, ptr addrspace(1) %arrayidx72.1.15, align 4, !tbaa !16
  %vecext.2.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 2
  %add69.2.15 = or disjoint i64 %mul56.15, %117
  %add71.2.15 = or disjoint i64 %add69.2.15, %conv70
  %arrayidx72.2.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.15
  store i32 %vecext.2.15, ptr addrspace(1) %arrayidx72.2.15, align 4, !tbaa !16
  %vecext.3.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 3
  %add69.3.15 = or disjoint i64 %mul56.15, %119
  %add71.3.15 = or disjoint i64 %add69.3.15, %conv70
  %arrayidx72.3.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.15
  store i32 %vecext.3.15, ptr addrspace(1) %arrayidx72.3.15, align 4, !tbaa !16
  %add55.16 = mul nuw nsw i64 %add, 5376
  %mul56.16 = add nuw nsw i64 %add55.16, 4096
  %vecext.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 0
  %add69.16 = or disjoint i64 %mul56.16, %113
  %add71.16 = or disjoint i64 %add69.16, %conv70
  %arrayidx72.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.16
  store i32 %vecext.16, ptr addrspace(1) %arrayidx72.16, align 4, !tbaa !16
  %vecext.1.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 1
  %add69.1.16 = or disjoint i64 %mul56.16, %115
  %add71.1.16 = or disjoint i64 %add69.1.16, %conv70
  %arrayidx72.1.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.16
  store i32 %vecext.1.16, ptr addrspace(1) %arrayidx72.1.16, align 4, !tbaa !16
  %vecext.2.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 2
  %add69.2.16 = or disjoint i64 %mul56.16, %117
  %add71.2.16 = or disjoint i64 %add69.2.16, %conv70
  %arrayidx72.2.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.16
  store i32 %vecext.2.16, ptr addrspace(1) %arrayidx72.2.16, align 4, !tbaa !16
  %vecext.3.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 3
  %add69.3.16 = or disjoint i64 %mul56.16, %119
  %add71.3.16 = or disjoint i64 %add69.3.16, %conv70
  %arrayidx72.3.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.16
  store i32 %vecext.3.16, ptr addrspace(1) %arrayidx72.3.16, align 4, !tbaa !16
  %add55.17 = mul nuw nsw i64 %add, 5376
  %mul56.17 = add nuw nsw i64 %add55.17, 4352
  %vecext.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 0
  %add69.17 = or disjoint i64 %mul56.17, %113
  %add71.17 = or disjoint i64 %add69.17, %conv70
  %arrayidx72.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.17
  store i32 %vecext.17, ptr addrspace(1) %arrayidx72.17, align 4, !tbaa !16
  %vecext.1.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 1
  %add69.1.17 = or disjoint i64 %mul56.17, %115
  %add71.1.17 = or disjoint i64 %add69.1.17, %conv70
  %arrayidx72.1.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.17
  store i32 %vecext.1.17, ptr addrspace(1) %arrayidx72.1.17, align 4, !tbaa !16
  %vecext.2.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 2
  %add69.2.17 = or disjoint i64 %mul56.17, %117
  %add71.2.17 = or disjoint i64 %add69.2.17, %conv70
  %arrayidx72.2.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.17
  store i32 %vecext.2.17, ptr addrspace(1) %arrayidx72.2.17, align 4, !tbaa !16
  %vecext.3.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 3
  %add69.3.17 = or disjoint i64 %mul56.17, %119
  %add71.3.17 = or disjoint i64 %add69.3.17, %conv70
  %arrayidx72.3.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.17
  store i32 %vecext.3.17, ptr addrspace(1) %arrayidx72.3.17, align 4, !tbaa !16
  %add55.18 = mul nuw nsw i64 %add, 5376
  %mul56.18 = add nuw nsw i64 %add55.18, 4608
  %vecext.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 0
  %add69.18 = or disjoint i64 %mul56.18, %113
  %add71.18 = or disjoint i64 %add69.18, %conv70
  %arrayidx72.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.18
  store i32 %vecext.18, ptr addrspace(1) %arrayidx72.18, align 4, !tbaa !16
  %vecext.1.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 1
  %add69.1.18 = or disjoint i64 %mul56.18, %115
  %add71.1.18 = or disjoint i64 %add69.1.18, %conv70
  %arrayidx72.1.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.18
  store i32 %vecext.1.18, ptr addrspace(1) %arrayidx72.1.18, align 4, !tbaa !16
  %vecext.2.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 2
  %add69.2.18 = or disjoint i64 %mul56.18, %117
  %add71.2.18 = or disjoint i64 %add69.2.18, %conv70
  %arrayidx72.2.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.18
  store i32 %vecext.2.18, ptr addrspace(1) %arrayidx72.2.18, align 4, !tbaa !16
  %vecext.3.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 3
  %add69.3.18 = or disjoint i64 %mul56.18, %119
  %add71.3.18 = or disjoint i64 %add69.3.18, %conv70
  %arrayidx72.3.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.18
  store i32 %vecext.3.18, ptr addrspace(1) %arrayidx72.3.18, align 4, !tbaa !16
  %add55.19 = mul nuw nsw i64 %add, 5376
  %mul56.19 = add nuw nsw i64 %add55.19, 4864
  %vecext.19 = extractelement <4 x i32> %sums.sroa.78.1, i64 0
  %add69.19 = or disjoint i64 %mul56.19, %113
  %add71.19 = or disjoint i64 %add69.19, %conv70
  %arrayidx72.19 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.19
  store i32 %vecext.19, ptr addrspace(1) %arrayidx72.19, align 4, !tbaa !16
  %vecext.1.19 = extractelement <4 x i32> %sums.sroa.78.1, i64 1
  %add69.1.19 = or disjoint i64 %mul56.19, %115
  %add71.1.19 = or disjoint i64 %add69.1.19, %conv70
  %arrayidx72.1.19 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.19
  store i32 %vecext.1.19, ptr addrspace(1) %arrayidx72.1.19, align 4, !tbaa !16
  %vecext.2.19 = extractelement <4 x i32> %sums.sroa.78.1, i64 2
  %add69.2.19 = or disjoint i64 %mul56.19, %117
  %add71.2.19 = or disjoint i64 %add69.2.19, %conv70
  %arrayidx72.2.19 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.19
  store i32 %vecext.2.19, ptr addrspace(1) %arrayidx72.2.19, align 4, !tbaa !16
  %vecext.3.19 = extractelement <4 x i32> %sums.sroa.78.1, i64 3
  %add69.3.19 = or disjoint i64 %mul56.19, %119
  %add71.3.19 = or disjoint i64 %add69.3.19, %conv70
  %arrayidx72.3.19 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.19
  store i32 %vecext.3.19, ptr addrspace(1) %arrayidx72.3.19, align 4, !tbaa !16
  %add55.20 = mul nuw nsw i64 %add, 5376
  %mul56.20 = add nuw nsw i64 %add55.20, 5120
  %vecext.20 = extractelement <4 x i32> %sums.sroa.82.1, i64 0
  %add69.20 = or disjoint i64 %mul56.20, %113
  %add71.20 = or disjoint i64 %add69.20, %conv70
  %arrayidx72.20 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.20
  store i32 %vecext.20, ptr addrspace(1) %arrayidx72.20, align 4, !tbaa !16
  %vecext.1.20 = extractelement <4 x i32> %sums.sroa.82.1, i64 1
  %add69.1.20 = or disjoint i64 %mul56.20, %115
  %add71.1.20 = or disjoint i64 %add69.1.20, %conv70
  %arrayidx72.1.20 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.20
  store i32 %vecext.1.20, ptr addrspace(1) %arrayidx72.1.20, align 4, !tbaa !16
  %vecext.2.20 = extractelement <4 x i32> %sums.sroa.82.1, i64 2
  %add69.2.20 = or disjoint i64 %mul56.20, %117
  %add71.2.20 = or disjoint i64 %add69.2.20, %conv70
  %arrayidx72.2.20 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.20
  store i32 %vecext.2.20, ptr addrspace(1) %arrayidx72.2.20, align 4, !tbaa !16
  %vecext.3.20 = extractelement <4 x i32> %sums.sroa.82.1, i64 3
  %add69.3.20 = or disjoint i64 %mul56.20, %119
  %add71.3.20 = or disjoint i64 %add69.3.20, %conv70
  %arrayidx72.3.20 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.20
  store i32 %vecext.3.20, ptr addrspace(1) %arrayidx72.3.20, align 4, !tbaa !16
  ret void
}

; Function Attrs: convergent mustprogress nofree norecurse nounwind memory(argmem: readwrite)
define protected metaxgpu_kernel void @_Z13mmaPeakKernelILi22EEvPKaS1_Pii(ptr addrspace(1) noalias nocapture noundef readonly %a.coerce, ptr addrspace(1) noalias nocapture noundef readonly %b.coerce, ptr addrspace(1) noalias noundef writeonly %c.coerce, i32 noundef %iterations) local_unnamed_addr #3 comdat {
entry:
  %0 = tail call noundef range(i32 0, 1024) i32 @llvm.mxc.thread.id.x(), !range !25
  %1 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.mxc.dispatch.ptr()
  %2 = getelementptr inbounds i8, ptr addrspace(4) %1, i64 4
  %3 = load i16, ptr addrspace(4) %2, align 4, !range !26, !invariant.load !14
  %rem11 = and i32 %0, 15
  %4 = lshr i32 %0, 2
  %mul13 = and i32 %4, 12
  %mul15 = shl nuw nsw i32 %rem11, 4
  %5 = zext nneg i32 %mul15 to i64
  %6 = zext nneg i32 %mul13 to i64
  %7 = or disjoint i64 %5, %6
  %add.ptr = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %7
  %8 = load i32, ptr addrspace(1) %add.ptr, align 1
  %add.ptr21 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %7
  %9 = load i32, ptr addrspace(1) %add.ptr21, align 1
  %10 = or disjoint i64 %5, %6
  %11 = or disjoint i64 %10, 256
  %add.ptr.1 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %11
  %12 = load i32, ptr addrspace(1) %add.ptr.1, align 1
  %add.ptr21.1 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %11
  %13 = load i32, ptr addrspace(1) %add.ptr21.1, align 1
  %14 = or disjoint i64 %5, %6
  %15 = or disjoint i64 %14, 512
  %add.ptr.2 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %15
  %16 = load i32, ptr addrspace(1) %add.ptr.2, align 1
  %add.ptr21.2 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %15
  %17 = load i32, ptr addrspace(1) %add.ptr21.2, align 1
  %18 = or disjoint i64 %5, %6
  %19 = or disjoint i64 %18, 768
  %add.ptr.3 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %19
  %20 = load i32, ptr addrspace(1) %add.ptr.3, align 1
  %add.ptr21.3 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %19
  %21 = load i32, ptr addrspace(1) %add.ptr21.3, align 1
  %22 = or disjoint i64 %5, %6
  %23 = or disjoint i64 %22, 1024
  %add.ptr.4 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %23
  %24 = load i32, ptr addrspace(1) %add.ptr.4, align 1
  %add.ptr21.4 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %23
  %25 = load i32, ptr addrspace(1) %add.ptr21.4, align 1
  %26 = or disjoint i64 %5, %6
  %27 = or disjoint i64 %26, 1280
  %add.ptr.5 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %27
  %28 = load i32, ptr addrspace(1) %add.ptr.5, align 1
  %add.ptr21.5 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %27
  %29 = load i32, ptr addrspace(1) %add.ptr21.5, align 1
  %30 = or disjoint i64 %5, %6
  %31 = or disjoint i64 %30, 1536
  %add.ptr.6 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %31
  %32 = load i32, ptr addrspace(1) %add.ptr.6, align 1
  %add.ptr21.6 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %31
  %33 = load i32, ptr addrspace(1) %add.ptr21.6, align 1
  %34 = or disjoint i64 %5, %6
  %35 = or disjoint i64 %34, 1792
  %add.ptr.7 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %35
  %36 = load i32, ptr addrspace(1) %add.ptr.7, align 1
  %add.ptr21.7 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %35
  %37 = load i32, ptr addrspace(1) %add.ptr21.7, align 1
  %38 = or disjoint i64 %5, %6
  %39 = or disjoint i64 %38, 2048
  %add.ptr.8 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %39
  %40 = load i32, ptr addrspace(1) %add.ptr.8, align 1
  %add.ptr21.8 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %39
  %41 = load i32, ptr addrspace(1) %add.ptr21.8, align 1
  %42 = or disjoint i64 %5, %6
  %43 = or disjoint i64 %42, 2304
  %add.ptr.9 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %43
  %44 = load i32, ptr addrspace(1) %add.ptr.9, align 1
  %add.ptr21.9 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %43
  %45 = load i32, ptr addrspace(1) %add.ptr21.9, align 1
  %46 = or disjoint i64 %5, %6
  %47 = or disjoint i64 %46, 2560
  %add.ptr.10 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %47
  %48 = load i32, ptr addrspace(1) %add.ptr.10, align 1
  %add.ptr21.10 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %47
  %49 = load i32, ptr addrspace(1) %add.ptr21.10, align 1
  %50 = or disjoint i64 %5, %6
  %51 = or disjoint i64 %50, 2816
  %add.ptr.11 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %51
  %52 = load i32, ptr addrspace(1) %add.ptr.11, align 1
  %add.ptr21.11 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %51
  %53 = load i32, ptr addrspace(1) %add.ptr21.11, align 1
  %54 = or disjoint i64 %5, %6
  %55 = or disjoint i64 %54, 3072
  %add.ptr.12 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %55
  %56 = load i32, ptr addrspace(1) %add.ptr.12, align 1
  %add.ptr21.12 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %55
  %57 = load i32, ptr addrspace(1) %add.ptr21.12, align 1
  %58 = or disjoint i64 %5, %6
  %59 = or disjoint i64 %58, 3328
  %add.ptr.13 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %59
  %60 = load i32, ptr addrspace(1) %add.ptr.13, align 1
  %add.ptr21.13 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %59
  %61 = load i32, ptr addrspace(1) %add.ptr21.13, align 1
  %62 = or disjoint i64 %5, %6
  %63 = or disjoint i64 %62, 3584
  %add.ptr.14 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %63
  %64 = load i32, ptr addrspace(1) %add.ptr.14, align 1
  %add.ptr21.14 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %63
  %65 = load i32, ptr addrspace(1) %add.ptr21.14, align 1
  %66 = or disjoint i64 %5, %6
  %67 = or disjoint i64 %66, 3840
  %add.ptr.15 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %67
  %68 = load i32, ptr addrspace(1) %add.ptr.15, align 1
  %add.ptr21.15 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %67
  %69 = load i32, ptr addrspace(1) %add.ptr21.15, align 1
  %70 = or disjoint i64 %5, %6
  %71 = or disjoint i64 %70, 4096
  %add.ptr.16 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %71
  %72 = load i32, ptr addrspace(1) %add.ptr.16, align 1
  %add.ptr21.16 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %71
  %73 = load i32, ptr addrspace(1) %add.ptr21.16, align 1
  %74 = or disjoint i64 %5, %6
  %75 = or disjoint i64 %74, 4352
  %add.ptr.17 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %75
  %76 = load i32, ptr addrspace(1) %add.ptr.17, align 1
  %add.ptr21.17 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %75
  %77 = load i32, ptr addrspace(1) %add.ptr21.17, align 1
  %78 = or disjoint i64 %5, %6
  %79 = or disjoint i64 %78, 4608
  %add.ptr.18 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %79
  %80 = load i32, ptr addrspace(1) %add.ptr.18, align 1
  %add.ptr21.18 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %79
  %81 = load i32, ptr addrspace(1) %add.ptr21.18, align 1
  %82 = or disjoint i64 %5, %6
  %83 = or disjoint i64 %82, 4864
  %add.ptr.19 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %83
  %84 = load i32, ptr addrspace(1) %add.ptr.19, align 1
  %add.ptr21.19 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %83
  %85 = load i32, ptr addrspace(1) %add.ptr21.19, align 1
  %86 = or disjoint i64 %5, %6
  %87 = or disjoint i64 %86, 5120
  %add.ptr.20 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %87
  %88 = load i32, ptr addrspace(1) %add.ptr.20, align 1
  %add.ptr21.20 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %87
  %89 = load i32, ptr addrspace(1) %add.ptr21.20, align 1
  %90 = or disjoint i64 %5, %6
  %91 = or disjoint i64 %90, 5376
  %add.ptr.21 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %91
  %92 = load i32, ptr addrspace(1) %add.ptr.21, align 1
  %add.ptr21.21 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %91
  %93 = load i32, ptr addrspace(1) %add.ptr21.21, align 1
  %cmp25104 = icmp sgt i32 %iterations, 0
  br i1 %cmp25104, label %for.cond30.preheader, label %for.cond49.preheader

for.cond30.preheader:                             ; preds = %entry, %for.cond30.preheader
  %sums.sroa.86.0 = phi <4 x i32> [ %115, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.82.0 = phi <4 x i32> [ %114, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.78.0 = phi <4 x i32> [ %113, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.74.0 = phi <4 x i32> [ %112, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.70.0 = phi <4 x i32> [ %111, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.66.0 = phi <4 x i32> [ %110, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.62.0 = phi <4 x i32> [ %109, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.58.0 = phi <4 x i32> [ %108, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.54.0 = phi <4 x i32> [ %107, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.50.0 = phi <4 x i32> [ %106, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.46.0 = phi <4 x i32> [ %105, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.42.0 = phi <4 x i32> [ %104, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.38.0 = phi <4 x i32> [ %103, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.34.0 = phi <4 x i32> [ %102, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.30.0 = phi <4 x i32> [ %101, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.26.0 = phi <4 x i32> [ %100, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.22.0 = phi <4 x i32> [ %99, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.18.0 = phi <4 x i32> [ %98, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.14.0 = phi <4 x i32> [ %97, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.10.0 = phi <4 x i32> [ %96, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.6.0 = phi <4 x i32> [ %95, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.0.0 = phi <4 x i32> [ %94, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %iteration.0105 = phi i32 [ %inc46, %for.cond30.preheader ], [ 0, %entry ]
  %94 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %8, i32 %9, <4 x i32> %sums.sroa.0.0), !call_argsrelate !27
  %95 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %12, i32 %13, <4 x i32> %sums.sroa.6.0), !call_argsrelate !27
  %96 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %16, i32 %17, <4 x i32> %sums.sroa.10.0), !call_argsrelate !27
  %97 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %20, i32 %21, <4 x i32> %sums.sroa.14.0), !call_argsrelate !27
  %98 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %24, i32 %25, <4 x i32> %sums.sroa.18.0), !call_argsrelate !27
  %99 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %28, i32 %29, <4 x i32> %sums.sroa.22.0), !call_argsrelate !27
  %100 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %32, i32 %33, <4 x i32> %sums.sroa.26.0), !call_argsrelate !27
  %101 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %36, i32 %37, <4 x i32> %sums.sroa.30.0), !call_argsrelate !27
  %102 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %40, i32 %41, <4 x i32> %sums.sroa.34.0), !call_argsrelate !27
  %103 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %44, i32 %45, <4 x i32> %sums.sroa.38.0), !call_argsrelate !27
  %104 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %48, i32 %49, <4 x i32> %sums.sroa.42.0), !call_argsrelate !27
  %105 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %52, i32 %53, <4 x i32> %sums.sroa.46.0), !call_argsrelate !27
  %106 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %56, i32 %57, <4 x i32> %sums.sroa.50.0), !call_argsrelate !27
  %107 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %60, i32 %61, <4 x i32> %sums.sroa.54.0), !call_argsrelate !27
  %108 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %64, i32 %65, <4 x i32> %sums.sroa.58.0), !call_argsrelate !27
  %109 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %68, i32 %69, <4 x i32> %sums.sroa.62.0), !call_argsrelate !27
  %110 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %72, i32 %73, <4 x i32> %sums.sroa.66.0), !call_argsrelate !27
  %111 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %76, i32 %77, <4 x i32> %sums.sroa.70.0), !call_argsrelate !27
  %112 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %80, i32 %81, <4 x i32> %sums.sroa.74.0), !call_argsrelate !27
  %113 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %84, i32 %85, <4 x i32> %sums.sroa.78.0), !call_argsrelate !27
  %114 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %88, i32 %89, <4 x i32> %sums.sroa.82.0), !call_argsrelate !27
  %115 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %92, i32 %93, <4 x i32> %sums.sroa.86.0), !call_argsrelate !27
  %inc46 = add nuw nsw i32 %iteration.0105, 1
  %exitcond.not = icmp eq i32 %inc46, %iterations
  br i1 %exitcond.not, label %for.cond49.preheader, label %for.cond30.preheader, !llvm.loop !39

for.cond49.preheader:                             ; preds = %for.cond30.preheader, %entry
  %sums.sroa.86.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %115, %for.cond30.preheader ]
  %sums.sroa.82.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %114, %for.cond30.preheader ]
  %sums.sroa.78.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %113, %for.cond30.preheader ]
  %sums.sroa.74.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %112, %for.cond30.preheader ]
  %sums.sroa.70.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %111, %for.cond30.preheader ]
  %sums.sroa.66.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %110, %for.cond30.preheader ]
  %sums.sroa.62.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %109, %for.cond30.preheader ]
  %sums.sroa.58.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %108, %for.cond30.preheader ]
  %sums.sroa.54.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %107, %for.cond30.preheader ]
  %sums.sroa.50.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %106, %for.cond30.preheader ]
  %sums.sroa.46.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %105, %for.cond30.preheader ]
  %sums.sroa.42.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %104, %for.cond30.preheader ]
  %sums.sroa.38.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %103, %for.cond30.preheader ]
  %sums.sroa.34.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %102, %for.cond30.preheader ]
  %sums.sroa.30.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %101, %for.cond30.preheader ]
  %sums.sroa.26.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %100, %for.cond30.preheader ]
  %sums.sroa.22.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %99, %for.cond30.preheader ]
  %sums.sroa.18.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %98, %for.cond30.preheader ]
  %sums.sroa.14.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %97, %for.cond30.preheader ]
  %sums.sroa.10.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %96, %for.cond30.preheader ]
  %sums.sroa.6.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %95, %for.cond30.preheader ]
  %sums.sroa.0.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %94, %for.cond30.preheader ]
  %116 = lshr i16 %3, 6
  %conv7 = zext nneg i16 %116 to i64
  %117 = tail call noundef range(i32 0, 2147483647) i32 @llvm.mxc.block.id.x(), !range !15
  %conv = zext nneg i32 %117 to i64
  %mul = mul nuw nsw i64 %conv7, %conv
  %div9100 = lshr i32 %0, 6
  %conv10 = zext nneg i32 %div9100 to i64
  %add = add nuw nsw i64 %mul, %conv10
  %conv70 = zext nneg i32 %rem11 to i64
  %mul56 = mul nuw nsw i64 %add, 5632
  %vecext = extractelement <4 x i32> %sums.sroa.0.1, i64 0
  %118 = shl nuw nsw i64 %6, 4
  %add69 = or disjoint i64 %mul56, %118
  %add71 = or disjoint i64 %add69, %conv70
  %arrayidx72 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71
  store i32 %vecext, ptr addrspace(1) %arrayidx72, align 4, !tbaa !16
  %vecext.1 = extractelement <4 x i32> %sums.sroa.0.1, i64 1
  %119 = shl nuw nsw i64 %6, 4
  %120 = or disjoint i64 %119, 16
  %add69.1 = or disjoint i64 %mul56, %120
  %add71.1 = or disjoint i64 %add69.1, %conv70
  %arrayidx72.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1
  store i32 %vecext.1, ptr addrspace(1) %arrayidx72.1, align 4, !tbaa !16
  %vecext.2 = extractelement <4 x i32> %sums.sroa.0.1, i64 2
  %121 = shl nuw nsw i64 %6, 4
  %122 = or disjoint i64 %121, 32
  %add69.2 = or disjoint i64 %mul56, %122
  %add71.2 = or disjoint i64 %add69.2, %conv70
  %arrayidx72.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2
  store i32 %vecext.2, ptr addrspace(1) %arrayidx72.2, align 4, !tbaa !16
  %vecext.3 = extractelement <4 x i32> %sums.sroa.0.1, i64 3
  %123 = shl nuw nsw i64 %6, 4
  %124 = or disjoint i64 %123, 48
  %add69.3 = or disjoint i64 %mul56, %124
  %add71.3 = or disjoint i64 %add69.3, %conv70
  %arrayidx72.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3
  store i32 %vecext.3, ptr addrspace(1) %arrayidx72.3, align 4, !tbaa !16
  %add55.1 = mul nuw nsw i64 %add, 5632
  %mul56.1 = or disjoint i64 %add55.1, 256
  %vecext.1118 = extractelement <4 x i32> %sums.sroa.6.1, i64 0
  %add69.1119 = or disjoint i64 %mul56.1, %118
  %add71.1120 = or disjoint i64 %add69.1119, %conv70
  %arrayidx72.1121 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1120
  store i32 %vecext.1118, ptr addrspace(1) %arrayidx72.1121, align 4, !tbaa !16
  %vecext.1.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 1
  %add69.1.1 = or disjoint i64 %mul56.1, %120
  %add71.1.1 = or disjoint i64 %add69.1.1, %conv70
  %arrayidx72.1.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.1
  store i32 %vecext.1.1, ptr addrspace(1) %arrayidx72.1.1, align 4, !tbaa !16
  %vecext.2.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 2
  %add69.2.1 = or disjoint i64 %mul56.1, %122
  %add71.2.1 = or disjoint i64 %add69.2.1, %conv70
  %arrayidx72.2.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.1
  store i32 %vecext.2.1, ptr addrspace(1) %arrayidx72.2.1, align 4, !tbaa !16
  %vecext.3.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 3
  %add69.3.1 = or disjoint i64 %mul56.1, %124
  %add71.3.1 = or disjoint i64 %add69.3.1, %conv70
  %arrayidx72.3.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.1
  store i32 %vecext.3.1, ptr addrspace(1) %arrayidx72.3.1, align 4, !tbaa !16
  %add55.2 = mul nuw nsw i64 %add, 5632
  %mul56.2 = add nuw nsw i64 %add55.2, 512
  %vecext.2122 = extractelement <4 x i32> %sums.sroa.10.1, i64 0
  %add69.2123 = or disjoint i64 %mul56.2, %118
  %add71.2124 = or disjoint i64 %add69.2123, %conv70
  %arrayidx72.2125 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2124
  store i32 %vecext.2122, ptr addrspace(1) %arrayidx72.2125, align 4, !tbaa !16
  %vecext.1.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 1
  %add69.1.2 = or disjoint i64 %mul56.2, %120
  %add71.1.2 = or disjoint i64 %add69.1.2, %conv70
  %arrayidx72.1.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.2
  store i32 %vecext.1.2, ptr addrspace(1) %arrayidx72.1.2, align 4, !tbaa !16
  %vecext.2.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 2
  %add69.2.2 = or disjoint i64 %mul56.2, %122
  %add71.2.2 = or disjoint i64 %add69.2.2, %conv70
  %arrayidx72.2.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.2
  store i32 %vecext.2.2, ptr addrspace(1) %arrayidx72.2.2, align 4, !tbaa !16
  %vecext.3.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 3
  %add69.3.2 = or disjoint i64 %mul56.2, %124
  %add71.3.2 = or disjoint i64 %add69.3.2, %conv70
  %arrayidx72.3.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.2
  store i32 %vecext.3.2, ptr addrspace(1) %arrayidx72.3.2, align 4, !tbaa !16
  %add55.3 = mul nuw nsw i64 %add, 5632
  %mul56.3 = add nuw nsw i64 %add55.3, 768
  %vecext.3126 = extractelement <4 x i32> %sums.sroa.14.1, i64 0
  %add69.3127 = or disjoint i64 %mul56.3, %118
  %add71.3128 = or disjoint i64 %add69.3127, %conv70
  %arrayidx72.3129 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3128
  store i32 %vecext.3126, ptr addrspace(1) %arrayidx72.3129, align 4, !tbaa !16
  %vecext.1.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 1
  %add69.1.3 = or disjoint i64 %mul56.3, %120
  %add71.1.3 = or disjoint i64 %add69.1.3, %conv70
  %arrayidx72.1.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.3
  store i32 %vecext.1.3, ptr addrspace(1) %arrayidx72.1.3, align 4, !tbaa !16
  %vecext.2.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 2
  %add69.2.3 = or disjoint i64 %mul56.3, %122
  %add71.2.3 = or disjoint i64 %add69.2.3, %conv70
  %arrayidx72.2.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.3
  store i32 %vecext.2.3, ptr addrspace(1) %arrayidx72.2.3, align 4, !tbaa !16
  %vecext.3.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 3
  %add69.3.3 = or disjoint i64 %mul56.3, %124
  %add71.3.3 = or disjoint i64 %add69.3.3, %conv70
  %arrayidx72.3.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.3
  store i32 %vecext.3.3, ptr addrspace(1) %arrayidx72.3.3, align 4, !tbaa !16
  %add55.4 = mul nuw nsw i64 %add, 5632
  %mul56.4 = add nuw nsw i64 %add55.4, 1024
  %vecext.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 0
  %add69.4 = or disjoint i64 %mul56.4, %118
  %add71.4 = or disjoint i64 %add69.4, %conv70
  %arrayidx72.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.4
  store i32 %vecext.4, ptr addrspace(1) %arrayidx72.4, align 4, !tbaa !16
  %vecext.1.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 1
  %add69.1.4 = or disjoint i64 %mul56.4, %120
  %add71.1.4 = or disjoint i64 %add69.1.4, %conv70
  %arrayidx72.1.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.4
  store i32 %vecext.1.4, ptr addrspace(1) %arrayidx72.1.4, align 4, !tbaa !16
  %vecext.2.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 2
  %add69.2.4 = or disjoint i64 %mul56.4, %122
  %add71.2.4 = or disjoint i64 %add69.2.4, %conv70
  %arrayidx72.2.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.4
  store i32 %vecext.2.4, ptr addrspace(1) %arrayidx72.2.4, align 4, !tbaa !16
  %vecext.3.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 3
  %add69.3.4 = or disjoint i64 %mul56.4, %124
  %add71.3.4 = or disjoint i64 %add69.3.4, %conv70
  %arrayidx72.3.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.4
  store i32 %vecext.3.4, ptr addrspace(1) %arrayidx72.3.4, align 4, !tbaa !16
  %add55.5 = mul nuw nsw i64 %add, 5632
  %mul56.5 = add nuw nsw i64 %add55.5, 1280
  %vecext.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 0
  %add69.5 = or disjoint i64 %mul56.5, %118
  %add71.5 = or disjoint i64 %add69.5, %conv70
  %arrayidx72.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.5
  store i32 %vecext.5, ptr addrspace(1) %arrayidx72.5, align 4, !tbaa !16
  %vecext.1.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 1
  %add69.1.5 = or disjoint i64 %mul56.5, %120
  %add71.1.5 = or disjoint i64 %add69.1.5, %conv70
  %arrayidx72.1.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.5
  store i32 %vecext.1.5, ptr addrspace(1) %arrayidx72.1.5, align 4, !tbaa !16
  %vecext.2.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 2
  %add69.2.5 = or disjoint i64 %mul56.5, %122
  %add71.2.5 = or disjoint i64 %add69.2.5, %conv70
  %arrayidx72.2.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.5
  store i32 %vecext.2.5, ptr addrspace(1) %arrayidx72.2.5, align 4, !tbaa !16
  %vecext.3.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 3
  %add69.3.5 = or disjoint i64 %mul56.5, %124
  %add71.3.5 = or disjoint i64 %add69.3.5, %conv70
  %arrayidx72.3.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.5
  store i32 %vecext.3.5, ptr addrspace(1) %arrayidx72.3.5, align 4, !tbaa !16
  %add55.6 = mul nuw nsw i64 %add, 5632
  %mul56.6 = add nuw nsw i64 %add55.6, 1536
  %vecext.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 0
  %add69.6 = or disjoint i64 %mul56.6, %118
  %add71.6 = or disjoint i64 %add69.6, %conv70
  %arrayidx72.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.6
  store i32 %vecext.6, ptr addrspace(1) %arrayidx72.6, align 4, !tbaa !16
  %vecext.1.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 1
  %add69.1.6 = or disjoint i64 %mul56.6, %120
  %add71.1.6 = or disjoint i64 %add69.1.6, %conv70
  %arrayidx72.1.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.6
  store i32 %vecext.1.6, ptr addrspace(1) %arrayidx72.1.6, align 4, !tbaa !16
  %vecext.2.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 2
  %add69.2.6 = or disjoint i64 %mul56.6, %122
  %add71.2.6 = or disjoint i64 %add69.2.6, %conv70
  %arrayidx72.2.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.6
  store i32 %vecext.2.6, ptr addrspace(1) %arrayidx72.2.6, align 4, !tbaa !16
  %vecext.3.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 3
  %add69.3.6 = or disjoint i64 %mul56.6, %124
  %add71.3.6 = or disjoint i64 %add69.3.6, %conv70
  %arrayidx72.3.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.6
  store i32 %vecext.3.6, ptr addrspace(1) %arrayidx72.3.6, align 4, !tbaa !16
  %add55.7 = mul nuw nsw i64 %add, 5632
  %mul56.7 = add nuw nsw i64 %add55.7, 1792
  %vecext.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 0
  %add69.7 = or disjoint i64 %mul56.7, %118
  %add71.7 = or disjoint i64 %add69.7, %conv70
  %arrayidx72.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.7
  store i32 %vecext.7, ptr addrspace(1) %arrayidx72.7, align 4, !tbaa !16
  %vecext.1.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 1
  %add69.1.7 = or disjoint i64 %mul56.7, %120
  %add71.1.7 = or disjoint i64 %add69.1.7, %conv70
  %arrayidx72.1.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.7
  store i32 %vecext.1.7, ptr addrspace(1) %arrayidx72.1.7, align 4, !tbaa !16
  %vecext.2.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 2
  %add69.2.7 = or disjoint i64 %mul56.7, %122
  %add71.2.7 = or disjoint i64 %add69.2.7, %conv70
  %arrayidx72.2.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.7
  store i32 %vecext.2.7, ptr addrspace(1) %arrayidx72.2.7, align 4, !tbaa !16
  %vecext.3.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 3
  %add69.3.7 = or disjoint i64 %mul56.7, %124
  %add71.3.7 = or disjoint i64 %add69.3.7, %conv70
  %arrayidx72.3.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.7
  store i32 %vecext.3.7, ptr addrspace(1) %arrayidx72.3.7, align 4, !tbaa !16
  %add55.8 = mul nuw nsw i64 %add, 5632
  %mul56.8 = add nuw nsw i64 %add55.8, 2048
  %vecext.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 0
  %add69.8 = or disjoint i64 %mul56.8, %118
  %add71.8 = or disjoint i64 %add69.8, %conv70
  %arrayidx72.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.8
  store i32 %vecext.8, ptr addrspace(1) %arrayidx72.8, align 4, !tbaa !16
  %vecext.1.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 1
  %add69.1.8 = or disjoint i64 %mul56.8, %120
  %add71.1.8 = or disjoint i64 %add69.1.8, %conv70
  %arrayidx72.1.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.8
  store i32 %vecext.1.8, ptr addrspace(1) %arrayidx72.1.8, align 4, !tbaa !16
  %vecext.2.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 2
  %add69.2.8 = or disjoint i64 %mul56.8, %122
  %add71.2.8 = or disjoint i64 %add69.2.8, %conv70
  %arrayidx72.2.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.8
  store i32 %vecext.2.8, ptr addrspace(1) %arrayidx72.2.8, align 4, !tbaa !16
  %vecext.3.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 3
  %add69.3.8 = or disjoint i64 %mul56.8, %124
  %add71.3.8 = or disjoint i64 %add69.3.8, %conv70
  %arrayidx72.3.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.8
  store i32 %vecext.3.8, ptr addrspace(1) %arrayidx72.3.8, align 4, !tbaa !16
  %add55.9 = mul nuw nsw i64 %add, 5632
  %mul56.9 = add nuw nsw i64 %add55.9, 2304
  %vecext.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 0
  %add69.9 = or disjoint i64 %mul56.9, %118
  %add71.9 = or disjoint i64 %add69.9, %conv70
  %arrayidx72.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.9
  store i32 %vecext.9, ptr addrspace(1) %arrayidx72.9, align 4, !tbaa !16
  %vecext.1.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 1
  %add69.1.9 = or disjoint i64 %mul56.9, %120
  %add71.1.9 = or disjoint i64 %add69.1.9, %conv70
  %arrayidx72.1.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.9
  store i32 %vecext.1.9, ptr addrspace(1) %arrayidx72.1.9, align 4, !tbaa !16
  %vecext.2.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 2
  %add69.2.9 = or disjoint i64 %mul56.9, %122
  %add71.2.9 = or disjoint i64 %add69.2.9, %conv70
  %arrayidx72.2.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.9
  store i32 %vecext.2.9, ptr addrspace(1) %arrayidx72.2.9, align 4, !tbaa !16
  %vecext.3.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 3
  %add69.3.9 = or disjoint i64 %mul56.9, %124
  %add71.3.9 = or disjoint i64 %add69.3.9, %conv70
  %arrayidx72.3.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.9
  store i32 %vecext.3.9, ptr addrspace(1) %arrayidx72.3.9, align 4, !tbaa !16
  %add55.10 = mul nuw nsw i64 %add, 5632
  %mul56.10 = add nuw nsw i64 %add55.10, 2560
  %vecext.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 0
  %add69.10 = or disjoint i64 %mul56.10, %118
  %add71.10 = or disjoint i64 %add69.10, %conv70
  %arrayidx72.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.10
  store i32 %vecext.10, ptr addrspace(1) %arrayidx72.10, align 4, !tbaa !16
  %vecext.1.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 1
  %add69.1.10 = or disjoint i64 %mul56.10, %120
  %add71.1.10 = or disjoint i64 %add69.1.10, %conv70
  %arrayidx72.1.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.10
  store i32 %vecext.1.10, ptr addrspace(1) %arrayidx72.1.10, align 4, !tbaa !16
  %vecext.2.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 2
  %add69.2.10 = or disjoint i64 %mul56.10, %122
  %add71.2.10 = or disjoint i64 %add69.2.10, %conv70
  %arrayidx72.2.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.10
  store i32 %vecext.2.10, ptr addrspace(1) %arrayidx72.2.10, align 4, !tbaa !16
  %vecext.3.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 3
  %add69.3.10 = or disjoint i64 %mul56.10, %124
  %add71.3.10 = or disjoint i64 %add69.3.10, %conv70
  %arrayidx72.3.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.10
  store i32 %vecext.3.10, ptr addrspace(1) %arrayidx72.3.10, align 4, !tbaa !16
  %add55.11 = mul nuw nsw i64 %add, 5632
  %mul56.11 = add nuw nsw i64 %add55.11, 2816
  %vecext.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 0
  %add69.11 = or disjoint i64 %mul56.11, %118
  %add71.11 = or disjoint i64 %add69.11, %conv70
  %arrayidx72.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.11
  store i32 %vecext.11, ptr addrspace(1) %arrayidx72.11, align 4, !tbaa !16
  %vecext.1.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 1
  %add69.1.11 = or disjoint i64 %mul56.11, %120
  %add71.1.11 = or disjoint i64 %add69.1.11, %conv70
  %arrayidx72.1.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.11
  store i32 %vecext.1.11, ptr addrspace(1) %arrayidx72.1.11, align 4, !tbaa !16
  %vecext.2.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 2
  %add69.2.11 = or disjoint i64 %mul56.11, %122
  %add71.2.11 = or disjoint i64 %add69.2.11, %conv70
  %arrayidx72.2.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.11
  store i32 %vecext.2.11, ptr addrspace(1) %arrayidx72.2.11, align 4, !tbaa !16
  %vecext.3.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 3
  %add69.3.11 = or disjoint i64 %mul56.11, %124
  %add71.3.11 = or disjoint i64 %add69.3.11, %conv70
  %arrayidx72.3.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.11
  store i32 %vecext.3.11, ptr addrspace(1) %arrayidx72.3.11, align 4, !tbaa !16
  %add55.12 = mul nuw nsw i64 %add, 5632
  %mul56.12 = add nuw nsw i64 %add55.12, 3072
  %vecext.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 0
  %add69.12 = or disjoint i64 %mul56.12, %118
  %add71.12 = or disjoint i64 %add69.12, %conv70
  %arrayidx72.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.12
  store i32 %vecext.12, ptr addrspace(1) %arrayidx72.12, align 4, !tbaa !16
  %vecext.1.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 1
  %add69.1.12 = or disjoint i64 %mul56.12, %120
  %add71.1.12 = or disjoint i64 %add69.1.12, %conv70
  %arrayidx72.1.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.12
  store i32 %vecext.1.12, ptr addrspace(1) %arrayidx72.1.12, align 4, !tbaa !16
  %vecext.2.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 2
  %add69.2.12 = or disjoint i64 %mul56.12, %122
  %add71.2.12 = or disjoint i64 %add69.2.12, %conv70
  %arrayidx72.2.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.12
  store i32 %vecext.2.12, ptr addrspace(1) %arrayidx72.2.12, align 4, !tbaa !16
  %vecext.3.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 3
  %add69.3.12 = or disjoint i64 %mul56.12, %124
  %add71.3.12 = or disjoint i64 %add69.3.12, %conv70
  %arrayidx72.3.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.12
  store i32 %vecext.3.12, ptr addrspace(1) %arrayidx72.3.12, align 4, !tbaa !16
  %add55.13 = mul nuw nsw i64 %add, 5632
  %mul56.13 = add nuw nsw i64 %add55.13, 3328
  %vecext.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 0
  %add69.13 = or disjoint i64 %mul56.13, %118
  %add71.13 = or disjoint i64 %add69.13, %conv70
  %arrayidx72.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.13
  store i32 %vecext.13, ptr addrspace(1) %arrayidx72.13, align 4, !tbaa !16
  %vecext.1.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 1
  %add69.1.13 = or disjoint i64 %mul56.13, %120
  %add71.1.13 = or disjoint i64 %add69.1.13, %conv70
  %arrayidx72.1.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.13
  store i32 %vecext.1.13, ptr addrspace(1) %arrayidx72.1.13, align 4, !tbaa !16
  %vecext.2.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 2
  %add69.2.13 = or disjoint i64 %mul56.13, %122
  %add71.2.13 = or disjoint i64 %add69.2.13, %conv70
  %arrayidx72.2.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.13
  store i32 %vecext.2.13, ptr addrspace(1) %arrayidx72.2.13, align 4, !tbaa !16
  %vecext.3.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 3
  %add69.3.13 = or disjoint i64 %mul56.13, %124
  %add71.3.13 = or disjoint i64 %add69.3.13, %conv70
  %arrayidx72.3.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.13
  store i32 %vecext.3.13, ptr addrspace(1) %arrayidx72.3.13, align 4, !tbaa !16
  %add55.14 = mul nuw nsw i64 %add, 5632
  %mul56.14 = add nuw nsw i64 %add55.14, 3584
  %vecext.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 0
  %add69.14 = or disjoint i64 %mul56.14, %118
  %add71.14 = or disjoint i64 %add69.14, %conv70
  %arrayidx72.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.14
  store i32 %vecext.14, ptr addrspace(1) %arrayidx72.14, align 4, !tbaa !16
  %vecext.1.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 1
  %add69.1.14 = or disjoint i64 %mul56.14, %120
  %add71.1.14 = or disjoint i64 %add69.1.14, %conv70
  %arrayidx72.1.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.14
  store i32 %vecext.1.14, ptr addrspace(1) %arrayidx72.1.14, align 4, !tbaa !16
  %vecext.2.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 2
  %add69.2.14 = or disjoint i64 %mul56.14, %122
  %add71.2.14 = or disjoint i64 %add69.2.14, %conv70
  %arrayidx72.2.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.14
  store i32 %vecext.2.14, ptr addrspace(1) %arrayidx72.2.14, align 4, !tbaa !16
  %vecext.3.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 3
  %add69.3.14 = or disjoint i64 %mul56.14, %124
  %add71.3.14 = or disjoint i64 %add69.3.14, %conv70
  %arrayidx72.3.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.14
  store i32 %vecext.3.14, ptr addrspace(1) %arrayidx72.3.14, align 4, !tbaa !16
  %add55.15 = mul nuw nsw i64 %add, 5632
  %mul56.15 = add nuw nsw i64 %add55.15, 3840
  %vecext.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 0
  %add69.15 = or disjoint i64 %mul56.15, %118
  %add71.15 = or disjoint i64 %add69.15, %conv70
  %arrayidx72.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.15
  store i32 %vecext.15, ptr addrspace(1) %arrayidx72.15, align 4, !tbaa !16
  %vecext.1.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 1
  %add69.1.15 = or disjoint i64 %mul56.15, %120
  %add71.1.15 = or disjoint i64 %add69.1.15, %conv70
  %arrayidx72.1.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.15
  store i32 %vecext.1.15, ptr addrspace(1) %arrayidx72.1.15, align 4, !tbaa !16
  %vecext.2.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 2
  %add69.2.15 = or disjoint i64 %mul56.15, %122
  %add71.2.15 = or disjoint i64 %add69.2.15, %conv70
  %arrayidx72.2.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.15
  store i32 %vecext.2.15, ptr addrspace(1) %arrayidx72.2.15, align 4, !tbaa !16
  %vecext.3.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 3
  %add69.3.15 = or disjoint i64 %mul56.15, %124
  %add71.3.15 = or disjoint i64 %add69.3.15, %conv70
  %arrayidx72.3.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.15
  store i32 %vecext.3.15, ptr addrspace(1) %arrayidx72.3.15, align 4, !tbaa !16
  %add55.16 = mul nuw nsw i64 %add, 5632
  %mul56.16 = add nuw nsw i64 %add55.16, 4096
  %vecext.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 0
  %add69.16 = or disjoint i64 %mul56.16, %118
  %add71.16 = or disjoint i64 %add69.16, %conv70
  %arrayidx72.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.16
  store i32 %vecext.16, ptr addrspace(1) %arrayidx72.16, align 4, !tbaa !16
  %vecext.1.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 1
  %add69.1.16 = or disjoint i64 %mul56.16, %120
  %add71.1.16 = or disjoint i64 %add69.1.16, %conv70
  %arrayidx72.1.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.16
  store i32 %vecext.1.16, ptr addrspace(1) %arrayidx72.1.16, align 4, !tbaa !16
  %vecext.2.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 2
  %add69.2.16 = or disjoint i64 %mul56.16, %122
  %add71.2.16 = or disjoint i64 %add69.2.16, %conv70
  %arrayidx72.2.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.16
  store i32 %vecext.2.16, ptr addrspace(1) %arrayidx72.2.16, align 4, !tbaa !16
  %vecext.3.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 3
  %add69.3.16 = or disjoint i64 %mul56.16, %124
  %add71.3.16 = or disjoint i64 %add69.3.16, %conv70
  %arrayidx72.3.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.16
  store i32 %vecext.3.16, ptr addrspace(1) %arrayidx72.3.16, align 4, !tbaa !16
  %add55.17 = mul nuw nsw i64 %add, 5632
  %mul56.17 = add nuw nsw i64 %add55.17, 4352
  %vecext.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 0
  %add69.17 = or disjoint i64 %mul56.17, %118
  %add71.17 = or disjoint i64 %add69.17, %conv70
  %arrayidx72.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.17
  store i32 %vecext.17, ptr addrspace(1) %arrayidx72.17, align 4, !tbaa !16
  %vecext.1.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 1
  %add69.1.17 = or disjoint i64 %mul56.17, %120
  %add71.1.17 = or disjoint i64 %add69.1.17, %conv70
  %arrayidx72.1.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.17
  store i32 %vecext.1.17, ptr addrspace(1) %arrayidx72.1.17, align 4, !tbaa !16
  %vecext.2.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 2
  %add69.2.17 = or disjoint i64 %mul56.17, %122
  %add71.2.17 = or disjoint i64 %add69.2.17, %conv70
  %arrayidx72.2.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.17
  store i32 %vecext.2.17, ptr addrspace(1) %arrayidx72.2.17, align 4, !tbaa !16
  %vecext.3.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 3
  %add69.3.17 = or disjoint i64 %mul56.17, %124
  %add71.3.17 = or disjoint i64 %add69.3.17, %conv70
  %arrayidx72.3.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.17
  store i32 %vecext.3.17, ptr addrspace(1) %arrayidx72.3.17, align 4, !tbaa !16
  %add55.18 = mul nuw nsw i64 %add, 5632
  %mul56.18 = add nuw nsw i64 %add55.18, 4608
  %vecext.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 0
  %add69.18 = or disjoint i64 %mul56.18, %118
  %add71.18 = or disjoint i64 %add69.18, %conv70
  %arrayidx72.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.18
  store i32 %vecext.18, ptr addrspace(1) %arrayidx72.18, align 4, !tbaa !16
  %vecext.1.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 1
  %add69.1.18 = or disjoint i64 %mul56.18, %120
  %add71.1.18 = or disjoint i64 %add69.1.18, %conv70
  %arrayidx72.1.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.18
  store i32 %vecext.1.18, ptr addrspace(1) %arrayidx72.1.18, align 4, !tbaa !16
  %vecext.2.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 2
  %add69.2.18 = or disjoint i64 %mul56.18, %122
  %add71.2.18 = or disjoint i64 %add69.2.18, %conv70
  %arrayidx72.2.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.18
  store i32 %vecext.2.18, ptr addrspace(1) %arrayidx72.2.18, align 4, !tbaa !16
  %vecext.3.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 3
  %add69.3.18 = or disjoint i64 %mul56.18, %124
  %add71.3.18 = or disjoint i64 %add69.3.18, %conv70
  %arrayidx72.3.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.18
  store i32 %vecext.3.18, ptr addrspace(1) %arrayidx72.3.18, align 4, !tbaa !16
  %add55.19 = mul nuw nsw i64 %add, 5632
  %mul56.19 = add nuw nsw i64 %add55.19, 4864
  %vecext.19 = extractelement <4 x i32> %sums.sroa.78.1, i64 0
  %add69.19 = or disjoint i64 %mul56.19, %118
  %add71.19 = or disjoint i64 %add69.19, %conv70
  %arrayidx72.19 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.19
  store i32 %vecext.19, ptr addrspace(1) %arrayidx72.19, align 4, !tbaa !16
  %vecext.1.19 = extractelement <4 x i32> %sums.sroa.78.1, i64 1
  %add69.1.19 = or disjoint i64 %mul56.19, %120
  %add71.1.19 = or disjoint i64 %add69.1.19, %conv70
  %arrayidx72.1.19 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.19
  store i32 %vecext.1.19, ptr addrspace(1) %arrayidx72.1.19, align 4, !tbaa !16
  %vecext.2.19 = extractelement <4 x i32> %sums.sroa.78.1, i64 2
  %add69.2.19 = or disjoint i64 %mul56.19, %122
  %add71.2.19 = or disjoint i64 %add69.2.19, %conv70
  %arrayidx72.2.19 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.19
  store i32 %vecext.2.19, ptr addrspace(1) %arrayidx72.2.19, align 4, !tbaa !16
  %vecext.3.19 = extractelement <4 x i32> %sums.sroa.78.1, i64 3
  %add69.3.19 = or disjoint i64 %mul56.19, %124
  %add71.3.19 = or disjoint i64 %add69.3.19, %conv70
  %arrayidx72.3.19 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.19
  store i32 %vecext.3.19, ptr addrspace(1) %arrayidx72.3.19, align 4, !tbaa !16
  %add55.20 = mul nuw nsw i64 %add, 5632
  %mul56.20 = add nuw nsw i64 %add55.20, 5120
  %vecext.20 = extractelement <4 x i32> %sums.sroa.82.1, i64 0
  %add69.20 = or disjoint i64 %mul56.20, %118
  %add71.20 = or disjoint i64 %add69.20, %conv70
  %arrayidx72.20 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.20
  store i32 %vecext.20, ptr addrspace(1) %arrayidx72.20, align 4, !tbaa !16
  %vecext.1.20 = extractelement <4 x i32> %sums.sroa.82.1, i64 1
  %add69.1.20 = or disjoint i64 %mul56.20, %120
  %add71.1.20 = or disjoint i64 %add69.1.20, %conv70
  %arrayidx72.1.20 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.20
  store i32 %vecext.1.20, ptr addrspace(1) %arrayidx72.1.20, align 4, !tbaa !16
  %vecext.2.20 = extractelement <4 x i32> %sums.sroa.82.1, i64 2
  %add69.2.20 = or disjoint i64 %mul56.20, %122
  %add71.2.20 = or disjoint i64 %add69.2.20, %conv70
  %arrayidx72.2.20 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.20
  store i32 %vecext.2.20, ptr addrspace(1) %arrayidx72.2.20, align 4, !tbaa !16
  %vecext.3.20 = extractelement <4 x i32> %sums.sroa.82.1, i64 3
  %add69.3.20 = or disjoint i64 %mul56.20, %124
  %add71.3.20 = or disjoint i64 %add69.3.20, %conv70
  %arrayidx72.3.20 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.20
  store i32 %vecext.3.20, ptr addrspace(1) %arrayidx72.3.20, align 4, !tbaa !16
  %add55.21 = mul nuw nsw i64 %add, 5632
  %mul56.21 = add nuw nsw i64 %add55.21, 5376
  %vecext.21 = extractelement <4 x i32> %sums.sroa.86.1, i64 0
  %add69.21 = or disjoint i64 %mul56.21, %118
  %add71.21 = or disjoint i64 %add69.21, %conv70
  %arrayidx72.21 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.21
  store i32 %vecext.21, ptr addrspace(1) %arrayidx72.21, align 4, !tbaa !16
  %vecext.1.21 = extractelement <4 x i32> %sums.sroa.86.1, i64 1
  %add69.1.21 = or disjoint i64 %mul56.21, %120
  %add71.1.21 = or disjoint i64 %add69.1.21, %conv70
  %arrayidx72.1.21 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.21
  store i32 %vecext.1.21, ptr addrspace(1) %arrayidx72.1.21, align 4, !tbaa !16
  %vecext.2.21 = extractelement <4 x i32> %sums.sroa.86.1, i64 2
  %add69.2.21 = or disjoint i64 %mul56.21, %122
  %add71.2.21 = or disjoint i64 %add69.2.21, %conv70
  %arrayidx72.2.21 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.21
  store i32 %vecext.2.21, ptr addrspace(1) %arrayidx72.2.21, align 4, !tbaa !16
  %vecext.3.21 = extractelement <4 x i32> %sums.sroa.86.1, i64 3
  %add69.3.21 = or disjoint i64 %mul56.21, %124
  %add71.3.21 = or disjoint i64 %add69.3.21, %conv70
  %arrayidx72.3.21 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.21
  store i32 %vecext.3.21, ptr addrspace(1) %arrayidx72.3.21, align 4, !tbaa !16
  ret void
}

; Function Attrs: convergent mustprogress nofree norecurse nounwind memory(argmem: readwrite)
define protected metaxgpu_kernel void @_Z13mmaPeakKernelILi23EEvPKaS1_Pii(ptr addrspace(1) noalias nocapture noundef readonly %a.coerce, ptr addrspace(1) noalias nocapture noundef readonly %b.coerce, ptr addrspace(1) noalias noundef writeonly %c.coerce, i32 noundef %iterations) local_unnamed_addr #3 comdat {
entry:
  %0 = tail call noundef range(i32 0, 1024) i32 @llvm.mxc.thread.id.x(), !range !25
  %1 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.mxc.dispatch.ptr()
  %2 = getelementptr inbounds i8, ptr addrspace(4) %1, i64 4
  %3 = load i16, ptr addrspace(4) %2, align 4, !range !26, !invariant.load !14
  %rem11 = and i32 %0, 15
  %4 = lshr i32 %0, 2
  %mul13 = and i32 %4, 12
  %mul15 = shl nuw nsw i32 %rem11, 4
  %5 = zext nneg i32 %mul15 to i64
  %6 = zext nneg i32 %mul13 to i64
  %7 = or disjoint i64 %5, %6
  %add.ptr = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %7
  %8 = load i32, ptr addrspace(1) %add.ptr, align 1
  %add.ptr21 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %7
  %9 = load i32, ptr addrspace(1) %add.ptr21, align 1
  %10 = or disjoint i64 %5, %6
  %11 = or disjoint i64 %10, 256
  %add.ptr.1 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %11
  %12 = load i32, ptr addrspace(1) %add.ptr.1, align 1
  %add.ptr21.1 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %11
  %13 = load i32, ptr addrspace(1) %add.ptr21.1, align 1
  %14 = or disjoint i64 %5, %6
  %15 = or disjoint i64 %14, 512
  %add.ptr.2 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %15
  %16 = load i32, ptr addrspace(1) %add.ptr.2, align 1
  %add.ptr21.2 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %15
  %17 = load i32, ptr addrspace(1) %add.ptr21.2, align 1
  %18 = or disjoint i64 %5, %6
  %19 = or disjoint i64 %18, 768
  %add.ptr.3 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %19
  %20 = load i32, ptr addrspace(1) %add.ptr.3, align 1
  %add.ptr21.3 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %19
  %21 = load i32, ptr addrspace(1) %add.ptr21.3, align 1
  %22 = or disjoint i64 %5, %6
  %23 = or disjoint i64 %22, 1024
  %add.ptr.4 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %23
  %24 = load i32, ptr addrspace(1) %add.ptr.4, align 1
  %add.ptr21.4 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %23
  %25 = load i32, ptr addrspace(1) %add.ptr21.4, align 1
  %26 = or disjoint i64 %5, %6
  %27 = or disjoint i64 %26, 1280
  %add.ptr.5 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %27
  %28 = load i32, ptr addrspace(1) %add.ptr.5, align 1
  %add.ptr21.5 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %27
  %29 = load i32, ptr addrspace(1) %add.ptr21.5, align 1
  %30 = or disjoint i64 %5, %6
  %31 = or disjoint i64 %30, 1536
  %add.ptr.6 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %31
  %32 = load i32, ptr addrspace(1) %add.ptr.6, align 1
  %add.ptr21.6 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %31
  %33 = load i32, ptr addrspace(1) %add.ptr21.6, align 1
  %34 = or disjoint i64 %5, %6
  %35 = or disjoint i64 %34, 1792
  %add.ptr.7 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %35
  %36 = load i32, ptr addrspace(1) %add.ptr.7, align 1
  %add.ptr21.7 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %35
  %37 = load i32, ptr addrspace(1) %add.ptr21.7, align 1
  %38 = or disjoint i64 %5, %6
  %39 = or disjoint i64 %38, 2048
  %add.ptr.8 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %39
  %40 = load i32, ptr addrspace(1) %add.ptr.8, align 1
  %add.ptr21.8 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %39
  %41 = load i32, ptr addrspace(1) %add.ptr21.8, align 1
  %42 = or disjoint i64 %5, %6
  %43 = or disjoint i64 %42, 2304
  %add.ptr.9 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %43
  %44 = load i32, ptr addrspace(1) %add.ptr.9, align 1
  %add.ptr21.9 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %43
  %45 = load i32, ptr addrspace(1) %add.ptr21.9, align 1
  %46 = or disjoint i64 %5, %6
  %47 = or disjoint i64 %46, 2560
  %add.ptr.10 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %47
  %48 = load i32, ptr addrspace(1) %add.ptr.10, align 1
  %add.ptr21.10 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %47
  %49 = load i32, ptr addrspace(1) %add.ptr21.10, align 1
  %50 = or disjoint i64 %5, %6
  %51 = or disjoint i64 %50, 2816
  %add.ptr.11 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %51
  %52 = load i32, ptr addrspace(1) %add.ptr.11, align 1
  %add.ptr21.11 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %51
  %53 = load i32, ptr addrspace(1) %add.ptr21.11, align 1
  %54 = or disjoint i64 %5, %6
  %55 = or disjoint i64 %54, 3072
  %add.ptr.12 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %55
  %56 = load i32, ptr addrspace(1) %add.ptr.12, align 1
  %add.ptr21.12 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %55
  %57 = load i32, ptr addrspace(1) %add.ptr21.12, align 1
  %58 = or disjoint i64 %5, %6
  %59 = or disjoint i64 %58, 3328
  %add.ptr.13 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %59
  %60 = load i32, ptr addrspace(1) %add.ptr.13, align 1
  %add.ptr21.13 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %59
  %61 = load i32, ptr addrspace(1) %add.ptr21.13, align 1
  %62 = or disjoint i64 %5, %6
  %63 = or disjoint i64 %62, 3584
  %add.ptr.14 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %63
  %64 = load i32, ptr addrspace(1) %add.ptr.14, align 1
  %add.ptr21.14 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %63
  %65 = load i32, ptr addrspace(1) %add.ptr21.14, align 1
  %66 = or disjoint i64 %5, %6
  %67 = or disjoint i64 %66, 3840
  %add.ptr.15 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %67
  %68 = load i32, ptr addrspace(1) %add.ptr.15, align 1
  %add.ptr21.15 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %67
  %69 = load i32, ptr addrspace(1) %add.ptr21.15, align 1
  %70 = or disjoint i64 %5, %6
  %71 = or disjoint i64 %70, 4096
  %add.ptr.16 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %71
  %72 = load i32, ptr addrspace(1) %add.ptr.16, align 1
  %add.ptr21.16 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %71
  %73 = load i32, ptr addrspace(1) %add.ptr21.16, align 1
  %74 = or disjoint i64 %5, %6
  %75 = or disjoint i64 %74, 4352
  %add.ptr.17 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %75
  %76 = load i32, ptr addrspace(1) %add.ptr.17, align 1
  %add.ptr21.17 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %75
  %77 = load i32, ptr addrspace(1) %add.ptr21.17, align 1
  %78 = or disjoint i64 %5, %6
  %79 = or disjoint i64 %78, 4608
  %add.ptr.18 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %79
  %80 = load i32, ptr addrspace(1) %add.ptr.18, align 1
  %add.ptr21.18 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %79
  %81 = load i32, ptr addrspace(1) %add.ptr21.18, align 1
  %82 = or disjoint i64 %5, %6
  %83 = or disjoint i64 %82, 4864
  %add.ptr.19 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %83
  %84 = load i32, ptr addrspace(1) %add.ptr.19, align 1
  %add.ptr21.19 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %83
  %85 = load i32, ptr addrspace(1) %add.ptr21.19, align 1
  %86 = or disjoint i64 %5, %6
  %87 = or disjoint i64 %86, 5120
  %add.ptr.20 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %87
  %88 = load i32, ptr addrspace(1) %add.ptr.20, align 1
  %add.ptr21.20 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %87
  %89 = load i32, ptr addrspace(1) %add.ptr21.20, align 1
  %90 = or disjoint i64 %5, %6
  %91 = or disjoint i64 %90, 5376
  %add.ptr.21 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %91
  %92 = load i32, ptr addrspace(1) %add.ptr.21, align 1
  %add.ptr21.21 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %91
  %93 = load i32, ptr addrspace(1) %add.ptr21.21, align 1
  %94 = or disjoint i64 %5, %6
  %95 = or disjoint i64 %94, 5632
  %add.ptr.22 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %95
  %96 = load i32, ptr addrspace(1) %add.ptr.22, align 1
  %add.ptr21.22 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %95
  %97 = load i32, ptr addrspace(1) %add.ptr21.22, align 1
  %cmp25104 = icmp sgt i32 %iterations, 0
  br i1 %cmp25104, label %for.cond30.preheader, label %for.cond49.preheader

for.cond30.preheader:                             ; preds = %entry, %for.cond30.preheader
  %sums.sroa.90.0 = phi <4 x i32> [ %120, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.86.0 = phi <4 x i32> [ %119, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.82.0 = phi <4 x i32> [ %118, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.78.0 = phi <4 x i32> [ %117, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.74.0 = phi <4 x i32> [ %116, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.70.0 = phi <4 x i32> [ %115, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.66.0 = phi <4 x i32> [ %114, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.62.0 = phi <4 x i32> [ %113, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.58.0 = phi <4 x i32> [ %112, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.54.0 = phi <4 x i32> [ %111, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.50.0 = phi <4 x i32> [ %110, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.46.0 = phi <4 x i32> [ %109, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.42.0 = phi <4 x i32> [ %108, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.38.0 = phi <4 x i32> [ %107, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.34.0 = phi <4 x i32> [ %106, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.30.0 = phi <4 x i32> [ %105, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.26.0 = phi <4 x i32> [ %104, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.22.0 = phi <4 x i32> [ %103, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.18.0 = phi <4 x i32> [ %102, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.14.0 = phi <4 x i32> [ %101, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.10.0 = phi <4 x i32> [ %100, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.6.0 = phi <4 x i32> [ %99, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.0.0 = phi <4 x i32> [ %98, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %iteration.0105 = phi i32 [ %inc46, %for.cond30.preheader ], [ 0, %entry ]
  %98 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %8, i32 %9, <4 x i32> %sums.sroa.0.0), !call_argsrelate !27
  %99 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %12, i32 %13, <4 x i32> %sums.sroa.6.0), !call_argsrelate !27
  %100 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %16, i32 %17, <4 x i32> %sums.sroa.10.0), !call_argsrelate !27
  %101 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %20, i32 %21, <4 x i32> %sums.sroa.14.0), !call_argsrelate !27
  %102 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %24, i32 %25, <4 x i32> %sums.sroa.18.0), !call_argsrelate !27
  %103 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %28, i32 %29, <4 x i32> %sums.sroa.22.0), !call_argsrelate !27
  %104 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %32, i32 %33, <4 x i32> %sums.sroa.26.0), !call_argsrelate !27
  %105 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %36, i32 %37, <4 x i32> %sums.sroa.30.0), !call_argsrelate !27
  %106 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %40, i32 %41, <4 x i32> %sums.sroa.34.0), !call_argsrelate !27
  %107 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %44, i32 %45, <4 x i32> %sums.sroa.38.0), !call_argsrelate !27
  %108 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %48, i32 %49, <4 x i32> %sums.sroa.42.0), !call_argsrelate !27
  %109 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %52, i32 %53, <4 x i32> %sums.sroa.46.0), !call_argsrelate !27
  %110 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %56, i32 %57, <4 x i32> %sums.sroa.50.0), !call_argsrelate !27
  %111 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %60, i32 %61, <4 x i32> %sums.sroa.54.0), !call_argsrelate !27
  %112 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %64, i32 %65, <4 x i32> %sums.sroa.58.0), !call_argsrelate !27
  %113 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %68, i32 %69, <4 x i32> %sums.sroa.62.0), !call_argsrelate !27
  %114 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %72, i32 %73, <4 x i32> %sums.sroa.66.0), !call_argsrelate !27
  %115 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %76, i32 %77, <4 x i32> %sums.sroa.70.0), !call_argsrelate !27
  %116 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %80, i32 %81, <4 x i32> %sums.sroa.74.0), !call_argsrelate !27
  %117 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %84, i32 %85, <4 x i32> %sums.sroa.78.0), !call_argsrelate !27
  %118 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %88, i32 %89, <4 x i32> %sums.sroa.82.0), !call_argsrelate !27
  %119 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %92, i32 %93, <4 x i32> %sums.sroa.86.0), !call_argsrelate !27
  %120 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %96, i32 %97, <4 x i32> %sums.sroa.90.0), !call_argsrelate !27
  %inc46 = add nuw nsw i32 %iteration.0105, 1
  %exitcond.not = icmp eq i32 %inc46, %iterations
  br i1 %exitcond.not, label %for.cond49.preheader, label %for.cond30.preheader, !llvm.loop !40

for.cond49.preheader:                             ; preds = %for.cond30.preheader, %entry
  %sums.sroa.90.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %120, %for.cond30.preheader ]
  %sums.sroa.86.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %119, %for.cond30.preheader ]
  %sums.sroa.82.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %118, %for.cond30.preheader ]
  %sums.sroa.78.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %117, %for.cond30.preheader ]
  %sums.sroa.74.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %116, %for.cond30.preheader ]
  %sums.sroa.70.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %115, %for.cond30.preheader ]
  %sums.sroa.66.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %114, %for.cond30.preheader ]
  %sums.sroa.62.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %113, %for.cond30.preheader ]
  %sums.sroa.58.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %112, %for.cond30.preheader ]
  %sums.sroa.54.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %111, %for.cond30.preheader ]
  %sums.sroa.50.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %110, %for.cond30.preheader ]
  %sums.sroa.46.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %109, %for.cond30.preheader ]
  %sums.sroa.42.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %108, %for.cond30.preheader ]
  %sums.sroa.38.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %107, %for.cond30.preheader ]
  %sums.sroa.34.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %106, %for.cond30.preheader ]
  %sums.sroa.30.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %105, %for.cond30.preheader ]
  %sums.sroa.26.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %104, %for.cond30.preheader ]
  %sums.sroa.22.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %103, %for.cond30.preheader ]
  %sums.sroa.18.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %102, %for.cond30.preheader ]
  %sums.sroa.14.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %101, %for.cond30.preheader ]
  %sums.sroa.10.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %100, %for.cond30.preheader ]
  %sums.sroa.6.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %99, %for.cond30.preheader ]
  %sums.sroa.0.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %98, %for.cond30.preheader ]
  %121 = lshr i16 %3, 6
  %conv7 = zext nneg i16 %121 to i64
  %122 = tail call noundef range(i32 0, 2147483647) i32 @llvm.mxc.block.id.x(), !range !15
  %conv = zext nneg i32 %122 to i64
  %mul = mul nuw nsw i64 %conv7, %conv
  %div9100 = lshr i32 %0, 6
  %conv10 = zext nneg i32 %div9100 to i64
  %add = add nuw nsw i64 %mul, %conv10
  %conv70 = zext nneg i32 %rem11 to i64
  %mul56 = mul nuw nsw i64 %add, 5888
  %vecext = extractelement <4 x i32> %sums.sroa.0.1, i64 0
  %123 = shl nuw nsw i64 %6, 4
  %add69 = or disjoint i64 %mul56, %123
  %add71 = or disjoint i64 %add69, %conv70
  %arrayidx72 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71
  store i32 %vecext, ptr addrspace(1) %arrayidx72, align 4, !tbaa !16
  %vecext.1 = extractelement <4 x i32> %sums.sroa.0.1, i64 1
  %124 = shl nuw nsw i64 %6, 4
  %125 = or disjoint i64 %124, 16
  %add69.1 = or disjoint i64 %mul56, %125
  %add71.1 = or disjoint i64 %add69.1, %conv70
  %arrayidx72.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1
  store i32 %vecext.1, ptr addrspace(1) %arrayidx72.1, align 4, !tbaa !16
  %vecext.2 = extractelement <4 x i32> %sums.sroa.0.1, i64 2
  %126 = shl nuw nsw i64 %6, 4
  %127 = or disjoint i64 %126, 32
  %add69.2 = or disjoint i64 %mul56, %127
  %add71.2 = or disjoint i64 %add69.2, %conv70
  %arrayidx72.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2
  store i32 %vecext.2, ptr addrspace(1) %arrayidx72.2, align 4, !tbaa !16
  %vecext.3 = extractelement <4 x i32> %sums.sroa.0.1, i64 3
  %128 = shl nuw nsw i64 %6, 4
  %129 = or disjoint i64 %128, 48
  %add69.3 = or disjoint i64 %mul56, %129
  %add71.3 = or disjoint i64 %add69.3, %conv70
  %arrayidx72.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3
  store i32 %vecext.3, ptr addrspace(1) %arrayidx72.3, align 4, !tbaa !16
  %add55.1 = mul nuw nsw i64 %add, 5888
  %mul56.1 = add nuw nsw i64 %add55.1, 256
  %vecext.1118 = extractelement <4 x i32> %sums.sroa.6.1, i64 0
  %add69.1119 = or disjoint i64 %mul56.1, %123
  %add71.1120 = or disjoint i64 %add69.1119, %conv70
  %arrayidx72.1121 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1120
  store i32 %vecext.1118, ptr addrspace(1) %arrayidx72.1121, align 4, !tbaa !16
  %vecext.1.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 1
  %add69.1.1 = or disjoint i64 %mul56.1, %125
  %add71.1.1 = or disjoint i64 %add69.1.1, %conv70
  %arrayidx72.1.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.1
  store i32 %vecext.1.1, ptr addrspace(1) %arrayidx72.1.1, align 4, !tbaa !16
  %vecext.2.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 2
  %add69.2.1 = or disjoint i64 %mul56.1, %127
  %add71.2.1 = or disjoint i64 %add69.2.1, %conv70
  %arrayidx72.2.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.1
  store i32 %vecext.2.1, ptr addrspace(1) %arrayidx72.2.1, align 4, !tbaa !16
  %vecext.3.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 3
  %add69.3.1 = or disjoint i64 %mul56.1, %129
  %add71.3.1 = or disjoint i64 %add69.3.1, %conv70
  %arrayidx72.3.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.1
  store i32 %vecext.3.1, ptr addrspace(1) %arrayidx72.3.1, align 4, !tbaa !16
  %add55.2 = mul nuw nsw i64 %add, 5888
  %mul56.2 = add nuw nsw i64 %add55.2, 512
  %vecext.2122 = extractelement <4 x i32> %sums.sroa.10.1, i64 0
  %add69.2123 = or disjoint i64 %mul56.2, %123
  %add71.2124 = or disjoint i64 %add69.2123, %conv70
  %arrayidx72.2125 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2124
  store i32 %vecext.2122, ptr addrspace(1) %arrayidx72.2125, align 4, !tbaa !16
  %vecext.1.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 1
  %add69.1.2 = or disjoint i64 %mul56.2, %125
  %add71.1.2 = or disjoint i64 %add69.1.2, %conv70
  %arrayidx72.1.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.2
  store i32 %vecext.1.2, ptr addrspace(1) %arrayidx72.1.2, align 4, !tbaa !16
  %vecext.2.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 2
  %add69.2.2 = or disjoint i64 %mul56.2, %127
  %add71.2.2 = or disjoint i64 %add69.2.2, %conv70
  %arrayidx72.2.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.2
  store i32 %vecext.2.2, ptr addrspace(1) %arrayidx72.2.2, align 4, !tbaa !16
  %vecext.3.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 3
  %add69.3.2 = or disjoint i64 %mul56.2, %129
  %add71.3.2 = or disjoint i64 %add69.3.2, %conv70
  %arrayidx72.3.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.2
  store i32 %vecext.3.2, ptr addrspace(1) %arrayidx72.3.2, align 4, !tbaa !16
  %add55.3 = mul nuw nsw i64 %add, 5888
  %mul56.3 = add nuw nsw i64 %add55.3, 768
  %vecext.3126 = extractelement <4 x i32> %sums.sroa.14.1, i64 0
  %add69.3127 = or disjoint i64 %mul56.3, %123
  %add71.3128 = or disjoint i64 %add69.3127, %conv70
  %arrayidx72.3129 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3128
  store i32 %vecext.3126, ptr addrspace(1) %arrayidx72.3129, align 4, !tbaa !16
  %vecext.1.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 1
  %add69.1.3 = or disjoint i64 %mul56.3, %125
  %add71.1.3 = or disjoint i64 %add69.1.3, %conv70
  %arrayidx72.1.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.3
  store i32 %vecext.1.3, ptr addrspace(1) %arrayidx72.1.3, align 4, !tbaa !16
  %vecext.2.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 2
  %add69.2.3 = or disjoint i64 %mul56.3, %127
  %add71.2.3 = or disjoint i64 %add69.2.3, %conv70
  %arrayidx72.2.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.3
  store i32 %vecext.2.3, ptr addrspace(1) %arrayidx72.2.3, align 4, !tbaa !16
  %vecext.3.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 3
  %add69.3.3 = or disjoint i64 %mul56.3, %129
  %add71.3.3 = or disjoint i64 %add69.3.3, %conv70
  %arrayidx72.3.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.3
  store i32 %vecext.3.3, ptr addrspace(1) %arrayidx72.3.3, align 4, !tbaa !16
  %add55.4 = mul nuw nsw i64 %add, 5888
  %mul56.4 = add nuw nsw i64 %add55.4, 1024
  %vecext.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 0
  %add69.4 = or disjoint i64 %mul56.4, %123
  %add71.4 = or disjoint i64 %add69.4, %conv70
  %arrayidx72.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.4
  store i32 %vecext.4, ptr addrspace(1) %arrayidx72.4, align 4, !tbaa !16
  %vecext.1.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 1
  %add69.1.4 = or disjoint i64 %mul56.4, %125
  %add71.1.4 = or disjoint i64 %add69.1.4, %conv70
  %arrayidx72.1.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.4
  store i32 %vecext.1.4, ptr addrspace(1) %arrayidx72.1.4, align 4, !tbaa !16
  %vecext.2.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 2
  %add69.2.4 = or disjoint i64 %mul56.4, %127
  %add71.2.4 = or disjoint i64 %add69.2.4, %conv70
  %arrayidx72.2.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.4
  store i32 %vecext.2.4, ptr addrspace(1) %arrayidx72.2.4, align 4, !tbaa !16
  %vecext.3.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 3
  %add69.3.4 = or disjoint i64 %mul56.4, %129
  %add71.3.4 = or disjoint i64 %add69.3.4, %conv70
  %arrayidx72.3.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.4
  store i32 %vecext.3.4, ptr addrspace(1) %arrayidx72.3.4, align 4, !tbaa !16
  %add55.5 = mul nuw nsw i64 %add, 5888
  %mul56.5 = add nuw nsw i64 %add55.5, 1280
  %vecext.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 0
  %add69.5 = or disjoint i64 %mul56.5, %123
  %add71.5 = or disjoint i64 %add69.5, %conv70
  %arrayidx72.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.5
  store i32 %vecext.5, ptr addrspace(1) %arrayidx72.5, align 4, !tbaa !16
  %vecext.1.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 1
  %add69.1.5 = or disjoint i64 %mul56.5, %125
  %add71.1.5 = or disjoint i64 %add69.1.5, %conv70
  %arrayidx72.1.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.5
  store i32 %vecext.1.5, ptr addrspace(1) %arrayidx72.1.5, align 4, !tbaa !16
  %vecext.2.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 2
  %add69.2.5 = or disjoint i64 %mul56.5, %127
  %add71.2.5 = or disjoint i64 %add69.2.5, %conv70
  %arrayidx72.2.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.5
  store i32 %vecext.2.5, ptr addrspace(1) %arrayidx72.2.5, align 4, !tbaa !16
  %vecext.3.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 3
  %add69.3.5 = or disjoint i64 %mul56.5, %129
  %add71.3.5 = or disjoint i64 %add69.3.5, %conv70
  %arrayidx72.3.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.5
  store i32 %vecext.3.5, ptr addrspace(1) %arrayidx72.3.5, align 4, !tbaa !16
  %add55.6 = mul nuw nsw i64 %add, 5888
  %mul56.6 = add nuw nsw i64 %add55.6, 1536
  %vecext.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 0
  %add69.6 = or disjoint i64 %mul56.6, %123
  %add71.6 = or disjoint i64 %add69.6, %conv70
  %arrayidx72.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.6
  store i32 %vecext.6, ptr addrspace(1) %arrayidx72.6, align 4, !tbaa !16
  %vecext.1.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 1
  %add69.1.6 = or disjoint i64 %mul56.6, %125
  %add71.1.6 = or disjoint i64 %add69.1.6, %conv70
  %arrayidx72.1.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.6
  store i32 %vecext.1.6, ptr addrspace(1) %arrayidx72.1.6, align 4, !tbaa !16
  %vecext.2.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 2
  %add69.2.6 = or disjoint i64 %mul56.6, %127
  %add71.2.6 = or disjoint i64 %add69.2.6, %conv70
  %arrayidx72.2.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.6
  store i32 %vecext.2.6, ptr addrspace(1) %arrayidx72.2.6, align 4, !tbaa !16
  %vecext.3.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 3
  %add69.3.6 = or disjoint i64 %mul56.6, %129
  %add71.3.6 = or disjoint i64 %add69.3.6, %conv70
  %arrayidx72.3.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.6
  store i32 %vecext.3.6, ptr addrspace(1) %arrayidx72.3.6, align 4, !tbaa !16
  %add55.7 = mul nuw nsw i64 %add, 5888
  %mul56.7 = add nuw nsw i64 %add55.7, 1792
  %vecext.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 0
  %add69.7 = or disjoint i64 %mul56.7, %123
  %add71.7 = or disjoint i64 %add69.7, %conv70
  %arrayidx72.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.7
  store i32 %vecext.7, ptr addrspace(1) %arrayidx72.7, align 4, !tbaa !16
  %vecext.1.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 1
  %add69.1.7 = or disjoint i64 %mul56.7, %125
  %add71.1.7 = or disjoint i64 %add69.1.7, %conv70
  %arrayidx72.1.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.7
  store i32 %vecext.1.7, ptr addrspace(1) %arrayidx72.1.7, align 4, !tbaa !16
  %vecext.2.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 2
  %add69.2.7 = or disjoint i64 %mul56.7, %127
  %add71.2.7 = or disjoint i64 %add69.2.7, %conv70
  %arrayidx72.2.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.7
  store i32 %vecext.2.7, ptr addrspace(1) %arrayidx72.2.7, align 4, !tbaa !16
  %vecext.3.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 3
  %add69.3.7 = or disjoint i64 %mul56.7, %129
  %add71.3.7 = or disjoint i64 %add69.3.7, %conv70
  %arrayidx72.3.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.7
  store i32 %vecext.3.7, ptr addrspace(1) %arrayidx72.3.7, align 4, !tbaa !16
  %add55.8 = mul nuw nsw i64 %add, 5888
  %mul56.8 = add nuw nsw i64 %add55.8, 2048
  %vecext.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 0
  %add69.8 = or disjoint i64 %mul56.8, %123
  %add71.8 = or disjoint i64 %add69.8, %conv70
  %arrayidx72.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.8
  store i32 %vecext.8, ptr addrspace(1) %arrayidx72.8, align 4, !tbaa !16
  %vecext.1.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 1
  %add69.1.8 = or disjoint i64 %mul56.8, %125
  %add71.1.8 = or disjoint i64 %add69.1.8, %conv70
  %arrayidx72.1.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.8
  store i32 %vecext.1.8, ptr addrspace(1) %arrayidx72.1.8, align 4, !tbaa !16
  %vecext.2.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 2
  %add69.2.8 = or disjoint i64 %mul56.8, %127
  %add71.2.8 = or disjoint i64 %add69.2.8, %conv70
  %arrayidx72.2.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.8
  store i32 %vecext.2.8, ptr addrspace(1) %arrayidx72.2.8, align 4, !tbaa !16
  %vecext.3.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 3
  %add69.3.8 = or disjoint i64 %mul56.8, %129
  %add71.3.8 = or disjoint i64 %add69.3.8, %conv70
  %arrayidx72.3.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.8
  store i32 %vecext.3.8, ptr addrspace(1) %arrayidx72.3.8, align 4, !tbaa !16
  %add55.9 = mul nuw nsw i64 %add, 5888
  %mul56.9 = add nuw nsw i64 %add55.9, 2304
  %vecext.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 0
  %add69.9 = or disjoint i64 %mul56.9, %123
  %add71.9 = or disjoint i64 %add69.9, %conv70
  %arrayidx72.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.9
  store i32 %vecext.9, ptr addrspace(1) %arrayidx72.9, align 4, !tbaa !16
  %vecext.1.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 1
  %add69.1.9 = or disjoint i64 %mul56.9, %125
  %add71.1.9 = or disjoint i64 %add69.1.9, %conv70
  %arrayidx72.1.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.9
  store i32 %vecext.1.9, ptr addrspace(1) %arrayidx72.1.9, align 4, !tbaa !16
  %vecext.2.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 2
  %add69.2.9 = or disjoint i64 %mul56.9, %127
  %add71.2.9 = or disjoint i64 %add69.2.9, %conv70
  %arrayidx72.2.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.9
  store i32 %vecext.2.9, ptr addrspace(1) %arrayidx72.2.9, align 4, !tbaa !16
  %vecext.3.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 3
  %add69.3.9 = or disjoint i64 %mul56.9, %129
  %add71.3.9 = or disjoint i64 %add69.3.9, %conv70
  %arrayidx72.3.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.9
  store i32 %vecext.3.9, ptr addrspace(1) %arrayidx72.3.9, align 4, !tbaa !16
  %add55.10 = mul nuw nsw i64 %add, 5888
  %mul56.10 = add nuw nsw i64 %add55.10, 2560
  %vecext.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 0
  %add69.10 = or disjoint i64 %mul56.10, %123
  %add71.10 = or disjoint i64 %add69.10, %conv70
  %arrayidx72.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.10
  store i32 %vecext.10, ptr addrspace(1) %arrayidx72.10, align 4, !tbaa !16
  %vecext.1.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 1
  %add69.1.10 = or disjoint i64 %mul56.10, %125
  %add71.1.10 = or disjoint i64 %add69.1.10, %conv70
  %arrayidx72.1.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.10
  store i32 %vecext.1.10, ptr addrspace(1) %arrayidx72.1.10, align 4, !tbaa !16
  %vecext.2.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 2
  %add69.2.10 = or disjoint i64 %mul56.10, %127
  %add71.2.10 = or disjoint i64 %add69.2.10, %conv70
  %arrayidx72.2.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.10
  store i32 %vecext.2.10, ptr addrspace(1) %arrayidx72.2.10, align 4, !tbaa !16
  %vecext.3.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 3
  %add69.3.10 = or disjoint i64 %mul56.10, %129
  %add71.3.10 = or disjoint i64 %add69.3.10, %conv70
  %arrayidx72.3.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.10
  store i32 %vecext.3.10, ptr addrspace(1) %arrayidx72.3.10, align 4, !tbaa !16
  %add55.11 = mul nuw nsw i64 %add, 5888
  %mul56.11 = add nuw nsw i64 %add55.11, 2816
  %vecext.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 0
  %add69.11 = or disjoint i64 %mul56.11, %123
  %add71.11 = or disjoint i64 %add69.11, %conv70
  %arrayidx72.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.11
  store i32 %vecext.11, ptr addrspace(1) %arrayidx72.11, align 4, !tbaa !16
  %vecext.1.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 1
  %add69.1.11 = or disjoint i64 %mul56.11, %125
  %add71.1.11 = or disjoint i64 %add69.1.11, %conv70
  %arrayidx72.1.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.11
  store i32 %vecext.1.11, ptr addrspace(1) %arrayidx72.1.11, align 4, !tbaa !16
  %vecext.2.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 2
  %add69.2.11 = or disjoint i64 %mul56.11, %127
  %add71.2.11 = or disjoint i64 %add69.2.11, %conv70
  %arrayidx72.2.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.11
  store i32 %vecext.2.11, ptr addrspace(1) %arrayidx72.2.11, align 4, !tbaa !16
  %vecext.3.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 3
  %add69.3.11 = or disjoint i64 %mul56.11, %129
  %add71.3.11 = or disjoint i64 %add69.3.11, %conv70
  %arrayidx72.3.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.11
  store i32 %vecext.3.11, ptr addrspace(1) %arrayidx72.3.11, align 4, !tbaa !16
  %add55.12 = mul nuw nsw i64 %add, 5888
  %mul56.12 = add nuw nsw i64 %add55.12, 3072
  %vecext.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 0
  %add69.12 = or disjoint i64 %mul56.12, %123
  %add71.12 = or disjoint i64 %add69.12, %conv70
  %arrayidx72.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.12
  store i32 %vecext.12, ptr addrspace(1) %arrayidx72.12, align 4, !tbaa !16
  %vecext.1.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 1
  %add69.1.12 = or disjoint i64 %mul56.12, %125
  %add71.1.12 = or disjoint i64 %add69.1.12, %conv70
  %arrayidx72.1.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.12
  store i32 %vecext.1.12, ptr addrspace(1) %arrayidx72.1.12, align 4, !tbaa !16
  %vecext.2.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 2
  %add69.2.12 = or disjoint i64 %mul56.12, %127
  %add71.2.12 = or disjoint i64 %add69.2.12, %conv70
  %arrayidx72.2.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.12
  store i32 %vecext.2.12, ptr addrspace(1) %arrayidx72.2.12, align 4, !tbaa !16
  %vecext.3.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 3
  %add69.3.12 = or disjoint i64 %mul56.12, %129
  %add71.3.12 = or disjoint i64 %add69.3.12, %conv70
  %arrayidx72.3.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.12
  store i32 %vecext.3.12, ptr addrspace(1) %arrayidx72.3.12, align 4, !tbaa !16
  %add55.13 = mul nuw nsw i64 %add, 5888
  %mul56.13 = add nuw nsw i64 %add55.13, 3328
  %vecext.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 0
  %add69.13 = or disjoint i64 %mul56.13, %123
  %add71.13 = or disjoint i64 %add69.13, %conv70
  %arrayidx72.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.13
  store i32 %vecext.13, ptr addrspace(1) %arrayidx72.13, align 4, !tbaa !16
  %vecext.1.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 1
  %add69.1.13 = or disjoint i64 %mul56.13, %125
  %add71.1.13 = or disjoint i64 %add69.1.13, %conv70
  %arrayidx72.1.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.13
  store i32 %vecext.1.13, ptr addrspace(1) %arrayidx72.1.13, align 4, !tbaa !16
  %vecext.2.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 2
  %add69.2.13 = or disjoint i64 %mul56.13, %127
  %add71.2.13 = or disjoint i64 %add69.2.13, %conv70
  %arrayidx72.2.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.13
  store i32 %vecext.2.13, ptr addrspace(1) %arrayidx72.2.13, align 4, !tbaa !16
  %vecext.3.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 3
  %add69.3.13 = or disjoint i64 %mul56.13, %129
  %add71.3.13 = or disjoint i64 %add69.3.13, %conv70
  %arrayidx72.3.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.13
  store i32 %vecext.3.13, ptr addrspace(1) %arrayidx72.3.13, align 4, !tbaa !16
  %add55.14 = mul nuw nsw i64 %add, 5888
  %mul56.14 = add nuw nsw i64 %add55.14, 3584
  %vecext.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 0
  %add69.14 = or disjoint i64 %mul56.14, %123
  %add71.14 = or disjoint i64 %add69.14, %conv70
  %arrayidx72.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.14
  store i32 %vecext.14, ptr addrspace(1) %arrayidx72.14, align 4, !tbaa !16
  %vecext.1.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 1
  %add69.1.14 = or disjoint i64 %mul56.14, %125
  %add71.1.14 = or disjoint i64 %add69.1.14, %conv70
  %arrayidx72.1.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.14
  store i32 %vecext.1.14, ptr addrspace(1) %arrayidx72.1.14, align 4, !tbaa !16
  %vecext.2.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 2
  %add69.2.14 = or disjoint i64 %mul56.14, %127
  %add71.2.14 = or disjoint i64 %add69.2.14, %conv70
  %arrayidx72.2.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.14
  store i32 %vecext.2.14, ptr addrspace(1) %arrayidx72.2.14, align 4, !tbaa !16
  %vecext.3.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 3
  %add69.3.14 = or disjoint i64 %mul56.14, %129
  %add71.3.14 = or disjoint i64 %add69.3.14, %conv70
  %arrayidx72.3.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.14
  store i32 %vecext.3.14, ptr addrspace(1) %arrayidx72.3.14, align 4, !tbaa !16
  %add55.15 = mul nuw nsw i64 %add, 5888
  %mul56.15 = add nuw nsw i64 %add55.15, 3840
  %vecext.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 0
  %add69.15 = or disjoint i64 %mul56.15, %123
  %add71.15 = or disjoint i64 %add69.15, %conv70
  %arrayidx72.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.15
  store i32 %vecext.15, ptr addrspace(1) %arrayidx72.15, align 4, !tbaa !16
  %vecext.1.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 1
  %add69.1.15 = or disjoint i64 %mul56.15, %125
  %add71.1.15 = or disjoint i64 %add69.1.15, %conv70
  %arrayidx72.1.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.15
  store i32 %vecext.1.15, ptr addrspace(1) %arrayidx72.1.15, align 4, !tbaa !16
  %vecext.2.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 2
  %add69.2.15 = or disjoint i64 %mul56.15, %127
  %add71.2.15 = or disjoint i64 %add69.2.15, %conv70
  %arrayidx72.2.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.15
  store i32 %vecext.2.15, ptr addrspace(1) %arrayidx72.2.15, align 4, !tbaa !16
  %vecext.3.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 3
  %add69.3.15 = or disjoint i64 %mul56.15, %129
  %add71.3.15 = or disjoint i64 %add69.3.15, %conv70
  %arrayidx72.3.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.15
  store i32 %vecext.3.15, ptr addrspace(1) %arrayidx72.3.15, align 4, !tbaa !16
  %add55.16 = mul nuw nsw i64 %add, 5888
  %mul56.16 = add nuw nsw i64 %add55.16, 4096
  %vecext.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 0
  %add69.16 = or disjoint i64 %mul56.16, %123
  %add71.16 = or disjoint i64 %add69.16, %conv70
  %arrayidx72.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.16
  store i32 %vecext.16, ptr addrspace(1) %arrayidx72.16, align 4, !tbaa !16
  %vecext.1.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 1
  %add69.1.16 = or disjoint i64 %mul56.16, %125
  %add71.1.16 = or disjoint i64 %add69.1.16, %conv70
  %arrayidx72.1.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.16
  store i32 %vecext.1.16, ptr addrspace(1) %arrayidx72.1.16, align 4, !tbaa !16
  %vecext.2.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 2
  %add69.2.16 = or disjoint i64 %mul56.16, %127
  %add71.2.16 = or disjoint i64 %add69.2.16, %conv70
  %arrayidx72.2.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.16
  store i32 %vecext.2.16, ptr addrspace(1) %arrayidx72.2.16, align 4, !tbaa !16
  %vecext.3.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 3
  %add69.3.16 = or disjoint i64 %mul56.16, %129
  %add71.3.16 = or disjoint i64 %add69.3.16, %conv70
  %arrayidx72.3.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.16
  store i32 %vecext.3.16, ptr addrspace(1) %arrayidx72.3.16, align 4, !tbaa !16
  %add55.17 = mul nuw nsw i64 %add, 5888
  %mul56.17 = add nuw nsw i64 %add55.17, 4352
  %vecext.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 0
  %add69.17 = or disjoint i64 %mul56.17, %123
  %add71.17 = or disjoint i64 %add69.17, %conv70
  %arrayidx72.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.17
  store i32 %vecext.17, ptr addrspace(1) %arrayidx72.17, align 4, !tbaa !16
  %vecext.1.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 1
  %add69.1.17 = or disjoint i64 %mul56.17, %125
  %add71.1.17 = or disjoint i64 %add69.1.17, %conv70
  %arrayidx72.1.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.17
  store i32 %vecext.1.17, ptr addrspace(1) %arrayidx72.1.17, align 4, !tbaa !16
  %vecext.2.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 2
  %add69.2.17 = or disjoint i64 %mul56.17, %127
  %add71.2.17 = or disjoint i64 %add69.2.17, %conv70
  %arrayidx72.2.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.17
  store i32 %vecext.2.17, ptr addrspace(1) %arrayidx72.2.17, align 4, !tbaa !16
  %vecext.3.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 3
  %add69.3.17 = or disjoint i64 %mul56.17, %129
  %add71.3.17 = or disjoint i64 %add69.3.17, %conv70
  %arrayidx72.3.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.17
  store i32 %vecext.3.17, ptr addrspace(1) %arrayidx72.3.17, align 4, !tbaa !16
  %add55.18 = mul nuw nsw i64 %add, 5888
  %mul56.18 = add nuw nsw i64 %add55.18, 4608
  %vecext.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 0
  %add69.18 = or disjoint i64 %mul56.18, %123
  %add71.18 = or disjoint i64 %add69.18, %conv70
  %arrayidx72.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.18
  store i32 %vecext.18, ptr addrspace(1) %arrayidx72.18, align 4, !tbaa !16
  %vecext.1.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 1
  %add69.1.18 = or disjoint i64 %mul56.18, %125
  %add71.1.18 = or disjoint i64 %add69.1.18, %conv70
  %arrayidx72.1.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.18
  store i32 %vecext.1.18, ptr addrspace(1) %arrayidx72.1.18, align 4, !tbaa !16
  %vecext.2.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 2
  %add69.2.18 = or disjoint i64 %mul56.18, %127
  %add71.2.18 = or disjoint i64 %add69.2.18, %conv70
  %arrayidx72.2.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.18
  store i32 %vecext.2.18, ptr addrspace(1) %arrayidx72.2.18, align 4, !tbaa !16
  %vecext.3.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 3
  %add69.3.18 = or disjoint i64 %mul56.18, %129
  %add71.3.18 = or disjoint i64 %add69.3.18, %conv70
  %arrayidx72.3.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.18
  store i32 %vecext.3.18, ptr addrspace(1) %arrayidx72.3.18, align 4, !tbaa !16
  %add55.19 = mul nuw nsw i64 %add, 5888
  %mul56.19 = add nuw nsw i64 %add55.19, 4864
  %vecext.19 = extractelement <4 x i32> %sums.sroa.78.1, i64 0
  %add69.19 = or disjoint i64 %mul56.19, %123
  %add71.19 = or disjoint i64 %add69.19, %conv70
  %arrayidx72.19 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.19
  store i32 %vecext.19, ptr addrspace(1) %arrayidx72.19, align 4, !tbaa !16
  %vecext.1.19 = extractelement <4 x i32> %sums.sroa.78.1, i64 1
  %add69.1.19 = or disjoint i64 %mul56.19, %125
  %add71.1.19 = or disjoint i64 %add69.1.19, %conv70
  %arrayidx72.1.19 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.19
  store i32 %vecext.1.19, ptr addrspace(1) %arrayidx72.1.19, align 4, !tbaa !16
  %vecext.2.19 = extractelement <4 x i32> %sums.sroa.78.1, i64 2
  %add69.2.19 = or disjoint i64 %mul56.19, %127
  %add71.2.19 = or disjoint i64 %add69.2.19, %conv70
  %arrayidx72.2.19 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.19
  store i32 %vecext.2.19, ptr addrspace(1) %arrayidx72.2.19, align 4, !tbaa !16
  %vecext.3.19 = extractelement <4 x i32> %sums.sroa.78.1, i64 3
  %add69.3.19 = or disjoint i64 %mul56.19, %129
  %add71.3.19 = or disjoint i64 %add69.3.19, %conv70
  %arrayidx72.3.19 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.19
  store i32 %vecext.3.19, ptr addrspace(1) %arrayidx72.3.19, align 4, !tbaa !16
  %add55.20 = mul nuw nsw i64 %add, 5888
  %mul56.20 = add nuw nsw i64 %add55.20, 5120
  %vecext.20 = extractelement <4 x i32> %sums.sroa.82.1, i64 0
  %add69.20 = or disjoint i64 %mul56.20, %123
  %add71.20 = or disjoint i64 %add69.20, %conv70
  %arrayidx72.20 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.20
  store i32 %vecext.20, ptr addrspace(1) %arrayidx72.20, align 4, !tbaa !16
  %vecext.1.20 = extractelement <4 x i32> %sums.sroa.82.1, i64 1
  %add69.1.20 = or disjoint i64 %mul56.20, %125
  %add71.1.20 = or disjoint i64 %add69.1.20, %conv70
  %arrayidx72.1.20 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.20
  store i32 %vecext.1.20, ptr addrspace(1) %arrayidx72.1.20, align 4, !tbaa !16
  %vecext.2.20 = extractelement <4 x i32> %sums.sroa.82.1, i64 2
  %add69.2.20 = or disjoint i64 %mul56.20, %127
  %add71.2.20 = or disjoint i64 %add69.2.20, %conv70
  %arrayidx72.2.20 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.20
  store i32 %vecext.2.20, ptr addrspace(1) %arrayidx72.2.20, align 4, !tbaa !16
  %vecext.3.20 = extractelement <4 x i32> %sums.sroa.82.1, i64 3
  %add69.3.20 = or disjoint i64 %mul56.20, %129
  %add71.3.20 = or disjoint i64 %add69.3.20, %conv70
  %arrayidx72.3.20 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.20
  store i32 %vecext.3.20, ptr addrspace(1) %arrayidx72.3.20, align 4, !tbaa !16
  %add55.21 = mul nuw nsw i64 %add, 5888
  %mul56.21 = add nuw nsw i64 %add55.21, 5376
  %vecext.21 = extractelement <4 x i32> %sums.sroa.86.1, i64 0
  %add69.21 = or disjoint i64 %mul56.21, %123
  %add71.21 = or disjoint i64 %add69.21, %conv70
  %arrayidx72.21 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.21
  store i32 %vecext.21, ptr addrspace(1) %arrayidx72.21, align 4, !tbaa !16
  %vecext.1.21 = extractelement <4 x i32> %sums.sroa.86.1, i64 1
  %add69.1.21 = or disjoint i64 %mul56.21, %125
  %add71.1.21 = or disjoint i64 %add69.1.21, %conv70
  %arrayidx72.1.21 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.21
  store i32 %vecext.1.21, ptr addrspace(1) %arrayidx72.1.21, align 4, !tbaa !16
  %vecext.2.21 = extractelement <4 x i32> %sums.sroa.86.1, i64 2
  %add69.2.21 = or disjoint i64 %mul56.21, %127
  %add71.2.21 = or disjoint i64 %add69.2.21, %conv70
  %arrayidx72.2.21 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.21
  store i32 %vecext.2.21, ptr addrspace(1) %arrayidx72.2.21, align 4, !tbaa !16
  %vecext.3.21 = extractelement <4 x i32> %sums.sroa.86.1, i64 3
  %add69.3.21 = or disjoint i64 %mul56.21, %129
  %add71.3.21 = or disjoint i64 %add69.3.21, %conv70
  %arrayidx72.3.21 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.21
  store i32 %vecext.3.21, ptr addrspace(1) %arrayidx72.3.21, align 4, !tbaa !16
  %add55.22 = mul nuw nsw i64 %add, 5888
  %mul56.22 = add nuw nsw i64 %add55.22, 5632
  %vecext.22 = extractelement <4 x i32> %sums.sroa.90.1, i64 0
  %add69.22 = or disjoint i64 %mul56.22, %123
  %add71.22 = or disjoint i64 %add69.22, %conv70
  %arrayidx72.22 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.22
  store i32 %vecext.22, ptr addrspace(1) %arrayidx72.22, align 4, !tbaa !16
  %vecext.1.22 = extractelement <4 x i32> %sums.sroa.90.1, i64 1
  %add69.1.22 = or disjoint i64 %mul56.22, %125
  %add71.1.22 = or disjoint i64 %add69.1.22, %conv70
  %arrayidx72.1.22 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.22
  store i32 %vecext.1.22, ptr addrspace(1) %arrayidx72.1.22, align 4, !tbaa !16
  %vecext.2.22 = extractelement <4 x i32> %sums.sroa.90.1, i64 2
  %add69.2.22 = or disjoint i64 %mul56.22, %127
  %add71.2.22 = or disjoint i64 %add69.2.22, %conv70
  %arrayidx72.2.22 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.22
  store i32 %vecext.2.22, ptr addrspace(1) %arrayidx72.2.22, align 4, !tbaa !16
  %vecext.3.22 = extractelement <4 x i32> %sums.sroa.90.1, i64 3
  %add69.3.22 = or disjoint i64 %mul56.22, %129
  %add71.3.22 = or disjoint i64 %add69.3.22, %conv70
  %arrayidx72.3.22 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.22
  store i32 %vecext.3.22, ptr addrspace(1) %arrayidx72.3.22, align 4, !tbaa !16
  ret void
}

; Function Attrs: convergent mustprogress nofree norecurse nounwind memory(argmem: readwrite)
define protected metaxgpu_kernel void @_Z13mmaPeakKernelILi24EEvPKaS1_Pii(ptr addrspace(1) noalias nocapture noundef readonly %a.coerce, ptr addrspace(1) noalias nocapture noundef readonly %b.coerce, ptr addrspace(1) noalias noundef writeonly %c.coerce, i32 noundef %iterations) local_unnamed_addr #3 comdat {
entry:
  %0 = tail call noundef range(i32 0, 1024) i32 @llvm.mxc.thread.id.x(), !range !25
  %1 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.mxc.dispatch.ptr()
  %2 = getelementptr inbounds i8, ptr addrspace(4) %1, i64 4
  %3 = load i16, ptr addrspace(4) %2, align 4, !range !26, !invariant.load !14
  %rem11 = and i32 %0, 15
  %4 = lshr i32 %0, 2
  %mul13 = and i32 %4, 12
  %mul15 = shl nuw nsw i32 %rem11, 4
  %5 = zext nneg i32 %mul15 to i64
  %6 = zext nneg i32 %mul13 to i64
  %7 = or disjoint i64 %5, %6
  %add.ptr = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %7
  %8 = load i32, ptr addrspace(1) %add.ptr, align 1
  %add.ptr21 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %7
  %9 = load i32, ptr addrspace(1) %add.ptr21, align 1
  %10 = or disjoint i64 %5, %6
  %11 = or disjoint i64 %10, 256
  %add.ptr.1 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %11
  %12 = load i32, ptr addrspace(1) %add.ptr.1, align 1
  %add.ptr21.1 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %11
  %13 = load i32, ptr addrspace(1) %add.ptr21.1, align 1
  %14 = or disjoint i64 %5, %6
  %15 = or disjoint i64 %14, 512
  %add.ptr.2 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %15
  %16 = load i32, ptr addrspace(1) %add.ptr.2, align 1
  %add.ptr21.2 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %15
  %17 = load i32, ptr addrspace(1) %add.ptr21.2, align 1
  %18 = or disjoint i64 %5, %6
  %19 = or disjoint i64 %18, 768
  %add.ptr.3 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %19
  %20 = load i32, ptr addrspace(1) %add.ptr.3, align 1
  %add.ptr21.3 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %19
  %21 = load i32, ptr addrspace(1) %add.ptr21.3, align 1
  %22 = or disjoint i64 %5, %6
  %23 = or disjoint i64 %22, 1024
  %add.ptr.4 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %23
  %24 = load i32, ptr addrspace(1) %add.ptr.4, align 1
  %add.ptr21.4 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %23
  %25 = load i32, ptr addrspace(1) %add.ptr21.4, align 1
  %26 = or disjoint i64 %5, %6
  %27 = or disjoint i64 %26, 1280
  %add.ptr.5 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %27
  %28 = load i32, ptr addrspace(1) %add.ptr.5, align 1
  %add.ptr21.5 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %27
  %29 = load i32, ptr addrspace(1) %add.ptr21.5, align 1
  %30 = or disjoint i64 %5, %6
  %31 = or disjoint i64 %30, 1536
  %add.ptr.6 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %31
  %32 = load i32, ptr addrspace(1) %add.ptr.6, align 1
  %add.ptr21.6 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %31
  %33 = load i32, ptr addrspace(1) %add.ptr21.6, align 1
  %34 = or disjoint i64 %5, %6
  %35 = or disjoint i64 %34, 1792
  %add.ptr.7 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %35
  %36 = load i32, ptr addrspace(1) %add.ptr.7, align 1
  %add.ptr21.7 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %35
  %37 = load i32, ptr addrspace(1) %add.ptr21.7, align 1
  %38 = or disjoint i64 %5, %6
  %39 = or disjoint i64 %38, 2048
  %add.ptr.8 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %39
  %40 = load i32, ptr addrspace(1) %add.ptr.8, align 1
  %add.ptr21.8 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %39
  %41 = load i32, ptr addrspace(1) %add.ptr21.8, align 1
  %42 = or disjoint i64 %5, %6
  %43 = or disjoint i64 %42, 2304
  %add.ptr.9 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %43
  %44 = load i32, ptr addrspace(1) %add.ptr.9, align 1
  %add.ptr21.9 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %43
  %45 = load i32, ptr addrspace(1) %add.ptr21.9, align 1
  %46 = or disjoint i64 %5, %6
  %47 = or disjoint i64 %46, 2560
  %add.ptr.10 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %47
  %48 = load i32, ptr addrspace(1) %add.ptr.10, align 1
  %add.ptr21.10 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %47
  %49 = load i32, ptr addrspace(1) %add.ptr21.10, align 1
  %50 = or disjoint i64 %5, %6
  %51 = or disjoint i64 %50, 2816
  %add.ptr.11 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %51
  %52 = load i32, ptr addrspace(1) %add.ptr.11, align 1
  %add.ptr21.11 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %51
  %53 = load i32, ptr addrspace(1) %add.ptr21.11, align 1
  %54 = or disjoint i64 %5, %6
  %55 = or disjoint i64 %54, 3072
  %add.ptr.12 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %55
  %56 = load i32, ptr addrspace(1) %add.ptr.12, align 1
  %add.ptr21.12 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %55
  %57 = load i32, ptr addrspace(1) %add.ptr21.12, align 1
  %58 = or disjoint i64 %5, %6
  %59 = or disjoint i64 %58, 3328
  %add.ptr.13 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %59
  %60 = load i32, ptr addrspace(1) %add.ptr.13, align 1
  %add.ptr21.13 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %59
  %61 = load i32, ptr addrspace(1) %add.ptr21.13, align 1
  %62 = or disjoint i64 %5, %6
  %63 = or disjoint i64 %62, 3584
  %add.ptr.14 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %63
  %64 = load i32, ptr addrspace(1) %add.ptr.14, align 1
  %add.ptr21.14 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %63
  %65 = load i32, ptr addrspace(1) %add.ptr21.14, align 1
  %66 = or disjoint i64 %5, %6
  %67 = or disjoint i64 %66, 3840
  %add.ptr.15 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %67
  %68 = load i32, ptr addrspace(1) %add.ptr.15, align 1
  %add.ptr21.15 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %67
  %69 = load i32, ptr addrspace(1) %add.ptr21.15, align 1
  %70 = or disjoint i64 %5, %6
  %71 = or disjoint i64 %70, 4096
  %add.ptr.16 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %71
  %72 = load i32, ptr addrspace(1) %add.ptr.16, align 1
  %add.ptr21.16 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %71
  %73 = load i32, ptr addrspace(1) %add.ptr21.16, align 1
  %74 = or disjoint i64 %5, %6
  %75 = or disjoint i64 %74, 4352
  %add.ptr.17 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %75
  %76 = load i32, ptr addrspace(1) %add.ptr.17, align 1
  %add.ptr21.17 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %75
  %77 = load i32, ptr addrspace(1) %add.ptr21.17, align 1
  %78 = or disjoint i64 %5, %6
  %79 = or disjoint i64 %78, 4608
  %add.ptr.18 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %79
  %80 = load i32, ptr addrspace(1) %add.ptr.18, align 1
  %add.ptr21.18 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %79
  %81 = load i32, ptr addrspace(1) %add.ptr21.18, align 1
  %82 = or disjoint i64 %5, %6
  %83 = or disjoint i64 %82, 4864
  %add.ptr.19 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %83
  %84 = load i32, ptr addrspace(1) %add.ptr.19, align 1
  %add.ptr21.19 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %83
  %85 = load i32, ptr addrspace(1) %add.ptr21.19, align 1
  %86 = or disjoint i64 %5, %6
  %87 = or disjoint i64 %86, 5120
  %add.ptr.20 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %87
  %88 = load i32, ptr addrspace(1) %add.ptr.20, align 1
  %add.ptr21.20 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %87
  %89 = load i32, ptr addrspace(1) %add.ptr21.20, align 1
  %90 = or disjoint i64 %5, %6
  %91 = or disjoint i64 %90, 5376
  %add.ptr.21 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %91
  %92 = load i32, ptr addrspace(1) %add.ptr.21, align 1
  %add.ptr21.21 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %91
  %93 = load i32, ptr addrspace(1) %add.ptr21.21, align 1
  %94 = or disjoint i64 %5, %6
  %95 = or disjoint i64 %94, 5632
  %add.ptr.22 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %95
  %96 = load i32, ptr addrspace(1) %add.ptr.22, align 1
  %add.ptr21.22 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %95
  %97 = load i32, ptr addrspace(1) %add.ptr21.22, align 1
  %98 = or disjoint i64 %5, %6
  %99 = or disjoint i64 %98, 5888
  %add.ptr.23 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %99
  %100 = load i32, ptr addrspace(1) %add.ptr.23, align 1
  %add.ptr21.23 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %99
  %101 = load i32, ptr addrspace(1) %add.ptr21.23, align 1
  %cmp25104 = icmp sgt i32 %iterations, 0
  br i1 %cmp25104, label %for.cond30.preheader, label %for.cond49.preheader

for.cond30.preheader:                             ; preds = %entry, %for.cond30.preheader
  %sums.sroa.94.0 = phi <4 x i32> [ %125, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.90.0 = phi <4 x i32> [ %124, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.86.0 = phi <4 x i32> [ %123, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.82.0 = phi <4 x i32> [ %122, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.78.0 = phi <4 x i32> [ %121, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.74.0 = phi <4 x i32> [ %120, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.70.0 = phi <4 x i32> [ %119, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.66.0 = phi <4 x i32> [ %118, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.62.0 = phi <4 x i32> [ %117, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.58.0 = phi <4 x i32> [ %116, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.54.0 = phi <4 x i32> [ %115, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.50.0 = phi <4 x i32> [ %114, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.46.0 = phi <4 x i32> [ %113, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.42.0 = phi <4 x i32> [ %112, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.38.0 = phi <4 x i32> [ %111, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.34.0 = phi <4 x i32> [ %110, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.30.0 = phi <4 x i32> [ %109, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.26.0 = phi <4 x i32> [ %108, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.22.0 = phi <4 x i32> [ %107, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.18.0 = phi <4 x i32> [ %106, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.14.0 = phi <4 x i32> [ %105, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.10.0 = phi <4 x i32> [ %104, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.6.0 = phi <4 x i32> [ %103, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.0.0 = phi <4 x i32> [ %102, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %iteration.0105 = phi i32 [ %inc46, %for.cond30.preheader ], [ 0, %entry ]
  %102 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %8, i32 %9, <4 x i32> %sums.sroa.0.0), !call_argsrelate !27
  %103 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %12, i32 %13, <4 x i32> %sums.sroa.6.0), !call_argsrelate !27
  %104 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %16, i32 %17, <4 x i32> %sums.sroa.10.0), !call_argsrelate !27
  %105 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %20, i32 %21, <4 x i32> %sums.sroa.14.0), !call_argsrelate !27
  %106 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %24, i32 %25, <4 x i32> %sums.sroa.18.0), !call_argsrelate !27
  %107 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %28, i32 %29, <4 x i32> %sums.sroa.22.0), !call_argsrelate !27
  %108 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %32, i32 %33, <4 x i32> %sums.sroa.26.0), !call_argsrelate !27
  %109 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %36, i32 %37, <4 x i32> %sums.sroa.30.0), !call_argsrelate !27
  %110 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %40, i32 %41, <4 x i32> %sums.sroa.34.0), !call_argsrelate !27
  %111 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %44, i32 %45, <4 x i32> %sums.sroa.38.0), !call_argsrelate !27
  %112 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %48, i32 %49, <4 x i32> %sums.sroa.42.0), !call_argsrelate !27
  %113 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %52, i32 %53, <4 x i32> %sums.sroa.46.0), !call_argsrelate !27
  %114 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %56, i32 %57, <4 x i32> %sums.sroa.50.0), !call_argsrelate !27
  %115 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %60, i32 %61, <4 x i32> %sums.sroa.54.0), !call_argsrelate !27
  %116 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %64, i32 %65, <4 x i32> %sums.sroa.58.0), !call_argsrelate !27
  %117 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %68, i32 %69, <4 x i32> %sums.sroa.62.0), !call_argsrelate !27
  %118 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %72, i32 %73, <4 x i32> %sums.sroa.66.0), !call_argsrelate !27
  %119 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %76, i32 %77, <4 x i32> %sums.sroa.70.0), !call_argsrelate !27
  %120 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %80, i32 %81, <4 x i32> %sums.sroa.74.0), !call_argsrelate !27
  %121 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %84, i32 %85, <4 x i32> %sums.sroa.78.0), !call_argsrelate !27
  %122 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %88, i32 %89, <4 x i32> %sums.sroa.82.0), !call_argsrelate !27
  %123 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %92, i32 %93, <4 x i32> %sums.sroa.86.0), !call_argsrelate !27
  %124 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %96, i32 %97, <4 x i32> %sums.sroa.90.0), !call_argsrelate !27
  %125 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %100, i32 %101, <4 x i32> %sums.sroa.94.0), !call_argsrelate !27
  %inc46 = add nuw nsw i32 %iteration.0105, 1
  %exitcond.not = icmp eq i32 %inc46, %iterations
  br i1 %exitcond.not, label %for.cond49.preheader, label %for.cond30.preheader, !llvm.loop !41

for.cond49.preheader:                             ; preds = %for.cond30.preheader, %entry
  %sums.sroa.94.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %125, %for.cond30.preheader ]
  %sums.sroa.90.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %124, %for.cond30.preheader ]
  %sums.sroa.86.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %123, %for.cond30.preheader ]
  %sums.sroa.82.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %122, %for.cond30.preheader ]
  %sums.sroa.78.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %121, %for.cond30.preheader ]
  %sums.sroa.74.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %120, %for.cond30.preheader ]
  %sums.sroa.70.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %119, %for.cond30.preheader ]
  %sums.sroa.66.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %118, %for.cond30.preheader ]
  %sums.sroa.62.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %117, %for.cond30.preheader ]
  %sums.sroa.58.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %116, %for.cond30.preheader ]
  %sums.sroa.54.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %115, %for.cond30.preheader ]
  %sums.sroa.50.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %114, %for.cond30.preheader ]
  %sums.sroa.46.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %113, %for.cond30.preheader ]
  %sums.sroa.42.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %112, %for.cond30.preheader ]
  %sums.sroa.38.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %111, %for.cond30.preheader ]
  %sums.sroa.34.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %110, %for.cond30.preheader ]
  %sums.sroa.30.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %109, %for.cond30.preheader ]
  %sums.sroa.26.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %108, %for.cond30.preheader ]
  %sums.sroa.22.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %107, %for.cond30.preheader ]
  %sums.sroa.18.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %106, %for.cond30.preheader ]
  %sums.sroa.14.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %105, %for.cond30.preheader ]
  %sums.sroa.10.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %104, %for.cond30.preheader ]
  %sums.sroa.6.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %103, %for.cond30.preheader ]
  %sums.sroa.0.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %102, %for.cond30.preheader ]
  %126 = lshr i16 %3, 6
  %conv7 = zext nneg i16 %126 to i64
  %127 = tail call noundef range(i32 0, 2147483647) i32 @llvm.mxc.block.id.x(), !range !15
  %conv = zext nneg i32 %127 to i64
  %mul = mul nuw nsw i64 %conv7, %conv
  %div9100 = lshr i32 %0, 6
  %conv10 = zext nneg i32 %div9100 to i64
  %add = add nuw nsw i64 %mul, %conv10
  %conv70 = zext nneg i32 %rem11 to i64
  %mul56 = mul nuw nsw i64 %add, 6144
  %vecext = extractelement <4 x i32> %sums.sroa.0.1, i64 0
  %128 = shl nuw nsw i64 %6, 4
  %add69 = or disjoint i64 %mul56, %128
  %add71 = or disjoint i64 %add69, %conv70
  %arrayidx72 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71
  store i32 %vecext, ptr addrspace(1) %arrayidx72, align 4, !tbaa !16
  %vecext.1 = extractelement <4 x i32> %sums.sroa.0.1, i64 1
  %129 = shl nuw nsw i64 %6, 4
  %130 = or disjoint i64 %129, 16
  %add69.1 = or disjoint i64 %mul56, %130
  %add71.1 = or disjoint i64 %add69.1, %conv70
  %arrayidx72.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1
  store i32 %vecext.1, ptr addrspace(1) %arrayidx72.1, align 4, !tbaa !16
  %vecext.2 = extractelement <4 x i32> %sums.sroa.0.1, i64 2
  %131 = shl nuw nsw i64 %6, 4
  %132 = or disjoint i64 %131, 32
  %add69.2 = or disjoint i64 %mul56, %132
  %add71.2 = or disjoint i64 %add69.2, %conv70
  %arrayidx72.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2
  store i32 %vecext.2, ptr addrspace(1) %arrayidx72.2, align 4, !tbaa !16
  %vecext.3 = extractelement <4 x i32> %sums.sroa.0.1, i64 3
  %133 = shl nuw nsw i64 %6, 4
  %134 = or disjoint i64 %133, 48
  %add69.3 = or disjoint i64 %mul56, %134
  %add71.3 = or disjoint i64 %add69.3, %conv70
  %arrayidx72.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3
  store i32 %vecext.3, ptr addrspace(1) %arrayidx72.3, align 4, !tbaa !16
  %add55.1 = mul nuw nsw i64 %add, 6144
  %mul56.1 = or disjoint i64 %add55.1, 256
  %vecext.1118 = extractelement <4 x i32> %sums.sroa.6.1, i64 0
  %add69.1119 = or disjoint i64 %mul56.1, %128
  %add71.1120 = or disjoint i64 %add69.1119, %conv70
  %arrayidx72.1121 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1120
  store i32 %vecext.1118, ptr addrspace(1) %arrayidx72.1121, align 4, !tbaa !16
  %vecext.1.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 1
  %add69.1.1 = or disjoint i64 %mul56.1, %130
  %add71.1.1 = or disjoint i64 %add69.1.1, %conv70
  %arrayidx72.1.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.1
  store i32 %vecext.1.1, ptr addrspace(1) %arrayidx72.1.1, align 4, !tbaa !16
  %vecext.2.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 2
  %add69.2.1 = or disjoint i64 %mul56.1, %132
  %add71.2.1 = or disjoint i64 %add69.2.1, %conv70
  %arrayidx72.2.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.1
  store i32 %vecext.2.1, ptr addrspace(1) %arrayidx72.2.1, align 4, !tbaa !16
  %vecext.3.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 3
  %add69.3.1 = or disjoint i64 %mul56.1, %134
  %add71.3.1 = or disjoint i64 %add69.3.1, %conv70
  %arrayidx72.3.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.1
  store i32 %vecext.3.1, ptr addrspace(1) %arrayidx72.3.1, align 4, !tbaa !16
  %add55.2 = mul nuw nsw i64 %add, 6144
  %mul56.2 = or disjoint i64 %add55.2, 512
  %vecext.2122 = extractelement <4 x i32> %sums.sroa.10.1, i64 0
  %add69.2123 = or disjoint i64 %mul56.2, %128
  %add71.2124 = or disjoint i64 %add69.2123, %conv70
  %arrayidx72.2125 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2124
  store i32 %vecext.2122, ptr addrspace(1) %arrayidx72.2125, align 4, !tbaa !16
  %vecext.1.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 1
  %add69.1.2 = or disjoint i64 %mul56.2, %130
  %add71.1.2 = or disjoint i64 %add69.1.2, %conv70
  %arrayidx72.1.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.2
  store i32 %vecext.1.2, ptr addrspace(1) %arrayidx72.1.2, align 4, !tbaa !16
  %vecext.2.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 2
  %add69.2.2 = or disjoint i64 %mul56.2, %132
  %add71.2.2 = or disjoint i64 %add69.2.2, %conv70
  %arrayidx72.2.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.2
  store i32 %vecext.2.2, ptr addrspace(1) %arrayidx72.2.2, align 4, !tbaa !16
  %vecext.3.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 3
  %add69.3.2 = or disjoint i64 %mul56.2, %134
  %add71.3.2 = or disjoint i64 %add69.3.2, %conv70
  %arrayidx72.3.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.2
  store i32 %vecext.3.2, ptr addrspace(1) %arrayidx72.3.2, align 4, !tbaa !16
  %add55.3 = mul nuw nsw i64 %add, 6144
  %mul56.3 = or disjoint i64 %add55.3, 768
  %vecext.3126 = extractelement <4 x i32> %sums.sroa.14.1, i64 0
  %add69.3127 = or disjoint i64 %mul56.3, %128
  %add71.3128 = or disjoint i64 %add69.3127, %conv70
  %arrayidx72.3129 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3128
  store i32 %vecext.3126, ptr addrspace(1) %arrayidx72.3129, align 4, !tbaa !16
  %vecext.1.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 1
  %add69.1.3 = or disjoint i64 %mul56.3, %130
  %add71.1.3 = or disjoint i64 %add69.1.3, %conv70
  %arrayidx72.1.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.3
  store i32 %vecext.1.3, ptr addrspace(1) %arrayidx72.1.3, align 4, !tbaa !16
  %vecext.2.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 2
  %add69.2.3 = or disjoint i64 %mul56.3, %132
  %add71.2.3 = or disjoint i64 %add69.2.3, %conv70
  %arrayidx72.2.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.3
  store i32 %vecext.2.3, ptr addrspace(1) %arrayidx72.2.3, align 4, !tbaa !16
  %vecext.3.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 3
  %add69.3.3 = or disjoint i64 %mul56.3, %134
  %add71.3.3 = or disjoint i64 %add69.3.3, %conv70
  %arrayidx72.3.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.3
  store i32 %vecext.3.3, ptr addrspace(1) %arrayidx72.3.3, align 4, !tbaa !16
  %add55.4 = mul nuw nsw i64 %add, 6144
  %mul56.4 = or disjoint i64 %add55.4, 1024
  %vecext.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 0
  %add69.4 = or disjoint i64 %mul56.4, %128
  %add71.4 = or disjoint i64 %add69.4, %conv70
  %arrayidx72.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.4
  store i32 %vecext.4, ptr addrspace(1) %arrayidx72.4, align 4, !tbaa !16
  %vecext.1.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 1
  %add69.1.4 = or disjoint i64 %mul56.4, %130
  %add71.1.4 = or disjoint i64 %add69.1.4, %conv70
  %arrayidx72.1.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.4
  store i32 %vecext.1.4, ptr addrspace(1) %arrayidx72.1.4, align 4, !tbaa !16
  %vecext.2.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 2
  %add69.2.4 = or disjoint i64 %mul56.4, %132
  %add71.2.4 = or disjoint i64 %add69.2.4, %conv70
  %arrayidx72.2.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.4
  store i32 %vecext.2.4, ptr addrspace(1) %arrayidx72.2.4, align 4, !tbaa !16
  %vecext.3.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 3
  %add69.3.4 = or disjoint i64 %mul56.4, %134
  %add71.3.4 = or disjoint i64 %add69.3.4, %conv70
  %arrayidx72.3.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.4
  store i32 %vecext.3.4, ptr addrspace(1) %arrayidx72.3.4, align 4, !tbaa !16
  %add55.5 = mul nuw nsw i64 %add, 6144
  %mul56.5 = or disjoint i64 %add55.5, 1280
  %vecext.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 0
  %add69.5 = or disjoint i64 %mul56.5, %128
  %add71.5 = or disjoint i64 %add69.5, %conv70
  %arrayidx72.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.5
  store i32 %vecext.5, ptr addrspace(1) %arrayidx72.5, align 4, !tbaa !16
  %vecext.1.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 1
  %add69.1.5 = or disjoint i64 %mul56.5, %130
  %add71.1.5 = or disjoint i64 %add69.1.5, %conv70
  %arrayidx72.1.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.5
  store i32 %vecext.1.5, ptr addrspace(1) %arrayidx72.1.5, align 4, !tbaa !16
  %vecext.2.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 2
  %add69.2.5 = or disjoint i64 %mul56.5, %132
  %add71.2.5 = or disjoint i64 %add69.2.5, %conv70
  %arrayidx72.2.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.5
  store i32 %vecext.2.5, ptr addrspace(1) %arrayidx72.2.5, align 4, !tbaa !16
  %vecext.3.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 3
  %add69.3.5 = or disjoint i64 %mul56.5, %134
  %add71.3.5 = or disjoint i64 %add69.3.5, %conv70
  %arrayidx72.3.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.5
  store i32 %vecext.3.5, ptr addrspace(1) %arrayidx72.3.5, align 4, !tbaa !16
  %add55.6 = mul nuw nsw i64 %add, 6144
  %mul56.6 = or disjoint i64 %add55.6, 1536
  %vecext.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 0
  %add69.6 = or disjoint i64 %mul56.6, %128
  %add71.6 = or disjoint i64 %add69.6, %conv70
  %arrayidx72.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.6
  store i32 %vecext.6, ptr addrspace(1) %arrayidx72.6, align 4, !tbaa !16
  %vecext.1.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 1
  %add69.1.6 = or disjoint i64 %mul56.6, %130
  %add71.1.6 = or disjoint i64 %add69.1.6, %conv70
  %arrayidx72.1.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.6
  store i32 %vecext.1.6, ptr addrspace(1) %arrayidx72.1.6, align 4, !tbaa !16
  %vecext.2.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 2
  %add69.2.6 = or disjoint i64 %mul56.6, %132
  %add71.2.6 = or disjoint i64 %add69.2.6, %conv70
  %arrayidx72.2.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.6
  store i32 %vecext.2.6, ptr addrspace(1) %arrayidx72.2.6, align 4, !tbaa !16
  %vecext.3.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 3
  %add69.3.6 = or disjoint i64 %mul56.6, %134
  %add71.3.6 = or disjoint i64 %add69.3.6, %conv70
  %arrayidx72.3.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.6
  store i32 %vecext.3.6, ptr addrspace(1) %arrayidx72.3.6, align 4, !tbaa !16
  %add55.7 = mul nuw nsw i64 %add, 6144
  %mul56.7 = or disjoint i64 %add55.7, 1792
  %vecext.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 0
  %add69.7 = or disjoint i64 %mul56.7, %128
  %add71.7 = or disjoint i64 %add69.7, %conv70
  %arrayidx72.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.7
  store i32 %vecext.7, ptr addrspace(1) %arrayidx72.7, align 4, !tbaa !16
  %vecext.1.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 1
  %add69.1.7 = or disjoint i64 %mul56.7, %130
  %add71.1.7 = or disjoint i64 %add69.1.7, %conv70
  %arrayidx72.1.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.7
  store i32 %vecext.1.7, ptr addrspace(1) %arrayidx72.1.7, align 4, !tbaa !16
  %vecext.2.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 2
  %add69.2.7 = or disjoint i64 %mul56.7, %132
  %add71.2.7 = or disjoint i64 %add69.2.7, %conv70
  %arrayidx72.2.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.7
  store i32 %vecext.2.7, ptr addrspace(1) %arrayidx72.2.7, align 4, !tbaa !16
  %vecext.3.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 3
  %add69.3.7 = or disjoint i64 %mul56.7, %134
  %add71.3.7 = or disjoint i64 %add69.3.7, %conv70
  %arrayidx72.3.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.7
  store i32 %vecext.3.7, ptr addrspace(1) %arrayidx72.3.7, align 4, !tbaa !16
  %add55.8 = mul nuw nsw i64 %add, 6144
  %mul56.8 = add nuw nsw i64 %add55.8, 2048
  %vecext.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 0
  %add69.8 = or disjoint i64 %mul56.8, %128
  %add71.8 = or disjoint i64 %add69.8, %conv70
  %arrayidx72.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.8
  store i32 %vecext.8, ptr addrspace(1) %arrayidx72.8, align 4, !tbaa !16
  %vecext.1.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 1
  %add69.1.8 = or disjoint i64 %mul56.8, %130
  %add71.1.8 = or disjoint i64 %add69.1.8, %conv70
  %arrayidx72.1.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.8
  store i32 %vecext.1.8, ptr addrspace(1) %arrayidx72.1.8, align 4, !tbaa !16
  %vecext.2.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 2
  %add69.2.8 = or disjoint i64 %mul56.8, %132
  %add71.2.8 = or disjoint i64 %add69.2.8, %conv70
  %arrayidx72.2.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.8
  store i32 %vecext.2.8, ptr addrspace(1) %arrayidx72.2.8, align 4, !tbaa !16
  %vecext.3.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 3
  %add69.3.8 = or disjoint i64 %mul56.8, %134
  %add71.3.8 = or disjoint i64 %add69.3.8, %conv70
  %arrayidx72.3.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.8
  store i32 %vecext.3.8, ptr addrspace(1) %arrayidx72.3.8, align 4, !tbaa !16
  %add55.9 = mul nuw nsw i64 %add, 6144
  %mul56.9 = add nuw nsw i64 %add55.9, 2304
  %vecext.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 0
  %add69.9 = or disjoint i64 %mul56.9, %128
  %add71.9 = or disjoint i64 %add69.9, %conv70
  %arrayidx72.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.9
  store i32 %vecext.9, ptr addrspace(1) %arrayidx72.9, align 4, !tbaa !16
  %vecext.1.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 1
  %add69.1.9 = or disjoint i64 %mul56.9, %130
  %add71.1.9 = or disjoint i64 %add69.1.9, %conv70
  %arrayidx72.1.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.9
  store i32 %vecext.1.9, ptr addrspace(1) %arrayidx72.1.9, align 4, !tbaa !16
  %vecext.2.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 2
  %add69.2.9 = or disjoint i64 %mul56.9, %132
  %add71.2.9 = or disjoint i64 %add69.2.9, %conv70
  %arrayidx72.2.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.9
  store i32 %vecext.2.9, ptr addrspace(1) %arrayidx72.2.9, align 4, !tbaa !16
  %vecext.3.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 3
  %add69.3.9 = or disjoint i64 %mul56.9, %134
  %add71.3.9 = or disjoint i64 %add69.3.9, %conv70
  %arrayidx72.3.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.9
  store i32 %vecext.3.9, ptr addrspace(1) %arrayidx72.3.9, align 4, !tbaa !16
  %add55.10 = mul nuw nsw i64 %add, 6144
  %mul56.10 = add nuw nsw i64 %add55.10, 2560
  %vecext.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 0
  %add69.10 = or disjoint i64 %mul56.10, %128
  %add71.10 = or disjoint i64 %add69.10, %conv70
  %arrayidx72.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.10
  store i32 %vecext.10, ptr addrspace(1) %arrayidx72.10, align 4, !tbaa !16
  %vecext.1.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 1
  %add69.1.10 = or disjoint i64 %mul56.10, %130
  %add71.1.10 = or disjoint i64 %add69.1.10, %conv70
  %arrayidx72.1.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.10
  store i32 %vecext.1.10, ptr addrspace(1) %arrayidx72.1.10, align 4, !tbaa !16
  %vecext.2.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 2
  %add69.2.10 = or disjoint i64 %mul56.10, %132
  %add71.2.10 = or disjoint i64 %add69.2.10, %conv70
  %arrayidx72.2.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.10
  store i32 %vecext.2.10, ptr addrspace(1) %arrayidx72.2.10, align 4, !tbaa !16
  %vecext.3.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 3
  %add69.3.10 = or disjoint i64 %mul56.10, %134
  %add71.3.10 = or disjoint i64 %add69.3.10, %conv70
  %arrayidx72.3.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.10
  store i32 %vecext.3.10, ptr addrspace(1) %arrayidx72.3.10, align 4, !tbaa !16
  %add55.11 = mul nuw nsw i64 %add, 6144
  %mul56.11 = add nuw nsw i64 %add55.11, 2816
  %vecext.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 0
  %add69.11 = or disjoint i64 %mul56.11, %128
  %add71.11 = or disjoint i64 %add69.11, %conv70
  %arrayidx72.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.11
  store i32 %vecext.11, ptr addrspace(1) %arrayidx72.11, align 4, !tbaa !16
  %vecext.1.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 1
  %add69.1.11 = or disjoint i64 %mul56.11, %130
  %add71.1.11 = or disjoint i64 %add69.1.11, %conv70
  %arrayidx72.1.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.11
  store i32 %vecext.1.11, ptr addrspace(1) %arrayidx72.1.11, align 4, !tbaa !16
  %vecext.2.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 2
  %add69.2.11 = or disjoint i64 %mul56.11, %132
  %add71.2.11 = or disjoint i64 %add69.2.11, %conv70
  %arrayidx72.2.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.11
  store i32 %vecext.2.11, ptr addrspace(1) %arrayidx72.2.11, align 4, !tbaa !16
  %vecext.3.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 3
  %add69.3.11 = or disjoint i64 %mul56.11, %134
  %add71.3.11 = or disjoint i64 %add69.3.11, %conv70
  %arrayidx72.3.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.11
  store i32 %vecext.3.11, ptr addrspace(1) %arrayidx72.3.11, align 4, !tbaa !16
  %add55.12 = mul nuw nsw i64 %add, 6144
  %mul56.12 = add nuw nsw i64 %add55.12, 3072
  %vecext.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 0
  %add69.12 = or disjoint i64 %mul56.12, %128
  %add71.12 = or disjoint i64 %add69.12, %conv70
  %arrayidx72.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.12
  store i32 %vecext.12, ptr addrspace(1) %arrayidx72.12, align 4, !tbaa !16
  %vecext.1.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 1
  %add69.1.12 = or disjoint i64 %mul56.12, %130
  %add71.1.12 = or disjoint i64 %add69.1.12, %conv70
  %arrayidx72.1.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.12
  store i32 %vecext.1.12, ptr addrspace(1) %arrayidx72.1.12, align 4, !tbaa !16
  %vecext.2.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 2
  %add69.2.12 = or disjoint i64 %mul56.12, %132
  %add71.2.12 = or disjoint i64 %add69.2.12, %conv70
  %arrayidx72.2.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.12
  store i32 %vecext.2.12, ptr addrspace(1) %arrayidx72.2.12, align 4, !tbaa !16
  %vecext.3.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 3
  %add69.3.12 = or disjoint i64 %mul56.12, %134
  %add71.3.12 = or disjoint i64 %add69.3.12, %conv70
  %arrayidx72.3.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.12
  store i32 %vecext.3.12, ptr addrspace(1) %arrayidx72.3.12, align 4, !tbaa !16
  %add55.13 = mul nuw nsw i64 %add, 6144
  %mul56.13 = add nuw nsw i64 %add55.13, 3328
  %vecext.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 0
  %add69.13 = or disjoint i64 %mul56.13, %128
  %add71.13 = or disjoint i64 %add69.13, %conv70
  %arrayidx72.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.13
  store i32 %vecext.13, ptr addrspace(1) %arrayidx72.13, align 4, !tbaa !16
  %vecext.1.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 1
  %add69.1.13 = or disjoint i64 %mul56.13, %130
  %add71.1.13 = or disjoint i64 %add69.1.13, %conv70
  %arrayidx72.1.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.13
  store i32 %vecext.1.13, ptr addrspace(1) %arrayidx72.1.13, align 4, !tbaa !16
  %vecext.2.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 2
  %add69.2.13 = or disjoint i64 %mul56.13, %132
  %add71.2.13 = or disjoint i64 %add69.2.13, %conv70
  %arrayidx72.2.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.13
  store i32 %vecext.2.13, ptr addrspace(1) %arrayidx72.2.13, align 4, !tbaa !16
  %vecext.3.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 3
  %add69.3.13 = or disjoint i64 %mul56.13, %134
  %add71.3.13 = or disjoint i64 %add69.3.13, %conv70
  %arrayidx72.3.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.13
  store i32 %vecext.3.13, ptr addrspace(1) %arrayidx72.3.13, align 4, !tbaa !16
  %add55.14 = mul nuw nsw i64 %add, 6144
  %mul56.14 = add nuw nsw i64 %add55.14, 3584
  %vecext.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 0
  %add69.14 = or disjoint i64 %mul56.14, %128
  %add71.14 = or disjoint i64 %add69.14, %conv70
  %arrayidx72.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.14
  store i32 %vecext.14, ptr addrspace(1) %arrayidx72.14, align 4, !tbaa !16
  %vecext.1.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 1
  %add69.1.14 = or disjoint i64 %mul56.14, %130
  %add71.1.14 = or disjoint i64 %add69.1.14, %conv70
  %arrayidx72.1.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.14
  store i32 %vecext.1.14, ptr addrspace(1) %arrayidx72.1.14, align 4, !tbaa !16
  %vecext.2.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 2
  %add69.2.14 = or disjoint i64 %mul56.14, %132
  %add71.2.14 = or disjoint i64 %add69.2.14, %conv70
  %arrayidx72.2.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.14
  store i32 %vecext.2.14, ptr addrspace(1) %arrayidx72.2.14, align 4, !tbaa !16
  %vecext.3.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 3
  %add69.3.14 = or disjoint i64 %mul56.14, %134
  %add71.3.14 = or disjoint i64 %add69.3.14, %conv70
  %arrayidx72.3.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.14
  store i32 %vecext.3.14, ptr addrspace(1) %arrayidx72.3.14, align 4, !tbaa !16
  %add55.15 = mul nuw nsw i64 %add, 6144
  %mul56.15 = add nuw nsw i64 %add55.15, 3840
  %vecext.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 0
  %add69.15 = or disjoint i64 %mul56.15, %128
  %add71.15 = or disjoint i64 %add69.15, %conv70
  %arrayidx72.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.15
  store i32 %vecext.15, ptr addrspace(1) %arrayidx72.15, align 4, !tbaa !16
  %vecext.1.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 1
  %add69.1.15 = or disjoint i64 %mul56.15, %130
  %add71.1.15 = or disjoint i64 %add69.1.15, %conv70
  %arrayidx72.1.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.15
  store i32 %vecext.1.15, ptr addrspace(1) %arrayidx72.1.15, align 4, !tbaa !16
  %vecext.2.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 2
  %add69.2.15 = or disjoint i64 %mul56.15, %132
  %add71.2.15 = or disjoint i64 %add69.2.15, %conv70
  %arrayidx72.2.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.15
  store i32 %vecext.2.15, ptr addrspace(1) %arrayidx72.2.15, align 4, !tbaa !16
  %vecext.3.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 3
  %add69.3.15 = or disjoint i64 %mul56.15, %134
  %add71.3.15 = or disjoint i64 %add69.3.15, %conv70
  %arrayidx72.3.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.15
  store i32 %vecext.3.15, ptr addrspace(1) %arrayidx72.3.15, align 4, !tbaa !16
  %add55.16 = mul nuw nsw i64 %add, 6144
  %mul56.16 = add nuw nsw i64 %add55.16, 4096
  %vecext.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 0
  %add69.16 = or disjoint i64 %mul56.16, %128
  %add71.16 = or disjoint i64 %add69.16, %conv70
  %arrayidx72.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.16
  store i32 %vecext.16, ptr addrspace(1) %arrayidx72.16, align 4, !tbaa !16
  %vecext.1.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 1
  %add69.1.16 = or disjoint i64 %mul56.16, %130
  %add71.1.16 = or disjoint i64 %add69.1.16, %conv70
  %arrayidx72.1.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.16
  store i32 %vecext.1.16, ptr addrspace(1) %arrayidx72.1.16, align 4, !tbaa !16
  %vecext.2.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 2
  %add69.2.16 = or disjoint i64 %mul56.16, %132
  %add71.2.16 = or disjoint i64 %add69.2.16, %conv70
  %arrayidx72.2.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.16
  store i32 %vecext.2.16, ptr addrspace(1) %arrayidx72.2.16, align 4, !tbaa !16
  %vecext.3.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 3
  %add69.3.16 = or disjoint i64 %mul56.16, %134
  %add71.3.16 = or disjoint i64 %add69.3.16, %conv70
  %arrayidx72.3.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.16
  store i32 %vecext.3.16, ptr addrspace(1) %arrayidx72.3.16, align 4, !tbaa !16
  %add55.17 = mul nuw nsw i64 %add, 6144
  %mul56.17 = add nuw nsw i64 %add55.17, 4352
  %vecext.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 0
  %add69.17 = or disjoint i64 %mul56.17, %128
  %add71.17 = or disjoint i64 %add69.17, %conv70
  %arrayidx72.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.17
  store i32 %vecext.17, ptr addrspace(1) %arrayidx72.17, align 4, !tbaa !16
  %vecext.1.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 1
  %add69.1.17 = or disjoint i64 %mul56.17, %130
  %add71.1.17 = or disjoint i64 %add69.1.17, %conv70
  %arrayidx72.1.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.17
  store i32 %vecext.1.17, ptr addrspace(1) %arrayidx72.1.17, align 4, !tbaa !16
  %vecext.2.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 2
  %add69.2.17 = or disjoint i64 %mul56.17, %132
  %add71.2.17 = or disjoint i64 %add69.2.17, %conv70
  %arrayidx72.2.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.17
  store i32 %vecext.2.17, ptr addrspace(1) %arrayidx72.2.17, align 4, !tbaa !16
  %vecext.3.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 3
  %add69.3.17 = or disjoint i64 %mul56.17, %134
  %add71.3.17 = or disjoint i64 %add69.3.17, %conv70
  %arrayidx72.3.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.17
  store i32 %vecext.3.17, ptr addrspace(1) %arrayidx72.3.17, align 4, !tbaa !16
  %add55.18 = mul nuw nsw i64 %add, 6144
  %mul56.18 = add nuw nsw i64 %add55.18, 4608
  %vecext.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 0
  %add69.18 = or disjoint i64 %mul56.18, %128
  %add71.18 = or disjoint i64 %add69.18, %conv70
  %arrayidx72.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.18
  store i32 %vecext.18, ptr addrspace(1) %arrayidx72.18, align 4, !tbaa !16
  %vecext.1.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 1
  %add69.1.18 = or disjoint i64 %mul56.18, %130
  %add71.1.18 = or disjoint i64 %add69.1.18, %conv70
  %arrayidx72.1.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.18
  store i32 %vecext.1.18, ptr addrspace(1) %arrayidx72.1.18, align 4, !tbaa !16
  %vecext.2.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 2
  %add69.2.18 = or disjoint i64 %mul56.18, %132
  %add71.2.18 = or disjoint i64 %add69.2.18, %conv70
  %arrayidx72.2.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.18
  store i32 %vecext.2.18, ptr addrspace(1) %arrayidx72.2.18, align 4, !tbaa !16
  %vecext.3.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 3
  %add69.3.18 = or disjoint i64 %mul56.18, %134
  %add71.3.18 = or disjoint i64 %add69.3.18, %conv70
  %arrayidx72.3.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.18
  store i32 %vecext.3.18, ptr addrspace(1) %arrayidx72.3.18, align 4, !tbaa !16
  %add55.19 = mul nuw nsw i64 %add, 6144
  %mul56.19 = add nuw nsw i64 %add55.19, 4864
  %vecext.19 = extractelement <4 x i32> %sums.sroa.78.1, i64 0
  %add69.19 = or disjoint i64 %mul56.19, %128
  %add71.19 = or disjoint i64 %add69.19, %conv70
  %arrayidx72.19 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.19
  store i32 %vecext.19, ptr addrspace(1) %arrayidx72.19, align 4, !tbaa !16
  %vecext.1.19 = extractelement <4 x i32> %sums.sroa.78.1, i64 1
  %add69.1.19 = or disjoint i64 %mul56.19, %130
  %add71.1.19 = or disjoint i64 %add69.1.19, %conv70
  %arrayidx72.1.19 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.19
  store i32 %vecext.1.19, ptr addrspace(1) %arrayidx72.1.19, align 4, !tbaa !16
  %vecext.2.19 = extractelement <4 x i32> %sums.sroa.78.1, i64 2
  %add69.2.19 = or disjoint i64 %mul56.19, %132
  %add71.2.19 = or disjoint i64 %add69.2.19, %conv70
  %arrayidx72.2.19 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.19
  store i32 %vecext.2.19, ptr addrspace(1) %arrayidx72.2.19, align 4, !tbaa !16
  %vecext.3.19 = extractelement <4 x i32> %sums.sroa.78.1, i64 3
  %add69.3.19 = or disjoint i64 %mul56.19, %134
  %add71.3.19 = or disjoint i64 %add69.3.19, %conv70
  %arrayidx72.3.19 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.19
  store i32 %vecext.3.19, ptr addrspace(1) %arrayidx72.3.19, align 4, !tbaa !16
  %add55.20 = mul nuw nsw i64 %add, 6144
  %mul56.20 = add nuw nsw i64 %add55.20, 5120
  %vecext.20 = extractelement <4 x i32> %sums.sroa.82.1, i64 0
  %add69.20 = or disjoint i64 %mul56.20, %128
  %add71.20 = or disjoint i64 %add69.20, %conv70
  %arrayidx72.20 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.20
  store i32 %vecext.20, ptr addrspace(1) %arrayidx72.20, align 4, !tbaa !16
  %vecext.1.20 = extractelement <4 x i32> %sums.sroa.82.1, i64 1
  %add69.1.20 = or disjoint i64 %mul56.20, %130
  %add71.1.20 = or disjoint i64 %add69.1.20, %conv70
  %arrayidx72.1.20 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.20
  store i32 %vecext.1.20, ptr addrspace(1) %arrayidx72.1.20, align 4, !tbaa !16
  %vecext.2.20 = extractelement <4 x i32> %sums.sroa.82.1, i64 2
  %add69.2.20 = or disjoint i64 %mul56.20, %132
  %add71.2.20 = or disjoint i64 %add69.2.20, %conv70
  %arrayidx72.2.20 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.20
  store i32 %vecext.2.20, ptr addrspace(1) %arrayidx72.2.20, align 4, !tbaa !16
  %vecext.3.20 = extractelement <4 x i32> %sums.sroa.82.1, i64 3
  %add69.3.20 = or disjoint i64 %mul56.20, %134
  %add71.3.20 = or disjoint i64 %add69.3.20, %conv70
  %arrayidx72.3.20 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.20
  store i32 %vecext.3.20, ptr addrspace(1) %arrayidx72.3.20, align 4, !tbaa !16
  %add55.21 = mul nuw nsw i64 %add, 6144
  %mul56.21 = add nuw nsw i64 %add55.21, 5376
  %vecext.21 = extractelement <4 x i32> %sums.sroa.86.1, i64 0
  %add69.21 = or disjoint i64 %mul56.21, %128
  %add71.21 = or disjoint i64 %add69.21, %conv70
  %arrayidx72.21 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.21
  store i32 %vecext.21, ptr addrspace(1) %arrayidx72.21, align 4, !tbaa !16
  %vecext.1.21 = extractelement <4 x i32> %sums.sroa.86.1, i64 1
  %add69.1.21 = or disjoint i64 %mul56.21, %130
  %add71.1.21 = or disjoint i64 %add69.1.21, %conv70
  %arrayidx72.1.21 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.21
  store i32 %vecext.1.21, ptr addrspace(1) %arrayidx72.1.21, align 4, !tbaa !16
  %vecext.2.21 = extractelement <4 x i32> %sums.sroa.86.1, i64 2
  %add69.2.21 = or disjoint i64 %mul56.21, %132
  %add71.2.21 = or disjoint i64 %add69.2.21, %conv70
  %arrayidx72.2.21 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.21
  store i32 %vecext.2.21, ptr addrspace(1) %arrayidx72.2.21, align 4, !tbaa !16
  %vecext.3.21 = extractelement <4 x i32> %sums.sroa.86.1, i64 3
  %add69.3.21 = or disjoint i64 %mul56.21, %134
  %add71.3.21 = or disjoint i64 %add69.3.21, %conv70
  %arrayidx72.3.21 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.21
  store i32 %vecext.3.21, ptr addrspace(1) %arrayidx72.3.21, align 4, !tbaa !16
  %add55.22 = mul nuw nsw i64 %add, 6144
  %mul56.22 = add nuw nsw i64 %add55.22, 5632
  %vecext.22 = extractelement <4 x i32> %sums.sroa.90.1, i64 0
  %add69.22 = or disjoint i64 %mul56.22, %128
  %add71.22 = or disjoint i64 %add69.22, %conv70
  %arrayidx72.22 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.22
  store i32 %vecext.22, ptr addrspace(1) %arrayidx72.22, align 4, !tbaa !16
  %vecext.1.22 = extractelement <4 x i32> %sums.sroa.90.1, i64 1
  %add69.1.22 = or disjoint i64 %mul56.22, %130
  %add71.1.22 = or disjoint i64 %add69.1.22, %conv70
  %arrayidx72.1.22 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.22
  store i32 %vecext.1.22, ptr addrspace(1) %arrayidx72.1.22, align 4, !tbaa !16
  %vecext.2.22 = extractelement <4 x i32> %sums.sroa.90.1, i64 2
  %add69.2.22 = or disjoint i64 %mul56.22, %132
  %add71.2.22 = or disjoint i64 %add69.2.22, %conv70
  %arrayidx72.2.22 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.22
  store i32 %vecext.2.22, ptr addrspace(1) %arrayidx72.2.22, align 4, !tbaa !16
  %vecext.3.22 = extractelement <4 x i32> %sums.sroa.90.1, i64 3
  %add69.3.22 = or disjoint i64 %mul56.22, %134
  %add71.3.22 = or disjoint i64 %add69.3.22, %conv70
  %arrayidx72.3.22 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.22
  store i32 %vecext.3.22, ptr addrspace(1) %arrayidx72.3.22, align 4, !tbaa !16
  %add55.23 = mul nuw nsw i64 %add, 6144
  %mul56.23 = add nuw nsw i64 %add55.23, 5888
  %vecext.23 = extractelement <4 x i32> %sums.sroa.94.1, i64 0
  %add69.23 = or disjoint i64 %mul56.23, %128
  %add71.23 = or disjoint i64 %add69.23, %conv70
  %arrayidx72.23 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.23
  store i32 %vecext.23, ptr addrspace(1) %arrayidx72.23, align 4, !tbaa !16
  %vecext.1.23 = extractelement <4 x i32> %sums.sroa.94.1, i64 1
  %add69.1.23 = or disjoint i64 %mul56.23, %130
  %add71.1.23 = or disjoint i64 %add69.1.23, %conv70
  %arrayidx72.1.23 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.23
  store i32 %vecext.1.23, ptr addrspace(1) %arrayidx72.1.23, align 4, !tbaa !16
  %vecext.2.23 = extractelement <4 x i32> %sums.sroa.94.1, i64 2
  %add69.2.23 = or disjoint i64 %mul56.23, %132
  %add71.2.23 = or disjoint i64 %add69.2.23, %conv70
  %arrayidx72.2.23 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.23
  store i32 %vecext.2.23, ptr addrspace(1) %arrayidx72.2.23, align 4, !tbaa !16
  %vecext.3.23 = extractelement <4 x i32> %sums.sroa.94.1, i64 3
  %add69.3.23 = or disjoint i64 %mul56.23, %134
  %add71.3.23 = or disjoint i64 %add69.3.23, %conv70
  %arrayidx72.3.23 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.23
  store i32 %vecext.3.23, ptr addrspace(1) %arrayidx72.3.23, align 4, !tbaa !16
  ret void
}

; Function Attrs: convergent mustprogress nofree norecurse nounwind memory(argmem: readwrite)
define protected metaxgpu_kernel void @_Z13mmaPeakKernelILi25EEvPKaS1_Pii(ptr addrspace(1) noalias nocapture noundef readonly %a.coerce, ptr addrspace(1) noalias nocapture noundef readonly %b.coerce, ptr addrspace(1) noalias noundef writeonly %c.coerce, i32 noundef %iterations) local_unnamed_addr #3 comdat {
entry:
  %0 = tail call noundef range(i32 0, 1024) i32 @llvm.mxc.thread.id.x(), !range !25
  %1 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.mxc.dispatch.ptr()
  %2 = getelementptr inbounds i8, ptr addrspace(4) %1, i64 4
  %3 = load i16, ptr addrspace(4) %2, align 4, !range !26, !invariant.load !14
  %rem11 = and i32 %0, 15
  %4 = lshr i32 %0, 2
  %mul13 = and i32 %4, 12
  %mul15 = shl nuw nsw i32 %rem11, 4
  %5 = zext nneg i32 %mul15 to i64
  %6 = zext nneg i32 %mul13 to i64
  %7 = or disjoint i64 %5, %6
  %add.ptr = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %7
  %8 = load i32, ptr addrspace(1) %add.ptr, align 1
  %add.ptr21 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %7
  %9 = load i32, ptr addrspace(1) %add.ptr21, align 1
  %10 = or disjoint i64 %5, %6
  %11 = or disjoint i64 %10, 256
  %add.ptr.1 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %11
  %12 = load i32, ptr addrspace(1) %add.ptr.1, align 1
  %add.ptr21.1 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %11
  %13 = load i32, ptr addrspace(1) %add.ptr21.1, align 1
  %14 = or disjoint i64 %5, %6
  %15 = or disjoint i64 %14, 512
  %add.ptr.2 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %15
  %16 = load i32, ptr addrspace(1) %add.ptr.2, align 1
  %add.ptr21.2 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %15
  %17 = load i32, ptr addrspace(1) %add.ptr21.2, align 1
  %18 = or disjoint i64 %5, %6
  %19 = or disjoint i64 %18, 768
  %add.ptr.3 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %19
  %20 = load i32, ptr addrspace(1) %add.ptr.3, align 1
  %add.ptr21.3 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %19
  %21 = load i32, ptr addrspace(1) %add.ptr21.3, align 1
  %22 = or disjoint i64 %5, %6
  %23 = or disjoint i64 %22, 1024
  %add.ptr.4 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %23
  %24 = load i32, ptr addrspace(1) %add.ptr.4, align 1
  %add.ptr21.4 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %23
  %25 = load i32, ptr addrspace(1) %add.ptr21.4, align 1
  %26 = or disjoint i64 %5, %6
  %27 = or disjoint i64 %26, 1280
  %add.ptr.5 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %27
  %28 = load i32, ptr addrspace(1) %add.ptr.5, align 1
  %add.ptr21.5 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %27
  %29 = load i32, ptr addrspace(1) %add.ptr21.5, align 1
  %30 = or disjoint i64 %5, %6
  %31 = or disjoint i64 %30, 1536
  %add.ptr.6 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %31
  %32 = load i32, ptr addrspace(1) %add.ptr.6, align 1
  %add.ptr21.6 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %31
  %33 = load i32, ptr addrspace(1) %add.ptr21.6, align 1
  %34 = or disjoint i64 %5, %6
  %35 = or disjoint i64 %34, 1792
  %add.ptr.7 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %35
  %36 = load i32, ptr addrspace(1) %add.ptr.7, align 1
  %add.ptr21.7 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %35
  %37 = load i32, ptr addrspace(1) %add.ptr21.7, align 1
  %38 = or disjoint i64 %5, %6
  %39 = or disjoint i64 %38, 2048
  %add.ptr.8 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %39
  %40 = load i32, ptr addrspace(1) %add.ptr.8, align 1
  %add.ptr21.8 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %39
  %41 = load i32, ptr addrspace(1) %add.ptr21.8, align 1
  %42 = or disjoint i64 %5, %6
  %43 = or disjoint i64 %42, 2304
  %add.ptr.9 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %43
  %44 = load i32, ptr addrspace(1) %add.ptr.9, align 1
  %add.ptr21.9 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %43
  %45 = load i32, ptr addrspace(1) %add.ptr21.9, align 1
  %46 = or disjoint i64 %5, %6
  %47 = or disjoint i64 %46, 2560
  %add.ptr.10 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %47
  %48 = load i32, ptr addrspace(1) %add.ptr.10, align 1
  %add.ptr21.10 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %47
  %49 = load i32, ptr addrspace(1) %add.ptr21.10, align 1
  %50 = or disjoint i64 %5, %6
  %51 = or disjoint i64 %50, 2816
  %add.ptr.11 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %51
  %52 = load i32, ptr addrspace(1) %add.ptr.11, align 1
  %add.ptr21.11 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %51
  %53 = load i32, ptr addrspace(1) %add.ptr21.11, align 1
  %54 = or disjoint i64 %5, %6
  %55 = or disjoint i64 %54, 3072
  %add.ptr.12 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %55
  %56 = load i32, ptr addrspace(1) %add.ptr.12, align 1
  %add.ptr21.12 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %55
  %57 = load i32, ptr addrspace(1) %add.ptr21.12, align 1
  %58 = or disjoint i64 %5, %6
  %59 = or disjoint i64 %58, 3328
  %add.ptr.13 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %59
  %60 = load i32, ptr addrspace(1) %add.ptr.13, align 1
  %add.ptr21.13 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %59
  %61 = load i32, ptr addrspace(1) %add.ptr21.13, align 1
  %62 = or disjoint i64 %5, %6
  %63 = or disjoint i64 %62, 3584
  %add.ptr.14 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %63
  %64 = load i32, ptr addrspace(1) %add.ptr.14, align 1
  %add.ptr21.14 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %63
  %65 = load i32, ptr addrspace(1) %add.ptr21.14, align 1
  %66 = or disjoint i64 %5, %6
  %67 = or disjoint i64 %66, 3840
  %add.ptr.15 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %67
  %68 = load i32, ptr addrspace(1) %add.ptr.15, align 1
  %add.ptr21.15 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %67
  %69 = load i32, ptr addrspace(1) %add.ptr21.15, align 1
  %70 = or disjoint i64 %5, %6
  %71 = or disjoint i64 %70, 4096
  %add.ptr.16 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %71
  %72 = load i32, ptr addrspace(1) %add.ptr.16, align 1
  %add.ptr21.16 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %71
  %73 = load i32, ptr addrspace(1) %add.ptr21.16, align 1
  %74 = or disjoint i64 %5, %6
  %75 = or disjoint i64 %74, 4352
  %add.ptr.17 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %75
  %76 = load i32, ptr addrspace(1) %add.ptr.17, align 1
  %add.ptr21.17 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %75
  %77 = load i32, ptr addrspace(1) %add.ptr21.17, align 1
  %78 = or disjoint i64 %5, %6
  %79 = or disjoint i64 %78, 4608
  %add.ptr.18 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %79
  %80 = load i32, ptr addrspace(1) %add.ptr.18, align 1
  %add.ptr21.18 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %79
  %81 = load i32, ptr addrspace(1) %add.ptr21.18, align 1
  %82 = or disjoint i64 %5, %6
  %83 = or disjoint i64 %82, 4864
  %add.ptr.19 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %83
  %84 = load i32, ptr addrspace(1) %add.ptr.19, align 1
  %add.ptr21.19 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %83
  %85 = load i32, ptr addrspace(1) %add.ptr21.19, align 1
  %86 = or disjoint i64 %5, %6
  %87 = or disjoint i64 %86, 5120
  %add.ptr.20 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %87
  %88 = load i32, ptr addrspace(1) %add.ptr.20, align 1
  %add.ptr21.20 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %87
  %89 = load i32, ptr addrspace(1) %add.ptr21.20, align 1
  %90 = or disjoint i64 %5, %6
  %91 = or disjoint i64 %90, 5376
  %add.ptr.21 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %91
  %92 = load i32, ptr addrspace(1) %add.ptr.21, align 1
  %add.ptr21.21 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %91
  %93 = load i32, ptr addrspace(1) %add.ptr21.21, align 1
  %94 = or disjoint i64 %5, %6
  %95 = or disjoint i64 %94, 5632
  %add.ptr.22 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %95
  %96 = load i32, ptr addrspace(1) %add.ptr.22, align 1
  %add.ptr21.22 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %95
  %97 = load i32, ptr addrspace(1) %add.ptr21.22, align 1
  %98 = or disjoint i64 %5, %6
  %99 = or disjoint i64 %98, 5888
  %add.ptr.23 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %99
  %100 = load i32, ptr addrspace(1) %add.ptr.23, align 1
  %add.ptr21.23 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %99
  %101 = load i32, ptr addrspace(1) %add.ptr21.23, align 1
  %102 = or disjoint i64 %5, %6
  %103 = or disjoint i64 %102, 6144
  %add.ptr.24 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %103
  %104 = load i32, ptr addrspace(1) %add.ptr.24, align 1
  %add.ptr21.24 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %103
  %105 = load i32, ptr addrspace(1) %add.ptr21.24, align 1
  %cmp25104 = icmp sgt i32 %iterations, 0
  br i1 %cmp25104, label %for.cond30.preheader, label %for.cond49.preheader

for.cond30.preheader:                             ; preds = %entry, %for.cond30.preheader
  %sums.sroa.98.0 = phi <4 x i32> [ %130, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.94.0 = phi <4 x i32> [ %129, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.90.0 = phi <4 x i32> [ %128, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.86.0 = phi <4 x i32> [ %127, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.82.0 = phi <4 x i32> [ %126, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.78.0 = phi <4 x i32> [ %125, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.74.0 = phi <4 x i32> [ %124, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.70.0 = phi <4 x i32> [ %123, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.66.0 = phi <4 x i32> [ %122, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.62.0 = phi <4 x i32> [ %121, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.58.0 = phi <4 x i32> [ %120, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.54.0 = phi <4 x i32> [ %119, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.50.0 = phi <4 x i32> [ %118, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.46.0 = phi <4 x i32> [ %117, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.42.0 = phi <4 x i32> [ %116, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.38.0 = phi <4 x i32> [ %115, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.34.0 = phi <4 x i32> [ %114, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.30.0 = phi <4 x i32> [ %113, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.26.0 = phi <4 x i32> [ %112, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.22.0 = phi <4 x i32> [ %111, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.18.0 = phi <4 x i32> [ %110, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.14.0 = phi <4 x i32> [ %109, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.10.0 = phi <4 x i32> [ %108, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.6.0 = phi <4 x i32> [ %107, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.0.0 = phi <4 x i32> [ %106, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %iteration.0105 = phi i32 [ %inc46, %for.cond30.preheader ], [ 0, %entry ]
  %106 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %8, i32 %9, <4 x i32> %sums.sroa.0.0), !call_argsrelate !27
  %107 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %12, i32 %13, <4 x i32> %sums.sroa.6.0), !call_argsrelate !27
  %108 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %16, i32 %17, <4 x i32> %sums.sroa.10.0), !call_argsrelate !27
  %109 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %20, i32 %21, <4 x i32> %sums.sroa.14.0), !call_argsrelate !27
  %110 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %24, i32 %25, <4 x i32> %sums.sroa.18.0), !call_argsrelate !27
  %111 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %28, i32 %29, <4 x i32> %sums.sroa.22.0), !call_argsrelate !27
  %112 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %32, i32 %33, <4 x i32> %sums.sroa.26.0), !call_argsrelate !27
  %113 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %36, i32 %37, <4 x i32> %sums.sroa.30.0), !call_argsrelate !27
  %114 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %40, i32 %41, <4 x i32> %sums.sroa.34.0), !call_argsrelate !27
  %115 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %44, i32 %45, <4 x i32> %sums.sroa.38.0), !call_argsrelate !27
  %116 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %48, i32 %49, <4 x i32> %sums.sroa.42.0), !call_argsrelate !27
  %117 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %52, i32 %53, <4 x i32> %sums.sroa.46.0), !call_argsrelate !27
  %118 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %56, i32 %57, <4 x i32> %sums.sroa.50.0), !call_argsrelate !27
  %119 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %60, i32 %61, <4 x i32> %sums.sroa.54.0), !call_argsrelate !27
  %120 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %64, i32 %65, <4 x i32> %sums.sroa.58.0), !call_argsrelate !27
  %121 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %68, i32 %69, <4 x i32> %sums.sroa.62.0), !call_argsrelate !27
  %122 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %72, i32 %73, <4 x i32> %sums.sroa.66.0), !call_argsrelate !27
  %123 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %76, i32 %77, <4 x i32> %sums.sroa.70.0), !call_argsrelate !27
  %124 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %80, i32 %81, <4 x i32> %sums.sroa.74.0), !call_argsrelate !27
  %125 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %84, i32 %85, <4 x i32> %sums.sroa.78.0), !call_argsrelate !27
  %126 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %88, i32 %89, <4 x i32> %sums.sroa.82.0), !call_argsrelate !27
  %127 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %92, i32 %93, <4 x i32> %sums.sroa.86.0), !call_argsrelate !27
  %128 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %96, i32 %97, <4 x i32> %sums.sroa.90.0), !call_argsrelate !27
  %129 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %100, i32 %101, <4 x i32> %sums.sroa.94.0), !call_argsrelate !27
  %130 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %104, i32 %105, <4 x i32> %sums.sroa.98.0), !call_argsrelate !27
  %inc46 = add nuw nsw i32 %iteration.0105, 1
  %exitcond.not = icmp eq i32 %inc46, %iterations
  br i1 %exitcond.not, label %for.cond49.preheader, label %for.cond30.preheader, !llvm.loop !42

for.cond49.preheader:                             ; preds = %for.cond30.preheader, %entry
  %sums.sroa.98.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %130, %for.cond30.preheader ]
  %sums.sroa.94.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %129, %for.cond30.preheader ]
  %sums.sroa.90.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %128, %for.cond30.preheader ]
  %sums.sroa.86.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %127, %for.cond30.preheader ]
  %sums.sroa.82.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %126, %for.cond30.preheader ]
  %sums.sroa.78.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %125, %for.cond30.preheader ]
  %sums.sroa.74.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %124, %for.cond30.preheader ]
  %sums.sroa.70.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %123, %for.cond30.preheader ]
  %sums.sroa.66.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %122, %for.cond30.preheader ]
  %sums.sroa.62.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %121, %for.cond30.preheader ]
  %sums.sroa.58.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %120, %for.cond30.preheader ]
  %sums.sroa.54.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %119, %for.cond30.preheader ]
  %sums.sroa.50.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %118, %for.cond30.preheader ]
  %sums.sroa.46.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %117, %for.cond30.preheader ]
  %sums.sroa.42.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %116, %for.cond30.preheader ]
  %sums.sroa.38.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %115, %for.cond30.preheader ]
  %sums.sroa.34.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %114, %for.cond30.preheader ]
  %sums.sroa.30.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %113, %for.cond30.preheader ]
  %sums.sroa.26.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %112, %for.cond30.preheader ]
  %sums.sroa.22.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %111, %for.cond30.preheader ]
  %sums.sroa.18.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %110, %for.cond30.preheader ]
  %sums.sroa.14.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %109, %for.cond30.preheader ]
  %sums.sroa.10.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %108, %for.cond30.preheader ]
  %sums.sroa.6.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %107, %for.cond30.preheader ]
  %sums.sroa.0.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %106, %for.cond30.preheader ]
  %131 = lshr i16 %3, 6
  %conv7 = zext nneg i16 %131 to i64
  %132 = tail call noundef range(i32 0, 2147483647) i32 @llvm.mxc.block.id.x(), !range !15
  %conv = zext nneg i32 %132 to i64
  %mul = mul nuw nsw i64 %conv7, %conv
  %div9100 = lshr i32 %0, 6
  %conv10 = zext nneg i32 %div9100 to i64
  %add = add nuw nsw i64 %mul, %conv10
  %conv70 = zext nneg i32 %rem11 to i64
  %mul56 = mul nuw nsw i64 %add, 6400
  %vecext = extractelement <4 x i32> %sums.sroa.0.1, i64 0
  %133 = shl nuw nsw i64 %6, 4
  %add69 = or disjoint i64 %mul56, %133
  %add71 = or disjoint i64 %add69, %conv70
  %arrayidx72 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71
  store i32 %vecext, ptr addrspace(1) %arrayidx72, align 4, !tbaa !16
  %vecext.1 = extractelement <4 x i32> %sums.sroa.0.1, i64 1
  %134 = shl nuw nsw i64 %6, 4
  %135 = or disjoint i64 %134, 16
  %add69.1 = or disjoint i64 %mul56, %135
  %add71.1 = or disjoint i64 %add69.1, %conv70
  %arrayidx72.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1
  store i32 %vecext.1, ptr addrspace(1) %arrayidx72.1, align 4, !tbaa !16
  %vecext.2 = extractelement <4 x i32> %sums.sroa.0.1, i64 2
  %136 = shl nuw nsw i64 %6, 4
  %137 = or disjoint i64 %136, 32
  %add69.2 = or disjoint i64 %mul56, %137
  %add71.2 = or disjoint i64 %add69.2, %conv70
  %arrayidx72.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2
  store i32 %vecext.2, ptr addrspace(1) %arrayidx72.2, align 4, !tbaa !16
  %vecext.3 = extractelement <4 x i32> %sums.sroa.0.1, i64 3
  %138 = shl nuw nsw i64 %6, 4
  %139 = or disjoint i64 %138, 48
  %add69.3 = or disjoint i64 %mul56, %139
  %add71.3 = or disjoint i64 %add69.3, %conv70
  %arrayidx72.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3
  store i32 %vecext.3, ptr addrspace(1) %arrayidx72.3, align 4, !tbaa !16
  %add55.1 = mul nuw nsw i64 %add, 6400
  %mul56.1 = add nuw nsw i64 %add55.1, 256
  %vecext.1118 = extractelement <4 x i32> %sums.sroa.6.1, i64 0
  %add69.1119 = or disjoint i64 %mul56.1, %133
  %add71.1120 = or disjoint i64 %add69.1119, %conv70
  %arrayidx72.1121 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1120
  store i32 %vecext.1118, ptr addrspace(1) %arrayidx72.1121, align 4, !tbaa !16
  %vecext.1.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 1
  %add69.1.1 = or disjoint i64 %mul56.1, %135
  %add71.1.1 = or disjoint i64 %add69.1.1, %conv70
  %arrayidx72.1.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.1
  store i32 %vecext.1.1, ptr addrspace(1) %arrayidx72.1.1, align 4, !tbaa !16
  %vecext.2.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 2
  %add69.2.1 = or disjoint i64 %mul56.1, %137
  %add71.2.1 = or disjoint i64 %add69.2.1, %conv70
  %arrayidx72.2.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.1
  store i32 %vecext.2.1, ptr addrspace(1) %arrayidx72.2.1, align 4, !tbaa !16
  %vecext.3.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 3
  %add69.3.1 = or disjoint i64 %mul56.1, %139
  %add71.3.1 = or disjoint i64 %add69.3.1, %conv70
  %arrayidx72.3.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.1
  store i32 %vecext.3.1, ptr addrspace(1) %arrayidx72.3.1, align 4, !tbaa !16
  %add55.2 = mul nuw nsw i64 %add, 6400
  %mul56.2 = add nuw nsw i64 %add55.2, 512
  %vecext.2122 = extractelement <4 x i32> %sums.sroa.10.1, i64 0
  %add69.2123 = or disjoint i64 %mul56.2, %133
  %add71.2124 = or disjoint i64 %add69.2123, %conv70
  %arrayidx72.2125 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2124
  store i32 %vecext.2122, ptr addrspace(1) %arrayidx72.2125, align 4, !tbaa !16
  %vecext.1.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 1
  %add69.1.2 = or disjoint i64 %mul56.2, %135
  %add71.1.2 = or disjoint i64 %add69.1.2, %conv70
  %arrayidx72.1.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.2
  store i32 %vecext.1.2, ptr addrspace(1) %arrayidx72.1.2, align 4, !tbaa !16
  %vecext.2.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 2
  %add69.2.2 = or disjoint i64 %mul56.2, %137
  %add71.2.2 = or disjoint i64 %add69.2.2, %conv70
  %arrayidx72.2.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.2
  store i32 %vecext.2.2, ptr addrspace(1) %arrayidx72.2.2, align 4, !tbaa !16
  %vecext.3.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 3
  %add69.3.2 = or disjoint i64 %mul56.2, %139
  %add71.3.2 = or disjoint i64 %add69.3.2, %conv70
  %arrayidx72.3.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.2
  store i32 %vecext.3.2, ptr addrspace(1) %arrayidx72.3.2, align 4, !tbaa !16
  %add55.3 = mul nuw nsw i64 %add, 6400
  %mul56.3 = add nuw nsw i64 %add55.3, 768
  %vecext.3126 = extractelement <4 x i32> %sums.sroa.14.1, i64 0
  %add69.3127 = or disjoint i64 %mul56.3, %133
  %add71.3128 = or disjoint i64 %add69.3127, %conv70
  %arrayidx72.3129 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3128
  store i32 %vecext.3126, ptr addrspace(1) %arrayidx72.3129, align 4, !tbaa !16
  %vecext.1.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 1
  %add69.1.3 = or disjoint i64 %mul56.3, %135
  %add71.1.3 = or disjoint i64 %add69.1.3, %conv70
  %arrayidx72.1.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.3
  store i32 %vecext.1.3, ptr addrspace(1) %arrayidx72.1.3, align 4, !tbaa !16
  %vecext.2.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 2
  %add69.2.3 = or disjoint i64 %mul56.3, %137
  %add71.2.3 = or disjoint i64 %add69.2.3, %conv70
  %arrayidx72.2.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.3
  store i32 %vecext.2.3, ptr addrspace(1) %arrayidx72.2.3, align 4, !tbaa !16
  %vecext.3.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 3
  %add69.3.3 = or disjoint i64 %mul56.3, %139
  %add71.3.3 = or disjoint i64 %add69.3.3, %conv70
  %arrayidx72.3.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.3
  store i32 %vecext.3.3, ptr addrspace(1) %arrayidx72.3.3, align 4, !tbaa !16
  %add55.4 = mul nuw nsw i64 %add, 6400
  %mul56.4 = add nuw nsw i64 %add55.4, 1024
  %vecext.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 0
  %add69.4 = or disjoint i64 %mul56.4, %133
  %add71.4 = or disjoint i64 %add69.4, %conv70
  %arrayidx72.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.4
  store i32 %vecext.4, ptr addrspace(1) %arrayidx72.4, align 4, !tbaa !16
  %vecext.1.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 1
  %add69.1.4 = or disjoint i64 %mul56.4, %135
  %add71.1.4 = or disjoint i64 %add69.1.4, %conv70
  %arrayidx72.1.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.4
  store i32 %vecext.1.4, ptr addrspace(1) %arrayidx72.1.4, align 4, !tbaa !16
  %vecext.2.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 2
  %add69.2.4 = or disjoint i64 %mul56.4, %137
  %add71.2.4 = or disjoint i64 %add69.2.4, %conv70
  %arrayidx72.2.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.4
  store i32 %vecext.2.4, ptr addrspace(1) %arrayidx72.2.4, align 4, !tbaa !16
  %vecext.3.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 3
  %add69.3.4 = or disjoint i64 %mul56.4, %139
  %add71.3.4 = or disjoint i64 %add69.3.4, %conv70
  %arrayidx72.3.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.4
  store i32 %vecext.3.4, ptr addrspace(1) %arrayidx72.3.4, align 4, !tbaa !16
  %add55.5 = mul nuw nsw i64 %add, 6400
  %mul56.5 = add nuw nsw i64 %add55.5, 1280
  %vecext.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 0
  %add69.5 = or disjoint i64 %mul56.5, %133
  %add71.5 = or disjoint i64 %add69.5, %conv70
  %arrayidx72.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.5
  store i32 %vecext.5, ptr addrspace(1) %arrayidx72.5, align 4, !tbaa !16
  %vecext.1.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 1
  %add69.1.5 = or disjoint i64 %mul56.5, %135
  %add71.1.5 = or disjoint i64 %add69.1.5, %conv70
  %arrayidx72.1.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.5
  store i32 %vecext.1.5, ptr addrspace(1) %arrayidx72.1.5, align 4, !tbaa !16
  %vecext.2.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 2
  %add69.2.5 = or disjoint i64 %mul56.5, %137
  %add71.2.5 = or disjoint i64 %add69.2.5, %conv70
  %arrayidx72.2.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.5
  store i32 %vecext.2.5, ptr addrspace(1) %arrayidx72.2.5, align 4, !tbaa !16
  %vecext.3.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 3
  %add69.3.5 = or disjoint i64 %mul56.5, %139
  %add71.3.5 = or disjoint i64 %add69.3.5, %conv70
  %arrayidx72.3.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.5
  store i32 %vecext.3.5, ptr addrspace(1) %arrayidx72.3.5, align 4, !tbaa !16
  %add55.6 = mul nuw nsw i64 %add, 6400
  %mul56.6 = add nuw nsw i64 %add55.6, 1536
  %vecext.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 0
  %add69.6 = or disjoint i64 %mul56.6, %133
  %add71.6 = or disjoint i64 %add69.6, %conv70
  %arrayidx72.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.6
  store i32 %vecext.6, ptr addrspace(1) %arrayidx72.6, align 4, !tbaa !16
  %vecext.1.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 1
  %add69.1.6 = or disjoint i64 %mul56.6, %135
  %add71.1.6 = or disjoint i64 %add69.1.6, %conv70
  %arrayidx72.1.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.6
  store i32 %vecext.1.6, ptr addrspace(1) %arrayidx72.1.6, align 4, !tbaa !16
  %vecext.2.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 2
  %add69.2.6 = or disjoint i64 %mul56.6, %137
  %add71.2.6 = or disjoint i64 %add69.2.6, %conv70
  %arrayidx72.2.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.6
  store i32 %vecext.2.6, ptr addrspace(1) %arrayidx72.2.6, align 4, !tbaa !16
  %vecext.3.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 3
  %add69.3.6 = or disjoint i64 %mul56.6, %139
  %add71.3.6 = or disjoint i64 %add69.3.6, %conv70
  %arrayidx72.3.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.6
  store i32 %vecext.3.6, ptr addrspace(1) %arrayidx72.3.6, align 4, !tbaa !16
  %add55.7 = mul nuw nsw i64 %add, 6400
  %mul56.7 = add nuw nsw i64 %add55.7, 1792
  %vecext.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 0
  %add69.7 = or disjoint i64 %mul56.7, %133
  %add71.7 = or disjoint i64 %add69.7, %conv70
  %arrayidx72.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.7
  store i32 %vecext.7, ptr addrspace(1) %arrayidx72.7, align 4, !tbaa !16
  %vecext.1.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 1
  %add69.1.7 = or disjoint i64 %mul56.7, %135
  %add71.1.7 = or disjoint i64 %add69.1.7, %conv70
  %arrayidx72.1.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.7
  store i32 %vecext.1.7, ptr addrspace(1) %arrayidx72.1.7, align 4, !tbaa !16
  %vecext.2.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 2
  %add69.2.7 = or disjoint i64 %mul56.7, %137
  %add71.2.7 = or disjoint i64 %add69.2.7, %conv70
  %arrayidx72.2.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.7
  store i32 %vecext.2.7, ptr addrspace(1) %arrayidx72.2.7, align 4, !tbaa !16
  %vecext.3.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 3
  %add69.3.7 = or disjoint i64 %mul56.7, %139
  %add71.3.7 = or disjoint i64 %add69.3.7, %conv70
  %arrayidx72.3.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.7
  store i32 %vecext.3.7, ptr addrspace(1) %arrayidx72.3.7, align 4, !tbaa !16
  %add55.8 = mul nuw nsw i64 %add, 6400
  %mul56.8 = add nuw nsw i64 %add55.8, 2048
  %vecext.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 0
  %add69.8 = or disjoint i64 %mul56.8, %133
  %add71.8 = or disjoint i64 %add69.8, %conv70
  %arrayidx72.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.8
  store i32 %vecext.8, ptr addrspace(1) %arrayidx72.8, align 4, !tbaa !16
  %vecext.1.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 1
  %add69.1.8 = or disjoint i64 %mul56.8, %135
  %add71.1.8 = or disjoint i64 %add69.1.8, %conv70
  %arrayidx72.1.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.8
  store i32 %vecext.1.8, ptr addrspace(1) %arrayidx72.1.8, align 4, !tbaa !16
  %vecext.2.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 2
  %add69.2.8 = or disjoint i64 %mul56.8, %137
  %add71.2.8 = or disjoint i64 %add69.2.8, %conv70
  %arrayidx72.2.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.8
  store i32 %vecext.2.8, ptr addrspace(1) %arrayidx72.2.8, align 4, !tbaa !16
  %vecext.3.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 3
  %add69.3.8 = or disjoint i64 %mul56.8, %139
  %add71.3.8 = or disjoint i64 %add69.3.8, %conv70
  %arrayidx72.3.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.8
  store i32 %vecext.3.8, ptr addrspace(1) %arrayidx72.3.8, align 4, !tbaa !16
  %add55.9 = mul nuw nsw i64 %add, 6400
  %mul56.9 = add nuw nsw i64 %add55.9, 2304
  %vecext.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 0
  %add69.9 = or disjoint i64 %mul56.9, %133
  %add71.9 = or disjoint i64 %add69.9, %conv70
  %arrayidx72.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.9
  store i32 %vecext.9, ptr addrspace(1) %arrayidx72.9, align 4, !tbaa !16
  %vecext.1.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 1
  %add69.1.9 = or disjoint i64 %mul56.9, %135
  %add71.1.9 = or disjoint i64 %add69.1.9, %conv70
  %arrayidx72.1.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.9
  store i32 %vecext.1.9, ptr addrspace(1) %arrayidx72.1.9, align 4, !tbaa !16
  %vecext.2.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 2
  %add69.2.9 = or disjoint i64 %mul56.9, %137
  %add71.2.9 = or disjoint i64 %add69.2.9, %conv70
  %arrayidx72.2.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.9
  store i32 %vecext.2.9, ptr addrspace(1) %arrayidx72.2.9, align 4, !tbaa !16
  %vecext.3.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 3
  %add69.3.9 = or disjoint i64 %mul56.9, %139
  %add71.3.9 = or disjoint i64 %add69.3.9, %conv70
  %arrayidx72.3.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.9
  store i32 %vecext.3.9, ptr addrspace(1) %arrayidx72.3.9, align 4, !tbaa !16
  %add55.10 = mul nuw nsw i64 %add, 6400
  %mul56.10 = add nuw nsw i64 %add55.10, 2560
  %vecext.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 0
  %add69.10 = or disjoint i64 %mul56.10, %133
  %add71.10 = or disjoint i64 %add69.10, %conv70
  %arrayidx72.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.10
  store i32 %vecext.10, ptr addrspace(1) %arrayidx72.10, align 4, !tbaa !16
  %vecext.1.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 1
  %add69.1.10 = or disjoint i64 %mul56.10, %135
  %add71.1.10 = or disjoint i64 %add69.1.10, %conv70
  %arrayidx72.1.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.10
  store i32 %vecext.1.10, ptr addrspace(1) %arrayidx72.1.10, align 4, !tbaa !16
  %vecext.2.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 2
  %add69.2.10 = or disjoint i64 %mul56.10, %137
  %add71.2.10 = or disjoint i64 %add69.2.10, %conv70
  %arrayidx72.2.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.10
  store i32 %vecext.2.10, ptr addrspace(1) %arrayidx72.2.10, align 4, !tbaa !16
  %vecext.3.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 3
  %add69.3.10 = or disjoint i64 %mul56.10, %139
  %add71.3.10 = or disjoint i64 %add69.3.10, %conv70
  %arrayidx72.3.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.10
  store i32 %vecext.3.10, ptr addrspace(1) %arrayidx72.3.10, align 4, !tbaa !16
  %add55.11 = mul nuw nsw i64 %add, 6400
  %mul56.11 = add nuw nsw i64 %add55.11, 2816
  %vecext.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 0
  %add69.11 = or disjoint i64 %mul56.11, %133
  %add71.11 = or disjoint i64 %add69.11, %conv70
  %arrayidx72.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.11
  store i32 %vecext.11, ptr addrspace(1) %arrayidx72.11, align 4, !tbaa !16
  %vecext.1.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 1
  %add69.1.11 = or disjoint i64 %mul56.11, %135
  %add71.1.11 = or disjoint i64 %add69.1.11, %conv70
  %arrayidx72.1.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.11
  store i32 %vecext.1.11, ptr addrspace(1) %arrayidx72.1.11, align 4, !tbaa !16
  %vecext.2.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 2
  %add69.2.11 = or disjoint i64 %mul56.11, %137
  %add71.2.11 = or disjoint i64 %add69.2.11, %conv70
  %arrayidx72.2.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.11
  store i32 %vecext.2.11, ptr addrspace(1) %arrayidx72.2.11, align 4, !tbaa !16
  %vecext.3.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 3
  %add69.3.11 = or disjoint i64 %mul56.11, %139
  %add71.3.11 = or disjoint i64 %add69.3.11, %conv70
  %arrayidx72.3.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.11
  store i32 %vecext.3.11, ptr addrspace(1) %arrayidx72.3.11, align 4, !tbaa !16
  %add55.12 = mul nuw nsw i64 %add, 6400
  %mul56.12 = add nuw nsw i64 %add55.12, 3072
  %vecext.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 0
  %add69.12 = or disjoint i64 %mul56.12, %133
  %add71.12 = or disjoint i64 %add69.12, %conv70
  %arrayidx72.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.12
  store i32 %vecext.12, ptr addrspace(1) %arrayidx72.12, align 4, !tbaa !16
  %vecext.1.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 1
  %add69.1.12 = or disjoint i64 %mul56.12, %135
  %add71.1.12 = or disjoint i64 %add69.1.12, %conv70
  %arrayidx72.1.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.12
  store i32 %vecext.1.12, ptr addrspace(1) %arrayidx72.1.12, align 4, !tbaa !16
  %vecext.2.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 2
  %add69.2.12 = or disjoint i64 %mul56.12, %137
  %add71.2.12 = or disjoint i64 %add69.2.12, %conv70
  %arrayidx72.2.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.12
  store i32 %vecext.2.12, ptr addrspace(1) %arrayidx72.2.12, align 4, !tbaa !16
  %vecext.3.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 3
  %add69.3.12 = or disjoint i64 %mul56.12, %139
  %add71.3.12 = or disjoint i64 %add69.3.12, %conv70
  %arrayidx72.3.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.12
  store i32 %vecext.3.12, ptr addrspace(1) %arrayidx72.3.12, align 4, !tbaa !16
  %add55.13 = mul nuw nsw i64 %add, 6400
  %mul56.13 = add nuw nsw i64 %add55.13, 3328
  %vecext.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 0
  %add69.13 = or disjoint i64 %mul56.13, %133
  %add71.13 = or disjoint i64 %add69.13, %conv70
  %arrayidx72.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.13
  store i32 %vecext.13, ptr addrspace(1) %arrayidx72.13, align 4, !tbaa !16
  %vecext.1.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 1
  %add69.1.13 = or disjoint i64 %mul56.13, %135
  %add71.1.13 = or disjoint i64 %add69.1.13, %conv70
  %arrayidx72.1.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.13
  store i32 %vecext.1.13, ptr addrspace(1) %arrayidx72.1.13, align 4, !tbaa !16
  %vecext.2.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 2
  %add69.2.13 = or disjoint i64 %mul56.13, %137
  %add71.2.13 = or disjoint i64 %add69.2.13, %conv70
  %arrayidx72.2.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.13
  store i32 %vecext.2.13, ptr addrspace(1) %arrayidx72.2.13, align 4, !tbaa !16
  %vecext.3.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 3
  %add69.3.13 = or disjoint i64 %mul56.13, %139
  %add71.3.13 = or disjoint i64 %add69.3.13, %conv70
  %arrayidx72.3.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.13
  store i32 %vecext.3.13, ptr addrspace(1) %arrayidx72.3.13, align 4, !tbaa !16
  %add55.14 = mul nuw nsw i64 %add, 6400
  %mul56.14 = add nuw nsw i64 %add55.14, 3584
  %vecext.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 0
  %add69.14 = or disjoint i64 %mul56.14, %133
  %add71.14 = or disjoint i64 %add69.14, %conv70
  %arrayidx72.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.14
  store i32 %vecext.14, ptr addrspace(1) %arrayidx72.14, align 4, !tbaa !16
  %vecext.1.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 1
  %add69.1.14 = or disjoint i64 %mul56.14, %135
  %add71.1.14 = or disjoint i64 %add69.1.14, %conv70
  %arrayidx72.1.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.14
  store i32 %vecext.1.14, ptr addrspace(1) %arrayidx72.1.14, align 4, !tbaa !16
  %vecext.2.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 2
  %add69.2.14 = or disjoint i64 %mul56.14, %137
  %add71.2.14 = or disjoint i64 %add69.2.14, %conv70
  %arrayidx72.2.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.14
  store i32 %vecext.2.14, ptr addrspace(1) %arrayidx72.2.14, align 4, !tbaa !16
  %vecext.3.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 3
  %add69.3.14 = or disjoint i64 %mul56.14, %139
  %add71.3.14 = or disjoint i64 %add69.3.14, %conv70
  %arrayidx72.3.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.14
  store i32 %vecext.3.14, ptr addrspace(1) %arrayidx72.3.14, align 4, !tbaa !16
  %add55.15 = mul nuw nsw i64 %add, 6400
  %mul56.15 = add nuw nsw i64 %add55.15, 3840
  %vecext.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 0
  %add69.15 = or disjoint i64 %mul56.15, %133
  %add71.15 = or disjoint i64 %add69.15, %conv70
  %arrayidx72.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.15
  store i32 %vecext.15, ptr addrspace(1) %arrayidx72.15, align 4, !tbaa !16
  %vecext.1.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 1
  %add69.1.15 = or disjoint i64 %mul56.15, %135
  %add71.1.15 = or disjoint i64 %add69.1.15, %conv70
  %arrayidx72.1.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.15
  store i32 %vecext.1.15, ptr addrspace(1) %arrayidx72.1.15, align 4, !tbaa !16
  %vecext.2.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 2
  %add69.2.15 = or disjoint i64 %mul56.15, %137
  %add71.2.15 = or disjoint i64 %add69.2.15, %conv70
  %arrayidx72.2.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.15
  store i32 %vecext.2.15, ptr addrspace(1) %arrayidx72.2.15, align 4, !tbaa !16
  %vecext.3.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 3
  %add69.3.15 = or disjoint i64 %mul56.15, %139
  %add71.3.15 = or disjoint i64 %add69.3.15, %conv70
  %arrayidx72.3.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.15
  store i32 %vecext.3.15, ptr addrspace(1) %arrayidx72.3.15, align 4, !tbaa !16
  %add55.16 = mul nuw nsw i64 %add, 6400
  %mul56.16 = add nuw nsw i64 %add55.16, 4096
  %vecext.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 0
  %add69.16 = or disjoint i64 %mul56.16, %133
  %add71.16 = or disjoint i64 %add69.16, %conv70
  %arrayidx72.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.16
  store i32 %vecext.16, ptr addrspace(1) %arrayidx72.16, align 4, !tbaa !16
  %vecext.1.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 1
  %add69.1.16 = or disjoint i64 %mul56.16, %135
  %add71.1.16 = or disjoint i64 %add69.1.16, %conv70
  %arrayidx72.1.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.16
  store i32 %vecext.1.16, ptr addrspace(1) %arrayidx72.1.16, align 4, !tbaa !16
  %vecext.2.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 2
  %add69.2.16 = or disjoint i64 %mul56.16, %137
  %add71.2.16 = or disjoint i64 %add69.2.16, %conv70
  %arrayidx72.2.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.16
  store i32 %vecext.2.16, ptr addrspace(1) %arrayidx72.2.16, align 4, !tbaa !16
  %vecext.3.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 3
  %add69.3.16 = or disjoint i64 %mul56.16, %139
  %add71.3.16 = or disjoint i64 %add69.3.16, %conv70
  %arrayidx72.3.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.16
  store i32 %vecext.3.16, ptr addrspace(1) %arrayidx72.3.16, align 4, !tbaa !16
  %add55.17 = mul nuw nsw i64 %add, 6400
  %mul56.17 = add nuw nsw i64 %add55.17, 4352
  %vecext.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 0
  %add69.17 = or disjoint i64 %mul56.17, %133
  %add71.17 = or disjoint i64 %add69.17, %conv70
  %arrayidx72.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.17
  store i32 %vecext.17, ptr addrspace(1) %arrayidx72.17, align 4, !tbaa !16
  %vecext.1.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 1
  %add69.1.17 = or disjoint i64 %mul56.17, %135
  %add71.1.17 = or disjoint i64 %add69.1.17, %conv70
  %arrayidx72.1.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.17
  store i32 %vecext.1.17, ptr addrspace(1) %arrayidx72.1.17, align 4, !tbaa !16
  %vecext.2.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 2
  %add69.2.17 = or disjoint i64 %mul56.17, %137
  %add71.2.17 = or disjoint i64 %add69.2.17, %conv70
  %arrayidx72.2.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.17
  store i32 %vecext.2.17, ptr addrspace(1) %arrayidx72.2.17, align 4, !tbaa !16
  %vecext.3.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 3
  %add69.3.17 = or disjoint i64 %mul56.17, %139
  %add71.3.17 = or disjoint i64 %add69.3.17, %conv70
  %arrayidx72.3.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.17
  store i32 %vecext.3.17, ptr addrspace(1) %arrayidx72.3.17, align 4, !tbaa !16
  %add55.18 = mul nuw nsw i64 %add, 6400
  %mul56.18 = add nuw nsw i64 %add55.18, 4608
  %vecext.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 0
  %add69.18 = or disjoint i64 %mul56.18, %133
  %add71.18 = or disjoint i64 %add69.18, %conv70
  %arrayidx72.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.18
  store i32 %vecext.18, ptr addrspace(1) %arrayidx72.18, align 4, !tbaa !16
  %vecext.1.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 1
  %add69.1.18 = or disjoint i64 %mul56.18, %135
  %add71.1.18 = or disjoint i64 %add69.1.18, %conv70
  %arrayidx72.1.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.18
  store i32 %vecext.1.18, ptr addrspace(1) %arrayidx72.1.18, align 4, !tbaa !16
  %vecext.2.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 2
  %add69.2.18 = or disjoint i64 %mul56.18, %137
  %add71.2.18 = or disjoint i64 %add69.2.18, %conv70
  %arrayidx72.2.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.18
  store i32 %vecext.2.18, ptr addrspace(1) %arrayidx72.2.18, align 4, !tbaa !16
  %vecext.3.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 3
  %add69.3.18 = or disjoint i64 %mul56.18, %139
  %add71.3.18 = or disjoint i64 %add69.3.18, %conv70
  %arrayidx72.3.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.18
  store i32 %vecext.3.18, ptr addrspace(1) %arrayidx72.3.18, align 4, !tbaa !16
  %add55.19 = mul nuw nsw i64 %add, 6400
  %mul56.19 = add nuw nsw i64 %add55.19, 4864
  %vecext.19 = extractelement <4 x i32> %sums.sroa.78.1, i64 0
  %add69.19 = or disjoint i64 %mul56.19, %133
  %add71.19 = or disjoint i64 %add69.19, %conv70
  %arrayidx72.19 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.19
  store i32 %vecext.19, ptr addrspace(1) %arrayidx72.19, align 4, !tbaa !16
  %vecext.1.19 = extractelement <4 x i32> %sums.sroa.78.1, i64 1
  %add69.1.19 = or disjoint i64 %mul56.19, %135
  %add71.1.19 = or disjoint i64 %add69.1.19, %conv70
  %arrayidx72.1.19 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.19
  store i32 %vecext.1.19, ptr addrspace(1) %arrayidx72.1.19, align 4, !tbaa !16
  %vecext.2.19 = extractelement <4 x i32> %sums.sroa.78.1, i64 2
  %add69.2.19 = or disjoint i64 %mul56.19, %137
  %add71.2.19 = or disjoint i64 %add69.2.19, %conv70
  %arrayidx72.2.19 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.19
  store i32 %vecext.2.19, ptr addrspace(1) %arrayidx72.2.19, align 4, !tbaa !16
  %vecext.3.19 = extractelement <4 x i32> %sums.sroa.78.1, i64 3
  %add69.3.19 = or disjoint i64 %mul56.19, %139
  %add71.3.19 = or disjoint i64 %add69.3.19, %conv70
  %arrayidx72.3.19 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.19
  store i32 %vecext.3.19, ptr addrspace(1) %arrayidx72.3.19, align 4, !tbaa !16
  %add55.20 = mul nuw nsw i64 %add, 6400
  %mul56.20 = add nuw nsw i64 %add55.20, 5120
  %vecext.20 = extractelement <4 x i32> %sums.sroa.82.1, i64 0
  %add69.20 = or disjoint i64 %mul56.20, %133
  %add71.20 = or disjoint i64 %add69.20, %conv70
  %arrayidx72.20 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.20
  store i32 %vecext.20, ptr addrspace(1) %arrayidx72.20, align 4, !tbaa !16
  %vecext.1.20 = extractelement <4 x i32> %sums.sroa.82.1, i64 1
  %add69.1.20 = or disjoint i64 %mul56.20, %135
  %add71.1.20 = or disjoint i64 %add69.1.20, %conv70
  %arrayidx72.1.20 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.20
  store i32 %vecext.1.20, ptr addrspace(1) %arrayidx72.1.20, align 4, !tbaa !16
  %vecext.2.20 = extractelement <4 x i32> %sums.sroa.82.1, i64 2
  %add69.2.20 = or disjoint i64 %mul56.20, %137
  %add71.2.20 = or disjoint i64 %add69.2.20, %conv70
  %arrayidx72.2.20 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.20
  store i32 %vecext.2.20, ptr addrspace(1) %arrayidx72.2.20, align 4, !tbaa !16
  %vecext.3.20 = extractelement <4 x i32> %sums.sroa.82.1, i64 3
  %add69.3.20 = or disjoint i64 %mul56.20, %139
  %add71.3.20 = or disjoint i64 %add69.3.20, %conv70
  %arrayidx72.3.20 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.20
  store i32 %vecext.3.20, ptr addrspace(1) %arrayidx72.3.20, align 4, !tbaa !16
  %add55.21 = mul nuw nsw i64 %add, 6400
  %mul56.21 = add nuw nsw i64 %add55.21, 5376
  %vecext.21 = extractelement <4 x i32> %sums.sroa.86.1, i64 0
  %add69.21 = or disjoint i64 %mul56.21, %133
  %add71.21 = or disjoint i64 %add69.21, %conv70
  %arrayidx72.21 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.21
  store i32 %vecext.21, ptr addrspace(1) %arrayidx72.21, align 4, !tbaa !16
  %vecext.1.21 = extractelement <4 x i32> %sums.sroa.86.1, i64 1
  %add69.1.21 = or disjoint i64 %mul56.21, %135
  %add71.1.21 = or disjoint i64 %add69.1.21, %conv70
  %arrayidx72.1.21 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.21
  store i32 %vecext.1.21, ptr addrspace(1) %arrayidx72.1.21, align 4, !tbaa !16
  %vecext.2.21 = extractelement <4 x i32> %sums.sroa.86.1, i64 2
  %add69.2.21 = or disjoint i64 %mul56.21, %137
  %add71.2.21 = or disjoint i64 %add69.2.21, %conv70
  %arrayidx72.2.21 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.21
  store i32 %vecext.2.21, ptr addrspace(1) %arrayidx72.2.21, align 4, !tbaa !16
  %vecext.3.21 = extractelement <4 x i32> %sums.sroa.86.1, i64 3
  %add69.3.21 = or disjoint i64 %mul56.21, %139
  %add71.3.21 = or disjoint i64 %add69.3.21, %conv70
  %arrayidx72.3.21 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.21
  store i32 %vecext.3.21, ptr addrspace(1) %arrayidx72.3.21, align 4, !tbaa !16
  %add55.22 = mul nuw nsw i64 %add, 6400
  %mul56.22 = add nuw nsw i64 %add55.22, 5632
  %vecext.22 = extractelement <4 x i32> %sums.sroa.90.1, i64 0
  %add69.22 = or disjoint i64 %mul56.22, %133
  %add71.22 = or disjoint i64 %add69.22, %conv70
  %arrayidx72.22 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.22
  store i32 %vecext.22, ptr addrspace(1) %arrayidx72.22, align 4, !tbaa !16
  %vecext.1.22 = extractelement <4 x i32> %sums.sroa.90.1, i64 1
  %add69.1.22 = or disjoint i64 %mul56.22, %135
  %add71.1.22 = or disjoint i64 %add69.1.22, %conv70
  %arrayidx72.1.22 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.22
  store i32 %vecext.1.22, ptr addrspace(1) %arrayidx72.1.22, align 4, !tbaa !16
  %vecext.2.22 = extractelement <4 x i32> %sums.sroa.90.1, i64 2
  %add69.2.22 = or disjoint i64 %mul56.22, %137
  %add71.2.22 = or disjoint i64 %add69.2.22, %conv70
  %arrayidx72.2.22 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.22
  store i32 %vecext.2.22, ptr addrspace(1) %arrayidx72.2.22, align 4, !tbaa !16
  %vecext.3.22 = extractelement <4 x i32> %sums.sroa.90.1, i64 3
  %add69.3.22 = or disjoint i64 %mul56.22, %139
  %add71.3.22 = or disjoint i64 %add69.3.22, %conv70
  %arrayidx72.3.22 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.22
  store i32 %vecext.3.22, ptr addrspace(1) %arrayidx72.3.22, align 4, !tbaa !16
  %add55.23 = mul nuw nsw i64 %add, 6400
  %mul56.23 = add nuw nsw i64 %add55.23, 5888
  %vecext.23 = extractelement <4 x i32> %sums.sroa.94.1, i64 0
  %add69.23 = or disjoint i64 %mul56.23, %133
  %add71.23 = or disjoint i64 %add69.23, %conv70
  %arrayidx72.23 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.23
  store i32 %vecext.23, ptr addrspace(1) %arrayidx72.23, align 4, !tbaa !16
  %vecext.1.23 = extractelement <4 x i32> %sums.sroa.94.1, i64 1
  %add69.1.23 = or disjoint i64 %mul56.23, %135
  %add71.1.23 = or disjoint i64 %add69.1.23, %conv70
  %arrayidx72.1.23 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.23
  store i32 %vecext.1.23, ptr addrspace(1) %arrayidx72.1.23, align 4, !tbaa !16
  %vecext.2.23 = extractelement <4 x i32> %sums.sroa.94.1, i64 2
  %add69.2.23 = or disjoint i64 %mul56.23, %137
  %add71.2.23 = or disjoint i64 %add69.2.23, %conv70
  %arrayidx72.2.23 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.23
  store i32 %vecext.2.23, ptr addrspace(1) %arrayidx72.2.23, align 4, !tbaa !16
  %vecext.3.23 = extractelement <4 x i32> %sums.sroa.94.1, i64 3
  %add69.3.23 = or disjoint i64 %mul56.23, %139
  %add71.3.23 = or disjoint i64 %add69.3.23, %conv70
  %arrayidx72.3.23 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.23
  store i32 %vecext.3.23, ptr addrspace(1) %arrayidx72.3.23, align 4, !tbaa !16
  %add55.24 = mul nuw nsw i64 %add, 6400
  %mul56.24 = add nuw nsw i64 %add55.24, 6144
  %vecext.24 = extractelement <4 x i32> %sums.sroa.98.1, i64 0
  %add69.24 = or disjoint i64 %mul56.24, %133
  %add71.24 = or disjoint i64 %add69.24, %conv70
  %arrayidx72.24 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.24
  store i32 %vecext.24, ptr addrspace(1) %arrayidx72.24, align 4, !tbaa !16
  %vecext.1.24 = extractelement <4 x i32> %sums.sroa.98.1, i64 1
  %add69.1.24 = or disjoint i64 %mul56.24, %135
  %add71.1.24 = or disjoint i64 %add69.1.24, %conv70
  %arrayidx72.1.24 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.24
  store i32 %vecext.1.24, ptr addrspace(1) %arrayidx72.1.24, align 4, !tbaa !16
  %vecext.2.24 = extractelement <4 x i32> %sums.sroa.98.1, i64 2
  %add69.2.24 = or disjoint i64 %mul56.24, %137
  %add71.2.24 = or disjoint i64 %add69.2.24, %conv70
  %arrayidx72.2.24 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.24
  store i32 %vecext.2.24, ptr addrspace(1) %arrayidx72.2.24, align 4, !tbaa !16
  %vecext.3.24 = extractelement <4 x i32> %sums.sroa.98.1, i64 3
  %add69.3.24 = or disjoint i64 %mul56.24, %139
  %add71.3.24 = or disjoint i64 %add69.3.24, %conv70
  %arrayidx72.3.24 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.24
  store i32 %vecext.3.24, ptr addrspace(1) %arrayidx72.3.24, align 4, !tbaa !16
  ret void
}

; Function Attrs: convergent mustprogress nofree norecurse nounwind memory(argmem: readwrite)
define protected metaxgpu_kernel void @_Z13mmaPeakKernelILi26EEvPKaS1_Pii(ptr addrspace(1) noalias nocapture noundef readonly %a.coerce, ptr addrspace(1) noalias nocapture noundef readonly %b.coerce, ptr addrspace(1) noalias noundef writeonly %c.coerce, i32 noundef %iterations) local_unnamed_addr #3 comdat {
entry:
  %0 = tail call noundef range(i32 0, 1024) i32 @llvm.mxc.thread.id.x(), !range !25
  %1 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.mxc.dispatch.ptr()
  %2 = getelementptr inbounds i8, ptr addrspace(4) %1, i64 4
  %3 = load i16, ptr addrspace(4) %2, align 4, !range !26, !invariant.load !14
  %rem11 = and i32 %0, 15
  %4 = lshr i32 %0, 2
  %mul13 = and i32 %4, 12
  %mul15 = shl nuw nsw i32 %rem11, 4
  %5 = zext nneg i32 %mul15 to i64
  %6 = zext nneg i32 %mul13 to i64
  %7 = or disjoint i64 %5, %6
  %add.ptr = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %7
  %8 = load i32, ptr addrspace(1) %add.ptr, align 1
  %add.ptr21 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %7
  %9 = load i32, ptr addrspace(1) %add.ptr21, align 1
  %10 = or disjoint i64 %5, %6
  %11 = or disjoint i64 %10, 256
  %add.ptr.1 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %11
  %12 = load i32, ptr addrspace(1) %add.ptr.1, align 1
  %add.ptr21.1 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %11
  %13 = load i32, ptr addrspace(1) %add.ptr21.1, align 1
  %14 = or disjoint i64 %5, %6
  %15 = or disjoint i64 %14, 512
  %add.ptr.2 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %15
  %16 = load i32, ptr addrspace(1) %add.ptr.2, align 1
  %add.ptr21.2 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %15
  %17 = load i32, ptr addrspace(1) %add.ptr21.2, align 1
  %18 = or disjoint i64 %5, %6
  %19 = or disjoint i64 %18, 768
  %add.ptr.3 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %19
  %20 = load i32, ptr addrspace(1) %add.ptr.3, align 1
  %add.ptr21.3 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %19
  %21 = load i32, ptr addrspace(1) %add.ptr21.3, align 1
  %22 = or disjoint i64 %5, %6
  %23 = or disjoint i64 %22, 1024
  %add.ptr.4 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %23
  %24 = load i32, ptr addrspace(1) %add.ptr.4, align 1
  %add.ptr21.4 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %23
  %25 = load i32, ptr addrspace(1) %add.ptr21.4, align 1
  %26 = or disjoint i64 %5, %6
  %27 = or disjoint i64 %26, 1280
  %add.ptr.5 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %27
  %28 = load i32, ptr addrspace(1) %add.ptr.5, align 1
  %add.ptr21.5 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %27
  %29 = load i32, ptr addrspace(1) %add.ptr21.5, align 1
  %30 = or disjoint i64 %5, %6
  %31 = or disjoint i64 %30, 1536
  %add.ptr.6 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %31
  %32 = load i32, ptr addrspace(1) %add.ptr.6, align 1
  %add.ptr21.6 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %31
  %33 = load i32, ptr addrspace(1) %add.ptr21.6, align 1
  %34 = or disjoint i64 %5, %6
  %35 = or disjoint i64 %34, 1792
  %add.ptr.7 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %35
  %36 = load i32, ptr addrspace(1) %add.ptr.7, align 1
  %add.ptr21.7 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %35
  %37 = load i32, ptr addrspace(1) %add.ptr21.7, align 1
  %38 = or disjoint i64 %5, %6
  %39 = or disjoint i64 %38, 2048
  %add.ptr.8 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %39
  %40 = load i32, ptr addrspace(1) %add.ptr.8, align 1
  %add.ptr21.8 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %39
  %41 = load i32, ptr addrspace(1) %add.ptr21.8, align 1
  %42 = or disjoint i64 %5, %6
  %43 = or disjoint i64 %42, 2304
  %add.ptr.9 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %43
  %44 = load i32, ptr addrspace(1) %add.ptr.9, align 1
  %add.ptr21.9 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %43
  %45 = load i32, ptr addrspace(1) %add.ptr21.9, align 1
  %46 = or disjoint i64 %5, %6
  %47 = or disjoint i64 %46, 2560
  %add.ptr.10 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %47
  %48 = load i32, ptr addrspace(1) %add.ptr.10, align 1
  %add.ptr21.10 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %47
  %49 = load i32, ptr addrspace(1) %add.ptr21.10, align 1
  %50 = or disjoint i64 %5, %6
  %51 = or disjoint i64 %50, 2816
  %add.ptr.11 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %51
  %52 = load i32, ptr addrspace(1) %add.ptr.11, align 1
  %add.ptr21.11 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %51
  %53 = load i32, ptr addrspace(1) %add.ptr21.11, align 1
  %54 = or disjoint i64 %5, %6
  %55 = or disjoint i64 %54, 3072
  %add.ptr.12 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %55
  %56 = load i32, ptr addrspace(1) %add.ptr.12, align 1
  %add.ptr21.12 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %55
  %57 = load i32, ptr addrspace(1) %add.ptr21.12, align 1
  %58 = or disjoint i64 %5, %6
  %59 = or disjoint i64 %58, 3328
  %add.ptr.13 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %59
  %60 = load i32, ptr addrspace(1) %add.ptr.13, align 1
  %add.ptr21.13 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %59
  %61 = load i32, ptr addrspace(1) %add.ptr21.13, align 1
  %62 = or disjoint i64 %5, %6
  %63 = or disjoint i64 %62, 3584
  %add.ptr.14 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %63
  %64 = load i32, ptr addrspace(1) %add.ptr.14, align 1
  %add.ptr21.14 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %63
  %65 = load i32, ptr addrspace(1) %add.ptr21.14, align 1
  %66 = or disjoint i64 %5, %6
  %67 = or disjoint i64 %66, 3840
  %add.ptr.15 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %67
  %68 = load i32, ptr addrspace(1) %add.ptr.15, align 1
  %add.ptr21.15 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %67
  %69 = load i32, ptr addrspace(1) %add.ptr21.15, align 1
  %70 = or disjoint i64 %5, %6
  %71 = or disjoint i64 %70, 4096
  %add.ptr.16 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %71
  %72 = load i32, ptr addrspace(1) %add.ptr.16, align 1
  %add.ptr21.16 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %71
  %73 = load i32, ptr addrspace(1) %add.ptr21.16, align 1
  %74 = or disjoint i64 %5, %6
  %75 = or disjoint i64 %74, 4352
  %add.ptr.17 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %75
  %76 = load i32, ptr addrspace(1) %add.ptr.17, align 1
  %add.ptr21.17 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %75
  %77 = load i32, ptr addrspace(1) %add.ptr21.17, align 1
  %78 = or disjoint i64 %5, %6
  %79 = or disjoint i64 %78, 4608
  %add.ptr.18 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %79
  %80 = load i32, ptr addrspace(1) %add.ptr.18, align 1
  %add.ptr21.18 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %79
  %81 = load i32, ptr addrspace(1) %add.ptr21.18, align 1
  %82 = or disjoint i64 %5, %6
  %83 = or disjoint i64 %82, 4864
  %add.ptr.19 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %83
  %84 = load i32, ptr addrspace(1) %add.ptr.19, align 1
  %add.ptr21.19 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %83
  %85 = load i32, ptr addrspace(1) %add.ptr21.19, align 1
  %86 = or disjoint i64 %5, %6
  %87 = or disjoint i64 %86, 5120
  %add.ptr.20 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %87
  %88 = load i32, ptr addrspace(1) %add.ptr.20, align 1
  %add.ptr21.20 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %87
  %89 = load i32, ptr addrspace(1) %add.ptr21.20, align 1
  %90 = or disjoint i64 %5, %6
  %91 = or disjoint i64 %90, 5376
  %add.ptr.21 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %91
  %92 = load i32, ptr addrspace(1) %add.ptr.21, align 1
  %add.ptr21.21 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %91
  %93 = load i32, ptr addrspace(1) %add.ptr21.21, align 1
  %94 = or disjoint i64 %5, %6
  %95 = or disjoint i64 %94, 5632
  %add.ptr.22 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %95
  %96 = load i32, ptr addrspace(1) %add.ptr.22, align 1
  %add.ptr21.22 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %95
  %97 = load i32, ptr addrspace(1) %add.ptr21.22, align 1
  %98 = or disjoint i64 %5, %6
  %99 = or disjoint i64 %98, 5888
  %add.ptr.23 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %99
  %100 = load i32, ptr addrspace(1) %add.ptr.23, align 1
  %add.ptr21.23 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %99
  %101 = load i32, ptr addrspace(1) %add.ptr21.23, align 1
  %102 = or disjoint i64 %5, %6
  %103 = or disjoint i64 %102, 6144
  %add.ptr.24 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %103
  %104 = load i32, ptr addrspace(1) %add.ptr.24, align 1
  %add.ptr21.24 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %103
  %105 = load i32, ptr addrspace(1) %add.ptr21.24, align 1
  %106 = or disjoint i64 %5, %6
  %107 = or disjoint i64 %106, 6400
  %add.ptr.25 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %107
  %108 = load i32, ptr addrspace(1) %add.ptr.25, align 1
  %add.ptr21.25 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %107
  %109 = load i32, ptr addrspace(1) %add.ptr21.25, align 1
  %cmp25104 = icmp sgt i32 %iterations, 0
  br i1 %cmp25104, label %for.cond30.preheader, label %for.cond49.preheader

for.cond30.preheader:                             ; preds = %entry, %for.cond30.preheader
  %sums.sroa.102.0 = phi <4 x i32> [ %135, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.98.0 = phi <4 x i32> [ %134, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.94.0 = phi <4 x i32> [ %133, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.90.0 = phi <4 x i32> [ %132, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.86.0 = phi <4 x i32> [ %131, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.82.0 = phi <4 x i32> [ %130, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.78.0 = phi <4 x i32> [ %129, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.74.0 = phi <4 x i32> [ %128, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.70.0 = phi <4 x i32> [ %127, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.66.0 = phi <4 x i32> [ %126, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.62.0 = phi <4 x i32> [ %125, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.58.0 = phi <4 x i32> [ %124, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.54.0 = phi <4 x i32> [ %123, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.50.0 = phi <4 x i32> [ %122, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.46.0 = phi <4 x i32> [ %121, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.42.0 = phi <4 x i32> [ %120, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.38.0 = phi <4 x i32> [ %119, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.34.0 = phi <4 x i32> [ %118, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.30.0 = phi <4 x i32> [ %117, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.26.0 = phi <4 x i32> [ %116, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.22.0 = phi <4 x i32> [ %115, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.18.0 = phi <4 x i32> [ %114, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.14.0 = phi <4 x i32> [ %113, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.10.0 = phi <4 x i32> [ %112, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.6.0 = phi <4 x i32> [ %111, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.0.0 = phi <4 x i32> [ %110, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %iteration.0105 = phi i32 [ %inc46, %for.cond30.preheader ], [ 0, %entry ]
  %110 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %8, i32 %9, <4 x i32> %sums.sroa.0.0), !call_argsrelate !27
  %111 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %12, i32 %13, <4 x i32> %sums.sroa.6.0), !call_argsrelate !27
  %112 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %16, i32 %17, <4 x i32> %sums.sroa.10.0), !call_argsrelate !27
  %113 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %20, i32 %21, <4 x i32> %sums.sroa.14.0), !call_argsrelate !27
  %114 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %24, i32 %25, <4 x i32> %sums.sroa.18.0), !call_argsrelate !27
  %115 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %28, i32 %29, <4 x i32> %sums.sroa.22.0), !call_argsrelate !27
  %116 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %32, i32 %33, <4 x i32> %sums.sroa.26.0), !call_argsrelate !27
  %117 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %36, i32 %37, <4 x i32> %sums.sroa.30.0), !call_argsrelate !27
  %118 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %40, i32 %41, <4 x i32> %sums.sroa.34.0), !call_argsrelate !27
  %119 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %44, i32 %45, <4 x i32> %sums.sroa.38.0), !call_argsrelate !27
  %120 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %48, i32 %49, <4 x i32> %sums.sroa.42.0), !call_argsrelate !27
  %121 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %52, i32 %53, <4 x i32> %sums.sroa.46.0), !call_argsrelate !27
  %122 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %56, i32 %57, <4 x i32> %sums.sroa.50.0), !call_argsrelate !27
  %123 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %60, i32 %61, <4 x i32> %sums.sroa.54.0), !call_argsrelate !27
  %124 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %64, i32 %65, <4 x i32> %sums.sroa.58.0), !call_argsrelate !27
  %125 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %68, i32 %69, <4 x i32> %sums.sroa.62.0), !call_argsrelate !27
  %126 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %72, i32 %73, <4 x i32> %sums.sroa.66.0), !call_argsrelate !27
  %127 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %76, i32 %77, <4 x i32> %sums.sroa.70.0), !call_argsrelate !27
  %128 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %80, i32 %81, <4 x i32> %sums.sroa.74.0), !call_argsrelate !27
  %129 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %84, i32 %85, <4 x i32> %sums.sroa.78.0), !call_argsrelate !27
  %130 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %88, i32 %89, <4 x i32> %sums.sroa.82.0), !call_argsrelate !27
  %131 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %92, i32 %93, <4 x i32> %sums.sroa.86.0), !call_argsrelate !27
  %132 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %96, i32 %97, <4 x i32> %sums.sroa.90.0), !call_argsrelate !27
  %133 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %100, i32 %101, <4 x i32> %sums.sroa.94.0), !call_argsrelate !27
  %134 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %104, i32 %105, <4 x i32> %sums.sroa.98.0), !call_argsrelate !27
  %135 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %108, i32 %109, <4 x i32> %sums.sroa.102.0), !call_argsrelate !27
  %inc46 = add nuw nsw i32 %iteration.0105, 1
  %exitcond.not = icmp eq i32 %inc46, %iterations
  br i1 %exitcond.not, label %for.cond49.preheader, label %for.cond30.preheader, !llvm.loop !43

for.cond49.preheader:                             ; preds = %for.cond30.preheader, %entry
  %sums.sroa.102.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %135, %for.cond30.preheader ]
  %sums.sroa.98.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %134, %for.cond30.preheader ]
  %sums.sroa.94.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %133, %for.cond30.preheader ]
  %sums.sroa.90.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %132, %for.cond30.preheader ]
  %sums.sroa.86.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %131, %for.cond30.preheader ]
  %sums.sroa.82.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %130, %for.cond30.preheader ]
  %sums.sroa.78.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %129, %for.cond30.preheader ]
  %sums.sroa.74.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %128, %for.cond30.preheader ]
  %sums.sroa.70.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %127, %for.cond30.preheader ]
  %sums.sroa.66.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %126, %for.cond30.preheader ]
  %sums.sroa.62.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %125, %for.cond30.preheader ]
  %sums.sroa.58.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %124, %for.cond30.preheader ]
  %sums.sroa.54.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %123, %for.cond30.preheader ]
  %sums.sroa.50.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %122, %for.cond30.preheader ]
  %sums.sroa.46.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %121, %for.cond30.preheader ]
  %sums.sroa.42.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %120, %for.cond30.preheader ]
  %sums.sroa.38.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %119, %for.cond30.preheader ]
  %sums.sroa.34.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %118, %for.cond30.preheader ]
  %sums.sroa.30.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %117, %for.cond30.preheader ]
  %sums.sroa.26.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %116, %for.cond30.preheader ]
  %sums.sroa.22.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %115, %for.cond30.preheader ]
  %sums.sroa.18.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %114, %for.cond30.preheader ]
  %sums.sroa.14.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %113, %for.cond30.preheader ]
  %sums.sroa.10.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %112, %for.cond30.preheader ]
  %sums.sroa.6.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %111, %for.cond30.preheader ]
  %sums.sroa.0.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %110, %for.cond30.preheader ]
  %136 = lshr i16 %3, 6
  %conv7 = zext nneg i16 %136 to i64
  %137 = tail call noundef range(i32 0, 2147483647) i32 @llvm.mxc.block.id.x(), !range !15
  %conv = zext nneg i32 %137 to i64
  %mul = mul nuw nsw i64 %conv7, %conv
  %div9100 = lshr i32 %0, 6
  %conv10 = zext nneg i32 %div9100 to i64
  %add = add nuw nsw i64 %mul, %conv10
  %conv70 = zext nneg i32 %rem11 to i64
  %mul56 = mul nuw nsw i64 %add, 6656
  %vecext = extractelement <4 x i32> %sums.sroa.0.1, i64 0
  %138 = shl nuw nsw i64 %6, 4
  %add69 = or disjoint i64 %mul56, %138
  %add71 = or disjoint i64 %add69, %conv70
  %arrayidx72 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71
  store i32 %vecext, ptr addrspace(1) %arrayidx72, align 4, !tbaa !16
  %vecext.1 = extractelement <4 x i32> %sums.sroa.0.1, i64 1
  %139 = shl nuw nsw i64 %6, 4
  %140 = or disjoint i64 %139, 16
  %add69.1 = or disjoint i64 %mul56, %140
  %add71.1 = or disjoint i64 %add69.1, %conv70
  %arrayidx72.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1
  store i32 %vecext.1, ptr addrspace(1) %arrayidx72.1, align 4, !tbaa !16
  %vecext.2 = extractelement <4 x i32> %sums.sroa.0.1, i64 2
  %141 = shl nuw nsw i64 %6, 4
  %142 = or disjoint i64 %141, 32
  %add69.2 = or disjoint i64 %mul56, %142
  %add71.2 = or disjoint i64 %add69.2, %conv70
  %arrayidx72.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2
  store i32 %vecext.2, ptr addrspace(1) %arrayidx72.2, align 4, !tbaa !16
  %vecext.3 = extractelement <4 x i32> %sums.sroa.0.1, i64 3
  %143 = shl nuw nsw i64 %6, 4
  %144 = or disjoint i64 %143, 48
  %add69.3 = or disjoint i64 %mul56, %144
  %add71.3 = or disjoint i64 %add69.3, %conv70
  %arrayidx72.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3
  store i32 %vecext.3, ptr addrspace(1) %arrayidx72.3, align 4, !tbaa !16
  %add55.1 = mul nuw nsw i64 %add, 6656
  %mul56.1 = or disjoint i64 %add55.1, 256
  %vecext.1118 = extractelement <4 x i32> %sums.sroa.6.1, i64 0
  %add69.1119 = or disjoint i64 %mul56.1, %138
  %add71.1120 = or disjoint i64 %add69.1119, %conv70
  %arrayidx72.1121 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1120
  store i32 %vecext.1118, ptr addrspace(1) %arrayidx72.1121, align 4, !tbaa !16
  %vecext.1.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 1
  %add69.1.1 = or disjoint i64 %mul56.1, %140
  %add71.1.1 = or disjoint i64 %add69.1.1, %conv70
  %arrayidx72.1.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.1
  store i32 %vecext.1.1, ptr addrspace(1) %arrayidx72.1.1, align 4, !tbaa !16
  %vecext.2.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 2
  %add69.2.1 = or disjoint i64 %mul56.1, %142
  %add71.2.1 = or disjoint i64 %add69.2.1, %conv70
  %arrayidx72.2.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.1
  store i32 %vecext.2.1, ptr addrspace(1) %arrayidx72.2.1, align 4, !tbaa !16
  %vecext.3.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 3
  %add69.3.1 = or disjoint i64 %mul56.1, %144
  %add71.3.1 = or disjoint i64 %add69.3.1, %conv70
  %arrayidx72.3.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.1
  store i32 %vecext.3.1, ptr addrspace(1) %arrayidx72.3.1, align 4, !tbaa !16
  %add55.2 = mul nuw nsw i64 %add, 6656
  %mul56.2 = add nuw nsw i64 %add55.2, 512
  %vecext.2122 = extractelement <4 x i32> %sums.sroa.10.1, i64 0
  %add69.2123 = or disjoint i64 %mul56.2, %138
  %add71.2124 = or disjoint i64 %add69.2123, %conv70
  %arrayidx72.2125 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2124
  store i32 %vecext.2122, ptr addrspace(1) %arrayidx72.2125, align 4, !tbaa !16
  %vecext.1.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 1
  %add69.1.2 = or disjoint i64 %mul56.2, %140
  %add71.1.2 = or disjoint i64 %add69.1.2, %conv70
  %arrayidx72.1.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.2
  store i32 %vecext.1.2, ptr addrspace(1) %arrayidx72.1.2, align 4, !tbaa !16
  %vecext.2.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 2
  %add69.2.2 = or disjoint i64 %mul56.2, %142
  %add71.2.2 = or disjoint i64 %add69.2.2, %conv70
  %arrayidx72.2.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.2
  store i32 %vecext.2.2, ptr addrspace(1) %arrayidx72.2.2, align 4, !tbaa !16
  %vecext.3.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 3
  %add69.3.2 = or disjoint i64 %mul56.2, %144
  %add71.3.2 = or disjoint i64 %add69.3.2, %conv70
  %arrayidx72.3.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.2
  store i32 %vecext.3.2, ptr addrspace(1) %arrayidx72.3.2, align 4, !tbaa !16
  %add55.3 = mul nuw nsw i64 %add, 6656
  %mul56.3 = add nuw nsw i64 %add55.3, 768
  %vecext.3126 = extractelement <4 x i32> %sums.sroa.14.1, i64 0
  %add69.3127 = or disjoint i64 %mul56.3, %138
  %add71.3128 = or disjoint i64 %add69.3127, %conv70
  %arrayidx72.3129 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3128
  store i32 %vecext.3126, ptr addrspace(1) %arrayidx72.3129, align 4, !tbaa !16
  %vecext.1.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 1
  %add69.1.3 = or disjoint i64 %mul56.3, %140
  %add71.1.3 = or disjoint i64 %add69.1.3, %conv70
  %arrayidx72.1.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.3
  store i32 %vecext.1.3, ptr addrspace(1) %arrayidx72.1.3, align 4, !tbaa !16
  %vecext.2.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 2
  %add69.2.3 = or disjoint i64 %mul56.3, %142
  %add71.2.3 = or disjoint i64 %add69.2.3, %conv70
  %arrayidx72.2.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.3
  store i32 %vecext.2.3, ptr addrspace(1) %arrayidx72.2.3, align 4, !tbaa !16
  %vecext.3.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 3
  %add69.3.3 = or disjoint i64 %mul56.3, %144
  %add71.3.3 = or disjoint i64 %add69.3.3, %conv70
  %arrayidx72.3.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.3
  store i32 %vecext.3.3, ptr addrspace(1) %arrayidx72.3.3, align 4, !tbaa !16
  %add55.4 = mul nuw nsw i64 %add, 6656
  %mul56.4 = add nuw nsw i64 %add55.4, 1024
  %vecext.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 0
  %add69.4 = or disjoint i64 %mul56.4, %138
  %add71.4 = or disjoint i64 %add69.4, %conv70
  %arrayidx72.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.4
  store i32 %vecext.4, ptr addrspace(1) %arrayidx72.4, align 4, !tbaa !16
  %vecext.1.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 1
  %add69.1.4 = or disjoint i64 %mul56.4, %140
  %add71.1.4 = or disjoint i64 %add69.1.4, %conv70
  %arrayidx72.1.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.4
  store i32 %vecext.1.4, ptr addrspace(1) %arrayidx72.1.4, align 4, !tbaa !16
  %vecext.2.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 2
  %add69.2.4 = or disjoint i64 %mul56.4, %142
  %add71.2.4 = or disjoint i64 %add69.2.4, %conv70
  %arrayidx72.2.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.4
  store i32 %vecext.2.4, ptr addrspace(1) %arrayidx72.2.4, align 4, !tbaa !16
  %vecext.3.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 3
  %add69.3.4 = or disjoint i64 %mul56.4, %144
  %add71.3.4 = or disjoint i64 %add69.3.4, %conv70
  %arrayidx72.3.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.4
  store i32 %vecext.3.4, ptr addrspace(1) %arrayidx72.3.4, align 4, !tbaa !16
  %add55.5 = mul nuw nsw i64 %add, 6656
  %mul56.5 = add nuw nsw i64 %add55.5, 1280
  %vecext.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 0
  %add69.5 = or disjoint i64 %mul56.5, %138
  %add71.5 = or disjoint i64 %add69.5, %conv70
  %arrayidx72.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.5
  store i32 %vecext.5, ptr addrspace(1) %arrayidx72.5, align 4, !tbaa !16
  %vecext.1.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 1
  %add69.1.5 = or disjoint i64 %mul56.5, %140
  %add71.1.5 = or disjoint i64 %add69.1.5, %conv70
  %arrayidx72.1.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.5
  store i32 %vecext.1.5, ptr addrspace(1) %arrayidx72.1.5, align 4, !tbaa !16
  %vecext.2.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 2
  %add69.2.5 = or disjoint i64 %mul56.5, %142
  %add71.2.5 = or disjoint i64 %add69.2.5, %conv70
  %arrayidx72.2.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.5
  store i32 %vecext.2.5, ptr addrspace(1) %arrayidx72.2.5, align 4, !tbaa !16
  %vecext.3.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 3
  %add69.3.5 = or disjoint i64 %mul56.5, %144
  %add71.3.5 = or disjoint i64 %add69.3.5, %conv70
  %arrayidx72.3.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.5
  store i32 %vecext.3.5, ptr addrspace(1) %arrayidx72.3.5, align 4, !tbaa !16
  %add55.6 = mul nuw nsw i64 %add, 6656
  %mul56.6 = add nuw nsw i64 %add55.6, 1536
  %vecext.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 0
  %add69.6 = or disjoint i64 %mul56.6, %138
  %add71.6 = or disjoint i64 %add69.6, %conv70
  %arrayidx72.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.6
  store i32 %vecext.6, ptr addrspace(1) %arrayidx72.6, align 4, !tbaa !16
  %vecext.1.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 1
  %add69.1.6 = or disjoint i64 %mul56.6, %140
  %add71.1.6 = or disjoint i64 %add69.1.6, %conv70
  %arrayidx72.1.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.6
  store i32 %vecext.1.6, ptr addrspace(1) %arrayidx72.1.6, align 4, !tbaa !16
  %vecext.2.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 2
  %add69.2.6 = or disjoint i64 %mul56.6, %142
  %add71.2.6 = or disjoint i64 %add69.2.6, %conv70
  %arrayidx72.2.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.6
  store i32 %vecext.2.6, ptr addrspace(1) %arrayidx72.2.6, align 4, !tbaa !16
  %vecext.3.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 3
  %add69.3.6 = or disjoint i64 %mul56.6, %144
  %add71.3.6 = or disjoint i64 %add69.3.6, %conv70
  %arrayidx72.3.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.6
  store i32 %vecext.3.6, ptr addrspace(1) %arrayidx72.3.6, align 4, !tbaa !16
  %add55.7 = mul nuw nsw i64 %add, 6656
  %mul56.7 = add nuw nsw i64 %add55.7, 1792
  %vecext.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 0
  %add69.7 = or disjoint i64 %mul56.7, %138
  %add71.7 = or disjoint i64 %add69.7, %conv70
  %arrayidx72.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.7
  store i32 %vecext.7, ptr addrspace(1) %arrayidx72.7, align 4, !tbaa !16
  %vecext.1.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 1
  %add69.1.7 = or disjoint i64 %mul56.7, %140
  %add71.1.7 = or disjoint i64 %add69.1.7, %conv70
  %arrayidx72.1.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.7
  store i32 %vecext.1.7, ptr addrspace(1) %arrayidx72.1.7, align 4, !tbaa !16
  %vecext.2.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 2
  %add69.2.7 = or disjoint i64 %mul56.7, %142
  %add71.2.7 = or disjoint i64 %add69.2.7, %conv70
  %arrayidx72.2.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.7
  store i32 %vecext.2.7, ptr addrspace(1) %arrayidx72.2.7, align 4, !tbaa !16
  %vecext.3.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 3
  %add69.3.7 = or disjoint i64 %mul56.7, %144
  %add71.3.7 = or disjoint i64 %add69.3.7, %conv70
  %arrayidx72.3.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.7
  store i32 %vecext.3.7, ptr addrspace(1) %arrayidx72.3.7, align 4, !tbaa !16
  %add55.8 = mul nuw nsw i64 %add, 6656
  %mul56.8 = add nuw nsw i64 %add55.8, 2048
  %vecext.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 0
  %add69.8 = or disjoint i64 %mul56.8, %138
  %add71.8 = or disjoint i64 %add69.8, %conv70
  %arrayidx72.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.8
  store i32 %vecext.8, ptr addrspace(1) %arrayidx72.8, align 4, !tbaa !16
  %vecext.1.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 1
  %add69.1.8 = or disjoint i64 %mul56.8, %140
  %add71.1.8 = or disjoint i64 %add69.1.8, %conv70
  %arrayidx72.1.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.8
  store i32 %vecext.1.8, ptr addrspace(1) %arrayidx72.1.8, align 4, !tbaa !16
  %vecext.2.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 2
  %add69.2.8 = or disjoint i64 %mul56.8, %142
  %add71.2.8 = or disjoint i64 %add69.2.8, %conv70
  %arrayidx72.2.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.8
  store i32 %vecext.2.8, ptr addrspace(1) %arrayidx72.2.8, align 4, !tbaa !16
  %vecext.3.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 3
  %add69.3.8 = or disjoint i64 %mul56.8, %144
  %add71.3.8 = or disjoint i64 %add69.3.8, %conv70
  %arrayidx72.3.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.8
  store i32 %vecext.3.8, ptr addrspace(1) %arrayidx72.3.8, align 4, !tbaa !16
  %add55.9 = mul nuw nsw i64 %add, 6656
  %mul56.9 = add nuw nsw i64 %add55.9, 2304
  %vecext.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 0
  %add69.9 = or disjoint i64 %mul56.9, %138
  %add71.9 = or disjoint i64 %add69.9, %conv70
  %arrayidx72.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.9
  store i32 %vecext.9, ptr addrspace(1) %arrayidx72.9, align 4, !tbaa !16
  %vecext.1.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 1
  %add69.1.9 = or disjoint i64 %mul56.9, %140
  %add71.1.9 = or disjoint i64 %add69.1.9, %conv70
  %arrayidx72.1.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.9
  store i32 %vecext.1.9, ptr addrspace(1) %arrayidx72.1.9, align 4, !tbaa !16
  %vecext.2.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 2
  %add69.2.9 = or disjoint i64 %mul56.9, %142
  %add71.2.9 = or disjoint i64 %add69.2.9, %conv70
  %arrayidx72.2.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.9
  store i32 %vecext.2.9, ptr addrspace(1) %arrayidx72.2.9, align 4, !tbaa !16
  %vecext.3.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 3
  %add69.3.9 = or disjoint i64 %mul56.9, %144
  %add71.3.9 = or disjoint i64 %add69.3.9, %conv70
  %arrayidx72.3.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.9
  store i32 %vecext.3.9, ptr addrspace(1) %arrayidx72.3.9, align 4, !tbaa !16
  %add55.10 = mul nuw nsw i64 %add, 6656
  %mul56.10 = add nuw nsw i64 %add55.10, 2560
  %vecext.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 0
  %add69.10 = or disjoint i64 %mul56.10, %138
  %add71.10 = or disjoint i64 %add69.10, %conv70
  %arrayidx72.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.10
  store i32 %vecext.10, ptr addrspace(1) %arrayidx72.10, align 4, !tbaa !16
  %vecext.1.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 1
  %add69.1.10 = or disjoint i64 %mul56.10, %140
  %add71.1.10 = or disjoint i64 %add69.1.10, %conv70
  %arrayidx72.1.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.10
  store i32 %vecext.1.10, ptr addrspace(1) %arrayidx72.1.10, align 4, !tbaa !16
  %vecext.2.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 2
  %add69.2.10 = or disjoint i64 %mul56.10, %142
  %add71.2.10 = or disjoint i64 %add69.2.10, %conv70
  %arrayidx72.2.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.10
  store i32 %vecext.2.10, ptr addrspace(1) %arrayidx72.2.10, align 4, !tbaa !16
  %vecext.3.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 3
  %add69.3.10 = or disjoint i64 %mul56.10, %144
  %add71.3.10 = or disjoint i64 %add69.3.10, %conv70
  %arrayidx72.3.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.10
  store i32 %vecext.3.10, ptr addrspace(1) %arrayidx72.3.10, align 4, !tbaa !16
  %add55.11 = mul nuw nsw i64 %add, 6656
  %mul56.11 = add nuw nsw i64 %add55.11, 2816
  %vecext.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 0
  %add69.11 = or disjoint i64 %mul56.11, %138
  %add71.11 = or disjoint i64 %add69.11, %conv70
  %arrayidx72.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.11
  store i32 %vecext.11, ptr addrspace(1) %arrayidx72.11, align 4, !tbaa !16
  %vecext.1.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 1
  %add69.1.11 = or disjoint i64 %mul56.11, %140
  %add71.1.11 = or disjoint i64 %add69.1.11, %conv70
  %arrayidx72.1.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.11
  store i32 %vecext.1.11, ptr addrspace(1) %arrayidx72.1.11, align 4, !tbaa !16
  %vecext.2.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 2
  %add69.2.11 = or disjoint i64 %mul56.11, %142
  %add71.2.11 = or disjoint i64 %add69.2.11, %conv70
  %arrayidx72.2.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.11
  store i32 %vecext.2.11, ptr addrspace(1) %arrayidx72.2.11, align 4, !tbaa !16
  %vecext.3.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 3
  %add69.3.11 = or disjoint i64 %mul56.11, %144
  %add71.3.11 = or disjoint i64 %add69.3.11, %conv70
  %arrayidx72.3.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.11
  store i32 %vecext.3.11, ptr addrspace(1) %arrayidx72.3.11, align 4, !tbaa !16
  %add55.12 = mul nuw nsw i64 %add, 6656
  %mul56.12 = add nuw nsw i64 %add55.12, 3072
  %vecext.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 0
  %add69.12 = or disjoint i64 %mul56.12, %138
  %add71.12 = or disjoint i64 %add69.12, %conv70
  %arrayidx72.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.12
  store i32 %vecext.12, ptr addrspace(1) %arrayidx72.12, align 4, !tbaa !16
  %vecext.1.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 1
  %add69.1.12 = or disjoint i64 %mul56.12, %140
  %add71.1.12 = or disjoint i64 %add69.1.12, %conv70
  %arrayidx72.1.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.12
  store i32 %vecext.1.12, ptr addrspace(1) %arrayidx72.1.12, align 4, !tbaa !16
  %vecext.2.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 2
  %add69.2.12 = or disjoint i64 %mul56.12, %142
  %add71.2.12 = or disjoint i64 %add69.2.12, %conv70
  %arrayidx72.2.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.12
  store i32 %vecext.2.12, ptr addrspace(1) %arrayidx72.2.12, align 4, !tbaa !16
  %vecext.3.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 3
  %add69.3.12 = or disjoint i64 %mul56.12, %144
  %add71.3.12 = or disjoint i64 %add69.3.12, %conv70
  %arrayidx72.3.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.12
  store i32 %vecext.3.12, ptr addrspace(1) %arrayidx72.3.12, align 4, !tbaa !16
  %add55.13 = mul nuw nsw i64 %add, 6656
  %mul56.13 = add nuw nsw i64 %add55.13, 3328
  %vecext.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 0
  %add69.13 = or disjoint i64 %mul56.13, %138
  %add71.13 = or disjoint i64 %add69.13, %conv70
  %arrayidx72.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.13
  store i32 %vecext.13, ptr addrspace(1) %arrayidx72.13, align 4, !tbaa !16
  %vecext.1.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 1
  %add69.1.13 = or disjoint i64 %mul56.13, %140
  %add71.1.13 = or disjoint i64 %add69.1.13, %conv70
  %arrayidx72.1.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.13
  store i32 %vecext.1.13, ptr addrspace(1) %arrayidx72.1.13, align 4, !tbaa !16
  %vecext.2.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 2
  %add69.2.13 = or disjoint i64 %mul56.13, %142
  %add71.2.13 = or disjoint i64 %add69.2.13, %conv70
  %arrayidx72.2.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.13
  store i32 %vecext.2.13, ptr addrspace(1) %arrayidx72.2.13, align 4, !tbaa !16
  %vecext.3.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 3
  %add69.3.13 = or disjoint i64 %mul56.13, %144
  %add71.3.13 = or disjoint i64 %add69.3.13, %conv70
  %arrayidx72.3.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.13
  store i32 %vecext.3.13, ptr addrspace(1) %arrayidx72.3.13, align 4, !tbaa !16
  %add55.14 = mul nuw nsw i64 %add, 6656
  %mul56.14 = add nuw nsw i64 %add55.14, 3584
  %vecext.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 0
  %add69.14 = or disjoint i64 %mul56.14, %138
  %add71.14 = or disjoint i64 %add69.14, %conv70
  %arrayidx72.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.14
  store i32 %vecext.14, ptr addrspace(1) %arrayidx72.14, align 4, !tbaa !16
  %vecext.1.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 1
  %add69.1.14 = or disjoint i64 %mul56.14, %140
  %add71.1.14 = or disjoint i64 %add69.1.14, %conv70
  %arrayidx72.1.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.14
  store i32 %vecext.1.14, ptr addrspace(1) %arrayidx72.1.14, align 4, !tbaa !16
  %vecext.2.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 2
  %add69.2.14 = or disjoint i64 %mul56.14, %142
  %add71.2.14 = or disjoint i64 %add69.2.14, %conv70
  %arrayidx72.2.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.14
  store i32 %vecext.2.14, ptr addrspace(1) %arrayidx72.2.14, align 4, !tbaa !16
  %vecext.3.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 3
  %add69.3.14 = or disjoint i64 %mul56.14, %144
  %add71.3.14 = or disjoint i64 %add69.3.14, %conv70
  %arrayidx72.3.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.14
  store i32 %vecext.3.14, ptr addrspace(1) %arrayidx72.3.14, align 4, !tbaa !16
  %add55.15 = mul nuw nsw i64 %add, 6656
  %mul56.15 = add nuw nsw i64 %add55.15, 3840
  %vecext.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 0
  %add69.15 = or disjoint i64 %mul56.15, %138
  %add71.15 = or disjoint i64 %add69.15, %conv70
  %arrayidx72.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.15
  store i32 %vecext.15, ptr addrspace(1) %arrayidx72.15, align 4, !tbaa !16
  %vecext.1.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 1
  %add69.1.15 = or disjoint i64 %mul56.15, %140
  %add71.1.15 = or disjoint i64 %add69.1.15, %conv70
  %arrayidx72.1.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.15
  store i32 %vecext.1.15, ptr addrspace(1) %arrayidx72.1.15, align 4, !tbaa !16
  %vecext.2.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 2
  %add69.2.15 = or disjoint i64 %mul56.15, %142
  %add71.2.15 = or disjoint i64 %add69.2.15, %conv70
  %arrayidx72.2.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.15
  store i32 %vecext.2.15, ptr addrspace(1) %arrayidx72.2.15, align 4, !tbaa !16
  %vecext.3.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 3
  %add69.3.15 = or disjoint i64 %mul56.15, %144
  %add71.3.15 = or disjoint i64 %add69.3.15, %conv70
  %arrayidx72.3.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.15
  store i32 %vecext.3.15, ptr addrspace(1) %arrayidx72.3.15, align 4, !tbaa !16
  %add55.16 = mul nuw nsw i64 %add, 6656
  %mul56.16 = add nuw nsw i64 %add55.16, 4096
  %vecext.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 0
  %add69.16 = or disjoint i64 %mul56.16, %138
  %add71.16 = or disjoint i64 %add69.16, %conv70
  %arrayidx72.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.16
  store i32 %vecext.16, ptr addrspace(1) %arrayidx72.16, align 4, !tbaa !16
  %vecext.1.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 1
  %add69.1.16 = or disjoint i64 %mul56.16, %140
  %add71.1.16 = or disjoint i64 %add69.1.16, %conv70
  %arrayidx72.1.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.16
  store i32 %vecext.1.16, ptr addrspace(1) %arrayidx72.1.16, align 4, !tbaa !16
  %vecext.2.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 2
  %add69.2.16 = or disjoint i64 %mul56.16, %142
  %add71.2.16 = or disjoint i64 %add69.2.16, %conv70
  %arrayidx72.2.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.16
  store i32 %vecext.2.16, ptr addrspace(1) %arrayidx72.2.16, align 4, !tbaa !16
  %vecext.3.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 3
  %add69.3.16 = or disjoint i64 %mul56.16, %144
  %add71.3.16 = or disjoint i64 %add69.3.16, %conv70
  %arrayidx72.3.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.16
  store i32 %vecext.3.16, ptr addrspace(1) %arrayidx72.3.16, align 4, !tbaa !16
  %add55.17 = mul nuw nsw i64 %add, 6656
  %mul56.17 = add nuw nsw i64 %add55.17, 4352
  %vecext.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 0
  %add69.17 = or disjoint i64 %mul56.17, %138
  %add71.17 = or disjoint i64 %add69.17, %conv70
  %arrayidx72.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.17
  store i32 %vecext.17, ptr addrspace(1) %arrayidx72.17, align 4, !tbaa !16
  %vecext.1.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 1
  %add69.1.17 = or disjoint i64 %mul56.17, %140
  %add71.1.17 = or disjoint i64 %add69.1.17, %conv70
  %arrayidx72.1.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.17
  store i32 %vecext.1.17, ptr addrspace(1) %arrayidx72.1.17, align 4, !tbaa !16
  %vecext.2.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 2
  %add69.2.17 = or disjoint i64 %mul56.17, %142
  %add71.2.17 = or disjoint i64 %add69.2.17, %conv70
  %arrayidx72.2.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.17
  store i32 %vecext.2.17, ptr addrspace(1) %arrayidx72.2.17, align 4, !tbaa !16
  %vecext.3.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 3
  %add69.3.17 = or disjoint i64 %mul56.17, %144
  %add71.3.17 = or disjoint i64 %add69.3.17, %conv70
  %arrayidx72.3.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.17
  store i32 %vecext.3.17, ptr addrspace(1) %arrayidx72.3.17, align 4, !tbaa !16
  %add55.18 = mul nuw nsw i64 %add, 6656
  %mul56.18 = add nuw nsw i64 %add55.18, 4608
  %vecext.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 0
  %add69.18 = or disjoint i64 %mul56.18, %138
  %add71.18 = or disjoint i64 %add69.18, %conv70
  %arrayidx72.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.18
  store i32 %vecext.18, ptr addrspace(1) %arrayidx72.18, align 4, !tbaa !16
  %vecext.1.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 1
  %add69.1.18 = or disjoint i64 %mul56.18, %140
  %add71.1.18 = or disjoint i64 %add69.1.18, %conv70
  %arrayidx72.1.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.18
  store i32 %vecext.1.18, ptr addrspace(1) %arrayidx72.1.18, align 4, !tbaa !16
  %vecext.2.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 2
  %add69.2.18 = or disjoint i64 %mul56.18, %142
  %add71.2.18 = or disjoint i64 %add69.2.18, %conv70
  %arrayidx72.2.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.18
  store i32 %vecext.2.18, ptr addrspace(1) %arrayidx72.2.18, align 4, !tbaa !16
  %vecext.3.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 3
  %add69.3.18 = or disjoint i64 %mul56.18, %144
  %add71.3.18 = or disjoint i64 %add69.3.18, %conv70
  %arrayidx72.3.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.18
  store i32 %vecext.3.18, ptr addrspace(1) %arrayidx72.3.18, align 4, !tbaa !16
  %add55.19 = mul nuw nsw i64 %add, 6656
  %mul56.19 = add nuw nsw i64 %add55.19, 4864
  %vecext.19 = extractelement <4 x i32> %sums.sroa.78.1, i64 0
  %add69.19 = or disjoint i64 %mul56.19, %138
  %add71.19 = or disjoint i64 %add69.19, %conv70
  %arrayidx72.19 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.19
  store i32 %vecext.19, ptr addrspace(1) %arrayidx72.19, align 4, !tbaa !16
  %vecext.1.19 = extractelement <4 x i32> %sums.sroa.78.1, i64 1
  %add69.1.19 = or disjoint i64 %mul56.19, %140
  %add71.1.19 = or disjoint i64 %add69.1.19, %conv70
  %arrayidx72.1.19 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.19
  store i32 %vecext.1.19, ptr addrspace(1) %arrayidx72.1.19, align 4, !tbaa !16
  %vecext.2.19 = extractelement <4 x i32> %sums.sroa.78.1, i64 2
  %add69.2.19 = or disjoint i64 %mul56.19, %142
  %add71.2.19 = or disjoint i64 %add69.2.19, %conv70
  %arrayidx72.2.19 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.19
  store i32 %vecext.2.19, ptr addrspace(1) %arrayidx72.2.19, align 4, !tbaa !16
  %vecext.3.19 = extractelement <4 x i32> %sums.sroa.78.1, i64 3
  %add69.3.19 = or disjoint i64 %mul56.19, %144
  %add71.3.19 = or disjoint i64 %add69.3.19, %conv70
  %arrayidx72.3.19 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.19
  store i32 %vecext.3.19, ptr addrspace(1) %arrayidx72.3.19, align 4, !tbaa !16
  %add55.20 = mul nuw nsw i64 %add, 6656
  %mul56.20 = add nuw nsw i64 %add55.20, 5120
  %vecext.20 = extractelement <4 x i32> %sums.sroa.82.1, i64 0
  %add69.20 = or disjoint i64 %mul56.20, %138
  %add71.20 = or disjoint i64 %add69.20, %conv70
  %arrayidx72.20 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.20
  store i32 %vecext.20, ptr addrspace(1) %arrayidx72.20, align 4, !tbaa !16
  %vecext.1.20 = extractelement <4 x i32> %sums.sroa.82.1, i64 1
  %add69.1.20 = or disjoint i64 %mul56.20, %140
  %add71.1.20 = or disjoint i64 %add69.1.20, %conv70
  %arrayidx72.1.20 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.20
  store i32 %vecext.1.20, ptr addrspace(1) %arrayidx72.1.20, align 4, !tbaa !16
  %vecext.2.20 = extractelement <4 x i32> %sums.sroa.82.1, i64 2
  %add69.2.20 = or disjoint i64 %mul56.20, %142
  %add71.2.20 = or disjoint i64 %add69.2.20, %conv70
  %arrayidx72.2.20 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.20
  store i32 %vecext.2.20, ptr addrspace(1) %arrayidx72.2.20, align 4, !tbaa !16
  %vecext.3.20 = extractelement <4 x i32> %sums.sroa.82.1, i64 3
  %add69.3.20 = or disjoint i64 %mul56.20, %144
  %add71.3.20 = or disjoint i64 %add69.3.20, %conv70
  %arrayidx72.3.20 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.20
  store i32 %vecext.3.20, ptr addrspace(1) %arrayidx72.3.20, align 4, !tbaa !16
  %add55.21 = mul nuw nsw i64 %add, 6656
  %mul56.21 = add nuw nsw i64 %add55.21, 5376
  %vecext.21 = extractelement <4 x i32> %sums.sroa.86.1, i64 0
  %add69.21 = or disjoint i64 %mul56.21, %138
  %add71.21 = or disjoint i64 %add69.21, %conv70
  %arrayidx72.21 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.21
  store i32 %vecext.21, ptr addrspace(1) %arrayidx72.21, align 4, !tbaa !16
  %vecext.1.21 = extractelement <4 x i32> %sums.sroa.86.1, i64 1
  %add69.1.21 = or disjoint i64 %mul56.21, %140
  %add71.1.21 = or disjoint i64 %add69.1.21, %conv70
  %arrayidx72.1.21 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.21
  store i32 %vecext.1.21, ptr addrspace(1) %arrayidx72.1.21, align 4, !tbaa !16
  %vecext.2.21 = extractelement <4 x i32> %sums.sroa.86.1, i64 2
  %add69.2.21 = or disjoint i64 %mul56.21, %142
  %add71.2.21 = or disjoint i64 %add69.2.21, %conv70
  %arrayidx72.2.21 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.21
  store i32 %vecext.2.21, ptr addrspace(1) %arrayidx72.2.21, align 4, !tbaa !16
  %vecext.3.21 = extractelement <4 x i32> %sums.sroa.86.1, i64 3
  %add69.3.21 = or disjoint i64 %mul56.21, %144
  %add71.3.21 = or disjoint i64 %add69.3.21, %conv70
  %arrayidx72.3.21 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.21
  store i32 %vecext.3.21, ptr addrspace(1) %arrayidx72.3.21, align 4, !tbaa !16
  %add55.22 = mul nuw nsw i64 %add, 6656
  %mul56.22 = add nuw nsw i64 %add55.22, 5632
  %vecext.22 = extractelement <4 x i32> %sums.sroa.90.1, i64 0
  %add69.22 = or disjoint i64 %mul56.22, %138
  %add71.22 = or disjoint i64 %add69.22, %conv70
  %arrayidx72.22 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.22
  store i32 %vecext.22, ptr addrspace(1) %arrayidx72.22, align 4, !tbaa !16
  %vecext.1.22 = extractelement <4 x i32> %sums.sroa.90.1, i64 1
  %add69.1.22 = or disjoint i64 %mul56.22, %140
  %add71.1.22 = or disjoint i64 %add69.1.22, %conv70
  %arrayidx72.1.22 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.22
  store i32 %vecext.1.22, ptr addrspace(1) %arrayidx72.1.22, align 4, !tbaa !16
  %vecext.2.22 = extractelement <4 x i32> %sums.sroa.90.1, i64 2
  %add69.2.22 = or disjoint i64 %mul56.22, %142
  %add71.2.22 = or disjoint i64 %add69.2.22, %conv70
  %arrayidx72.2.22 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.22
  store i32 %vecext.2.22, ptr addrspace(1) %arrayidx72.2.22, align 4, !tbaa !16
  %vecext.3.22 = extractelement <4 x i32> %sums.sroa.90.1, i64 3
  %add69.3.22 = or disjoint i64 %mul56.22, %144
  %add71.3.22 = or disjoint i64 %add69.3.22, %conv70
  %arrayidx72.3.22 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.22
  store i32 %vecext.3.22, ptr addrspace(1) %arrayidx72.3.22, align 4, !tbaa !16
  %add55.23 = mul nuw nsw i64 %add, 6656
  %mul56.23 = add nuw nsw i64 %add55.23, 5888
  %vecext.23 = extractelement <4 x i32> %sums.sroa.94.1, i64 0
  %add69.23 = or disjoint i64 %mul56.23, %138
  %add71.23 = or disjoint i64 %add69.23, %conv70
  %arrayidx72.23 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.23
  store i32 %vecext.23, ptr addrspace(1) %arrayidx72.23, align 4, !tbaa !16
  %vecext.1.23 = extractelement <4 x i32> %sums.sroa.94.1, i64 1
  %add69.1.23 = or disjoint i64 %mul56.23, %140
  %add71.1.23 = or disjoint i64 %add69.1.23, %conv70
  %arrayidx72.1.23 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.23
  store i32 %vecext.1.23, ptr addrspace(1) %arrayidx72.1.23, align 4, !tbaa !16
  %vecext.2.23 = extractelement <4 x i32> %sums.sroa.94.1, i64 2
  %add69.2.23 = or disjoint i64 %mul56.23, %142
  %add71.2.23 = or disjoint i64 %add69.2.23, %conv70
  %arrayidx72.2.23 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.23
  store i32 %vecext.2.23, ptr addrspace(1) %arrayidx72.2.23, align 4, !tbaa !16
  %vecext.3.23 = extractelement <4 x i32> %sums.sroa.94.1, i64 3
  %add69.3.23 = or disjoint i64 %mul56.23, %144
  %add71.3.23 = or disjoint i64 %add69.3.23, %conv70
  %arrayidx72.3.23 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.23
  store i32 %vecext.3.23, ptr addrspace(1) %arrayidx72.3.23, align 4, !tbaa !16
  %add55.24 = mul nuw nsw i64 %add, 6656
  %mul56.24 = add nuw nsw i64 %add55.24, 6144
  %vecext.24 = extractelement <4 x i32> %sums.sroa.98.1, i64 0
  %add69.24 = or disjoint i64 %mul56.24, %138
  %add71.24 = or disjoint i64 %add69.24, %conv70
  %arrayidx72.24 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.24
  store i32 %vecext.24, ptr addrspace(1) %arrayidx72.24, align 4, !tbaa !16
  %vecext.1.24 = extractelement <4 x i32> %sums.sroa.98.1, i64 1
  %add69.1.24 = or disjoint i64 %mul56.24, %140
  %add71.1.24 = or disjoint i64 %add69.1.24, %conv70
  %arrayidx72.1.24 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.24
  store i32 %vecext.1.24, ptr addrspace(1) %arrayidx72.1.24, align 4, !tbaa !16
  %vecext.2.24 = extractelement <4 x i32> %sums.sroa.98.1, i64 2
  %add69.2.24 = or disjoint i64 %mul56.24, %142
  %add71.2.24 = or disjoint i64 %add69.2.24, %conv70
  %arrayidx72.2.24 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.24
  store i32 %vecext.2.24, ptr addrspace(1) %arrayidx72.2.24, align 4, !tbaa !16
  %vecext.3.24 = extractelement <4 x i32> %sums.sroa.98.1, i64 3
  %add69.3.24 = or disjoint i64 %mul56.24, %144
  %add71.3.24 = or disjoint i64 %add69.3.24, %conv70
  %arrayidx72.3.24 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.24
  store i32 %vecext.3.24, ptr addrspace(1) %arrayidx72.3.24, align 4, !tbaa !16
  %add55.25 = mul nuw nsw i64 %add, 6656
  %mul56.25 = add nuw nsw i64 %add55.25, 6400
  %vecext.25 = extractelement <4 x i32> %sums.sroa.102.1, i64 0
  %add69.25 = or disjoint i64 %mul56.25, %138
  %add71.25 = or disjoint i64 %add69.25, %conv70
  %arrayidx72.25 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.25
  store i32 %vecext.25, ptr addrspace(1) %arrayidx72.25, align 4, !tbaa !16
  %vecext.1.25 = extractelement <4 x i32> %sums.sroa.102.1, i64 1
  %add69.1.25 = or disjoint i64 %mul56.25, %140
  %add71.1.25 = or disjoint i64 %add69.1.25, %conv70
  %arrayidx72.1.25 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.25
  store i32 %vecext.1.25, ptr addrspace(1) %arrayidx72.1.25, align 4, !tbaa !16
  %vecext.2.25 = extractelement <4 x i32> %sums.sroa.102.1, i64 2
  %add69.2.25 = or disjoint i64 %mul56.25, %142
  %add71.2.25 = or disjoint i64 %add69.2.25, %conv70
  %arrayidx72.2.25 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.25
  store i32 %vecext.2.25, ptr addrspace(1) %arrayidx72.2.25, align 4, !tbaa !16
  %vecext.3.25 = extractelement <4 x i32> %sums.sroa.102.1, i64 3
  %add69.3.25 = or disjoint i64 %mul56.25, %144
  %add71.3.25 = or disjoint i64 %add69.3.25, %conv70
  %arrayidx72.3.25 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.25
  store i32 %vecext.3.25, ptr addrspace(1) %arrayidx72.3.25, align 4, !tbaa !16
  ret void
}

; Function Attrs: convergent mustprogress nofree norecurse nounwind memory(argmem: readwrite)
define protected metaxgpu_kernel void @_Z13mmaPeakKernelILi27EEvPKaS1_Pii(ptr addrspace(1) noalias nocapture noundef readonly %a.coerce, ptr addrspace(1) noalias nocapture noundef readonly %b.coerce, ptr addrspace(1) noalias noundef writeonly %c.coerce, i32 noundef %iterations) local_unnamed_addr #3 comdat {
entry:
  %0 = tail call noundef range(i32 0, 1024) i32 @llvm.mxc.thread.id.x(), !range !25
  %1 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.mxc.dispatch.ptr()
  %2 = getelementptr inbounds i8, ptr addrspace(4) %1, i64 4
  %3 = load i16, ptr addrspace(4) %2, align 4, !range !26, !invariant.load !14
  %rem11 = and i32 %0, 15
  %4 = lshr i32 %0, 2
  %mul13 = and i32 %4, 12
  %mul15 = shl nuw nsw i32 %rem11, 4
  %5 = zext nneg i32 %mul15 to i64
  %6 = zext nneg i32 %mul13 to i64
  %7 = or disjoint i64 %5, %6
  %add.ptr = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %7
  %8 = load i32, ptr addrspace(1) %add.ptr, align 1
  %add.ptr21 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %7
  %9 = load i32, ptr addrspace(1) %add.ptr21, align 1
  %10 = or disjoint i64 %5, %6
  %11 = or disjoint i64 %10, 256
  %add.ptr.1 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %11
  %12 = load i32, ptr addrspace(1) %add.ptr.1, align 1
  %add.ptr21.1 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %11
  %13 = load i32, ptr addrspace(1) %add.ptr21.1, align 1
  %14 = or disjoint i64 %5, %6
  %15 = or disjoint i64 %14, 512
  %add.ptr.2 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %15
  %16 = load i32, ptr addrspace(1) %add.ptr.2, align 1
  %add.ptr21.2 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %15
  %17 = load i32, ptr addrspace(1) %add.ptr21.2, align 1
  %18 = or disjoint i64 %5, %6
  %19 = or disjoint i64 %18, 768
  %add.ptr.3 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %19
  %20 = load i32, ptr addrspace(1) %add.ptr.3, align 1
  %add.ptr21.3 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %19
  %21 = load i32, ptr addrspace(1) %add.ptr21.3, align 1
  %22 = or disjoint i64 %5, %6
  %23 = or disjoint i64 %22, 1024
  %add.ptr.4 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %23
  %24 = load i32, ptr addrspace(1) %add.ptr.4, align 1
  %add.ptr21.4 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %23
  %25 = load i32, ptr addrspace(1) %add.ptr21.4, align 1
  %26 = or disjoint i64 %5, %6
  %27 = or disjoint i64 %26, 1280
  %add.ptr.5 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %27
  %28 = load i32, ptr addrspace(1) %add.ptr.5, align 1
  %add.ptr21.5 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %27
  %29 = load i32, ptr addrspace(1) %add.ptr21.5, align 1
  %30 = or disjoint i64 %5, %6
  %31 = or disjoint i64 %30, 1536
  %add.ptr.6 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %31
  %32 = load i32, ptr addrspace(1) %add.ptr.6, align 1
  %add.ptr21.6 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %31
  %33 = load i32, ptr addrspace(1) %add.ptr21.6, align 1
  %34 = or disjoint i64 %5, %6
  %35 = or disjoint i64 %34, 1792
  %add.ptr.7 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %35
  %36 = load i32, ptr addrspace(1) %add.ptr.7, align 1
  %add.ptr21.7 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %35
  %37 = load i32, ptr addrspace(1) %add.ptr21.7, align 1
  %38 = or disjoint i64 %5, %6
  %39 = or disjoint i64 %38, 2048
  %add.ptr.8 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %39
  %40 = load i32, ptr addrspace(1) %add.ptr.8, align 1
  %add.ptr21.8 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %39
  %41 = load i32, ptr addrspace(1) %add.ptr21.8, align 1
  %42 = or disjoint i64 %5, %6
  %43 = or disjoint i64 %42, 2304
  %add.ptr.9 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %43
  %44 = load i32, ptr addrspace(1) %add.ptr.9, align 1
  %add.ptr21.9 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %43
  %45 = load i32, ptr addrspace(1) %add.ptr21.9, align 1
  %46 = or disjoint i64 %5, %6
  %47 = or disjoint i64 %46, 2560
  %add.ptr.10 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %47
  %48 = load i32, ptr addrspace(1) %add.ptr.10, align 1
  %add.ptr21.10 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %47
  %49 = load i32, ptr addrspace(1) %add.ptr21.10, align 1
  %50 = or disjoint i64 %5, %6
  %51 = or disjoint i64 %50, 2816
  %add.ptr.11 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %51
  %52 = load i32, ptr addrspace(1) %add.ptr.11, align 1
  %add.ptr21.11 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %51
  %53 = load i32, ptr addrspace(1) %add.ptr21.11, align 1
  %54 = or disjoint i64 %5, %6
  %55 = or disjoint i64 %54, 3072
  %add.ptr.12 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %55
  %56 = load i32, ptr addrspace(1) %add.ptr.12, align 1
  %add.ptr21.12 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %55
  %57 = load i32, ptr addrspace(1) %add.ptr21.12, align 1
  %58 = or disjoint i64 %5, %6
  %59 = or disjoint i64 %58, 3328
  %add.ptr.13 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %59
  %60 = load i32, ptr addrspace(1) %add.ptr.13, align 1
  %add.ptr21.13 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %59
  %61 = load i32, ptr addrspace(1) %add.ptr21.13, align 1
  %62 = or disjoint i64 %5, %6
  %63 = or disjoint i64 %62, 3584
  %add.ptr.14 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %63
  %64 = load i32, ptr addrspace(1) %add.ptr.14, align 1
  %add.ptr21.14 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %63
  %65 = load i32, ptr addrspace(1) %add.ptr21.14, align 1
  %66 = or disjoint i64 %5, %6
  %67 = or disjoint i64 %66, 3840
  %add.ptr.15 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %67
  %68 = load i32, ptr addrspace(1) %add.ptr.15, align 1
  %add.ptr21.15 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %67
  %69 = load i32, ptr addrspace(1) %add.ptr21.15, align 1
  %70 = or disjoint i64 %5, %6
  %71 = or disjoint i64 %70, 4096
  %add.ptr.16 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %71
  %72 = load i32, ptr addrspace(1) %add.ptr.16, align 1
  %add.ptr21.16 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %71
  %73 = load i32, ptr addrspace(1) %add.ptr21.16, align 1
  %74 = or disjoint i64 %5, %6
  %75 = or disjoint i64 %74, 4352
  %add.ptr.17 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %75
  %76 = load i32, ptr addrspace(1) %add.ptr.17, align 1
  %add.ptr21.17 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %75
  %77 = load i32, ptr addrspace(1) %add.ptr21.17, align 1
  %78 = or disjoint i64 %5, %6
  %79 = or disjoint i64 %78, 4608
  %add.ptr.18 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %79
  %80 = load i32, ptr addrspace(1) %add.ptr.18, align 1
  %add.ptr21.18 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %79
  %81 = load i32, ptr addrspace(1) %add.ptr21.18, align 1
  %82 = or disjoint i64 %5, %6
  %83 = or disjoint i64 %82, 4864
  %add.ptr.19 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %83
  %84 = load i32, ptr addrspace(1) %add.ptr.19, align 1
  %add.ptr21.19 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %83
  %85 = load i32, ptr addrspace(1) %add.ptr21.19, align 1
  %86 = or disjoint i64 %5, %6
  %87 = or disjoint i64 %86, 5120
  %add.ptr.20 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %87
  %88 = load i32, ptr addrspace(1) %add.ptr.20, align 1
  %add.ptr21.20 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %87
  %89 = load i32, ptr addrspace(1) %add.ptr21.20, align 1
  %90 = or disjoint i64 %5, %6
  %91 = or disjoint i64 %90, 5376
  %add.ptr.21 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %91
  %92 = load i32, ptr addrspace(1) %add.ptr.21, align 1
  %add.ptr21.21 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %91
  %93 = load i32, ptr addrspace(1) %add.ptr21.21, align 1
  %94 = or disjoint i64 %5, %6
  %95 = or disjoint i64 %94, 5632
  %add.ptr.22 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %95
  %96 = load i32, ptr addrspace(1) %add.ptr.22, align 1
  %add.ptr21.22 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %95
  %97 = load i32, ptr addrspace(1) %add.ptr21.22, align 1
  %98 = or disjoint i64 %5, %6
  %99 = or disjoint i64 %98, 5888
  %add.ptr.23 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %99
  %100 = load i32, ptr addrspace(1) %add.ptr.23, align 1
  %add.ptr21.23 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %99
  %101 = load i32, ptr addrspace(1) %add.ptr21.23, align 1
  %102 = or disjoint i64 %5, %6
  %103 = or disjoint i64 %102, 6144
  %add.ptr.24 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %103
  %104 = load i32, ptr addrspace(1) %add.ptr.24, align 1
  %add.ptr21.24 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %103
  %105 = load i32, ptr addrspace(1) %add.ptr21.24, align 1
  %106 = or disjoint i64 %5, %6
  %107 = or disjoint i64 %106, 6400
  %add.ptr.25 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %107
  %108 = load i32, ptr addrspace(1) %add.ptr.25, align 1
  %add.ptr21.25 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %107
  %109 = load i32, ptr addrspace(1) %add.ptr21.25, align 1
  %110 = or disjoint i64 %5, %6
  %111 = or disjoint i64 %110, 6656
  %add.ptr.26 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %111
  %112 = load i32, ptr addrspace(1) %add.ptr.26, align 1
  %add.ptr21.26 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %111
  %113 = load i32, ptr addrspace(1) %add.ptr21.26, align 1
  %cmp25104 = icmp sgt i32 %iterations, 0
  br i1 %cmp25104, label %for.cond30.preheader, label %for.cond49.preheader

for.cond30.preheader:                             ; preds = %entry, %for.cond30.preheader
  %sums.sroa.106.0 = phi <4 x i32> [ %140, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.102.0 = phi <4 x i32> [ %139, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.98.0 = phi <4 x i32> [ %138, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.94.0 = phi <4 x i32> [ %137, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.90.0 = phi <4 x i32> [ %136, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.86.0 = phi <4 x i32> [ %135, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.82.0 = phi <4 x i32> [ %134, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.78.0 = phi <4 x i32> [ %133, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.74.0 = phi <4 x i32> [ %132, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.70.0 = phi <4 x i32> [ %131, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.66.0 = phi <4 x i32> [ %130, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.62.0 = phi <4 x i32> [ %129, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.58.0 = phi <4 x i32> [ %128, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.54.0 = phi <4 x i32> [ %127, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.50.0 = phi <4 x i32> [ %126, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.46.0 = phi <4 x i32> [ %125, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.42.0 = phi <4 x i32> [ %124, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.38.0 = phi <4 x i32> [ %123, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.34.0 = phi <4 x i32> [ %122, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.30.0 = phi <4 x i32> [ %121, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.26.0 = phi <4 x i32> [ %120, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.22.0 = phi <4 x i32> [ %119, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.18.0 = phi <4 x i32> [ %118, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.14.0 = phi <4 x i32> [ %117, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.10.0 = phi <4 x i32> [ %116, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.6.0 = phi <4 x i32> [ %115, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.0.0 = phi <4 x i32> [ %114, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %iteration.0105 = phi i32 [ %inc46, %for.cond30.preheader ], [ 0, %entry ]
  %114 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %8, i32 %9, <4 x i32> %sums.sroa.0.0), !call_argsrelate !27
  %115 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %12, i32 %13, <4 x i32> %sums.sroa.6.0), !call_argsrelate !27
  %116 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %16, i32 %17, <4 x i32> %sums.sroa.10.0), !call_argsrelate !27
  %117 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %20, i32 %21, <4 x i32> %sums.sroa.14.0), !call_argsrelate !27
  %118 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %24, i32 %25, <4 x i32> %sums.sroa.18.0), !call_argsrelate !27
  %119 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %28, i32 %29, <4 x i32> %sums.sroa.22.0), !call_argsrelate !27
  %120 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %32, i32 %33, <4 x i32> %sums.sroa.26.0), !call_argsrelate !27
  %121 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %36, i32 %37, <4 x i32> %sums.sroa.30.0), !call_argsrelate !27
  %122 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %40, i32 %41, <4 x i32> %sums.sroa.34.0), !call_argsrelate !27
  %123 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %44, i32 %45, <4 x i32> %sums.sroa.38.0), !call_argsrelate !27
  %124 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %48, i32 %49, <4 x i32> %sums.sroa.42.0), !call_argsrelate !27
  %125 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %52, i32 %53, <4 x i32> %sums.sroa.46.0), !call_argsrelate !27
  %126 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %56, i32 %57, <4 x i32> %sums.sroa.50.0), !call_argsrelate !27
  %127 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %60, i32 %61, <4 x i32> %sums.sroa.54.0), !call_argsrelate !27
  %128 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %64, i32 %65, <4 x i32> %sums.sroa.58.0), !call_argsrelate !27
  %129 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %68, i32 %69, <4 x i32> %sums.sroa.62.0), !call_argsrelate !27
  %130 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %72, i32 %73, <4 x i32> %sums.sroa.66.0), !call_argsrelate !27
  %131 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %76, i32 %77, <4 x i32> %sums.sroa.70.0), !call_argsrelate !27
  %132 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %80, i32 %81, <4 x i32> %sums.sroa.74.0), !call_argsrelate !27
  %133 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %84, i32 %85, <4 x i32> %sums.sroa.78.0), !call_argsrelate !27
  %134 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %88, i32 %89, <4 x i32> %sums.sroa.82.0), !call_argsrelate !27
  %135 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %92, i32 %93, <4 x i32> %sums.sroa.86.0), !call_argsrelate !27
  %136 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %96, i32 %97, <4 x i32> %sums.sroa.90.0), !call_argsrelate !27
  %137 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %100, i32 %101, <4 x i32> %sums.sroa.94.0), !call_argsrelate !27
  %138 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %104, i32 %105, <4 x i32> %sums.sroa.98.0), !call_argsrelate !27
  %139 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %108, i32 %109, <4 x i32> %sums.sroa.102.0), !call_argsrelate !27
  %140 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %112, i32 %113, <4 x i32> %sums.sroa.106.0), !call_argsrelate !27
  %inc46 = add nuw nsw i32 %iteration.0105, 1
  %exitcond.not = icmp eq i32 %inc46, %iterations
  br i1 %exitcond.not, label %for.cond49.preheader, label %for.cond30.preheader, !llvm.loop !44

for.cond49.preheader:                             ; preds = %for.cond30.preheader, %entry
  %sums.sroa.106.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %140, %for.cond30.preheader ]
  %sums.sroa.102.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %139, %for.cond30.preheader ]
  %sums.sroa.98.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %138, %for.cond30.preheader ]
  %sums.sroa.94.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %137, %for.cond30.preheader ]
  %sums.sroa.90.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %136, %for.cond30.preheader ]
  %sums.sroa.86.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %135, %for.cond30.preheader ]
  %sums.sroa.82.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %134, %for.cond30.preheader ]
  %sums.sroa.78.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %133, %for.cond30.preheader ]
  %sums.sroa.74.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %132, %for.cond30.preheader ]
  %sums.sroa.70.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %131, %for.cond30.preheader ]
  %sums.sroa.66.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %130, %for.cond30.preheader ]
  %sums.sroa.62.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %129, %for.cond30.preheader ]
  %sums.sroa.58.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %128, %for.cond30.preheader ]
  %sums.sroa.54.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %127, %for.cond30.preheader ]
  %sums.sroa.50.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %126, %for.cond30.preheader ]
  %sums.sroa.46.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %125, %for.cond30.preheader ]
  %sums.sroa.42.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %124, %for.cond30.preheader ]
  %sums.sroa.38.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %123, %for.cond30.preheader ]
  %sums.sroa.34.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %122, %for.cond30.preheader ]
  %sums.sroa.30.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %121, %for.cond30.preheader ]
  %sums.sroa.26.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %120, %for.cond30.preheader ]
  %sums.sroa.22.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %119, %for.cond30.preheader ]
  %sums.sroa.18.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %118, %for.cond30.preheader ]
  %sums.sroa.14.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %117, %for.cond30.preheader ]
  %sums.sroa.10.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %116, %for.cond30.preheader ]
  %sums.sroa.6.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %115, %for.cond30.preheader ]
  %sums.sroa.0.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %114, %for.cond30.preheader ]
  %141 = lshr i16 %3, 6
  %conv7 = zext nneg i16 %141 to i64
  %142 = tail call noundef range(i32 0, 2147483647) i32 @llvm.mxc.block.id.x(), !range !15
  %conv = zext nneg i32 %142 to i64
  %mul = mul nuw nsw i64 %conv7, %conv
  %div9100 = lshr i32 %0, 6
  %conv10 = zext nneg i32 %div9100 to i64
  %add = add nuw nsw i64 %mul, %conv10
  %conv70 = zext nneg i32 %rem11 to i64
  %mul56 = mul nuw nsw i64 %add, 6912
  %vecext = extractelement <4 x i32> %sums.sroa.0.1, i64 0
  %143 = shl nuw nsw i64 %6, 4
  %add69 = or disjoint i64 %mul56, %143
  %add71 = or disjoint i64 %add69, %conv70
  %arrayidx72 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71
  store i32 %vecext, ptr addrspace(1) %arrayidx72, align 4, !tbaa !16
  %vecext.1 = extractelement <4 x i32> %sums.sroa.0.1, i64 1
  %144 = shl nuw nsw i64 %6, 4
  %145 = or disjoint i64 %144, 16
  %add69.1 = or disjoint i64 %mul56, %145
  %add71.1 = or disjoint i64 %add69.1, %conv70
  %arrayidx72.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1
  store i32 %vecext.1, ptr addrspace(1) %arrayidx72.1, align 4, !tbaa !16
  %vecext.2 = extractelement <4 x i32> %sums.sroa.0.1, i64 2
  %146 = shl nuw nsw i64 %6, 4
  %147 = or disjoint i64 %146, 32
  %add69.2 = or disjoint i64 %mul56, %147
  %add71.2 = or disjoint i64 %add69.2, %conv70
  %arrayidx72.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2
  store i32 %vecext.2, ptr addrspace(1) %arrayidx72.2, align 4, !tbaa !16
  %vecext.3 = extractelement <4 x i32> %sums.sroa.0.1, i64 3
  %148 = shl nuw nsw i64 %6, 4
  %149 = or disjoint i64 %148, 48
  %add69.3 = or disjoint i64 %mul56, %149
  %add71.3 = or disjoint i64 %add69.3, %conv70
  %arrayidx72.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3
  store i32 %vecext.3, ptr addrspace(1) %arrayidx72.3, align 4, !tbaa !16
  %add55.1 = mul nuw nsw i64 %add, 6912
  %mul56.1 = add nuw nsw i64 %add55.1, 256
  %vecext.1118 = extractelement <4 x i32> %sums.sroa.6.1, i64 0
  %add69.1119 = or disjoint i64 %mul56.1, %143
  %add71.1120 = or disjoint i64 %add69.1119, %conv70
  %arrayidx72.1121 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1120
  store i32 %vecext.1118, ptr addrspace(1) %arrayidx72.1121, align 4, !tbaa !16
  %vecext.1.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 1
  %add69.1.1 = or disjoint i64 %mul56.1, %145
  %add71.1.1 = or disjoint i64 %add69.1.1, %conv70
  %arrayidx72.1.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.1
  store i32 %vecext.1.1, ptr addrspace(1) %arrayidx72.1.1, align 4, !tbaa !16
  %vecext.2.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 2
  %add69.2.1 = or disjoint i64 %mul56.1, %147
  %add71.2.1 = or disjoint i64 %add69.2.1, %conv70
  %arrayidx72.2.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.1
  store i32 %vecext.2.1, ptr addrspace(1) %arrayidx72.2.1, align 4, !tbaa !16
  %vecext.3.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 3
  %add69.3.1 = or disjoint i64 %mul56.1, %149
  %add71.3.1 = or disjoint i64 %add69.3.1, %conv70
  %arrayidx72.3.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.1
  store i32 %vecext.3.1, ptr addrspace(1) %arrayidx72.3.1, align 4, !tbaa !16
  %add55.2 = mul nuw nsw i64 %add, 6912
  %mul56.2 = add nuw nsw i64 %add55.2, 512
  %vecext.2122 = extractelement <4 x i32> %sums.sroa.10.1, i64 0
  %add69.2123 = or disjoint i64 %mul56.2, %143
  %add71.2124 = or disjoint i64 %add69.2123, %conv70
  %arrayidx72.2125 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2124
  store i32 %vecext.2122, ptr addrspace(1) %arrayidx72.2125, align 4, !tbaa !16
  %vecext.1.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 1
  %add69.1.2 = or disjoint i64 %mul56.2, %145
  %add71.1.2 = or disjoint i64 %add69.1.2, %conv70
  %arrayidx72.1.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.2
  store i32 %vecext.1.2, ptr addrspace(1) %arrayidx72.1.2, align 4, !tbaa !16
  %vecext.2.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 2
  %add69.2.2 = or disjoint i64 %mul56.2, %147
  %add71.2.2 = or disjoint i64 %add69.2.2, %conv70
  %arrayidx72.2.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.2
  store i32 %vecext.2.2, ptr addrspace(1) %arrayidx72.2.2, align 4, !tbaa !16
  %vecext.3.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 3
  %add69.3.2 = or disjoint i64 %mul56.2, %149
  %add71.3.2 = or disjoint i64 %add69.3.2, %conv70
  %arrayidx72.3.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.2
  store i32 %vecext.3.2, ptr addrspace(1) %arrayidx72.3.2, align 4, !tbaa !16
  %add55.3 = mul nuw nsw i64 %add, 6912
  %mul56.3 = add nuw nsw i64 %add55.3, 768
  %vecext.3126 = extractelement <4 x i32> %sums.sroa.14.1, i64 0
  %add69.3127 = or disjoint i64 %mul56.3, %143
  %add71.3128 = or disjoint i64 %add69.3127, %conv70
  %arrayidx72.3129 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3128
  store i32 %vecext.3126, ptr addrspace(1) %arrayidx72.3129, align 4, !tbaa !16
  %vecext.1.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 1
  %add69.1.3 = or disjoint i64 %mul56.3, %145
  %add71.1.3 = or disjoint i64 %add69.1.3, %conv70
  %arrayidx72.1.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.3
  store i32 %vecext.1.3, ptr addrspace(1) %arrayidx72.1.3, align 4, !tbaa !16
  %vecext.2.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 2
  %add69.2.3 = or disjoint i64 %mul56.3, %147
  %add71.2.3 = or disjoint i64 %add69.2.3, %conv70
  %arrayidx72.2.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.3
  store i32 %vecext.2.3, ptr addrspace(1) %arrayidx72.2.3, align 4, !tbaa !16
  %vecext.3.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 3
  %add69.3.3 = or disjoint i64 %mul56.3, %149
  %add71.3.3 = or disjoint i64 %add69.3.3, %conv70
  %arrayidx72.3.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.3
  store i32 %vecext.3.3, ptr addrspace(1) %arrayidx72.3.3, align 4, !tbaa !16
  %add55.4 = mul nuw nsw i64 %add, 6912
  %mul56.4 = add nuw nsw i64 %add55.4, 1024
  %vecext.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 0
  %add69.4 = or disjoint i64 %mul56.4, %143
  %add71.4 = or disjoint i64 %add69.4, %conv70
  %arrayidx72.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.4
  store i32 %vecext.4, ptr addrspace(1) %arrayidx72.4, align 4, !tbaa !16
  %vecext.1.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 1
  %add69.1.4 = or disjoint i64 %mul56.4, %145
  %add71.1.4 = or disjoint i64 %add69.1.4, %conv70
  %arrayidx72.1.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.4
  store i32 %vecext.1.4, ptr addrspace(1) %arrayidx72.1.4, align 4, !tbaa !16
  %vecext.2.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 2
  %add69.2.4 = or disjoint i64 %mul56.4, %147
  %add71.2.4 = or disjoint i64 %add69.2.4, %conv70
  %arrayidx72.2.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.4
  store i32 %vecext.2.4, ptr addrspace(1) %arrayidx72.2.4, align 4, !tbaa !16
  %vecext.3.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 3
  %add69.3.4 = or disjoint i64 %mul56.4, %149
  %add71.3.4 = or disjoint i64 %add69.3.4, %conv70
  %arrayidx72.3.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.4
  store i32 %vecext.3.4, ptr addrspace(1) %arrayidx72.3.4, align 4, !tbaa !16
  %add55.5 = mul nuw nsw i64 %add, 6912
  %mul56.5 = add nuw nsw i64 %add55.5, 1280
  %vecext.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 0
  %add69.5 = or disjoint i64 %mul56.5, %143
  %add71.5 = or disjoint i64 %add69.5, %conv70
  %arrayidx72.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.5
  store i32 %vecext.5, ptr addrspace(1) %arrayidx72.5, align 4, !tbaa !16
  %vecext.1.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 1
  %add69.1.5 = or disjoint i64 %mul56.5, %145
  %add71.1.5 = or disjoint i64 %add69.1.5, %conv70
  %arrayidx72.1.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.5
  store i32 %vecext.1.5, ptr addrspace(1) %arrayidx72.1.5, align 4, !tbaa !16
  %vecext.2.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 2
  %add69.2.5 = or disjoint i64 %mul56.5, %147
  %add71.2.5 = or disjoint i64 %add69.2.5, %conv70
  %arrayidx72.2.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.5
  store i32 %vecext.2.5, ptr addrspace(1) %arrayidx72.2.5, align 4, !tbaa !16
  %vecext.3.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 3
  %add69.3.5 = or disjoint i64 %mul56.5, %149
  %add71.3.5 = or disjoint i64 %add69.3.5, %conv70
  %arrayidx72.3.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.5
  store i32 %vecext.3.5, ptr addrspace(1) %arrayidx72.3.5, align 4, !tbaa !16
  %add55.6 = mul nuw nsw i64 %add, 6912
  %mul56.6 = add nuw nsw i64 %add55.6, 1536
  %vecext.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 0
  %add69.6 = or disjoint i64 %mul56.6, %143
  %add71.6 = or disjoint i64 %add69.6, %conv70
  %arrayidx72.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.6
  store i32 %vecext.6, ptr addrspace(1) %arrayidx72.6, align 4, !tbaa !16
  %vecext.1.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 1
  %add69.1.6 = or disjoint i64 %mul56.6, %145
  %add71.1.6 = or disjoint i64 %add69.1.6, %conv70
  %arrayidx72.1.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.6
  store i32 %vecext.1.6, ptr addrspace(1) %arrayidx72.1.6, align 4, !tbaa !16
  %vecext.2.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 2
  %add69.2.6 = or disjoint i64 %mul56.6, %147
  %add71.2.6 = or disjoint i64 %add69.2.6, %conv70
  %arrayidx72.2.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.6
  store i32 %vecext.2.6, ptr addrspace(1) %arrayidx72.2.6, align 4, !tbaa !16
  %vecext.3.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 3
  %add69.3.6 = or disjoint i64 %mul56.6, %149
  %add71.3.6 = or disjoint i64 %add69.3.6, %conv70
  %arrayidx72.3.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.6
  store i32 %vecext.3.6, ptr addrspace(1) %arrayidx72.3.6, align 4, !tbaa !16
  %add55.7 = mul nuw nsw i64 %add, 6912
  %mul56.7 = add nuw nsw i64 %add55.7, 1792
  %vecext.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 0
  %add69.7 = or disjoint i64 %mul56.7, %143
  %add71.7 = or disjoint i64 %add69.7, %conv70
  %arrayidx72.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.7
  store i32 %vecext.7, ptr addrspace(1) %arrayidx72.7, align 4, !tbaa !16
  %vecext.1.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 1
  %add69.1.7 = or disjoint i64 %mul56.7, %145
  %add71.1.7 = or disjoint i64 %add69.1.7, %conv70
  %arrayidx72.1.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.7
  store i32 %vecext.1.7, ptr addrspace(1) %arrayidx72.1.7, align 4, !tbaa !16
  %vecext.2.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 2
  %add69.2.7 = or disjoint i64 %mul56.7, %147
  %add71.2.7 = or disjoint i64 %add69.2.7, %conv70
  %arrayidx72.2.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.7
  store i32 %vecext.2.7, ptr addrspace(1) %arrayidx72.2.7, align 4, !tbaa !16
  %vecext.3.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 3
  %add69.3.7 = or disjoint i64 %mul56.7, %149
  %add71.3.7 = or disjoint i64 %add69.3.7, %conv70
  %arrayidx72.3.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.7
  store i32 %vecext.3.7, ptr addrspace(1) %arrayidx72.3.7, align 4, !tbaa !16
  %add55.8 = mul nuw nsw i64 %add, 6912
  %mul56.8 = add nuw nsw i64 %add55.8, 2048
  %vecext.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 0
  %add69.8 = or disjoint i64 %mul56.8, %143
  %add71.8 = or disjoint i64 %add69.8, %conv70
  %arrayidx72.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.8
  store i32 %vecext.8, ptr addrspace(1) %arrayidx72.8, align 4, !tbaa !16
  %vecext.1.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 1
  %add69.1.8 = or disjoint i64 %mul56.8, %145
  %add71.1.8 = or disjoint i64 %add69.1.8, %conv70
  %arrayidx72.1.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.8
  store i32 %vecext.1.8, ptr addrspace(1) %arrayidx72.1.8, align 4, !tbaa !16
  %vecext.2.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 2
  %add69.2.8 = or disjoint i64 %mul56.8, %147
  %add71.2.8 = or disjoint i64 %add69.2.8, %conv70
  %arrayidx72.2.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.8
  store i32 %vecext.2.8, ptr addrspace(1) %arrayidx72.2.8, align 4, !tbaa !16
  %vecext.3.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 3
  %add69.3.8 = or disjoint i64 %mul56.8, %149
  %add71.3.8 = or disjoint i64 %add69.3.8, %conv70
  %arrayidx72.3.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.8
  store i32 %vecext.3.8, ptr addrspace(1) %arrayidx72.3.8, align 4, !tbaa !16
  %add55.9 = mul nuw nsw i64 %add, 6912
  %mul56.9 = add nuw nsw i64 %add55.9, 2304
  %vecext.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 0
  %add69.9 = or disjoint i64 %mul56.9, %143
  %add71.9 = or disjoint i64 %add69.9, %conv70
  %arrayidx72.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.9
  store i32 %vecext.9, ptr addrspace(1) %arrayidx72.9, align 4, !tbaa !16
  %vecext.1.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 1
  %add69.1.9 = or disjoint i64 %mul56.9, %145
  %add71.1.9 = or disjoint i64 %add69.1.9, %conv70
  %arrayidx72.1.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.9
  store i32 %vecext.1.9, ptr addrspace(1) %arrayidx72.1.9, align 4, !tbaa !16
  %vecext.2.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 2
  %add69.2.9 = or disjoint i64 %mul56.9, %147
  %add71.2.9 = or disjoint i64 %add69.2.9, %conv70
  %arrayidx72.2.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.9
  store i32 %vecext.2.9, ptr addrspace(1) %arrayidx72.2.9, align 4, !tbaa !16
  %vecext.3.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 3
  %add69.3.9 = or disjoint i64 %mul56.9, %149
  %add71.3.9 = or disjoint i64 %add69.3.9, %conv70
  %arrayidx72.3.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.9
  store i32 %vecext.3.9, ptr addrspace(1) %arrayidx72.3.9, align 4, !tbaa !16
  %add55.10 = mul nuw nsw i64 %add, 6912
  %mul56.10 = add nuw nsw i64 %add55.10, 2560
  %vecext.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 0
  %add69.10 = or disjoint i64 %mul56.10, %143
  %add71.10 = or disjoint i64 %add69.10, %conv70
  %arrayidx72.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.10
  store i32 %vecext.10, ptr addrspace(1) %arrayidx72.10, align 4, !tbaa !16
  %vecext.1.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 1
  %add69.1.10 = or disjoint i64 %mul56.10, %145
  %add71.1.10 = or disjoint i64 %add69.1.10, %conv70
  %arrayidx72.1.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.10
  store i32 %vecext.1.10, ptr addrspace(1) %arrayidx72.1.10, align 4, !tbaa !16
  %vecext.2.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 2
  %add69.2.10 = or disjoint i64 %mul56.10, %147
  %add71.2.10 = or disjoint i64 %add69.2.10, %conv70
  %arrayidx72.2.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.10
  store i32 %vecext.2.10, ptr addrspace(1) %arrayidx72.2.10, align 4, !tbaa !16
  %vecext.3.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 3
  %add69.3.10 = or disjoint i64 %mul56.10, %149
  %add71.3.10 = or disjoint i64 %add69.3.10, %conv70
  %arrayidx72.3.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.10
  store i32 %vecext.3.10, ptr addrspace(1) %arrayidx72.3.10, align 4, !tbaa !16
  %add55.11 = mul nuw nsw i64 %add, 6912
  %mul56.11 = add nuw nsw i64 %add55.11, 2816
  %vecext.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 0
  %add69.11 = or disjoint i64 %mul56.11, %143
  %add71.11 = or disjoint i64 %add69.11, %conv70
  %arrayidx72.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.11
  store i32 %vecext.11, ptr addrspace(1) %arrayidx72.11, align 4, !tbaa !16
  %vecext.1.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 1
  %add69.1.11 = or disjoint i64 %mul56.11, %145
  %add71.1.11 = or disjoint i64 %add69.1.11, %conv70
  %arrayidx72.1.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.11
  store i32 %vecext.1.11, ptr addrspace(1) %arrayidx72.1.11, align 4, !tbaa !16
  %vecext.2.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 2
  %add69.2.11 = or disjoint i64 %mul56.11, %147
  %add71.2.11 = or disjoint i64 %add69.2.11, %conv70
  %arrayidx72.2.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.11
  store i32 %vecext.2.11, ptr addrspace(1) %arrayidx72.2.11, align 4, !tbaa !16
  %vecext.3.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 3
  %add69.3.11 = or disjoint i64 %mul56.11, %149
  %add71.3.11 = or disjoint i64 %add69.3.11, %conv70
  %arrayidx72.3.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.11
  store i32 %vecext.3.11, ptr addrspace(1) %arrayidx72.3.11, align 4, !tbaa !16
  %add55.12 = mul nuw nsw i64 %add, 6912
  %mul56.12 = add nuw nsw i64 %add55.12, 3072
  %vecext.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 0
  %add69.12 = or disjoint i64 %mul56.12, %143
  %add71.12 = or disjoint i64 %add69.12, %conv70
  %arrayidx72.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.12
  store i32 %vecext.12, ptr addrspace(1) %arrayidx72.12, align 4, !tbaa !16
  %vecext.1.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 1
  %add69.1.12 = or disjoint i64 %mul56.12, %145
  %add71.1.12 = or disjoint i64 %add69.1.12, %conv70
  %arrayidx72.1.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.12
  store i32 %vecext.1.12, ptr addrspace(1) %arrayidx72.1.12, align 4, !tbaa !16
  %vecext.2.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 2
  %add69.2.12 = or disjoint i64 %mul56.12, %147
  %add71.2.12 = or disjoint i64 %add69.2.12, %conv70
  %arrayidx72.2.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.12
  store i32 %vecext.2.12, ptr addrspace(1) %arrayidx72.2.12, align 4, !tbaa !16
  %vecext.3.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 3
  %add69.3.12 = or disjoint i64 %mul56.12, %149
  %add71.3.12 = or disjoint i64 %add69.3.12, %conv70
  %arrayidx72.3.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.12
  store i32 %vecext.3.12, ptr addrspace(1) %arrayidx72.3.12, align 4, !tbaa !16
  %add55.13 = mul nuw nsw i64 %add, 6912
  %mul56.13 = add nuw nsw i64 %add55.13, 3328
  %vecext.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 0
  %add69.13 = or disjoint i64 %mul56.13, %143
  %add71.13 = or disjoint i64 %add69.13, %conv70
  %arrayidx72.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.13
  store i32 %vecext.13, ptr addrspace(1) %arrayidx72.13, align 4, !tbaa !16
  %vecext.1.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 1
  %add69.1.13 = or disjoint i64 %mul56.13, %145
  %add71.1.13 = or disjoint i64 %add69.1.13, %conv70
  %arrayidx72.1.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.13
  store i32 %vecext.1.13, ptr addrspace(1) %arrayidx72.1.13, align 4, !tbaa !16
  %vecext.2.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 2
  %add69.2.13 = or disjoint i64 %mul56.13, %147
  %add71.2.13 = or disjoint i64 %add69.2.13, %conv70
  %arrayidx72.2.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.13
  store i32 %vecext.2.13, ptr addrspace(1) %arrayidx72.2.13, align 4, !tbaa !16
  %vecext.3.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 3
  %add69.3.13 = or disjoint i64 %mul56.13, %149
  %add71.3.13 = or disjoint i64 %add69.3.13, %conv70
  %arrayidx72.3.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.13
  store i32 %vecext.3.13, ptr addrspace(1) %arrayidx72.3.13, align 4, !tbaa !16
  %add55.14 = mul nuw nsw i64 %add, 6912
  %mul56.14 = add nuw nsw i64 %add55.14, 3584
  %vecext.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 0
  %add69.14 = or disjoint i64 %mul56.14, %143
  %add71.14 = or disjoint i64 %add69.14, %conv70
  %arrayidx72.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.14
  store i32 %vecext.14, ptr addrspace(1) %arrayidx72.14, align 4, !tbaa !16
  %vecext.1.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 1
  %add69.1.14 = or disjoint i64 %mul56.14, %145
  %add71.1.14 = or disjoint i64 %add69.1.14, %conv70
  %arrayidx72.1.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.14
  store i32 %vecext.1.14, ptr addrspace(1) %arrayidx72.1.14, align 4, !tbaa !16
  %vecext.2.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 2
  %add69.2.14 = or disjoint i64 %mul56.14, %147
  %add71.2.14 = or disjoint i64 %add69.2.14, %conv70
  %arrayidx72.2.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.14
  store i32 %vecext.2.14, ptr addrspace(1) %arrayidx72.2.14, align 4, !tbaa !16
  %vecext.3.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 3
  %add69.3.14 = or disjoint i64 %mul56.14, %149
  %add71.3.14 = or disjoint i64 %add69.3.14, %conv70
  %arrayidx72.3.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.14
  store i32 %vecext.3.14, ptr addrspace(1) %arrayidx72.3.14, align 4, !tbaa !16
  %add55.15 = mul nuw nsw i64 %add, 6912
  %mul56.15 = add nuw nsw i64 %add55.15, 3840
  %vecext.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 0
  %add69.15 = or disjoint i64 %mul56.15, %143
  %add71.15 = or disjoint i64 %add69.15, %conv70
  %arrayidx72.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.15
  store i32 %vecext.15, ptr addrspace(1) %arrayidx72.15, align 4, !tbaa !16
  %vecext.1.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 1
  %add69.1.15 = or disjoint i64 %mul56.15, %145
  %add71.1.15 = or disjoint i64 %add69.1.15, %conv70
  %arrayidx72.1.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.15
  store i32 %vecext.1.15, ptr addrspace(1) %arrayidx72.1.15, align 4, !tbaa !16
  %vecext.2.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 2
  %add69.2.15 = or disjoint i64 %mul56.15, %147
  %add71.2.15 = or disjoint i64 %add69.2.15, %conv70
  %arrayidx72.2.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.15
  store i32 %vecext.2.15, ptr addrspace(1) %arrayidx72.2.15, align 4, !tbaa !16
  %vecext.3.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 3
  %add69.3.15 = or disjoint i64 %mul56.15, %149
  %add71.3.15 = or disjoint i64 %add69.3.15, %conv70
  %arrayidx72.3.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.15
  store i32 %vecext.3.15, ptr addrspace(1) %arrayidx72.3.15, align 4, !tbaa !16
  %add55.16 = mul nuw nsw i64 %add, 6912
  %mul56.16 = add nuw nsw i64 %add55.16, 4096
  %vecext.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 0
  %add69.16 = or disjoint i64 %mul56.16, %143
  %add71.16 = or disjoint i64 %add69.16, %conv70
  %arrayidx72.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.16
  store i32 %vecext.16, ptr addrspace(1) %arrayidx72.16, align 4, !tbaa !16
  %vecext.1.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 1
  %add69.1.16 = or disjoint i64 %mul56.16, %145
  %add71.1.16 = or disjoint i64 %add69.1.16, %conv70
  %arrayidx72.1.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.16
  store i32 %vecext.1.16, ptr addrspace(1) %arrayidx72.1.16, align 4, !tbaa !16
  %vecext.2.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 2
  %add69.2.16 = or disjoint i64 %mul56.16, %147
  %add71.2.16 = or disjoint i64 %add69.2.16, %conv70
  %arrayidx72.2.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.16
  store i32 %vecext.2.16, ptr addrspace(1) %arrayidx72.2.16, align 4, !tbaa !16
  %vecext.3.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 3
  %add69.3.16 = or disjoint i64 %mul56.16, %149
  %add71.3.16 = or disjoint i64 %add69.3.16, %conv70
  %arrayidx72.3.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.16
  store i32 %vecext.3.16, ptr addrspace(1) %arrayidx72.3.16, align 4, !tbaa !16
  %add55.17 = mul nuw nsw i64 %add, 6912
  %mul56.17 = add nuw nsw i64 %add55.17, 4352
  %vecext.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 0
  %add69.17 = or disjoint i64 %mul56.17, %143
  %add71.17 = or disjoint i64 %add69.17, %conv70
  %arrayidx72.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.17
  store i32 %vecext.17, ptr addrspace(1) %arrayidx72.17, align 4, !tbaa !16
  %vecext.1.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 1
  %add69.1.17 = or disjoint i64 %mul56.17, %145
  %add71.1.17 = or disjoint i64 %add69.1.17, %conv70
  %arrayidx72.1.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.17
  store i32 %vecext.1.17, ptr addrspace(1) %arrayidx72.1.17, align 4, !tbaa !16
  %vecext.2.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 2
  %add69.2.17 = or disjoint i64 %mul56.17, %147
  %add71.2.17 = or disjoint i64 %add69.2.17, %conv70
  %arrayidx72.2.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.17
  store i32 %vecext.2.17, ptr addrspace(1) %arrayidx72.2.17, align 4, !tbaa !16
  %vecext.3.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 3
  %add69.3.17 = or disjoint i64 %mul56.17, %149
  %add71.3.17 = or disjoint i64 %add69.3.17, %conv70
  %arrayidx72.3.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.17
  store i32 %vecext.3.17, ptr addrspace(1) %arrayidx72.3.17, align 4, !tbaa !16
  %add55.18 = mul nuw nsw i64 %add, 6912
  %mul56.18 = add nuw nsw i64 %add55.18, 4608
  %vecext.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 0
  %add69.18 = or disjoint i64 %mul56.18, %143
  %add71.18 = or disjoint i64 %add69.18, %conv70
  %arrayidx72.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.18
  store i32 %vecext.18, ptr addrspace(1) %arrayidx72.18, align 4, !tbaa !16
  %vecext.1.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 1
  %add69.1.18 = or disjoint i64 %mul56.18, %145
  %add71.1.18 = or disjoint i64 %add69.1.18, %conv70
  %arrayidx72.1.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.18
  store i32 %vecext.1.18, ptr addrspace(1) %arrayidx72.1.18, align 4, !tbaa !16
  %vecext.2.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 2
  %add69.2.18 = or disjoint i64 %mul56.18, %147
  %add71.2.18 = or disjoint i64 %add69.2.18, %conv70
  %arrayidx72.2.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.18
  store i32 %vecext.2.18, ptr addrspace(1) %arrayidx72.2.18, align 4, !tbaa !16
  %vecext.3.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 3
  %add69.3.18 = or disjoint i64 %mul56.18, %149
  %add71.3.18 = or disjoint i64 %add69.3.18, %conv70
  %arrayidx72.3.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.18
  store i32 %vecext.3.18, ptr addrspace(1) %arrayidx72.3.18, align 4, !tbaa !16
  %add55.19 = mul nuw nsw i64 %add, 6912
  %mul56.19 = add nuw nsw i64 %add55.19, 4864
  %vecext.19 = extractelement <4 x i32> %sums.sroa.78.1, i64 0
  %add69.19 = or disjoint i64 %mul56.19, %143
  %add71.19 = or disjoint i64 %add69.19, %conv70
  %arrayidx72.19 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.19
  store i32 %vecext.19, ptr addrspace(1) %arrayidx72.19, align 4, !tbaa !16
  %vecext.1.19 = extractelement <4 x i32> %sums.sroa.78.1, i64 1
  %add69.1.19 = or disjoint i64 %mul56.19, %145
  %add71.1.19 = or disjoint i64 %add69.1.19, %conv70
  %arrayidx72.1.19 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.19
  store i32 %vecext.1.19, ptr addrspace(1) %arrayidx72.1.19, align 4, !tbaa !16
  %vecext.2.19 = extractelement <4 x i32> %sums.sroa.78.1, i64 2
  %add69.2.19 = or disjoint i64 %mul56.19, %147
  %add71.2.19 = or disjoint i64 %add69.2.19, %conv70
  %arrayidx72.2.19 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.19
  store i32 %vecext.2.19, ptr addrspace(1) %arrayidx72.2.19, align 4, !tbaa !16
  %vecext.3.19 = extractelement <4 x i32> %sums.sroa.78.1, i64 3
  %add69.3.19 = or disjoint i64 %mul56.19, %149
  %add71.3.19 = or disjoint i64 %add69.3.19, %conv70
  %arrayidx72.3.19 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.19
  store i32 %vecext.3.19, ptr addrspace(1) %arrayidx72.3.19, align 4, !tbaa !16
  %add55.20 = mul nuw nsw i64 %add, 6912
  %mul56.20 = add nuw nsw i64 %add55.20, 5120
  %vecext.20 = extractelement <4 x i32> %sums.sroa.82.1, i64 0
  %add69.20 = or disjoint i64 %mul56.20, %143
  %add71.20 = or disjoint i64 %add69.20, %conv70
  %arrayidx72.20 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.20
  store i32 %vecext.20, ptr addrspace(1) %arrayidx72.20, align 4, !tbaa !16
  %vecext.1.20 = extractelement <4 x i32> %sums.sroa.82.1, i64 1
  %add69.1.20 = or disjoint i64 %mul56.20, %145
  %add71.1.20 = or disjoint i64 %add69.1.20, %conv70
  %arrayidx72.1.20 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.20
  store i32 %vecext.1.20, ptr addrspace(1) %arrayidx72.1.20, align 4, !tbaa !16
  %vecext.2.20 = extractelement <4 x i32> %sums.sroa.82.1, i64 2
  %add69.2.20 = or disjoint i64 %mul56.20, %147
  %add71.2.20 = or disjoint i64 %add69.2.20, %conv70
  %arrayidx72.2.20 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.20
  store i32 %vecext.2.20, ptr addrspace(1) %arrayidx72.2.20, align 4, !tbaa !16
  %vecext.3.20 = extractelement <4 x i32> %sums.sroa.82.1, i64 3
  %add69.3.20 = or disjoint i64 %mul56.20, %149
  %add71.3.20 = or disjoint i64 %add69.3.20, %conv70
  %arrayidx72.3.20 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.20
  store i32 %vecext.3.20, ptr addrspace(1) %arrayidx72.3.20, align 4, !tbaa !16
  %add55.21 = mul nuw nsw i64 %add, 6912
  %mul56.21 = add nuw nsw i64 %add55.21, 5376
  %vecext.21 = extractelement <4 x i32> %sums.sroa.86.1, i64 0
  %add69.21 = or disjoint i64 %mul56.21, %143
  %add71.21 = or disjoint i64 %add69.21, %conv70
  %arrayidx72.21 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.21
  store i32 %vecext.21, ptr addrspace(1) %arrayidx72.21, align 4, !tbaa !16
  %vecext.1.21 = extractelement <4 x i32> %sums.sroa.86.1, i64 1
  %add69.1.21 = or disjoint i64 %mul56.21, %145
  %add71.1.21 = or disjoint i64 %add69.1.21, %conv70
  %arrayidx72.1.21 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.21
  store i32 %vecext.1.21, ptr addrspace(1) %arrayidx72.1.21, align 4, !tbaa !16
  %vecext.2.21 = extractelement <4 x i32> %sums.sroa.86.1, i64 2
  %add69.2.21 = or disjoint i64 %mul56.21, %147
  %add71.2.21 = or disjoint i64 %add69.2.21, %conv70
  %arrayidx72.2.21 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.21
  store i32 %vecext.2.21, ptr addrspace(1) %arrayidx72.2.21, align 4, !tbaa !16
  %vecext.3.21 = extractelement <4 x i32> %sums.sroa.86.1, i64 3
  %add69.3.21 = or disjoint i64 %mul56.21, %149
  %add71.3.21 = or disjoint i64 %add69.3.21, %conv70
  %arrayidx72.3.21 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.21
  store i32 %vecext.3.21, ptr addrspace(1) %arrayidx72.3.21, align 4, !tbaa !16
  %add55.22 = mul nuw nsw i64 %add, 6912
  %mul56.22 = add nuw nsw i64 %add55.22, 5632
  %vecext.22 = extractelement <4 x i32> %sums.sroa.90.1, i64 0
  %add69.22 = or disjoint i64 %mul56.22, %143
  %add71.22 = or disjoint i64 %add69.22, %conv70
  %arrayidx72.22 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.22
  store i32 %vecext.22, ptr addrspace(1) %arrayidx72.22, align 4, !tbaa !16
  %vecext.1.22 = extractelement <4 x i32> %sums.sroa.90.1, i64 1
  %add69.1.22 = or disjoint i64 %mul56.22, %145
  %add71.1.22 = or disjoint i64 %add69.1.22, %conv70
  %arrayidx72.1.22 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.22
  store i32 %vecext.1.22, ptr addrspace(1) %arrayidx72.1.22, align 4, !tbaa !16
  %vecext.2.22 = extractelement <4 x i32> %sums.sroa.90.1, i64 2
  %add69.2.22 = or disjoint i64 %mul56.22, %147
  %add71.2.22 = or disjoint i64 %add69.2.22, %conv70
  %arrayidx72.2.22 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.22
  store i32 %vecext.2.22, ptr addrspace(1) %arrayidx72.2.22, align 4, !tbaa !16
  %vecext.3.22 = extractelement <4 x i32> %sums.sroa.90.1, i64 3
  %add69.3.22 = or disjoint i64 %mul56.22, %149
  %add71.3.22 = or disjoint i64 %add69.3.22, %conv70
  %arrayidx72.3.22 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.22
  store i32 %vecext.3.22, ptr addrspace(1) %arrayidx72.3.22, align 4, !tbaa !16
  %add55.23 = mul nuw nsw i64 %add, 6912
  %mul56.23 = add nuw nsw i64 %add55.23, 5888
  %vecext.23 = extractelement <4 x i32> %sums.sroa.94.1, i64 0
  %add69.23 = or disjoint i64 %mul56.23, %143
  %add71.23 = or disjoint i64 %add69.23, %conv70
  %arrayidx72.23 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.23
  store i32 %vecext.23, ptr addrspace(1) %arrayidx72.23, align 4, !tbaa !16
  %vecext.1.23 = extractelement <4 x i32> %sums.sroa.94.1, i64 1
  %add69.1.23 = or disjoint i64 %mul56.23, %145
  %add71.1.23 = or disjoint i64 %add69.1.23, %conv70
  %arrayidx72.1.23 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.23
  store i32 %vecext.1.23, ptr addrspace(1) %arrayidx72.1.23, align 4, !tbaa !16
  %vecext.2.23 = extractelement <4 x i32> %sums.sroa.94.1, i64 2
  %add69.2.23 = or disjoint i64 %mul56.23, %147
  %add71.2.23 = or disjoint i64 %add69.2.23, %conv70
  %arrayidx72.2.23 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.23
  store i32 %vecext.2.23, ptr addrspace(1) %arrayidx72.2.23, align 4, !tbaa !16
  %vecext.3.23 = extractelement <4 x i32> %sums.sroa.94.1, i64 3
  %add69.3.23 = or disjoint i64 %mul56.23, %149
  %add71.3.23 = or disjoint i64 %add69.3.23, %conv70
  %arrayidx72.3.23 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.23
  store i32 %vecext.3.23, ptr addrspace(1) %arrayidx72.3.23, align 4, !tbaa !16
  %add55.24 = mul nuw nsw i64 %add, 6912
  %mul56.24 = add nuw nsw i64 %add55.24, 6144
  %vecext.24 = extractelement <4 x i32> %sums.sroa.98.1, i64 0
  %add69.24 = or disjoint i64 %mul56.24, %143
  %add71.24 = or disjoint i64 %add69.24, %conv70
  %arrayidx72.24 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.24
  store i32 %vecext.24, ptr addrspace(1) %arrayidx72.24, align 4, !tbaa !16
  %vecext.1.24 = extractelement <4 x i32> %sums.sroa.98.1, i64 1
  %add69.1.24 = or disjoint i64 %mul56.24, %145
  %add71.1.24 = or disjoint i64 %add69.1.24, %conv70
  %arrayidx72.1.24 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.24
  store i32 %vecext.1.24, ptr addrspace(1) %arrayidx72.1.24, align 4, !tbaa !16
  %vecext.2.24 = extractelement <4 x i32> %sums.sroa.98.1, i64 2
  %add69.2.24 = or disjoint i64 %mul56.24, %147
  %add71.2.24 = or disjoint i64 %add69.2.24, %conv70
  %arrayidx72.2.24 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.24
  store i32 %vecext.2.24, ptr addrspace(1) %arrayidx72.2.24, align 4, !tbaa !16
  %vecext.3.24 = extractelement <4 x i32> %sums.sroa.98.1, i64 3
  %add69.3.24 = or disjoint i64 %mul56.24, %149
  %add71.3.24 = or disjoint i64 %add69.3.24, %conv70
  %arrayidx72.3.24 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.24
  store i32 %vecext.3.24, ptr addrspace(1) %arrayidx72.3.24, align 4, !tbaa !16
  %add55.25 = mul nuw nsw i64 %add, 6912
  %mul56.25 = add nuw nsw i64 %add55.25, 6400
  %vecext.25 = extractelement <4 x i32> %sums.sroa.102.1, i64 0
  %add69.25 = or disjoint i64 %mul56.25, %143
  %add71.25 = or disjoint i64 %add69.25, %conv70
  %arrayidx72.25 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.25
  store i32 %vecext.25, ptr addrspace(1) %arrayidx72.25, align 4, !tbaa !16
  %vecext.1.25 = extractelement <4 x i32> %sums.sroa.102.1, i64 1
  %add69.1.25 = or disjoint i64 %mul56.25, %145
  %add71.1.25 = or disjoint i64 %add69.1.25, %conv70
  %arrayidx72.1.25 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.25
  store i32 %vecext.1.25, ptr addrspace(1) %arrayidx72.1.25, align 4, !tbaa !16
  %vecext.2.25 = extractelement <4 x i32> %sums.sroa.102.1, i64 2
  %add69.2.25 = or disjoint i64 %mul56.25, %147
  %add71.2.25 = or disjoint i64 %add69.2.25, %conv70
  %arrayidx72.2.25 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.25
  store i32 %vecext.2.25, ptr addrspace(1) %arrayidx72.2.25, align 4, !tbaa !16
  %vecext.3.25 = extractelement <4 x i32> %sums.sroa.102.1, i64 3
  %add69.3.25 = or disjoint i64 %mul56.25, %149
  %add71.3.25 = or disjoint i64 %add69.3.25, %conv70
  %arrayidx72.3.25 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.25
  store i32 %vecext.3.25, ptr addrspace(1) %arrayidx72.3.25, align 4, !tbaa !16
  %add55.26 = mul nuw nsw i64 %add, 6912
  %mul56.26 = add nuw nsw i64 %add55.26, 6656
  %vecext.26 = extractelement <4 x i32> %sums.sroa.106.1, i64 0
  %add69.26 = or disjoint i64 %mul56.26, %143
  %add71.26 = or disjoint i64 %add69.26, %conv70
  %arrayidx72.26 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.26
  store i32 %vecext.26, ptr addrspace(1) %arrayidx72.26, align 4, !tbaa !16
  %vecext.1.26 = extractelement <4 x i32> %sums.sroa.106.1, i64 1
  %add69.1.26 = or disjoint i64 %mul56.26, %145
  %add71.1.26 = or disjoint i64 %add69.1.26, %conv70
  %arrayidx72.1.26 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.26
  store i32 %vecext.1.26, ptr addrspace(1) %arrayidx72.1.26, align 4, !tbaa !16
  %vecext.2.26 = extractelement <4 x i32> %sums.sroa.106.1, i64 2
  %add69.2.26 = or disjoint i64 %mul56.26, %147
  %add71.2.26 = or disjoint i64 %add69.2.26, %conv70
  %arrayidx72.2.26 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.26
  store i32 %vecext.2.26, ptr addrspace(1) %arrayidx72.2.26, align 4, !tbaa !16
  %vecext.3.26 = extractelement <4 x i32> %sums.sroa.106.1, i64 3
  %add69.3.26 = or disjoint i64 %mul56.26, %149
  %add71.3.26 = or disjoint i64 %add69.3.26, %conv70
  %arrayidx72.3.26 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.26
  store i32 %vecext.3.26, ptr addrspace(1) %arrayidx72.3.26, align 4, !tbaa !16
  ret void
}

; Function Attrs: convergent mustprogress nofree norecurse nounwind memory(argmem: readwrite)
define protected metaxgpu_kernel void @_Z13mmaPeakKernelILi28EEvPKaS1_Pii(ptr addrspace(1) noalias nocapture noundef readonly %a.coerce, ptr addrspace(1) noalias nocapture noundef readonly %b.coerce, ptr addrspace(1) noalias noundef writeonly %c.coerce, i32 noundef %iterations) local_unnamed_addr #3 comdat {
entry:
  %0 = tail call noundef range(i32 0, 1024) i32 @llvm.mxc.thread.id.x(), !range !25
  %1 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.mxc.dispatch.ptr()
  %2 = getelementptr inbounds i8, ptr addrspace(4) %1, i64 4
  %3 = load i16, ptr addrspace(4) %2, align 4, !range !26, !invariant.load !14
  %rem11 = and i32 %0, 15
  %4 = lshr i32 %0, 2
  %mul13 = and i32 %4, 12
  %mul15 = shl nuw nsw i32 %rem11, 4
  %5 = zext nneg i32 %mul15 to i64
  %6 = zext nneg i32 %mul13 to i64
  %7 = or disjoint i64 %5, %6
  %add.ptr = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %7
  %8 = load i32, ptr addrspace(1) %add.ptr, align 1
  %add.ptr21 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %7
  %9 = load i32, ptr addrspace(1) %add.ptr21, align 1
  %10 = or disjoint i64 %5, %6
  %11 = or disjoint i64 %10, 256
  %add.ptr.1 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %11
  %12 = load i32, ptr addrspace(1) %add.ptr.1, align 1
  %add.ptr21.1 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %11
  %13 = load i32, ptr addrspace(1) %add.ptr21.1, align 1
  %14 = or disjoint i64 %5, %6
  %15 = or disjoint i64 %14, 512
  %add.ptr.2 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %15
  %16 = load i32, ptr addrspace(1) %add.ptr.2, align 1
  %add.ptr21.2 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %15
  %17 = load i32, ptr addrspace(1) %add.ptr21.2, align 1
  %18 = or disjoint i64 %5, %6
  %19 = or disjoint i64 %18, 768
  %add.ptr.3 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %19
  %20 = load i32, ptr addrspace(1) %add.ptr.3, align 1
  %add.ptr21.3 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %19
  %21 = load i32, ptr addrspace(1) %add.ptr21.3, align 1
  %22 = or disjoint i64 %5, %6
  %23 = or disjoint i64 %22, 1024
  %add.ptr.4 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %23
  %24 = load i32, ptr addrspace(1) %add.ptr.4, align 1
  %add.ptr21.4 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %23
  %25 = load i32, ptr addrspace(1) %add.ptr21.4, align 1
  %26 = or disjoint i64 %5, %6
  %27 = or disjoint i64 %26, 1280
  %add.ptr.5 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %27
  %28 = load i32, ptr addrspace(1) %add.ptr.5, align 1
  %add.ptr21.5 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %27
  %29 = load i32, ptr addrspace(1) %add.ptr21.5, align 1
  %30 = or disjoint i64 %5, %6
  %31 = or disjoint i64 %30, 1536
  %add.ptr.6 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %31
  %32 = load i32, ptr addrspace(1) %add.ptr.6, align 1
  %add.ptr21.6 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %31
  %33 = load i32, ptr addrspace(1) %add.ptr21.6, align 1
  %34 = or disjoint i64 %5, %6
  %35 = or disjoint i64 %34, 1792
  %add.ptr.7 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %35
  %36 = load i32, ptr addrspace(1) %add.ptr.7, align 1
  %add.ptr21.7 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %35
  %37 = load i32, ptr addrspace(1) %add.ptr21.7, align 1
  %38 = or disjoint i64 %5, %6
  %39 = or disjoint i64 %38, 2048
  %add.ptr.8 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %39
  %40 = load i32, ptr addrspace(1) %add.ptr.8, align 1
  %add.ptr21.8 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %39
  %41 = load i32, ptr addrspace(1) %add.ptr21.8, align 1
  %42 = or disjoint i64 %5, %6
  %43 = or disjoint i64 %42, 2304
  %add.ptr.9 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %43
  %44 = load i32, ptr addrspace(1) %add.ptr.9, align 1
  %add.ptr21.9 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %43
  %45 = load i32, ptr addrspace(1) %add.ptr21.9, align 1
  %46 = or disjoint i64 %5, %6
  %47 = or disjoint i64 %46, 2560
  %add.ptr.10 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %47
  %48 = load i32, ptr addrspace(1) %add.ptr.10, align 1
  %add.ptr21.10 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %47
  %49 = load i32, ptr addrspace(1) %add.ptr21.10, align 1
  %50 = or disjoint i64 %5, %6
  %51 = or disjoint i64 %50, 2816
  %add.ptr.11 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %51
  %52 = load i32, ptr addrspace(1) %add.ptr.11, align 1
  %add.ptr21.11 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %51
  %53 = load i32, ptr addrspace(1) %add.ptr21.11, align 1
  %54 = or disjoint i64 %5, %6
  %55 = or disjoint i64 %54, 3072
  %add.ptr.12 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %55
  %56 = load i32, ptr addrspace(1) %add.ptr.12, align 1
  %add.ptr21.12 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %55
  %57 = load i32, ptr addrspace(1) %add.ptr21.12, align 1
  %58 = or disjoint i64 %5, %6
  %59 = or disjoint i64 %58, 3328
  %add.ptr.13 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %59
  %60 = load i32, ptr addrspace(1) %add.ptr.13, align 1
  %add.ptr21.13 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %59
  %61 = load i32, ptr addrspace(1) %add.ptr21.13, align 1
  %62 = or disjoint i64 %5, %6
  %63 = or disjoint i64 %62, 3584
  %add.ptr.14 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %63
  %64 = load i32, ptr addrspace(1) %add.ptr.14, align 1
  %add.ptr21.14 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %63
  %65 = load i32, ptr addrspace(1) %add.ptr21.14, align 1
  %66 = or disjoint i64 %5, %6
  %67 = or disjoint i64 %66, 3840
  %add.ptr.15 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %67
  %68 = load i32, ptr addrspace(1) %add.ptr.15, align 1
  %add.ptr21.15 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %67
  %69 = load i32, ptr addrspace(1) %add.ptr21.15, align 1
  %70 = or disjoint i64 %5, %6
  %71 = or disjoint i64 %70, 4096
  %add.ptr.16 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %71
  %72 = load i32, ptr addrspace(1) %add.ptr.16, align 1
  %add.ptr21.16 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %71
  %73 = load i32, ptr addrspace(1) %add.ptr21.16, align 1
  %74 = or disjoint i64 %5, %6
  %75 = or disjoint i64 %74, 4352
  %add.ptr.17 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %75
  %76 = load i32, ptr addrspace(1) %add.ptr.17, align 1
  %add.ptr21.17 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %75
  %77 = load i32, ptr addrspace(1) %add.ptr21.17, align 1
  %78 = or disjoint i64 %5, %6
  %79 = or disjoint i64 %78, 4608
  %add.ptr.18 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %79
  %80 = load i32, ptr addrspace(1) %add.ptr.18, align 1
  %add.ptr21.18 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %79
  %81 = load i32, ptr addrspace(1) %add.ptr21.18, align 1
  %82 = or disjoint i64 %5, %6
  %83 = or disjoint i64 %82, 4864
  %add.ptr.19 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %83
  %84 = load i32, ptr addrspace(1) %add.ptr.19, align 1
  %add.ptr21.19 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %83
  %85 = load i32, ptr addrspace(1) %add.ptr21.19, align 1
  %86 = or disjoint i64 %5, %6
  %87 = or disjoint i64 %86, 5120
  %add.ptr.20 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %87
  %88 = load i32, ptr addrspace(1) %add.ptr.20, align 1
  %add.ptr21.20 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %87
  %89 = load i32, ptr addrspace(1) %add.ptr21.20, align 1
  %90 = or disjoint i64 %5, %6
  %91 = or disjoint i64 %90, 5376
  %add.ptr.21 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %91
  %92 = load i32, ptr addrspace(1) %add.ptr.21, align 1
  %add.ptr21.21 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %91
  %93 = load i32, ptr addrspace(1) %add.ptr21.21, align 1
  %94 = or disjoint i64 %5, %6
  %95 = or disjoint i64 %94, 5632
  %add.ptr.22 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %95
  %96 = load i32, ptr addrspace(1) %add.ptr.22, align 1
  %add.ptr21.22 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %95
  %97 = load i32, ptr addrspace(1) %add.ptr21.22, align 1
  %98 = or disjoint i64 %5, %6
  %99 = or disjoint i64 %98, 5888
  %add.ptr.23 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %99
  %100 = load i32, ptr addrspace(1) %add.ptr.23, align 1
  %add.ptr21.23 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %99
  %101 = load i32, ptr addrspace(1) %add.ptr21.23, align 1
  %102 = or disjoint i64 %5, %6
  %103 = or disjoint i64 %102, 6144
  %add.ptr.24 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %103
  %104 = load i32, ptr addrspace(1) %add.ptr.24, align 1
  %add.ptr21.24 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %103
  %105 = load i32, ptr addrspace(1) %add.ptr21.24, align 1
  %106 = or disjoint i64 %5, %6
  %107 = or disjoint i64 %106, 6400
  %add.ptr.25 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %107
  %108 = load i32, ptr addrspace(1) %add.ptr.25, align 1
  %add.ptr21.25 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %107
  %109 = load i32, ptr addrspace(1) %add.ptr21.25, align 1
  %110 = or disjoint i64 %5, %6
  %111 = or disjoint i64 %110, 6656
  %add.ptr.26 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %111
  %112 = load i32, ptr addrspace(1) %add.ptr.26, align 1
  %add.ptr21.26 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %111
  %113 = load i32, ptr addrspace(1) %add.ptr21.26, align 1
  %114 = or disjoint i64 %5, %6
  %115 = or disjoint i64 %114, 6912
  %add.ptr.27 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %115
  %116 = load i32, ptr addrspace(1) %add.ptr.27, align 1
  %add.ptr21.27 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %115
  %117 = load i32, ptr addrspace(1) %add.ptr21.27, align 1
  %cmp25104 = icmp sgt i32 %iterations, 0
  br i1 %cmp25104, label %for.cond30.preheader, label %for.cond49.preheader

for.cond30.preheader:                             ; preds = %entry, %for.cond30.preheader
  %sums.sroa.110.0 = phi <4 x i32> [ %145, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.106.0 = phi <4 x i32> [ %144, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.102.0 = phi <4 x i32> [ %143, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.98.0 = phi <4 x i32> [ %142, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.94.0 = phi <4 x i32> [ %141, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.90.0 = phi <4 x i32> [ %140, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.86.0 = phi <4 x i32> [ %139, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.82.0 = phi <4 x i32> [ %138, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.78.0 = phi <4 x i32> [ %137, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.74.0 = phi <4 x i32> [ %136, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.70.0 = phi <4 x i32> [ %135, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.66.0 = phi <4 x i32> [ %134, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.62.0 = phi <4 x i32> [ %133, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.58.0 = phi <4 x i32> [ %132, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.54.0 = phi <4 x i32> [ %131, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.50.0 = phi <4 x i32> [ %130, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.46.0 = phi <4 x i32> [ %129, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.42.0 = phi <4 x i32> [ %128, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.38.0 = phi <4 x i32> [ %127, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.34.0 = phi <4 x i32> [ %126, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.30.0 = phi <4 x i32> [ %125, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.26.0 = phi <4 x i32> [ %124, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.22.0 = phi <4 x i32> [ %123, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.18.0 = phi <4 x i32> [ %122, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.14.0 = phi <4 x i32> [ %121, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.10.0 = phi <4 x i32> [ %120, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.6.0 = phi <4 x i32> [ %119, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.0.0 = phi <4 x i32> [ %118, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %iteration.0105 = phi i32 [ %inc46, %for.cond30.preheader ], [ 0, %entry ]
  %118 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %8, i32 %9, <4 x i32> %sums.sroa.0.0), !call_argsrelate !27
  %119 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %12, i32 %13, <4 x i32> %sums.sroa.6.0), !call_argsrelate !27
  %120 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %16, i32 %17, <4 x i32> %sums.sroa.10.0), !call_argsrelate !27
  %121 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %20, i32 %21, <4 x i32> %sums.sroa.14.0), !call_argsrelate !27
  %122 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %24, i32 %25, <4 x i32> %sums.sroa.18.0), !call_argsrelate !27
  %123 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %28, i32 %29, <4 x i32> %sums.sroa.22.0), !call_argsrelate !27
  %124 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %32, i32 %33, <4 x i32> %sums.sroa.26.0), !call_argsrelate !27
  %125 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %36, i32 %37, <4 x i32> %sums.sroa.30.0), !call_argsrelate !27
  %126 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %40, i32 %41, <4 x i32> %sums.sroa.34.0), !call_argsrelate !27
  %127 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %44, i32 %45, <4 x i32> %sums.sroa.38.0), !call_argsrelate !27
  %128 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %48, i32 %49, <4 x i32> %sums.sroa.42.0), !call_argsrelate !27
  %129 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %52, i32 %53, <4 x i32> %sums.sroa.46.0), !call_argsrelate !27
  %130 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %56, i32 %57, <4 x i32> %sums.sroa.50.0), !call_argsrelate !27
  %131 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %60, i32 %61, <4 x i32> %sums.sroa.54.0), !call_argsrelate !27
  %132 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %64, i32 %65, <4 x i32> %sums.sroa.58.0), !call_argsrelate !27
  %133 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %68, i32 %69, <4 x i32> %sums.sroa.62.0), !call_argsrelate !27
  %134 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %72, i32 %73, <4 x i32> %sums.sroa.66.0), !call_argsrelate !27
  %135 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %76, i32 %77, <4 x i32> %sums.sroa.70.0), !call_argsrelate !27
  %136 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %80, i32 %81, <4 x i32> %sums.sroa.74.0), !call_argsrelate !27
  %137 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %84, i32 %85, <4 x i32> %sums.sroa.78.0), !call_argsrelate !27
  %138 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %88, i32 %89, <4 x i32> %sums.sroa.82.0), !call_argsrelate !27
  %139 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %92, i32 %93, <4 x i32> %sums.sroa.86.0), !call_argsrelate !27
  %140 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %96, i32 %97, <4 x i32> %sums.sroa.90.0), !call_argsrelate !27
  %141 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %100, i32 %101, <4 x i32> %sums.sroa.94.0), !call_argsrelate !27
  %142 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %104, i32 %105, <4 x i32> %sums.sroa.98.0), !call_argsrelate !27
  %143 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %108, i32 %109, <4 x i32> %sums.sroa.102.0), !call_argsrelate !27
  %144 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %112, i32 %113, <4 x i32> %sums.sroa.106.0), !call_argsrelate !27
  %145 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %116, i32 %117, <4 x i32> %sums.sroa.110.0), !call_argsrelate !27
  %inc46 = add nuw nsw i32 %iteration.0105, 1
  %exitcond.not = icmp eq i32 %inc46, %iterations
  br i1 %exitcond.not, label %for.cond49.preheader, label %for.cond30.preheader, !llvm.loop !45

for.cond49.preheader:                             ; preds = %for.cond30.preheader, %entry
  %sums.sroa.110.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %145, %for.cond30.preheader ]
  %sums.sroa.106.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %144, %for.cond30.preheader ]
  %sums.sroa.102.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %143, %for.cond30.preheader ]
  %sums.sroa.98.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %142, %for.cond30.preheader ]
  %sums.sroa.94.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %141, %for.cond30.preheader ]
  %sums.sroa.90.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %140, %for.cond30.preheader ]
  %sums.sroa.86.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %139, %for.cond30.preheader ]
  %sums.sroa.82.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %138, %for.cond30.preheader ]
  %sums.sroa.78.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %137, %for.cond30.preheader ]
  %sums.sroa.74.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %136, %for.cond30.preheader ]
  %sums.sroa.70.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %135, %for.cond30.preheader ]
  %sums.sroa.66.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %134, %for.cond30.preheader ]
  %sums.sroa.62.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %133, %for.cond30.preheader ]
  %sums.sroa.58.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %132, %for.cond30.preheader ]
  %sums.sroa.54.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %131, %for.cond30.preheader ]
  %sums.sroa.50.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %130, %for.cond30.preheader ]
  %sums.sroa.46.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %129, %for.cond30.preheader ]
  %sums.sroa.42.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %128, %for.cond30.preheader ]
  %sums.sroa.38.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %127, %for.cond30.preheader ]
  %sums.sroa.34.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %126, %for.cond30.preheader ]
  %sums.sroa.30.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %125, %for.cond30.preheader ]
  %sums.sroa.26.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %124, %for.cond30.preheader ]
  %sums.sroa.22.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %123, %for.cond30.preheader ]
  %sums.sroa.18.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %122, %for.cond30.preheader ]
  %sums.sroa.14.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %121, %for.cond30.preheader ]
  %sums.sroa.10.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %120, %for.cond30.preheader ]
  %sums.sroa.6.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %119, %for.cond30.preheader ]
  %sums.sroa.0.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %118, %for.cond30.preheader ]
  %146 = lshr i16 %3, 6
  %conv7 = zext nneg i16 %146 to i64
  %147 = tail call noundef range(i32 0, 2147483647) i32 @llvm.mxc.block.id.x(), !range !15
  %conv = zext nneg i32 %147 to i64
  %mul = mul nuw nsw i64 %conv7, %conv
  %div9100 = lshr i32 %0, 6
  %conv10 = zext nneg i32 %div9100 to i64
  %add = add nuw nsw i64 %mul, %conv10
  %conv70 = zext nneg i32 %rem11 to i64
  %mul56 = mul nuw nsw i64 %add, 7168
  %vecext = extractelement <4 x i32> %sums.sroa.0.1, i64 0
  %148 = shl nuw nsw i64 %6, 4
  %add69 = or disjoint i64 %mul56, %148
  %add71 = or disjoint i64 %add69, %conv70
  %arrayidx72 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71
  store i32 %vecext, ptr addrspace(1) %arrayidx72, align 4, !tbaa !16
  %vecext.1 = extractelement <4 x i32> %sums.sroa.0.1, i64 1
  %149 = shl nuw nsw i64 %6, 4
  %150 = or disjoint i64 %149, 16
  %add69.1 = or disjoint i64 %mul56, %150
  %add71.1 = or disjoint i64 %add69.1, %conv70
  %arrayidx72.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1
  store i32 %vecext.1, ptr addrspace(1) %arrayidx72.1, align 4, !tbaa !16
  %vecext.2 = extractelement <4 x i32> %sums.sroa.0.1, i64 2
  %151 = shl nuw nsw i64 %6, 4
  %152 = or disjoint i64 %151, 32
  %add69.2 = or disjoint i64 %mul56, %152
  %add71.2 = or disjoint i64 %add69.2, %conv70
  %arrayidx72.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2
  store i32 %vecext.2, ptr addrspace(1) %arrayidx72.2, align 4, !tbaa !16
  %vecext.3 = extractelement <4 x i32> %sums.sroa.0.1, i64 3
  %153 = shl nuw nsw i64 %6, 4
  %154 = or disjoint i64 %153, 48
  %add69.3 = or disjoint i64 %mul56, %154
  %add71.3 = or disjoint i64 %add69.3, %conv70
  %arrayidx72.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3
  store i32 %vecext.3, ptr addrspace(1) %arrayidx72.3, align 4, !tbaa !16
  %add55.1 = mul nuw nsw i64 %add, 7168
  %mul56.1 = or disjoint i64 %add55.1, 256
  %vecext.1118 = extractelement <4 x i32> %sums.sroa.6.1, i64 0
  %add69.1119 = or disjoint i64 %mul56.1, %148
  %add71.1120 = or disjoint i64 %add69.1119, %conv70
  %arrayidx72.1121 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1120
  store i32 %vecext.1118, ptr addrspace(1) %arrayidx72.1121, align 4, !tbaa !16
  %vecext.1.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 1
  %add69.1.1 = or disjoint i64 %mul56.1, %150
  %add71.1.1 = or disjoint i64 %add69.1.1, %conv70
  %arrayidx72.1.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.1
  store i32 %vecext.1.1, ptr addrspace(1) %arrayidx72.1.1, align 4, !tbaa !16
  %vecext.2.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 2
  %add69.2.1 = or disjoint i64 %mul56.1, %152
  %add71.2.1 = or disjoint i64 %add69.2.1, %conv70
  %arrayidx72.2.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.1
  store i32 %vecext.2.1, ptr addrspace(1) %arrayidx72.2.1, align 4, !tbaa !16
  %vecext.3.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 3
  %add69.3.1 = or disjoint i64 %mul56.1, %154
  %add71.3.1 = or disjoint i64 %add69.3.1, %conv70
  %arrayidx72.3.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.1
  store i32 %vecext.3.1, ptr addrspace(1) %arrayidx72.3.1, align 4, !tbaa !16
  %add55.2 = mul nuw nsw i64 %add, 7168
  %mul56.2 = or disjoint i64 %add55.2, 512
  %vecext.2122 = extractelement <4 x i32> %sums.sroa.10.1, i64 0
  %add69.2123 = or disjoint i64 %mul56.2, %148
  %add71.2124 = or disjoint i64 %add69.2123, %conv70
  %arrayidx72.2125 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2124
  store i32 %vecext.2122, ptr addrspace(1) %arrayidx72.2125, align 4, !tbaa !16
  %vecext.1.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 1
  %add69.1.2 = or disjoint i64 %mul56.2, %150
  %add71.1.2 = or disjoint i64 %add69.1.2, %conv70
  %arrayidx72.1.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.2
  store i32 %vecext.1.2, ptr addrspace(1) %arrayidx72.1.2, align 4, !tbaa !16
  %vecext.2.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 2
  %add69.2.2 = or disjoint i64 %mul56.2, %152
  %add71.2.2 = or disjoint i64 %add69.2.2, %conv70
  %arrayidx72.2.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.2
  store i32 %vecext.2.2, ptr addrspace(1) %arrayidx72.2.2, align 4, !tbaa !16
  %vecext.3.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 3
  %add69.3.2 = or disjoint i64 %mul56.2, %154
  %add71.3.2 = or disjoint i64 %add69.3.2, %conv70
  %arrayidx72.3.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.2
  store i32 %vecext.3.2, ptr addrspace(1) %arrayidx72.3.2, align 4, !tbaa !16
  %add55.3 = mul nuw nsw i64 %add, 7168
  %mul56.3 = or disjoint i64 %add55.3, 768
  %vecext.3126 = extractelement <4 x i32> %sums.sroa.14.1, i64 0
  %add69.3127 = or disjoint i64 %mul56.3, %148
  %add71.3128 = or disjoint i64 %add69.3127, %conv70
  %arrayidx72.3129 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3128
  store i32 %vecext.3126, ptr addrspace(1) %arrayidx72.3129, align 4, !tbaa !16
  %vecext.1.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 1
  %add69.1.3 = or disjoint i64 %mul56.3, %150
  %add71.1.3 = or disjoint i64 %add69.1.3, %conv70
  %arrayidx72.1.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.3
  store i32 %vecext.1.3, ptr addrspace(1) %arrayidx72.1.3, align 4, !tbaa !16
  %vecext.2.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 2
  %add69.2.3 = or disjoint i64 %mul56.3, %152
  %add71.2.3 = or disjoint i64 %add69.2.3, %conv70
  %arrayidx72.2.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.3
  store i32 %vecext.2.3, ptr addrspace(1) %arrayidx72.2.3, align 4, !tbaa !16
  %vecext.3.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 3
  %add69.3.3 = or disjoint i64 %mul56.3, %154
  %add71.3.3 = or disjoint i64 %add69.3.3, %conv70
  %arrayidx72.3.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.3
  store i32 %vecext.3.3, ptr addrspace(1) %arrayidx72.3.3, align 4, !tbaa !16
  %add55.4 = mul nuw nsw i64 %add, 7168
  %mul56.4 = add nuw nsw i64 %add55.4, 1024
  %vecext.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 0
  %add69.4 = or disjoint i64 %mul56.4, %148
  %add71.4 = or disjoint i64 %add69.4, %conv70
  %arrayidx72.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.4
  store i32 %vecext.4, ptr addrspace(1) %arrayidx72.4, align 4, !tbaa !16
  %vecext.1.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 1
  %add69.1.4 = or disjoint i64 %mul56.4, %150
  %add71.1.4 = or disjoint i64 %add69.1.4, %conv70
  %arrayidx72.1.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.4
  store i32 %vecext.1.4, ptr addrspace(1) %arrayidx72.1.4, align 4, !tbaa !16
  %vecext.2.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 2
  %add69.2.4 = or disjoint i64 %mul56.4, %152
  %add71.2.4 = or disjoint i64 %add69.2.4, %conv70
  %arrayidx72.2.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.4
  store i32 %vecext.2.4, ptr addrspace(1) %arrayidx72.2.4, align 4, !tbaa !16
  %vecext.3.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 3
  %add69.3.4 = or disjoint i64 %mul56.4, %154
  %add71.3.4 = or disjoint i64 %add69.3.4, %conv70
  %arrayidx72.3.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.4
  store i32 %vecext.3.4, ptr addrspace(1) %arrayidx72.3.4, align 4, !tbaa !16
  %add55.5 = mul nuw nsw i64 %add, 7168
  %mul56.5 = add nuw nsw i64 %add55.5, 1280
  %vecext.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 0
  %add69.5 = or disjoint i64 %mul56.5, %148
  %add71.5 = or disjoint i64 %add69.5, %conv70
  %arrayidx72.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.5
  store i32 %vecext.5, ptr addrspace(1) %arrayidx72.5, align 4, !tbaa !16
  %vecext.1.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 1
  %add69.1.5 = or disjoint i64 %mul56.5, %150
  %add71.1.5 = or disjoint i64 %add69.1.5, %conv70
  %arrayidx72.1.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.5
  store i32 %vecext.1.5, ptr addrspace(1) %arrayidx72.1.5, align 4, !tbaa !16
  %vecext.2.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 2
  %add69.2.5 = or disjoint i64 %mul56.5, %152
  %add71.2.5 = or disjoint i64 %add69.2.5, %conv70
  %arrayidx72.2.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.5
  store i32 %vecext.2.5, ptr addrspace(1) %arrayidx72.2.5, align 4, !tbaa !16
  %vecext.3.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 3
  %add69.3.5 = or disjoint i64 %mul56.5, %154
  %add71.3.5 = or disjoint i64 %add69.3.5, %conv70
  %arrayidx72.3.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.5
  store i32 %vecext.3.5, ptr addrspace(1) %arrayidx72.3.5, align 4, !tbaa !16
  %add55.6 = mul nuw nsw i64 %add, 7168
  %mul56.6 = add nuw nsw i64 %add55.6, 1536
  %vecext.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 0
  %add69.6 = or disjoint i64 %mul56.6, %148
  %add71.6 = or disjoint i64 %add69.6, %conv70
  %arrayidx72.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.6
  store i32 %vecext.6, ptr addrspace(1) %arrayidx72.6, align 4, !tbaa !16
  %vecext.1.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 1
  %add69.1.6 = or disjoint i64 %mul56.6, %150
  %add71.1.6 = or disjoint i64 %add69.1.6, %conv70
  %arrayidx72.1.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.6
  store i32 %vecext.1.6, ptr addrspace(1) %arrayidx72.1.6, align 4, !tbaa !16
  %vecext.2.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 2
  %add69.2.6 = or disjoint i64 %mul56.6, %152
  %add71.2.6 = or disjoint i64 %add69.2.6, %conv70
  %arrayidx72.2.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.6
  store i32 %vecext.2.6, ptr addrspace(1) %arrayidx72.2.6, align 4, !tbaa !16
  %vecext.3.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 3
  %add69.3.6 = or disjoint i64 %mul56.6, %154
  %add71.3.6 = or disjoint i64 %add69.3.6, %conv70
  %arrayidx72.3.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.6
  store i32 %vecext.3.6, ptr addrspace(1) %arrayidx72.3.6, align 4, !tbaa !16
  %add55.7 = mul nuw nsw i64 %add, 7168
  %mul56.7 = add nuw nsw i64 %add55.7, 1792
  %vecext.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 0
  %add69.7 = or disjoint i64 %mul56.7, %148
  %add71.7 = or disjoint i64 %add69.7, %conv70
  %arrayidx72.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.7
  store i32 %vecext.7, ptr addrspace(1) %arrayidx72.7, align 4, !tbaa !16
  %vecext.1.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 1
  %add69.1.7 = or disjoint i64 %mul56.7, %150
  %add71.1.7 = or disjoint i64 %add69.1.7, %conv70
  %arrayidx72.1.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.7
  store i32 %vecext.1.7, ptr addrspace(1) %arrayidx72.1.7, align 4, !tbaa !16
  %vecext.2.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 2
  %add69.2.7 = or disjoint i64 %mul56.7, %152
  %add71.2.7 = or disjoint i64 %add69.2.7, %conv70
  %arrayidx72.2.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.7
  store i32 %vecext.2.7, ptr addrspace(1) %arrayidx72.2.7, align 4, !tbaa !16
  %vecext.3.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 3
  %add69.3.7 = or disjoint i64 %mul56.7, %154
  %add71.3.7 = or disjoint i64 %add69.3.7, %conv70
  %arrayidx72.3.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.7
  store i32 %vecext.3.7, ptr addrspace(1) %arrayidx72.3.7, align 4, !tbaa !16
  %add55.8 = mul nuw nsw i64 %add, 7168
  %mul56.8 = add nuw nsw i64 %add55.8, 2048
  %vecext.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 0
  %add69.8 = or disjoint i64 %mul56.8, %148
  %add71.8 = or disjoint i64 %add69.8, %conv70
  %arrayidx72.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.8
  store i32 %vecext.8, ptr addrspace(1) %arrayidx72.8, align 4, !tbaa !16
  %vecext.1.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 1
  %add69.1.8 = or disjoint i64 %mul56.8, %150
  %add71.1.8 = or disjoint i64 %add69.1.8, %conv70
  %arrayidx72.1.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.8
  store i32 %vecext.1.8, ptr addrspace(1) %arrayidx72.1.8, align 4, !tbaa !16
  %vecext.2.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 2
  %add69.2.8 = or disjoint i64 %mul56.8, %152
  %add71.2.8 = or disjoint i64 %add69.2.8, %conv70
  %arrayidx72.2.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.8
  store i32 %vecext.2.8, ptr addrspace(1) %arrayidx72.2.8, align 4, !tbaa !16
  %vecext.3.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 3
  %add69.3.8 = or disjoint i64 %mul56.8, %154
  %add71.3.8 = or disjoint i64 %add69.3.8, %conv70
  %arrayidx72.3.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.8
  store i32 %vecext.3.8, ptr addrspace(1) %arrayidx72.3.8, align 4, !tbaa !16
  %add55.9 = mul nuw nsw i64 %add, 7168
  %mul56.9 = add nuw nsw i64 %add55.9, 2304
  %vecext.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 0
  %add69.9 = or disjoint i64 %mul56.9, %148
  %add71.9 = or disjoint i64 %add69.9, %conv70
  %arrayidx72.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.9
  store i32 %vecext.9, ptr addrspace(1) %arrayidx72.9, align 4, !tbaa !16
  %vecext.1.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 1
  %add69.1.9 = or disjoint i64 %mul56.9, %150
  %add71.1.9 = or disjoint i64 %add69.1.9, %conv70
  %arrayidx72.1.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.9
  store i32 %vecext.1.9, ptr addrspace(1) %arrayidx72.1.9, align 4, !tbaa !16
  %vecext.2.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 2
  %add69.2.9 = or disjoint i64 %mul56.9, %152
  %add71.2.9 = or disjoint i64 %add69.2.9, %conv70
  %arrayidx72.2.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.9
  store i32 %vecext.2.9, ptr addrspace(1) %arrayidx72.2.9, align 4, !tbaa !16
  %vecext.3.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 3
  %add69.3.9 = or disjoint i64 %mul56.9, %154
  %add71.3.9 = or disjoint i64 %add69.3.9, %conv70
  %arrayidx72.3.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.9
  store i32 %vecext.3.9, ptr addrspace(1) %arrayidx72.3.9, align 4, !tbaa !16
  %add55.10 = mul nuw nsw i64 %add, 7168
  %mul56.10 = add nuw nsw i64 %add55.10, 2560
  %vecext.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 0
  %add69.10 = or disjoint i64 %mul56.10, %148
  %add71.10 = or disjoint i64 %add69.10, %conv70
  %arrayidx72.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.10
  store i32 %vecext.10, ptr addrspace(1) %arrayidx72.10, align 4, !tbaa !16
  %vecext.1.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 1
  %add69.1.10 = or disjoint i64 %mul56.10, %150
  %add71.1.10 = or disjoint i64 %add69.1.10, %conv70
  %arrayidx72.1.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.10
  store i32 %vecext.1.10, ptr addrspace(1) %arrayidx72.1.10, align 4, !tbaa !16
  %vecext.2.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 2
  %add69.2.10 = or disjoint i64 %mul56.10, %152
  %add71.2.10 = or disjoint i64 %add69.2.10, %conv70
  %arrayidx72.2.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.10
  store i32 %vecext.2.10, ptr addrspace(1) %arrayidx72.2.10, align 4, !tbaa !16
  %vecext.3.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 3
  %add69.3.10 = or disjoint i64 %mul56.10, %154
  %add71.3.10 = or disjoint i64 %add69.3.10, %conv70
  %arrayidx72.3.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.10
  store i32 %vecext.3.10, ptr addrspace(1) %arrayidx72.3.10, align 4, !tbaa !16
  %add55.11 = mul nuw nsw i64 %add, 7168
  %mul56.11 = add nuw nsw i64 %add55.11, 2816
  %vecext.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 0
  %add69.11 = or disjoint i64 %mul56.11, %148
  %add71.11 = or disjoint i64 %add69.11, %conv70
  %arrayidx72.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.11
  store i32 %vecext.11, ptr addrspace(1) %arrayidx72.11, align 4, !tbaa !16
  %vecext.1.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 1
  %add69.1.11 = or disjoint i64 %mul56.11, %150
  %add71.1.11 = or disjoint i64 %add69.1.11, %conv70
  %arrayidx72.1.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.11
  store i32 %vecext.1.11, ptr addrspace(1) %arrayidx72.1.11, align 4, !tbaa !16
  %vecext.2.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 2
  %add69.2.11 = or disjoint i64 %mul56.11, %152
  %add71.2.11 = or disjoint i64 %add69.2.11, %conv70
  %arrayidx72.2.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.11
  store i32 %vecext.2.11, ptr addrspace(1) %arrayidx72.2.11, align 4, !tbaa !16
  %vecext.3.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 3
  %add69.3.11 = or disjoint i64 %mul56.11, %154
  %add71.3.11 = or disjoint i64 %add69.3.11, %conv70
  %arrayidx72.3.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.11
  store i32 %vecext.3.11, ptr addrspace(1) %arrayidx72.3.11, align 4, !tbaa !16
  %add55.12 = mul nuw nsw i64 %add, 7168
  %mul56.12 = add nuw nsw i64 %add55.12, 3072
  %vecext.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 0
  %add69.12 = or disjoint i64 %mul56.12, %148
  %add71.12 = or disjoint i64 %add69.12, %conv70
  %arrayidx72.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.12
  store i32 %vecext.12, ptr addrspace(1) %arrayidx72.12, align 4, !tbaa !16
  %vecext.1.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 1
  %add69.1.12 = or disjoint i64 %mul56.12, %150
  %add71.1.12 = or disjoint i64 %add69.1.12, %conv70
  %arrayidx72.1.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.12
  store i32 %vecext.1.12, ptr addrspace(1) %arrayidx72.1.12, align 4, !tbaa !16
  %vecext.2.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 2
  %add69.2.12 = or disjoint i64 %mul56.12, %152
  %add71.2.12 = or disjoint i64 %add69.2.12, %conv70
  %arrayidx72.2.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.12
  store i32 %vecext.2.12, ptr addrspace(1) %arrayidx72.2.12, align 4, !tbaa !16
  %vecext.3.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 3
  %add69.3.12 = or disjoint i64 %mul56.12, %154
  %add71.3.12 = or disjoint i64 %add69.3.12, %conv70
  %arrayidx72.3.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.12
  store i32 %vecext.3.12, ptr addrspace(1) %arrayidx72.3.12, align 4, !tbaa !16
  %add55.13 = mul nuw nsw i64 %add, 7168
  %mul56.13 = add nuw nsw i64 %add55.13, 3328
  %vecext.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 0
  %add69.13 = or disjoint i64 %mul56.13, %148
  %add71.13 = or disjoint i64 %add69.13, %conv70
  %arrayidx72.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.13
  store i32 %vecext.13, ptr addrspace(1) %arrayidx72.13, align 4, !tbaa !16
  %vecext.1.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 1
  %add69.1.13 = or disjoint i64 %mul56.13, %150
  %add71.1.13 = or disjoint i64 %add69.1.13, %conv70
  %arrayidx72.1.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.13
  store i32 %vecext.1.13, ptr addrspace(1) %arrayidx72.1.13, align 4, !tbaa !16
  %vecext.2.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 2
  %add69.2.13 = or disjoint i64 %mul56.13, %152
  %add71.2.13 = or disjoint i64 %add69.2.13, %conv70
  %arrayidx72.2.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.13
  store i32 %vecext.2.13, ptr addrspace(1) %arrayidx72.2.13, align 4, !tbaa !16
  %vecext.3.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 3
  %add69.3.13 = or disjoint i64 %mul56.13, %154
  %add71.3.13 = or disjoint i64 %add69.3.13, %conv70
  %arrayidx72.3.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.13
  store i32 %vecext.3.13, ptr addrspace(1) %arrayidx72.3.13, align 4, !tbaa !16
  %add55.14 = mul nuw nsw i64 %add, 7168
  %mul56.14 = add nuw nsw i64 %add55.14, 3584
  %vecext.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 0
  %add69.14 = or disjoint i64 %mul56.14, %148
  %add71.14 = or disjoint i64 %add69.14, %conv70
  %arrayidx72.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.14
  store i32 %vecext.14, ptr addrspace(1) %arrayidx72.14, align 4, !tbaa !16
  %vecext.1.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 1
  %add69.1.14 = or disjoint i64 %mul56.14, %150
  %add71.1.14 = or disjoint i64 %add69.1.14, %conv70
  %arrayidx72.1.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.14
  store i32 %vecext.1.14, ptr addrspace(1) %arrayidx72.1.14, align 4, !tbaa !16
  %vecext.2.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 2
  %add69.2.14 = or disjoint i64 %mul56.14, %152
  %add71.2.14 = or disjoint i64 %add69.2.14, %conv70
  %arrayidx72.2.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.14
  store i32 %vecext.2.14, ptr addrspace(1) %arrayidx72.2.14, align 4, !tbaa !16
  %vecext.3.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 3
  %add69.3.14 = or disjoint i64 %mul56.14, %154
  %add71.3.14 = or disjoint i64 %add69.3.14, %conv70
  %arrayidx72.3.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.14
  store i32 %vecext.3.14, ptr addrspace(1) %arrayidx72.3.14, align 4, !tbaa !16
  %add55.15 = mul nuw nsw i64 %add, 7168
  %mul56.15 = add nuw nsw i64 %add55.15, 3840
  %vecext.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 0
  %add69.15 = or disjoint i64 %mul56.15, %148
  %add71.15 = or disjoint i64 %add69.15, %conv70
  %arrayidx72.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.15
  store i32 %vecext.15, ptr addrspace(1) %arrayidx72.15, align 4, !tbaa !16
  %vecext.1.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 1
  %add69.1.15 = or disjoint i64 %mul56.15, %150
  %add71.1.15 = or disjoint i64 %add69.1.15, %conv70
  %arrayidx72.1.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.15
  store i32 %vecext.1.15, ptr addrspace(1) %arrayidx72.1.15, align 4, !tbaa !16
  %vecext.2.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 2
  %add69.2.15 = or disjoint i64 %mul56.15, %152
  %add71.2.15 = or disjoint i64 %add69.2.15, %conv70
  %arrayidx72.2.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.15
  store i32 %vecext.2.15, ptr addrspace(1) %arrayidx72.2.15, align 4, !tbaa !16
  %vecext.3.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 3
  %add69.3.15 = or disjoint i64 %mul56.15, %154
  %add71.3.15 = or disjoint i64 %add69.3.15, %conv70
  %arrayidx72.3.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.15
  store i32 %vecext.3.15, ptr addrspace(1) %arrayidx72.3.15, align 4, !tbaa !16
  %add55.16 = mul nuw nsw i64 %add, 7168
  %mul56.16 = add nuw nsw i64 %add55.16, 4096
  %vecext.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 0
  %add69.16 = or disjoint i64 %mul56.16, %148
  %add71.16 = or disjoint i64 %add69.16, %conv70
  %arrayidx72.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.16
  store i32 %vecext.16, ptr addrspace(1) %arrayidx72.16, align 4, !tbaa !16
  %vecext.1.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 1
  %add69.1.16 = or disjoint i64 %mul56.16, %150
  %add71.1.16 = or disjoint i64 %add69.1.16, %conv70
  %arrayidx72.1.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.16
  store i32 %vecext.1.16, ptr addrspace(1) %arrayidx72.1.16, align 4, !tbaa !16
  %vecext.2.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 2
  %add69.2.16 = or disjoint i64 %mul56.16, %152
  %add71.2.16 = or disjoint i64 %add69.2.16, %conv70
  %arrayidx72.2.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.16
  store i32 %vecext.2.16, ptr addrspace(1) %arrayidx72.2.16, align 4, !tbaa !16
  %vecext.3.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 3
  %add69.3.16 = or disjoint i64 %mul56.16, %154
  %add71.3.16 = or disjoint i64 %add69.3.16, %conv70
  %arrayidx72.3.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.16
  store i32 %vecext.3.16, ptr addrspace(1) %arrayidx72.3.16, align 4, !tbaa !16
  %add55.17 = mul nuw nsw i64 %add, 7168
  %mul56.17 = add nuw nsw i64 %add55.17, 4352
  %vecext.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 0
  %add69.17 = or disjoint i64 %mul56.17, %148
  %add71.17 = or disjoint i64 %add69.17, %conv70
  %arrayidx72.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.17
  store i32 %vecext.17, ptr addrspace(1) %arrayidx72.17, align 4, !tbaa !16
  %vecext.1.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 1
  %add69.1.17 = or disjoint i64 %mul56.17, %150
  %add71.1.17 = or disjoint i64 %add69.1.17, %conv70
  %arrayidx72.1.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.17
  store i32 %vecext.1.17, ptr addrspace(1) %arrayidx72.1.17, align 4, !tbaa !16
  %vecext.2.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 2
  %add69.2.17 = or disjoint i64 %mul56.17, %152
  %add71.2.17 = or disjoint i64 %add69.2.17, %conv70
  %arrayidx72.2.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.17
  store i32 %vecext.2.17, ptr addrspace(1) %arrayidx72.2.17, align 4, !tbaa !16
  %vecext.3.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 3
  %add69.3.17 = or disjoint i64 %mul56.17, %154
  %add71.3.17 = or disjoint i64 %add69.3.17, %conv70
  %arrayidx72.3.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.17
  store i32 %vecext.3.17, ptr addrspace(1) %arrayidx72.3.17, align 4, !tbaa !16
  %add55.18 = mul nuw nsw i64 %add, 7168
  %mul56.18 = add nuw nsw i64 %add55.18, 4608
  %vecext.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 0
  %add69.18 = or disjoint i64 %mul56.18, %148
  %add71.18 = or disjoint i64 %add69.18, %conv70
  %arrayidx72.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.18
  store i32 %vecext.18, ptr addrspace(1) %arrayidx72.18, align 4, !tbaa !16
  %vecext.1.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 1
  %add69.1.18 = or disjoint i64 %mul56.18, %150
  %add71.1.18 = or disjoint i64 %add69.1.18, %conv70
  %arrayidx72.1.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.18
  store i32 %vecext.1.18, ptr addrspace(1) %arrayidx72.1.18, align 4, !tbaa !16
  %vecext.2.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 2
  %add69.2.18 = or disjoint i64 %mul56.18, %152
  %add71.2.18 = or disjoint i64 %add69.2.18, %conv70
  %arrayidx72.2.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.18
  store i32 %vecext.2.18, ptr addrspace(1) %arrayidx72.2.18, align 4, !tbaa !16
  %vecext.3.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 3
  %add69.3.18 = or disjoint i64 %mul56.18, %154
  %add71.3.18 = or disjoint i64 %add69.3.18, %conv70
  %arrayidx72.3.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.18
  store i32 %vecext.3.18, ptr addrspace(1) %arrayidx72.3.18, align 4, !tbaa !16
  %add55.19 = mul nuw nsw i64 %add, 7168
  %mul56.19 = add nuw nsw i64 %add55.19, 4864
  %vecext.19 = extractelement <4 x i32> %sums.sroa.78.1, i64 0
  %add69.19 = or disjoint i64 %mul56.19, %148
  %add71.19 = or disjoint i64 %add69.19, %conv70
  %arrayidx72.19 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.19
  store i32 %vecext.19, ptr addrspace(1) %arrayidx72.19, align 4, !tbaa !16
  %vecext.1.19 = extractelement <4 x i32> %sums.sroa.78.1, i64 1
  %add69.1.19 = or disjoint i64 %mul56.19, %150
  %add71.1.19 = or disjoint i64 %add69.1.19, %conv70
  %arrayidx72.1.19 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.19
  store i32 %vecext.1.19, ptr addrspace(1) %arrayidx72.1.19, align 4, !tbaa !16
  %vecext.2.19 = extractelement <4 x i32> %sums.sroa.78.1, i64 2
  %add69.2.19 = or disjoint i64 %mul56.19, %152
  %add71.2.19 = or disjoint i64 %add69.2.19, %conv70
  %arrayidx72.2.19 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.19
  store i32 %vecext.2.19, ptr addrspace(1) %arrayidx72.2.19, align 4, !tbaa !16
  %vecext.3.19 = extractelement <4 x i32> %sums.sroa.78.1, i64 3
  %add69.3.19 = or disjoint i64 %mul56.19, %154
  %add71.3.19 = or disjoint i64 %add69.3.19, %conv70
  %arrayidx72.3.19 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.19
  store i32 %vecext.3.19, ptr addrspace(1) %arrayidx72.3.19, align 4, !tbaa !16
  %add55.20 = mul nuw nsw i64 %add, 7168
  %mul56.20 = add nuw nsw i64 %add55.20, 5120
  %vecext.20 = extractelement <4 x i32> %sums.sroa.82.1, i64 0
  %add69.20 = or disjoint i64 %mul56.20, %148
  %add71.20 = or disjoint i64 %add69.20, %conv70
  %arrayidx72.20 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.20
  store i32 %vecext.20, ptr addrspace(1) %arrayidx72.20, align 4, !tbaa !16
  %vecext.1.20 = extractelement <4 x i32> %sums.sroa.82.1, i64 1
  %add69.1.20 = or disjoint i64 %mul56.20, %150
  %add71.1.20 = or disjoint i64 %add69.1.20, %conv70
  %arrayidx72.1.20 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.20
  store i32 %vecext.1.20, ptr addrspace(1) %arrayidx72.1.20, align 4, !tbaa !16
  %vecext.2.20 = extractelement <4 x i32> %sums.sroa.82.1, i64 2
  %add69.2.20 = or disjoint i64 %mul56.20, %152
  %add71.2.20 = or disjoint i64 %add69.2.20, %conv70
  %arrayidx72.2.20 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.20
  store i32 %vecext.2.20, ptr addrspace(1) %arrayidx72.2.20, align 4, !tbaa !16
  %vecext.3.20 = extractelement <4 x i32> %sums.sroa.82.1, i64 3
  %add69.3.20 = or disjoint i64 %mul56.20, %154
  %add71.3.20 = or disjoint i64 %add69.3.20, %conv70
  %arrayidx72.3.20 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.20
  store i32 %vecext.3.20, ptr addrspace(1) %arrayidx72.3.20, align 4, !tbaa !16
  %add55.21 = mul nuw nsw i64 %add, 7168
  %mul56.21 = add nuw nsw i64 %add55.21, 5376
  %vecext.21 = extractelement <4 x i32> %sums.sroa.86.1, i64 0
  %add69.21 = or disjoint i64 %mul56.21, %148
  %add71.21 = or disjoint i64 %add69.21, %conv70
  %arrayidx72.21 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.21
  store i32 %vecext.21, ptr addrspace(1) %arrayidx72.21, align 4, !tbaa !16
  %vecext.1.21 = extractelement <4 x i32> %sums.sroa.86.1, i64 1
  %add69.1.21 = or disjoint i64 %mul56.21, %150
  %add71.1.21 = or disjoint i64 %add69.1.21, %conv70
  %arrayidx72.1.21 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.21
  store i32 %vecext.1.21, ptr addrspace(1) %arrayidx72.1.21, align 4, !tbaa !16
  %vecext.2.21 = extractelement <4 x i32> %sums.sroa.86.1, i64 2
  %add69.2.21 = or disjoint i64 %mul56.21, %152
  %add71.2.21 = or disjoint i64 %add69.2.21, %conv70
  %arrayidx72.2.21 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.21
  store i32 %vecext.2.21, ptr addrspace(1) %arrayidx72.2.21, align 4, !tbaa !16
  %vecext.3.21 = extractelement <4 x i32> %sums.sroa.86.1, i64 3
  %add69.3.21 = or disjoint i64 %mul56.21, %154
  %add71.3.21 = or disjoint i64 %add69.3.21, %conv70
  %arrayidx72.3.21 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.21
  store i32 %vecext.3.21, ptr addrspace(1) %arrayidx72.3.21, align 4, !tbaa !16
  %add55.22 = mul nuw nsw i64 %add, 7168
  %mul56.22 = add nuw nsw i64 %add55.22, 5632
  %vecext.22 = extractelement <4 x i32> %sums.sroa.90.1, i64 0
  %add69.22 = or disjoint i64 %mul56.22, %148
  %add71.22 = or disjoint i64 %add69.22, %conv70
  %arrayidx72.22 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.22
  store i32 %vecext.22, ptr addrspace(1) %arrayidx72.22, align 4, !tbaa !16
  %vecext.1.22 = extractelement <4 x i32> %sums.sroa.90.1, i64 1
  %add69.1.22 = or disjoint i64 %mul56.22, %150
  %add71.1.22 = or disjoint i64 %add69.1.22, %conv70
  %arrayidx72.1.22 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.22
  store i32 %vecext.1.22, ptr addrspace(1) %arrayidx72.1.22, align 4, !tbaa !16
  %vecext.2.22 = extractelement <4 x i32> %sums.sroa.90.1, i64 2
  %add69.2.22 = or disjoint i64 %mul56.22, %152
  %add71.2.22 = or disjoint i64 %add69.2.22, %conv70
  %arrayidx72.2.22 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.22
  store i32 %vecext.2.22, ptr addrspace(1) %arrayidx72.2.22, align 4, !tbaa !16
  %vecext.3.22 = extractelement <4 x i32> %sums.sroa.90.1, i64 3
  %add69.3.22 = or disjoint i64 %mul56.22, %154
  %add71.3.22 = or disjoint i64 %add69.3.22, %conv70
  %arrayidx72.3.22 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.22
  store i32 %vecext.3.22, ptr addrspace(1) %arrayidx72.3.22, align 4, !tbaa !16
  %add55.23 = mul nuw nsw i64 %add, 7168
  %mul56.23 = add nuw nsw i64 %add55.23, 5888
  %vecext.23 = extractelement <4 x i32> %sums.sroa.94.1, i64 0
  %add69.23 = or disjoint i64 %mul56.23, %148
  %add71.23 = or disjoint i64 %add69.23, %conv70
  %arrayidx72.23 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.23
  store i32 %vecext.23, ptr addrspace(1) %arrayidx72.23, align 4, !tbaa !16
  %vecext.1.23 = extractelement <4 x i32> %sums.sroa.94.1, i64 1
  %add69.1.23 = or disjoint i64 %mul56.23, %150
  %add71.1.23 = or disjoint i64 %add69.1.23, %conv70
  %arrayidx72.1.23 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.23
  store i32 %vecext.1.23, ptr addrspace(1) %arrayidx72.1.23, align 4, !tbaa !16
  %vecext.2.23 = extractelement <4 x i32> %sums.sroa.94.1, i64 2
  %add69.2.23 = or disjoint i64 %mul56.23, %152
  %add71.2.23 = or disjoint i64 %add69.2.23, %conv70
  %arrayidx72.2.23 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.23
  store i32 %vecext.2.23, ptr addrspace(1) %arrayidx72.2.23, align 4, !tbaa !16
  %vecext.3.23 = extractelement <4 x i32> %sums.sroa.94.1, i64 3
  %add69.3.23 = or disjoint i64 %mul56.23, %154
  %add71.3.23 = or disjoint i64 %add69.3.23, %conv70
  %arrayidx72.3.23 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.23
  store i32 %vecext.3.23, ptr addrspace(1) %arrayidx72.3.23, align 4, !tbaa !16
  %add55.24 = mul nuw nsw i64 %add, 7168
  %mul56.24 = add nuw nsw i64 %add55.24, 6144
  %vecext.24 = extractelement <4 x i32> %sums.sroa.98.1, i64 0
  %add69.24 = or disjoint i64 %mul56.24, %148
  %add71.24 = or disjoint i64 %add69.24, %conv70
  %arrayidx72.24 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.24
  store i32 %vecext.24, ptr addrspace(1) %arrayidx72.24, align 4, !tbaa !16
  %vecext.1.24 = extractelement <4 x i32> %sums.sroa.98.1, i64 1
  %add69.1.24 = or disjoint i64 %mul56.24, %150
  %add71.1.24 = or disjoint i64 %add69.1.24, %conv70
  %arrayidx72.1.24 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.24
  store i32 %vecext.1.24, ptr addrspace(1) %arrayidx72.1.24, align 4, !tbaa !16
  %vecext.2.24 = extractelement <4 x i32> %sums.sroa.98.1, i64 2
  %add69.2.24 = or disjoint i64 %mul56.24, %152
  %add71.2.24 = or disjoint i64 %add69.2.24, %conv70
  %arrayidx72.2.24 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.24
  store i32 %vecext.2.24, ptr addrspace(1) %arrayidx72.2.24, align 4, !tbaa !16
  %vecext.3.24 = extractelement <4 x i32> %sums.sroa.98.1, i64 3
  %add69.3.24 = or disjoint i64 %mul56.24, %154
  %add71.3.24 = or disjoint i64 %add69.3.24, %conv70
  %arrayidx72.3.24 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.24
  store i32 %vecext.3.24, ptr addrspace(1) %arrayidx72.3.24, align 4, !tbaa !16
  %add55.25 = mul nuw nsw i64 %add, 7168
  %mul56.25 = add nuw nsw i64 %add55.25, 6400
  %vecext.25 = extractelement <4 x i32> %sums.sroa.102.1, i64 0
  %add69.25 = or disjoint i64 %mul56.25, %148
  %add71.25 = or disjoint i64 %add69.25, %conv70
  %arrayidx72.25 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.25
  store i32 %vecext.25, ptr addrspace(1) %arrayidx72.25, align 4, !tbaa !16
  %vecext.1.25 = extractelement <4 x i32> %sums.sroa.102.1, i64 1
  %add69.1.25 = or disjoint i64 %mul56.25, %150
  %add71.1.25 = or disjoint i64 %add69.1.25, %conv70
  %arrayidx72.1.25 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.25
  store i32 %vecext.1.25, ptr addrspace(1) %arrayidx72.1.25, align 4, !tbaa !16
  %vecext.2.25 = extractelement <4 x i32> %sums.sroa.102.1, i64 2
  %add69.2.25 = or disjoint i64 %mul56.25, %152
  %add71.2.25 = or disjoint i64 %add69.2.25, %conv70
  %arrayidx72.2.25 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.25
  store i32 %vecext.2.25, ptr addrspace(1) %arrayidx72.2.25, align 4, !tbaa !16
  %vecext.3.25 = extractelement <4 x i32> %sums.sroa.102.1, i64 3
  %add69.3.25 = or disjoint i64 %mul56.25, %154
  %add71.3.25 = or disjoint i64 %add69.3.25, %conv70
  %arrayidx72.3.25 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.25
  store i32 %vecext.3.25, ptr addrspace(1) %arrayidx72.3.25, align 4, !tbaa !16
  %add55.26 = mul nuw nsw i64 %add, 7168
  %mul56.26 = add nuw nsw i64 %add55.26, 6656
  %vecext.26 = extractelement <4 x i32> %sums.sroa.106.1, i64 0
  %add69.26 = or disjoint i64 %mul56.26, %148
  %add71.26 = or disjoint i64 %add69.26, %conv70
  %arrayidx72.26 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.26
  store i32 %vecext.26, ptr addrspace(1) %arrayidx72.26, align 4, !tbaa !16
  %vecext.1.26 = extractelement <4 x i32> %sums.sroa.106.1, i64 1
  %add69.1.26 = or disjoint i64 %mul56.26, %150
  %add71.1.26 = or disjoint i64 %add69.1.26, %conv70
  %arrayidx72.1.26 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.26
  store i32 %vecext.1.26, ptr addrspace(1) %arrayidx72.1.26, align 4, !tbaa !16
  %vecext.2.26 = extractelement <4 x i32> %sums.sroa.106.1, i64 2
  %add69.2.26 = or disjoint i64 %mul56.26, %152
  %add71.2.26 = or disjoint i64 %add69.2.26, %conv70
  %arrayidx72.2.26 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.26
  store i32 %vecext.2.26, ptr addrspace(1) %arrayidx72.2.26, align 4, !tbaa !16
  %vecext.3.26 = extractelement <4 x i32> %sums.sroa.106.1, i64 3
  %add69.3.26 = or disjoint i64 %mul56.26, %154
  %add71.3.26 = or disjoint i64 %add69.3.26, %conv70
  %arrayidx72.3.26 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.26
  store i32 %vecext.3.26, ptr addrspace(1) %arrayidx72.3.26, align 4, !tbaa !16
  %add55.27 = mul nuw nsw i64 %add, 7168
  %mul56.27 = add nuw nsw i64 %add55.27, 6912
  %vecext.27 = extractelement <4 x i32> %sums.sroa.110.1, i64 0
  %add69.27 = or disjoint i64 %mul56.27, %148
  %add71.27 = or disjoint i64 %add69.27, %conv70
  %arrayidx72.27 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.27
  store i32 %vecext.27, ptr addrspace(1) %arrayidx72.27, align 4, !tbaa !16
  %vecext.1.27 = extractelement <4 x i32> %sums.sroa.110.1, i64 1
  %add69.1.27 = or disjoint i64 %mul56.27, %150
  %add71.1.27 = or disjoint i64 %add69.1.27, %conv70
  %arrayidx72.1.27 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.27
  store i32 %vecext.1.27, ptr addrspace(1) %arrayidx72.1.27, align 4, !tbaa !16
  %vecext.2.27 = extractelement <4 x i32> %sums.sroa.110.1, i64 2
  %add69.2.27 = or disjoint i64 %mul56.27, %152
  %add71.2.27 = or disjoint i64 %add69.2.27, %conv70
  %arrayidx72.2.27 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.27
  store i32 %vecext.2.27, ptr addrspace(1) %arrayidx72.2.27, align 4, !tbaa !16
  %vecext.3.27 = extractelement <4 x i32> %sums.sroa.110.1, i64 3
  %add69.3.27 = or disjoint i64 %mul56.27, %154
  %add71.3.27 = or disjoint i64 %add69.3.27, %conv70
  %arrayidx72.3.27 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.27
  store i32 %vecext.3.27, ptr addrspace(1) %arrayidx72.3.27, align 4, !tbaa !16
  ret void
}

; Function Attrs: convergent mustprogress nofree norecurse nounwind memory(argmem: readwrite)
define protected metaxgpu_kernel void @_Z13mmaPeakKernelILi29EEvPKaS1_Pii(ptr addrspace(1) noalias nocapture noundef readonly %a.coerce, ptr addrspace(1) noalias nocapture noundef readonly %b.coerce, ptr addrspace(1) noalias noundef writeonly %c.coerce, i32 noundef %iterations) local_unnamed_addr #3 comdat {
entry:
  %0 = tail call noundef range(i32 0, 1024) i32 @llvm.mxc.thread.id.x(), !range !25
  %1 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.mxc.dispatch.ptr()
  %2 = getelementptr inbounds i8, ptr addrspace(4) %1, i64 4
  %3 = load i16, ptr addrspace(4) %2, align 4, !range !26, !invariant.load !14
  %rem11 = and i32 %0, 15
  %4 = lshr i32 %0, 2
  %mul13 = and i32 %4, 12
  %mul15 = shl nuw nsw i32 %rem11, 4
  %5 = zext nneg i32 %mul15 to i64
  %6 = zext nneg i32 %mul13 to i64
  %7 = or disjoint i64 %5, %6
  %add.ptr = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %7
  %8 = load i32, ptr addrspace(1) %add.ptr, align 1
  %add.ptr21 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %7
  %9 = load i32, ptr addrspace(1) %add.ptr21, align 1
  %10 = or disjoint i64 %5, %6
  %11 = or disjoint i64 %10, 256
  %add.ptr.1 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %11
  %12 = load i32, ptr addrspace(1) %add.ptr.1, align 1
  %add.ptr21.1 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %11
  %13 = load i32, ptr addrspace(1) %add.ptr21.1, align 1
  %14 = or disjoint i64 %5, %6
  %15 = or disjoint i64 %14, 512
  %add.ptr.2 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %15
  %16 = load i32, ptr addrspace(1) %add.ptr.2, align 1
  %add.ptr21.2 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %15
  %17 = load i32, ptr addrspace(1) %add.ptr21.2, align 1
  %18 = or disjoint i64 %5, %6
  %19 = or disjoint i64 %18, 768
  %add.ptr.3 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %19
  %20 = load i32, ptr addrspace(1) %add.ptr.3, align 1
  %add.ptr21.3 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %19
  %21 = load i32, ptr addrspace(1) %add.ptr21.3, align 1
  %22 = or disjoint i64 %5, %6
  %23 = or disjoint i64 %22, 1024
  %add.ptr.4 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %23
  %24 = load i32, ptr addrspace(1) %add.ptr.4, align 1
  %add.ptr21.4 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %23
  %25 = load i32, ptr addrspace(1) %add.ptr21.4, align 1
  %26 = or disjoint i64 %5, %6
  %27 = or disjoint i64 %26, 1280
  %add.ptr.5 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %27
  %28 = load i32, ptr addrspace(1) %add.ptr.5, align 1
  %add.ptr21.5 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %27
  %29 = load i32, ptr addrspace(1) %add.ptr21.5, align 1
  %30 = or disjoint i64 %5, %6
  %31 = or disjoint i64 %30, 1536
  %add.ptr.6 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %31
  %32 = load i32, ptr addrspace(1) %add.ptr.6, align 1
  %add.ptr21.6 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %31
  %33 = load i32, ptr addrspace(1) %add.ptr21.6, align 1
  %34 = or disjoint i64 %5, %6
  %35 = or disjoint i64 %34, 1792
  %add.ptr.7 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %35
  %36 = load i32, ptr addrspace(1) %add.ptr.7, align 1
  %add.ptr21.7 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %35
  %37 = load i32, ptr addrspace(1) %add.ptr21.7, align 1
  %38 = or disjoint i64 %5, %6
  %39 = or disjoint i64 %38, 2048
  %add.ptr.8 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %39
  %40 = load i32, ptr addrspace(1) %add.ptr.8, align 1
  %add.ptr21.8 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %39
  %41 = load i32, ptr addrspace(1) %add.ptr21.8, align 1
  %42 = or disjoint i64 %5, %6
  %43 = or disjoint i64 %42, 2304
  %add.ptr.9 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %43
  %44 = load i32, ptr addrspace(1) %add.ptr.9, align 1
  %add.ptr21.9 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %43
  %45 = load i32, ptr addrspace(1) %add.ptr21.9, align 1
  %46 = or disjoint i64 %5, %6
  %47 = or disjoint i64 %46, 2560
  %add.ptr.10 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %47
  %48 = load i32, ptr addrspace(1) %add.ptr.10, align 1
  %add.ptr21.10 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %47
  %49 = load i32, ptr addrspace(1) %add.ptr21.10, align 1
  %50 = or disjoint i64 %5, %6
  %51 = or disjoint i64 %50, 2816
  %add.ptr.11 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %51
  %52 = load i32, ptr addrspace(1) %add.ptr.11, align 1
  %add.ptr21.11 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %51
  %53 = load i32, ptr addrspace(1) %add.ptr21.11, align 1
  %54 = or disjoint i64 %5, %6
  %55 = or disjoint i64 %54, 3072
  %add.ptr.12 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %55
  %56 = load i32, ptr addrspace(1) %add.ptr.12, align 1
  %add.ptr21.12 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %55
  %57 = load i32, ptr addrspace(1) %add.ptr21.12, align 1
  %58 = or disjoint i64 %5, %6
  %59 = or disjoint i64 %58, 3328
  %add.ptr.13 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %59
  %60 = load i32, ptr addrspace(1) %add.ptr.13, align 1
  %add.ptr21.13 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %59
  %61 = load i32, ptr addrspace(1) %add.ptr21.13, align 1
  %62 = or disjoint i64 %5, %6
  %63 = or disjoint i64 %62, 3584
  %add.ptr.14 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %63
  %64 = load i32, ptr addrspace(1) %add.ptr.14, align 1
  %add.ptr21.14 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %63
  %65 = load i32, ptr addrspace(1) %add.ptr21.14, align 1
  %66 = or disjoint i64 %5, %6
  %67 = or disjoint i64 %66, 3840
  %add.ptr.15 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %67
  %68 = load i32, ptr addrspace(1) %add.ptr.15, align 1
  %add.ptr21.15 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %67
  %69 = load i32, ptr addrspace(1) %add.ptr21.15, align 1
  %70 = or disjoint i64 %5, %6
  %71 = or disjoint i64 %70, 4096
  %add.ptr.16 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %71
  %72 = load i32, ptr addrspace(1) %add.ptr.16, align 1
  %add.ptr21.16 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %71
  %73 = load i32, ptr addrspace(1) %add.ptr21.16, align 1
  %74 = or disjoint i64 %5, %6
  %75 = or disjoint i64 %74, 4352
  %add.ptr.17 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %75
  %76 = load i32, ptr addrspace(1) %add.ptr.17, align 1
  %add.ptr21.17 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %75
  %77 = load i32, ptr addrspace(1) %add.ptr21.17, align 1
  %78 = or disjoint i64 %5, %6
  %79 = or disjoint i64 %78, 4608
  %add.ptr.18 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %79
  %80 = load i32, ptr addrspace(1) %add.ptr.18, align 1
  %add.ptr21.18 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %79
  %81 = load i32, ptr addrspace(1) %add.ptr21.18, align 1
  %82 = or disjoint i64 %5, %6
  %83 = or disjoint i64 %82, 4864
  %add.ptr.19 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %83
  %84 = load i32, ptr addrspace(1) %add.ptr.19, align 1
  %add.ptr21.19 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %83
  %85 = load i32, ptr addrspace(1) %add.ptr21.19, align 1
  %86 = or disjoint i64 %5, %6
  %87 = or disjoint i64 %86, 5120
  %add.ptr.20 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %87
  %88 = load i32, ptr addrspace(1) %add.ptr.20, align 1
  %add.ptr21.20 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %87
  %89 = load i32, ptr addrspace(1) %add.ptr21.20, align 1
  %90 = or disjoint i64 %5, %6
  %91 = or disjoint i64 %90, 5376
  %add.ptr.21 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %91
  %92 = load i32, ptr addrspace(1) %add.ptr.21, align 1
  %add.ptr21.21 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %91
  %93 = load i32, ptr addrspace(1) %add.ptr21.21, align 1
  %94 = or disjoint i64 %5, %6
  %95 = or disjoint i64 %94, 5632
  %add.ptr.22 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %95
  %96 = load i32, ptr addrspace(1) %add.ptr.22, align 1
  %add.ptr21.22 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %95
  %97 = load i32, ptr addrspace(1) %add.ptr21.22, align 1
  %98 = or disjoint i64 %5, %6
  %99 = or disjoint i64 %98, 5888
  %add.ptr.23 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %99
  %100 = load i32, ptr addrspace(1) %add.ptr.23, align 1
  %add.ptr21.23 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %99
  %101 = load i32, ptr addrspace(1) %add.ptr21.23, align 1
  %102 = or disjoint i64 %5, %6
  %103 = or disjoint i64 %102, 6144
  %add.ptr.24 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %103
  %104 = load i32, ptr addrspace(1) %add.ptr.24, align 1
  %add.ptr21.24 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %103
  %105 = load i32, ptr addrspace(1) %add.ptr21.24, align 1
  %106 = or disjoint i64 %5, %6
  %107 = or disjoint i64 %106, 6400
  %add.ptr.25 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %107
  %108 = load i32, ptr addrspace(1) %add.ptr.25, align 1
  %add.ptr21.25 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %107
  %109 = load i32, ptr addrspace(1) %add.ptr21.25, align 1
  %110 = or disjoint i64 %5, %6
  %111 = or disjoint i64 %110, 6656
  %add.ptr.26 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %111
  %112 = load i32, ptr addrspace(1) %add.ptr.26, align 1
  %add.ptr21.26 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %111
  %113 = load i32, ptr addrspace(1) %add.ptr21.26, align 1
  %114 = or disjoint i64 %5, %6
  %115 = or disjoint i64 %114, 6912
  %add.ptr.27 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %115
  %116 = load i32, ptr addrspace(1) %add.ptr.27, align 1
  %add.ptr21.27 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %115
  %117 = load i32, ptr addrspace(1) %add.ptr21.27, align 1
  %118 = or disjoint i64 %5, %6
  %119 = or disjoint i64 %118, 7168
  %add.ptr.28 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %119
  %120 = load i32, ptr addrspace(1) %add.ptr.28, align 1
  %add.ptr21.28 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %119
  %121 = load i32, ptr addrspace(1) %add.ptr21.28, align 1
  %cmp25104 = icmp sgt i32 %iterations, 0
  br i1 %cmp25104, label %for.cond30.preheader, label %for.cond49.preheader

for.cond30.preheader:                             ; preds = %entry, %for.cond30.preheader
  %sums.sroa.114.0 = phi <4 x i32> [ %150, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.110.0 = phi <4 x i32> [ %149, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.106.0 = phi <4 x i32> [ %148, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.102.0 = phi <4 x i32> [ %147, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.98.0 = phi <4 x i32> [ %146, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.94.0 = phi <4 x i32> [ %145, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.90.0 = phi <4 x i32> [ %144, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.86.0 = phi <4 x i32> [ %143, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.82.0 = phi <4 x i32> [ %142, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.78.0 = phi <4 x i32> [ %141, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.74.0 = phi <4 x i32> [ %140, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.70.0 = phi <4 x i32> [ %139, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.66.0 = phi <4 x i32> [ %138, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.62.0 = phi <4 x i32> [ %137, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.58.0 = phi <4 x i32> [ %136, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.54.0 = phi <4 x i32> [ %135, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.50.0 = phi <4 x i32> [ %134, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.46.0 = phi <4 x i32> [ %133, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.42.0 = phi <4 x i32> [ %132, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.38.0 = phi <4 x i32> [ %131, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.34.0 = phi <4 x i32> [ %130, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.30.0 = phi <4 x i32> [ %129, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.26.0 = phi <4 x i32> [ %128, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.22.0 = phi <4 x i32> [ %127, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.18.0 = phi <4 x i32> [ %126, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.14.0 = phi <4 x i32> [ %125, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.10.0 = phi <4 x i32> [ %124, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.6.0 = phi <4 x i32> [ %123, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.0.0 = phi <4 x i32> [ %122, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %iteration.0105 = phi i32 [ %inc46, %for.cond30.preheader ], [ 0, %entry ]
  %122 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %8, i32 %9, <4 x i32> %sums.sroa.0.0), !call_argsrelate !27
  %123 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %12, i32 %13, <4 x i32> %sums.sroa.6.0), !call_argsrelate !27
  %124 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %16, i32 %17, <4 x i32> %sums.sroa.10.0), !call_argsrelate !27
  %125 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %20, i32 %21, <4 x i32> %sums.sroa.14.0), !call_argsrelate !27
  %126 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %24, i32 %25, <4 x i32> %sums.sroa.18.0), !call_argsrelate !27
  %127 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %28, i32 %29, <4 x i32> %sums.sroa.22.0), !call_argsrelate !27
  %128 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %32, i32 %33, <4 x i32> %sums.sroa.26.0), !call_argsrelate !27
  %129 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %36, i32 %37, <4 x i32> %sums.sroa.30.0), !call_argsrelate !27
  %130 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %40, i32 %41, <4 x i32> %sums.sroa.34.0), !call_argsrelate !27
  %131 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %44, i32 %45, <4 x i32> %sums.sroa.38.0), !call_argsrelate !27
  %132 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %48, i32 %49, <4 x i32> %sums.sroa.42.0), !call_argsrelate !27
  %133 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %52, i32 %53, <4 x i32> %sums.sroa.46.0), !call_argsrelate !27
  %134 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %56, i32 %57, <4 x i32> %sums.sroa.50.0), !call_argsrelate !27
  %135 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %60, i32 %61, <4 x i32> %sums.sroa.54.0), !call_argsrelate !27
  %136 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %64, i32 %65, <4 x i32> %sums.sroa.58.0), !call_argsrelate !27
  %137 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %68, i32 %69, <4 x i32> %sums.sroa.62.0), !call_argsrelate !27
  %138 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %72, i32 %73, <4 x i32> %sums.sroa.66.0), !call_argsrelate !27
  %139 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %76, i32 %77, <4 x i32> %sums.sroa.70.0), !call_argsrelate !27
  %140 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %80, i32 %81, <4 x i32> %sums.sroa.74.0), !call_argsrelate !27
  %141 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %84, i32 %85, <4 x i32> %sums.sroa.78.0), !call_argsrelate !27
  %142 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %88, i32 %89, <4 x i32> %sums.sroa.82.0), !call_argsrelate !27
  %143 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %92, i32 %93, <4 x i32> %sums.sroa.86.0), !call_argsrelate !27
  %144 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %96, i32 %97, <4 x i32> %sums.sroa.90.0), !call_argsrelate !27
  %145 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %100, i32 %101, <4 x i32> %sums.sroa.94.0), !call_argsrelate !27
  %146 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %104, i32 %105, <4 x i32> %sums.sroa.98.0), !call_argsrelate !27
  %147 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %108, i32 %109, <4 x i32> %sums.sroa.102.0), !call_argsrelate !27
  %148 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %112, i32 %113, <4 x i32> %sums.sroa.106.0), !call_argsrelate !27
  %149 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %116, i32 %117, <4 x i32> %sums.sroa.110.0), !call_argsrelate !27
  %150 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %120, i32 %121, <4 x i32> %sums.sroa.114.0), !call_argsrelate !27
  %inc46 = add nuw nsw i32 %iteration.0105, 1
  %exitcond.not = icmp eq i32 %inc46, %iterations
  br i1 %exitcond.not, label %for.cond49.preheader, label %for.cond30.preheader, !llvm.loop !46

for.cond49.preheader:                             ; preds = %for.cond30.preheader, %entry
  %sums.sroa.114.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %150, %for.cond30.preheader ]
  %sums.sroa.110.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %149, %for.cond30.preheader ]
  %sums.sroa.106.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %148, %for.cond30.preheader ]
  %sums.sroa.102.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %147, %for.cond30.preheader ]
  %sums.sroa.98.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %146, %for.cond30.preheader ]
  %sums.sroa.94.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %145, %for.cond30.preheader ]
  %sums.sroa.90.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %144, %for.cond30.preheader ]
  %sums.sroa.86.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %143, %for.cond30.preheader ]
  %sums.sroa.82.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %142, %for.cond30.preheader ]
  %sums.sroa.78.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %141, %for.cond30.preheader ]
  %sums.sroa.74.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %140, %for.cond30.preheader ]
  %sums.sroa.70.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %139, %for.cond30.preheader ]
  %sums.sroa.66.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %138, %for.cond30.preheader ]
  %sums.sroa.62.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %137, %for.cond30.preheader ]
  %sums.sroa.58.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %136, %for.cond30.preheader ]
  %sums.sroa.54.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %135, %for.cond30.preheader ]
  %sums.sroa.50.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %134, %for.cond30.preheader ]
  %sums.sroa.46.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %133, %for.cond30.preheader ]
  %sums.sroa.42.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %132, %for.cond30.preheader ]
  %sums.sroa.38.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %131, %for.cond30.preheader ]
  %sums.sroa.34.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %130, %for.cond30.preheader ]
  %sums.sroa.30.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %129, %for.cond30.preheader ]
  %sums.sroa.26.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %128, %for.cond30.preheader ]
  %sums.sroa.22.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %127, %for.cond30.preheader ]
  %sums.sroa.18.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %126, %for.cond30.preheader ]
  %sums.sroa.14.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %125, %for.cond30.preheader ]
  %sums.sroa.10.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %124, %for.cond30.preheader ]
  %sums.sroa.6.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %123, %for.cond30.preheader ]
  %sums.sroa.0.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %122, %for.cond30.preheader ]
  %151 = lshr i16 %3, 6
  %conv7 = zext nneg i16 %151 to i64
  %152 = tail call noundef range(i32 0, 2147483647) i32 @llvm.mxc.block.id.x(), !range !15
  %conv = zext nneg i32 %152 to i64
  %mul = mul nuw nsw i64 %conv7, %conv
  %div9100 = lshr i32 %0, 6
  %conv10 = zext nneg i32 %div9100 to i64
  %add = add nuw nsw i64 %mul, %conv10
  %conv70 = zext nneg i32 %rem11 to i64
  %mul56 = mul nuw nsw i64 %add, 7424
  %vecext = extractelement <4 x i32> %sums.sroa.0.1, i64 0
  %153 = shl nuw nsw i64 %6, 4
  %add69 = or disjoint i64 %mul56, %153
  %add71 = or disjoint i64 %add69, %conv70
  %arrayidx72 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71
  store i32 %vecext, ptr addrspace(1) %arrayidx72, align 4, !tbaa !16
  %vecext.1 = extractelement <4 x i32> %sums.sroa.0.1, i64 1
  %154 = shl nuw nsw i64 %6, 4
  %155 = or disjoint i64 %154, 16
  %add69.1 = or disjoint i64 %mul56, %155
  %add71.1 = or disjoint i64 %add69.1, %conv70
  %arrayidx72.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1
  store i32 %vecext.1, ptr addrspace(1) %arrayidx72.1, align 4, !tbaa !16
  %vecext.2 = extractelement <4 x i32> %sums.sroa.0.1, i64 2
  %156 = shl nuw nsw i64 %6, 4
  %157 = or disjoint i64 %156, 32
  %add69.2 = or disjoint i64 %mul56, %157
  %add71.2 = or disjoint i64 %add69.2, %conv70
  %arrayidx72.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2
  store i32 %vecext.2, ptr addrspace(1) %arrayidx72.2, align 4, !tbaa !16
  %vecext.3 = extractelement <4 x i32> %sums.sroa.0.1, i64 3
  %158 = shl nuw nsw i64 %6, 4
  %159 = or disjoint i64 %158, 48
  %add69.3 = or disjoint i64 %mul56, %159
  %add71.3 = or disjoint i64 %add69.3, %conv70
  %arrayidx72.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3
  store i32 %vecext.3, ptr addrspace(1) %arrayidx72.3, align 4, !tbaa !16
  %add55.1 = mul nuw nsw i64 %add, 7424
  %mul56.1 = add nuw nsw i64 %add55.1, 256
  %vecext.1118 = extractelement <4 x i32> %sums.sroa.6.1, i64 0
  %add69.1119 = or disjoint i64 %mul56.1, %153
  %add71.1120 = or disjoint i64 %add69.1119, %conv70
  %arrayidx72.1121 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1120
  store i32 %vecext.1118, ptr addrspace(1) %arrayidx72.1121, align 4, !tbaa !16
  %vecext.1.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 1
  %add69.1.1 = or disjoint i64 %mul56.1, %155
  %add71.1.1 = or disjoint i64 %add69.1.1, %conv70
  %arrayidx72.1.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.1
  store i32 %vecext.1.1, ptr addrspace(1) %arrayidx72.1.1, align 4, !tbaa !16
  %vecext.2.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 2
  %add69.2.1 = or disjoint i64 %mul56.1, %157
  %add71.2.1 = or disjoint i64 %add69.2.1, %conv70
  %arrayidx72.2.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.1
  store i32 %vecext.2.1, ptr addrspace(1) %arrayidx72.2.1, align 4, !tbaa !16
  %vecext.3.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 3
  %add69.3.1 = or disjoint i64 %mul56.1, %159
  %add71.3.1 = or disjoint i64 %add69.3.1, %conv70
  %arrayidx72.3.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.1
  store i32 %vecext.3.1, ptr addrspace(1) %arrayidx72.3.1, align 4, !tbaa !16
  %add55.2 = mul nuw nsw i64 %add, 7424
  %mul56.2 = add nuw nsw i64 %add55.2, 512
  %vecext.2122 = extractelement <4 x i32> %sums.sroa.10.1, i64 0
  %add69.2123 = or disjoint i64 %mul56.2, %153
  %add71.2124 = or disjoint i64 %add69.2123, %conv70
  %arrayidx72.2125 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2124
  store i32 %vecext.2122, ptr addrspace(1) %arrayidx72.2125, align 4, !tbaa !16
  %vecext.1.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 1
  %add69.1.2 = or disjoint i64 %mul56.2, %155
  %add71.1.2 = or disjoint i64 %add69.1.2, %conv70
  %arrayidx72.1.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.2
  store i32 %vecext.1.2, ptr addrspace(1) %arrayidx72.1.2, align 4, !tbaa !16
  %vecext.2.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 2
  %add69.2.2 = or disjoint i64 %mul56.2, %157
  %add71.2.2 = or disjoint i64 %add69.2.2, %conv70
  %arrayidx72.2.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.2
  store i32 %vecext.2.2, ptr addrspace(1) %arrayidx72.2.2, align 4, !tbaa !16
  %vecext.3.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 3
  %add69.3.2 = or disjoint i64 %mul56.2, %159
  %add71.3.2 = or disjoint i64 %add69.3.2, %conv70
  %arrayidx72.3.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.2
  store i32 %vecext.3.2, ptr addrspace(1) %arrayidx72.3.2, align 4, !tbaa !16
  %add55.3 = mul nuw nsw i64 %add, 7424
  %mul56.3 = add nuw nsw i64 %add55.3, 768
  %vecext.3126 = extractelement <4 x i32> %sums.sroa.14.1, i64 0
  %add69.3127 = or disjoint i64 %mul56.3, %153
  %add71.3128 = or disjoint i64 %add69.3127, %conv70
  %arrayidx72.3129 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3128
  store i32 %vecext.3126, ptr addrspace(1) %arrayidx72.3129, align 4, !tbaa !16
  %vecext.1.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 1
  %add69.1.3 = or disjoint i64 %mul56.3, %155
  %add71.1.3 = or disjoint i64 %add69.1.3, %conv70
  %arrayidx72.1.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.3
  store i32 %vecext.1.3, ptr addrspace(1) %arrayidx72.1.3, align 4, !tbaa !16
  %vecext.2.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 2
  %add69.2.3 = or disjoint i64 %mul56.3, %157
  %add71.2.3 = or disjoint i64 %add69.2.3, %conv70
  %arrayidx72.2.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.3
  store i32 %vecext.2.3, ptr addrspace(1) %arrayidx72.2.3, align 4, !tbaa !16
  %vecext.3.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 3
  %add69.3.3 = or disjoint i64 %mul56.3, %159
  %add71.3.3 = or disjoint i64 %add69.3.3, %conv70
  %arrayidx72.3.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.3
  store i32 %vecext.3.3, ptr addrspace(1) %arrayidx72.3.3, align 4, !tbaa !16
  %add55.4 = mul nuw nsw i64 %add, 7424
  %mul56.4 = add nuw nsw i64 %add55.4, 1024
  %vecext.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 0
  %add69.4 = or disjoint i64 %mul56.4, %153
  %add71.4 = or disjoint i64 %add69.4, %conv70
  %arrayidx72.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.4
  store i32 %vecext.4, ptr addrspace(1) %arrayidx72.4, align 4, !tbaa !16
  %vecext.1.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 1
  %add69.1.4 = or disjoint i64 %mul56.4, %155
  %add71.1.4 = or disjoint i64 %add69.1.4, %conv70
  %arrayidx72.1.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.4
  store i32 %vecext.1.4, ptr addrspace(1) %arrayidx72.1.4, align 4, !tbaa !16
  %vecext.2.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 2
  %add69.2.4 = or disjoint i64 %mul56.4, %157
  %add71.2.4 = or disjoint i64 %add69.2.4, %conv70
  %arrayidx72.2.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.4
  store i32 %vecext.2.4, ptr addrspace(1) %arrayidx72.2.4, align 4, !tbaa !16
  %vecext.3.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 3
  %add69.3.4 = or disjoint i64 %mul56.4, %159
  %add71.3.4 = or disjoint i64 %add69.3.4, %conv70
  %arrayidx72.3.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.4
  store i32 %vecext.3.4, ptr addrspace(1) %arrayidx72.3.4, align 4, !tbaa !16
  %add55.5 = mul nuw nsw i64 %add, 7424
  %mul56.5 = add nuw nsw i64 %add55.5, 1280
  %vecext.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 0
  %add69.5 = or disjoint i64 %mul56.5, %153
  %add71.5 = or disjoint i64 %add69.5, %conv70
  %arrayidx72.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.5
  store i32 %vecext.5, ptr addrspace(1) %arrayidx72.5, align 4, !tbaa !16
  %vecext.1.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 1
  %add69.1.5 = or disjoint i64 %mul56.5, %155
  %add71.1.5 = or disjoint i64 %add69.1.5, %conv70
  %arrayidx72.1.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.5
  store i32 %vecext.1.5, ptr addrspace(1) %arrayidx72.1.5, align 4, !tbaa !16
  %vecext.2.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 2
  %add69.2.5 = or disjoint i64 %mul56.5, %157
  %add71.2.5 = or disjoint i64 %add69.2.5, %conv70
  %arrayidx72.2.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.5
  store i32 %vecext.2.5, ptr addrspace(1) %arrayidx72.2.5, align 4, !tbaa !16
  %vecext.3.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 3
  %add69.3.5 = or disjoint i64 %mul56.5, %159
  %add71.3.5 = or disjoint i64 %add69.3.5, %conv70
  %arrayidx72.3.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.5
  store i32 %vecext.3.5, ptr addrspace(1) %arrayidx72.3.5, align 4, !tbaa !16
  %add55.6 = mul nuw nsw i64 %add, 7424
  %mul56.6 = add nuw nsw i64 %add55.6, 1536
  %vecext.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 0
  %add69.6 = or disjoint i64 %mul56.6, %153
  %add71.6 = or disjoint i64 %add69.6, %conv70
  %arrayidx72.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.6
  store i32 %vecext.6, ptr addrspace(1) %arrayidx72.6, align 4, !tbaa !16
  %vecext.1.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 1
  %add69.1.6 = or disjoint i64 %mul56.6, %155
  %add71.1.6 = or disjoint i64 %add69.1.6, %conv70
  %arrayidx72.1.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.6
  store i32 %vecext.1.6, ptr addrspace(1) %arrayidx72.1.6, align 4, !tbaa !16
  %vecext.2.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 2
  %add69.2.6 = or disjoint i64 %mul56.6, %157
  %add71.2.6 = or disjoint i64 %add69.2.6, %conv70
  %arrayidx72.2.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.6
  store i32 %vecext.2.6, ptr addrspace(1) %arrayidx72.2.6, align 4, !tbaa !16
  %vecext.3.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 3
  %add69.3.6 = or disjoint i64 %mul56.6, %159
  %add71.3.6 = or disjoint i64 %add69.3.6, %conv70
  %arrayidx72.3.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.6
  store i32 %vecext.3.6, ptr addrspace(1) %arrayidx72.3.6, align 4, !tbaa !16
  %add55.7 = mul nuw nsw i64 %add, 7424
  %mul56.7 = add nuw nsw i64 %add55.7, 1792
  %vecext.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 0
  %add69.7 = or disjoint i64 %mul56.7, %153
  %add71.7 = or disjoint i64 %add69.7, %conv70
  %arrayidx72.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.7
  store i32 %vecext.7, ptr addrspace(1) %arrayidx72.7, align 4, !tbaa !16
  %vecext.1.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 1
  %add69.1.7 = or disjoint i64 %mul56.7, %155
  %add71.1.7 = or disjoint i64 %add69.1.7, %conv70
  %arrayidx72.1.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.7
  store i32 %vecext.1.7, ptr addrspace(1) %arrayidx72.1.7, align 4, !tbaa !16
  %vecext.2.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 2
  %add69.2.7 = or disjoint i64 %mul56.7, %157
  %add71.2.7 = or disjoint i64 %add69.2.7, %conv70
  %arrayidx72.2.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.7
  store i32 %vecext.2.7, ptr addrspace(1) %arrayidx72.2.7, align 4, !tbaa !16
  %vecext.3.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 3
  %add69.3.7 = or disjoint i64 %mul56.7, %159
  %add71.3.7 = or disjoint i64 %add69.3.7, %conv70
  %arrayidx72.3.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.7
  store i32 %vecext.3.7, ptr addrspace(1) %arrayidx72.3.7, align 4, !tbaa !16
  %add55.8 = mul nuw nsw i64 %add, 7424
  %mul56.8 = add nuw nsw i64 %add55.8, 2048
  %vecext.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 0
  %add69.8 = or disjoint i64 %mul56.8, %153
  %add71.8 = or disjoint i64 %add69.8, %conv70
  %arrayidx72.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.8
  store i32 %vecext.8, ptr addrspace(1) %arrayidx72.8, align 4, !tbaa !16
  %vecext.1.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 1
  %add69.1.8 = or disjoint i64 %mul56.8, %155
  %add71.1.8 = or disjoint i64 %add69.1.8, %conv70
  %arrayidx72.1.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.8
  store i32 %vecext.1.8, ptr addrspace(1) %arrayidx72.1.8, align 4, !tbaa !16
  %vecext.2.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 2
  %add69.2.8 = or disjoint i64 %mul56.8, %157
  %add71.2.8 = or disjoint i64 %add69.2.8, %conv70
  %arrayidx72.2.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.8
  store i32 %vecext.2.8, ptr addrspace(1) %arrayidx72.2.8, align 4, !tbaa !16
  %vecext.3.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 3
  %add69.3.8 = or disjoint i64 %mul56.8, %159
  %add71.3.8 = or disjoint i64 %add69.3.8, %conv70
  %arrayidx72.3.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.8
  store i32 %vecext.3.8, ptr addrspace(1) %arrayidx72.3.8, align 4, !tbaa !16
  %add55.9 = mul nuw nsw i64 %add, 7424
  %mul56.9 = add nuw nsw i64 %add55.9, 2304
  %vecext.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 0
  %add69.9 = or disjoint i64 %mul56.9, %153
  %add71.9 = or disjoint i64 %add69.9, %conv70
  %arrayidx72.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.9
  store i32 %vecext.9, ptr addrspace(1) %arrayidx72.9, align 4, !tbaa !16
  %vecext.1.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 1
  %add69.1.9 = or disjoint i64 %mul56.9, %155
  %add71.1.9 = or disjoint i64 %add69.1.9, %conv70
  %arrayidx72.1.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.9
  store i32 %vecext.1.9, ptr addrspace(1) %arrayidx72.1.9, align 4, !tbaa !16
  %vecext.2.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 2
  %add69.2.9 = or disjoint i64 %mul56.9, %157
  %add71.2.9 = or disjoint i64 %add69.2.9, %conv70
  %arrayidx72.2.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.9
  store i32 %vecext.2.9, ptr addrspace(1) %arrayidx72.2.9, align 4, !tbaa !16
  %vecext.3.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 3
  %add69.3.9 = or disjoint i64 %mul56.9, %159
  %add71.3.9 = or disjoint i64 %add69.3.9, %conv70
  %arrayidx72.3.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.9
  store i32 %vecext.3.9, ptr addrspace(1) %arrayidx72.3.9, align 4, !tbaa !16
  %add55.10 = mul nuw nsw i64 %add, 7424
  %mul56.10 = add nuw nsw i64 %add55.10, 2560
  %vecext.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 0
  %add69.10 = or disjoint i64 %mul56.10, %153
  %add71.10 = or disjoint i64 %add69.10, %conv70
  %arrayidx72.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.10
  store i32 %vecext.10, ptr addrspace(1) %arrayidx72.10, align 4, !tbaa !16
  %vecext.1.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 1
  %add69.1.10 = or disjoint i64 %mul56.10, %155
  %add71.1.10 = or disjoint i64 %add69.1.10, %conv70
  %arrayidx72.1.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.10
  store i32 %vecext.1.10, ptr addrspace(1) %arrayidx72.1.10, align 4, !tbaa !16
  %vecext.2.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 2
  %add69.2.10 = or disjoint i64 %mul56.10, %157
  %add71.2.10 = or disjoint i64 %add69.2.10, %conv70
  %arrayidx72.2.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.10
  store i32 %vecext.2.10, ptr addrspace(1) %arrayidx72.2.10, align 4, !tbaa !16
  %vecext.3.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 3
  %add69.3.10 = or disjoint i64 %mul56.10, %159
  %add71.3.10 = or disjoint i64 %add69.3.10, %conv70
  %arrayidx72.3.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.10
  store i32 %vecext.3.10, ptr addrspace(1) %arrayidx72.3.10, align 4, !tbaa !16
  %add55.11 = mul nuw nsw i64 %add, 7424
  %mul56.11 = add nuw nsw i64 %add55.11, 2816
  %vecext.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 0
  %add69.11 = or disjoint i64 %mul56.11, %153
  %add71.11 = or disjoint i64 %add69.11, %conv70
  %arrayidx72.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.11
  store i32 %vecext.11, ptr addrspace(1) %arrayidx72.11, align 4, !tbaa !16
  %vecext.1.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 1
  %add69.1.11 = or disjoint i64 %mul56.11, %155
  %add71.1.11 = or disjoint i64 %add69.1.11, %conv70
  %arrayidx72.1.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.11
  store i32 %vecext.1.11, ptr addrspace(1) %arrayidx72.1.11, align 4, !tbaa !16
  %vecext.2.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 2
  %add69.2.11 = or disjoint i64 %mul56.11, %157
  %add71.2.11 = or disjoint i64 %add69.2.11, %conv70
  %arrayidx72.2.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.11
  store i32 %vecext.2.11, ptr addrspace(1) %arrayidx72.2.11, align 4, !tbaa !16
  %vecext.3.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 3
  %add69.3.11 = or disjoint i64 %mul56.11, %159
  %add71.3.11 = or disjoint i64 %add69.3.11, %conv70
  %arrayidx72.3.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.11
  store i32 %vecext.3.11, ptr addrspace(1) %arrayidx72.3.11, align 4, !tbaa !16
  %add55.12 = mul nuw nsw i64 %add, 7424
  %mul56.12 = add nuw nsw i64 %add55.12, 3072
  %vecext.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 0
  %add69.12 = or disjoint i64 %mul56.12, %153
  %add71.12 = or disjoint i64 %add69.12, %conv70
  %arrayidx72.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.12
  store i32 %vecext.12, ptr addrspace(1) %arrayidx72.12, align 4, !tbaa !16
  %vecext.1.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 1
  %add69.1.12 = or disjoint i64 %mul56.12, %155
  %add71.1.12 = or disjoint i64 %add69.1.12, %conv70
  %arrayidx72.1.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.12
  store i32 %vecext.1.12, ptr addrspace(1) %arrayidx72.1.12, align 4, !tbaa !16
  %vecext.2.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 2
  %add69.2.12 = or disjoint i64 %mul56.12, %157
  %add71.2.12 = or disjoint i64 %add69.2.12, %conv70
  %arrayidx72.2.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.12
  store i32 %vecext.2.12, ptr addrspace(1) %arrayidx72.2.12, align 4, !tbaa !16
  %vecext.3.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 3
  %add69.3.12 = or disjoint i64 %mul56.12, %159
  %add71.3.12 = or disjoint i64 %add69.3.12, %conv70
  %arrayidx72.3.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.12
  store i32 %vecext.3.12, ptr addrspace(1) %arrayidx72.3.12, align 4, !tbaa !16
  %add55.13 = mul nuw nsw i64 %add, 7424
  %mul56.13 = add nuw nsw i64 %add55.13, 3328
  %vecext.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 0
  %add69.13 = or disjoint i64 %mul56.13, %153
  %add71.13 = or disjoint i64 %add69.13, %conv70
  %arrayidx72.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.13
  store i32 %vecext.13, ptr addrspace(1) %arrayidx72.13, align 4, !tbaa !16
  %vecext.1.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 1
  %add69.1.13 = or disjoint i64 %mul56.13, %155
  %add71.1.13 = or disjoint i64 %add69.1.13, %conv70
  %arrayidx72.1.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.13
  store i32 %vecext.1.13, ptr addrspace(1) %arrayidx72.1.13, align 4, !tbaa !16
  %vecext.2.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 2
  %add69.2.13 = or disjoint i64 %mul56.13, %157
  %add71.2.13 = or disjoint i64 %add69.2.13, %conv70
  %arrayidx72.2.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.13
  store i32 %vecext.2.13, ptr addrspace(1) %arrayidx72.2.13, align 4, !tbaa !16
  %vecext.3.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 3
  %add69.3.13 = or disjoint i64 %mul56.13, %159
  %add71.3.13 = or disjoint i64 %add69.3.13, %conv70
  %arrayidx72.3.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.13
  store i32 %vecext.3.13, ptr addrspace(1) %arrayidx72.3.13, align 4, !tbaa !16
  %add55.14 = mul nuw nsw i64 %add, 7424
  %mul56.14 = add nuw nsw i64 %add55.14, 3584
  %vecext.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 0
  %add69.14 = or disjoint i64 %mul56.14, %153
  %add71.14 = or disjoint i64 %add69.14, %conv70
  %arrayidx72.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.14
  store i32 %vecext.14, ptr addrspace(1) %arrayidx72.14, align 4, !tbaa !16
  %vecext.1.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 1
  %add69.1.14 = or disjoint i64 %mul56.14, %155
  %add71.1.14 = or disjoint i64 %add69.1.14, %conv70
  %arrayidx72.1.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.14
  store i32 %vecext.1.14, ptr addrspace(1) %arrayidx72.1.14, align 4, !tbaa !16
  %vecext.2.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 2
  %add69.2.14 = or disjoint i64 %mul56.14, %157
  %add71.2.14 = or disjoint i64 %add69.2.14, %conv70
  %arrayidx72.2.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.14
  store i32 %vecext.2.14, ptr addrspace(1) %arrayidx72.2.14, align 4, !tbaa !16
  %vecext.3.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 3
  %add69.3.14 = or disjoint i64 %mul56.14, %159
  %add71.3.14 = or disjoint i64 %add69.3.14, %conv70
  %arrayidx72.3.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.14
  store i32 %vecext.3.14, ptr addrspace(1) %arrayidx72.3.14, align 4, !tbaa !16
  %add55.15 = mul nuw nsw i64 %add, 7424
  %mul56.15 = add nuw nsw i64 %add55.15, 3840
  %vecext.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 0
  %add69.15 = or disjoint i64 %mul56.15, %153
  %add71.15 = or disjoint i64 %add69.15, %conv70
  %arrayidx72.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.15
  store i32 %vecext.15, ptr addrspace(1) %arrayidx72.15, align 4, !tbaa !16
  %vecext.1.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 1
  %add69.1.15 = or disjoint i64 %mul56.15, %155
  %add71.1.15 = or disjoint i64 %add69.1.15, %conv70
  %arrayidx72.1.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.15
  store i32 %vecext.1.15, ptr addrspace(1) %arrayidx72.1.15, align 4, !tbaa !16
  %vecext.2.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 2
  %add69.2.15 = or disjoint i64 %mul56.15, %157
  %add71.2.15 = or disjoint i64 %add69.2.15, %conv70
  %arrayidx72.2.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.15
  store i32 %vecext.2.15, ptr addrspace(1) %arrayidx72.2.15, align 4, !tbaa !16
  %vecext.3.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 3
  %add69.3.15 = or disjoint i64 %mul56.15, %159
  %add71.3.15 = or disjoint i64 %add69.3.15, %conv70
  %arrayidx72.3.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.15
  store i32 %vecext.3.15, ptr addrspace(1) %arrayidx72.3.15, align 4, !tbaa !16
  %add55.16 = mul nuw nsw i64 %add, 7424
  %mul56.16 = add nuw nsw i64 %add55.16, 4096
  %vecext.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 0
  %add69.16 = or disjoint i64 %mul56.16, %153
  %add71.16 = or disjoint i64 %add69.16, %conv70
  %arrayidx72.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.16
  store i32 %vecext.16, ptr addrspace(1) %arrayidx72.16, align 4, !tbaa !16
  %vecext.1.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 1
  %add69.1.16 = or disjoint i64 %mul56.16, %155
  %add71.1.16 = or disjoint i64 %add69.1.16, %conv70
  %arrayidx72.1.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.16
  store i32 %vecext.1.16, ptr addrspace(1) %arrayidx72.1.16, align 4, !tbaa !16
  %vecext.2.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 2
  %add69.2.16 = or disjoint i64 %mul56.16, %157
  %add71.2.16 = or disjoint i64 %add69.2.16, %conv70
  %arrayidx72.2.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.16
  store i32 %vecext.2.16, ptr addrspace(1) %arrayidx72.2.16, align 4, !tbaa !16
  %vecext.3.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 3
  %add69.3.16 = or disjoint i64 %mul56.16, %159
  %add71.3.16 = or disjoint i64 %add69.3.16, %conv70
  %arrayidx72.3.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.16
  store i32 %vecext.3.16, ptr addrspace(1) %arrayidx72.3.16, align 4, !tbaa !16
  %add55.17 = mul nuw nsw i64 %add, 7424
  %mul56.17 = add nuw nsw i64 %add55.17, 4352
  %vecext.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 0
  %add69.17 = or disjoint i64 %mul56.17, %153
  %add71.17 = or disjoint i64 %add69.17, %conv70
  %arrayidx72.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.17
  store i32 %vecext.17, ptr addrspace(1) %arrayidx72.17, align 4, !tbaa !16
  %vecext.1.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 1
  %add69.1.17 = or disjoint i64 %mul56.17, %155
  %add71.1.17 = or disjoint i64 %add69.1.17, %conv70
  %arrayidx72.1.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.17
  store i32 %vecext.1.17, ptr addrspace(1) %arrayidx72.1.17, align 4, !tbaa !16
  %vecext.2.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 2
  %add69.2.17 = or disjoint i64 %mul56.17, %157
  %add71.2.17 = or disjoint i64 %add69.2.17, %conv70
  %arrayidx72.2.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.17
  store i32 %vecext.2.17, ptr addrspace(1) %arrayidx72.2.17, align 4, !tbaa !16
  %vecext.3.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 3
  %add69.3.17 = or disjoint i64 %mul56.17, %159
  %add71.3.17 = or disjoint i64 %add69.3.17, %conv70
  %arrayidx72.3.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.17
  store i32 %vecext.3.17, ptr addrspace(1) %arrayidx72.3.17, align 4, !tbaa !16
  %add55.18 = mul nuw nsw i64 %add, 7424
  %mul56.18 = add nuw nsw i64 %add55.18, 4608
  %vecext.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 0
  %add69.18 = or disjoint i64 %mul56.18, %153
  %add71.18 = or disjoint i64 %add69.18, %conv70
  %arrayidx72.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.18
  store i32 %vecext.18, ptr addrspace(1) %arrayidx72.18, align 4, !tbaa !16
  %vecext.1.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 1
  %add69.1.18 = or disjoint i64 %mul56.18, %155
  %add71.1.18 = or disjoint i64 %add69.1.18, %conv70
  %arrayidx72.1.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.18
  store i32 %vecext.1.18, ptr addrspace(1) %arrayidx72.1.18, align 4, !tbaa !16
  %vecext.2.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 2
  %add69.2.18 = or disjoint i64 %mul56.18, %157
  %add71.2.18 = or disjoint i64 %add69.2.18, %conv70
  %arrayidx72.2.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.18
  store i32 %vecext.2.18, ptr addrspace(1) %arrayidx72.2.18, align 4, !tbaa !16
  %vecext.3.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 3
  %add69.3.18 = or disjoint i64 %mul56.18, %159
  %add71.3.18 = or disjoint i64 %add69.3.18, %conv70
  %arrayidx72.3.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.18
  store i32 %vecext.3.18, ptr addrspace(1) %arrayidx72.3.18, align 4, !tbaa !16
  %add55.19 = mul nuw nsw i64 %add, 7424
  %mul56.19 = add nuw nsw i64 %add55.19, 4864
  %vecext.19 = extractelement <4 x i32> %sums.sroa.78.1, i64 0
  %add69.19 = or disjoint i64 %mul56.19, %153
  %add71.19 = or disjoint i64 %add69.19, %conv70
  %arrayidx72.19 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.19
  store i32 %vecext.19, ptr addrspace(1) %arrayidx72.19, align 4, !tbaa !16
  %vecext.1.19 = extractelement <4 x i32> %sums.sroa.78.1, i64 1
  %add69.1.19 = or disjoint i64 %mul56.19, %155
  %add71.1.19 = or disjoint i64 %add69.1.19, %conv70
  %arrayidx72.1.19 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.19
  store i32 %vecext.1.19, ptr addrspace(1) %arrayidx72.1.19, align 4, !tbaa !16
  %vecext.2.19 = extractelement <4 x i32> %sums.sroa.78.1, i64 2
  %add69.2.19 = or disjoint i64 %mul56.19, %157
  %add71.2.19 = or disjoint i64 %add69.2.19, %conv70
  %arrayidx72.2.19 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.19
  store i32 %vecext.2.19, ptr addrspace(1) %arrayidx72.2.19, align 4, !tbaa !16
  %vecext.3.19 = extractelement <4 x i32> %sums.sroa.78.1, i64 3
  %add69.3.19 = or disjoint i64 %mul56.19, %159
  %add71.3.19 = or disjoint i64 %add69.3.19, %conv70
  %arrayidx72.3.19 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.19
  store i32 %vecext.3.19, ptr addrspace(1) %arrayidx72.3.19, align 4, !tbaa !16
  %add55.20 = mul nuw nsw i64 %add, 7424
  %mul56.20 = add nuw nsw i64 %add55.20, 5120
  %vecext.20 = extractelement <4 x i32> %sums.sroa.82.1, i64 0
  %add69.20 = or disjoint i64 %mul56.20, %153
  %add71.20 = or disjoint i64 %add69.20, %conv70
  %arrayidx72.20 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.20
  store i32 %vecext.20, ptr addrspace(1) %arrayidx72.20, align 4, !tbaa !16
  %vecext.1.20 = extractelement <4 x i32> %sums.sroa.82.1, i64 1
  %add69.1.20 = or disjoint i64 %mul56.20, %155
  %add71.1.20 = or disjoint i64 %add69.1.20, %conv70
  %arrayidx72.1.20 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.20
  store i32 %vecext.1.20, ptr addrspace(1) %arrayidx72.1.20, align 4, !tbaa !16
  %vecext.2.20 = extractelement <4 x i32> %sums.sroa.82.1, i64 2
  %add69.2.20 = or disjoint i64 %mul56.20, %157
  %add71.2.20 = or disjoint i64 %add69.2.20, %conv70
  %arrayidx72.2.20 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.20
  store i32 %vecext.2.20, ptr addrspace(1) %arrayidx72.2.20, align 4, !tbaa !16
  %vecext.3.20 = extractelement <4 x i32> %sums.sroa.82.1, i64 3
  %add69.3.20 = or disjoint i64 %mul56.20, %159
  %add71.3.20 = or disjoint i64 %add69.3.20, %conv70
  %arrayidx72.3.20 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.20
  store i32 %vecext.3.20, ptr addrspace(1) %arrayidx72.3.20, align 4, !tbaa !16
  %add55.21 = mul nuw nsw i64 %add, 7424
  %mul56.21 = add nuw nsw i64 %add55.21, 5376
  %vecext.21 = extractelement <4 x i32> %sums.sroa.86.1, i64 0
  %add69.21 = or disjoint i64 %mul56.21, %153
  %add71.21 = or disjoint i64 %add69.21, %conv70
  %arrayidx72.21 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.21
  store i32 %vecext.21, ptr addrspace(1) %arrayidx72.21, align 4, !tbaa !16
  %vecext.1.21 = extractelement <4 x i32> %sums.sroa.86.1, i64 1
  %add69.1.21 = or disjoint i64 %mul56.21, %155
  %add71.1.21 = or disjoint i64 %add69.1.21, %conv70
  %arrayidx72.1.21 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.21
  store i32 %vecext.1.21, ptr addrspace(1) %arrayidx72.1.21, align 4, !tbaa !16
  %vecext.2.21 = extractelement <4 x i32> %sums.sroa.86.1, i64 2
  %add69.2.21 = or disjoint i64 %mul56.21, %157
  %add71.2.21 = or disjoint i64 %add69.2.21, %conv70
  %arrayidx72.2.21 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.21
  store i32 %vecext.2.21, ptr addrspace(1) %arrayidx72.2.21, align 4, !tbaa !16
  %vecext.3.21 = extractelement <4 x i32> %sums.sroa.86.1, i64 3
  %add69.3.21 = or disjoint i64 %mul56.21, %159
  %add71.3.21 = or disjoint i64 %add69.3.21, %conv70
  %arrayidx72.3.21 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.21
  store i32 %vecext.3.21, ptr addrspace(1) %arrayidx72.3.21, align 4, !tbaa !16
  %add55.22 = mul nuw nsw i64 %add, 7424
  %mul56.22 = add nuw nsw i64 %add55.22, 5632
  %vecext.22 = extractelement <4 x i32> %sums.sroa.90.1, i64 0
  %add69.22 = or disjoint i64 %mul56.22, %153
  %add71.22 = or disjoint i64 %add69.22, %conv70
  %arrayidx72.22 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.22
  store i32 %vecext.22, ptr addrspace(1) %arrayidx72.22, align 4, !tbaa !16
  %vecext.1.22 = extractelement <4 x i32> %sums.sroa.90.1, i64 1
  %add69.1.22 = or disjoint i64 %mul56.22, %155
  %add71.1.22 = or disjoint i64 %add69.1.22, %conv70
  %arrayidx72.1.22 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.22
  store i32 %vecext.1.22, ptr addrspace(1) %arrayidx72.1.22, align 4, !tbaa !16
  %vecext.2.22 = extractelement <4 x i32> %sums.sroa.90.1, i64 2
  %add69.2.22 = or disjoint i64 %mul56.22, %157
  %add71.2.22 = or disjoint i64 %add69.2.22, %conv70
  %arrayidx72.2.22 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.22
  store i32 %vecext.2.22, ptr addrspace(1) %arrayidx72.2.22, align 4, !tbaa !16
  %vecext.3.22 = extractelement <4 x i32> %sums.sroa.90.1, i64 3
  %add69.3.22 = or disjoint i64 %mul56.22, %159
  %add71.3.22 = or disjoint i64 %add69.3.22, %conv70
  %arrayidx72.3.22 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.22
  store i32 %vecext.3.22, ptr addrspace(1) %arrayidx72.3.22, align 4, !tbaa !16
  %add55.23 = mul nuw nsw i64 %add, 7424
  %mul56.23 = add nuw nsw i64 %add55.23, 5888
  %vecext.23 = extractelement <4 x i32> %sums.sroa.94.1, i64 0
  %add69.23 = or disjoint i64 %mul56.23, %153
  %add71.23 = or disjoint i64 %add69.23, %conv70
  %arrayidx72.23 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.23
  store i32 %vecext.23, ptr addrspace(1) %arrayidx72.23, align 4, !tbaa !16
  %vecext.1.23 = extractelement <4 x i32> %sums.sroa.94.1, i64 1
  %add69.1.23 = or disjoint i64 %mul56.23, %155
  %add71.1.23 = or disjoint i64 %add69.1.23, %conv70
  %arrayidx72.1.23 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.23
  store i32 %vecext.1.23, ptr addrspace(1) %arrayidx72.1.23, align 4, !tbaa !16
  %vecext.2.23 = extractelement <4 x i32> %sums.sroa.94.1, i64 2
  %add69.2.23 = or disjoint i64 %mul56.23, %157
  %add71.2.23 = or disjoint i64 %add69.2.23, %conv70
  %arrayidx72.2.23 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.23
  store i32 %vecext.2.23, ptr addrspace(1) %arrayidx72.2.23, align 4, !tbaa !16
  %vecext.3.23 = extractelement <4 x i32> %sums.sroa.94.1, i64 3
  %add69.3.23 = or disjoint i64 %mul56.23, %159
  %add71.3.23 = or disjoint i64 %add69.3.23, %conv70
  %arrayidx72.3.23 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.23
  store i32 %vecext.3.23, ptr addrspace(1) %arrayidx72.3.23, align 4, !tbaa !16
  %add55.24 = mul nuw nsw i64 %add, 7424
  %mul56.24 = add nuw nsw i64 %add55.24, 6144
  %vecext.24 = extractelement <4 x i32> %sums.sroa.98.1, i64 0
  %add69.24 = or disjoint i64 %mul56.24, %153
  %add71.24 = or disjoint i64 %add69.24, %conv70
  %arrayidx72.24 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.24
  store i32 %vecext.24, ptr addrspace(1) %arrayidx72.24, align 4, !tbaa !16
  %vecext.1.24 = extractelement <4 x i32> %sums.sroa.98.1, i64 1
  %add69.1.24 = or disjoint i64 %mul56.24, %155
  %add71.1.24 = or disjoint i64 %add69.1.24, %conv70
  %arrayidx72.1.24 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.24
  store i32 %vecext.1.24, ptr addrspace(1) %arrayidx72.1.24, align 4, !tbaa !16
  %vecext.2.24 = extractelement <4 x i32> %sums.sroa.98.1, i64 2
  %add69.2.24 = or disjoint i64 %mul56.24, %157
  %add71.2.24 = or disjoint i64 %add69.2.24, %conv70
  %arrayidx72.2.24 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.24
  store i32 %vecext.2.24, ptr addrspace(1) %arrayidx72.2.24, align 4, !tbaa !16
  %vecext.3.24 = extractelement <4 x i32> %sums.sroa.98.1, i64 3
  %add69.3.24 = or disjoint i64 %mul56.24, %159
  %add71.3.24 = or disjoint i64 %add69.3.24, %conv70
  %arrayidx72.3.24 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.24
  store i32 %vecext.3.24, ptr addrspace(1) %arrayidx72.3.24, align 4, !tbaa !16
  %add55.25 = mul nuw nsw i64 %add, 7424
  %mul56.25 = add nuw nsw i64 %add55.25, 6400
  %vecext.25 = extractelement <4 x i32> %sums.sroa.102.1, i64 0
  %add69.25 = or disjoint i64 %mul56.25, %153
  %add71.25 = or disjoint i64 %add69.25, %conv70
  %arrayidx72.25 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.25
  store i32 %vecext.25, ptr addrspace(1) %arrayidx72.25, align 4, !tbaa !16
  %vecext.1.25 = extractelement <4 x i32> %sums.sroa.102.1, i64 1
  %add69.1.25 = or disjoint i64 %mul56.25, %155
  %add71.1.25 = or disjoint i64 %add69.1.25, %conv70
  %arrayidx72.1.25 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.25
  store i32 %vecext.1.25, ptr addrspace(1) %arrayidx72.1.25, align 4, !tbaa !16
  %vecext.2.25 = extractelement <4 x i32> %sums.sroa.102.1, i64 2
  %add69.2.25 = or disjoint i64 %mul56.25, %157
  %add71.2.25 = or disjoint i64 %add69.2.25, %conv70
  %arrayidx72.2.25 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.25
  store i32 %vecext.2.25, ptr addrspace(1) %arrayidx72.2.25, align 4, !tbaa !16
  %vecext.3.25 = extractelement <4 x i32> %sums.sroa.102.1, i64 3
  %add69.3.25 = or disjoint i64 %mul56.25, %159
  %add71.3.25 = or disjoint i64 %add69.3.25, %conv70
  %arrayidx72.3.25 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.25
  store i32 %vecext.3.25, ptr addrspace(1) %arrayidx72.3.25, align 4, !tbaa !16
  %add55.26 = mul nuw nsw i64 %add, 7424
  %mul56.26 = add nuw nsw i64 %add55.26, 6656
  %vecext.26 = extractelement <4 x i32> %sums.sroa.106.1, i64 0
  %add69.26 = or disjoint i64 %mul56.26, %153
  %add71.26 = or disjoint i64 %add69.26, %conv70
  %arrayidx72.26 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.26
  store i32 %vecext.26, ptr addrspace(1) %arrayidx72.26, align 4, !tbaa !16
  %vecext.1.26 = extractelement <4 x i32> %sums.sroa.106.1, i64 1
  %add69.1.26 = or disjoint i64 %mul56.26, %155
  %add71.1.26 = or disjoint i64 %add69.1.26, %conv70
  %arrayidx72.1.26 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.26
  store i32 %vecext.1.26, ptr addrspace(1) %arrayidx72.1.26, align 4, !tbaa !16
  %vecext.2.26 = extractelement <4 x i32> %sums.sroa.106.1, i64 2
  %add69.2.26 = or disjoint i64 %mul56.26, %157
  %add71.2.26 = or disjoint i64 %add69.2.26, %conv70
  %arrayidx72.2.26 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.26
  store i32 %vecext.2.26, ptr addrspace(1) %arrayidx72.2.26, align 4, !tbaa !16
  %vecext.3.26 = extractelement <4 x i32> %sums.sroa.106.1, i64 3
  %add69.3.26 = or disjoint i64 %mul56.26, %159
  %add71.3.26 = or disjoint i64 %add69.3.26, %conv70
  %arrayidx72.3.26 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.26
  store i32 %vecext.3.26, ptr addrspace(1) %arrayidx72.3.26, align 4, !tbaa !16
  %add55.27 = mul nuw nsw i64 %add, 7424
  %mul56.27 = add nuw nsw i64 %add55.27, 6912
  %vecext.27 = extractelement <4 x i32> %sums.sroa.110.1, i64 0
  %add69.27 = or disjoint i64 %mul56.27, %153
  %add71.27 = or disjoint i64 %add69.27, %conv70
  %arrayidx72.27 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.27
  store i32 %vecext.27, ptr addrspace(1) %arrayidx72.27, align 4, !tbaa !16
  %vecext.1.27 = extractelement <4 x i32> %sums.sroa.110.1, i64 1
  %add69.1.27 = or disjoint i64 %mul56.27, %155
  %add71.1.27 = or disjoint i64 %add69.1.27, %conv70
  %arrayidx72.1.27 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.27
  store i32 %vecext.1.27, ptr addrspace(1) %arrayidx72.1.27, align 4, !tbaa !16
  %vecext.2.27 = extractelement <4 x i32> %sums.sroa.110.1, i64 2
  %add69.2.27 = or disjoint i64 %mul56.27, %157
  %add71.2.27 = or disjoint i64 %add69.2.27, %conv70
  %arrayidx72.2.27 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.27
  store i32 %vecext.2.27, ptr addrspace(1) %arrayidx72.2.27, align 4, !tbaa !16
  %vecext.3.27 = extractelement <4 x i32> %sums.sroa.110.1, i64 3
  %add69.3.27 = or disjoint i64 %mul56.27, %159
  %add71.3.27 = or disjoint i64 %add69.3.27, %conv70
  %arrayidx72.3.27 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.27
  store i32 %vecext.3.27, ptr addrspace(1) %arrayidx72.3.27, align 4, !tbaa !16
  %add55.28 = mul nuw nsw i64 %add, 7424
  %mul56.28 = add nuw nsw i64 %add55.28, 7168
  %vecext.28 = extractelement <4 x i32> %sums.sroa.114.1, i64 0
  %add69.28 = or disjoint i64 %mul56.28, %153
  %add71.28 = or disjoint i64 %add69.28, %conv70
  %arrayidx72.28 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.28
  store i32 %vecext.28, ptr addrspace(1) %arrayidx72.28, align 4, !tbaa !16
  %vecext.1.28 = extractelement <4 x i32> %sums.sroa.114.1, i64 1
  %add69.1.28 = or disjoint i64 %mul56.28, %155
  %add71.1.28 = or disjoint i64 %add69.1.28, %conv70
  %arrayidx72.1.28 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.28
  store i32 %vecext.1.28, ptr addrspace(1) %arrayidx72.1.28, align 4, !tbaa !16
  %vecext.2.28 = extractelement <4 x i32> %sums.sroa.114.1, i64 2
  %add69.2.28 = or disjoint i64 %mul56.28, %157
  %add71.2.28 = or disjoint i64 %add69.2.28, %conv70
  %arrayidx72.2.28 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.28
  store i32 %vecext.2.28, ptr addrspace(1) %arrayidx72.2.28, align 4, !tbaa !16
  %vecext.3.28 = extractelement <4 x i32> %sums.sroa.114.1, i64 3
  %add69.3.28 = or disjoint i64 %mul56.28, %159
  %add71.3.28 = or disjoint i64 %add69.3.28, %conv70
  %arrayidx72.3.28 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.28
  store i32 %vecext.3.28, ptr addrspace(1) %arrayidx72.3.28, align 4, !tbaa !16
  ret void
}

; Function Attrs: convergent mustprogress nofree norecurse nounwind memory(argmem: readwrite)
define protected metaxgpu_kernel void @_Z13mmaPeakKernelILi30EEvPKaS1_Pii(ptr addrspace(1) noalias nocapture noundef readonly %a.coerce, ptr addrspace(1) noalias nocapture noundef readonly %b.coerce, ptr addrspace(1) noalias noundef writeonly %c.coerce, i32 noundef %iterations) local_unnamed_addr #3 comdat {
entry:
  %0 = tail call noundef range(i32 0, 1024) i32 @llvm.mxc.thread.id.x(), !range !25
  %1 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.mxc.dispatch.ptr()
  %2 = getelementptr inbounds i8, ptr addrspace(4) %1, i64 4
  %3 = load i16, ptr addrspace(4) %2, align 4, !range !26, !invariant.load !14
  %rem11 = and i32 %0, 15
  %4 = lshr i32 %0, 2
  %mul13 = and i32 %4, 12
  %mul15 = shl nuw nsw i32 %rem11, 4
  %5 = zext nneg i32 %mul15 to i64
  %6 = zext nneg i32 %mul13 to i64
  %7 = or disjoint i64 %5, %6
  %add.ptr = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %7
  %8 = load i32, ptr addrspace(1) %add.ptr, align 1
  %add.ptr21 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %7
  %9 = load i32, ptr addrspace(1) %add.ptr21, align 1
  %10 = or disjoint i64 %5, %6
  %11 = or disjoint i64 %10, 256
  %add.ptr.1 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %11
  %12 = load i32, ptr addrspace(1) %add.ptr.1, align 1
  %add.ptr21.1 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %11
  %13 = load i32, ptr addrspace(1) %add.ptr21.1, align 1
  %14 = or disjoint i64 %5, %6
  %15 = or disjoint i64 %14, 512
  %add.ptr.2 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %15
  %16 = load i32, ptr addrspace(1) %add.ptr.2, align 1
  %add.ptr21.2 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %15
  %17 = load i32, ptr addrspace(1) %add.ptr21.2, align 1
  %18 = or disjoint i64 %5, %6
  %19 = or disjoint i64 %18, 768
  %add.ptr.3 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %19
  %20 = load i32, ptr addrspace(1) %add.ptr.3, align 1
  %add.ptr21.3 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %19
  %21 = load i32, ptr addrspace(1) %add.ptr21.3, align 1
  %22 = or disjoint i64 %5, %6
  %23 = or disjoint i64 %22, 1024
  %add.ptr.4 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %23
  %24 = load i32, ptr addrspace(1) %add.ptr.4, align 1
  %add.ptr21.4 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %23
  %25 = load i32, ptr addrspace(1) %add.ptr21.4, align 1
  %26 = or disjoint i64 %5, %6
  %27 = or disjoint i64 %26, 1280
  %add.ptr.5 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %27
  %28 = load i32, ptr addrspace(1) %add.ptr.5, align 1
  %add.ptr21.5 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %27
  %29 = load i32, ptr addrspace(1) %add.ptr21.5, align 1
  %30 = or disjoint i64 %5, %6
  %31 = or disjoint i64 %30, 1536
  %add.ptr.6 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %31
  %32 = load i32, ptr addrspace(1) %add.ptr.6, align 1
  %add.ptr21.6 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %31
  %33 = load i32, ptr addrspace(1) %add.ptr21.6, align 1
  %34 = or disjoint i64 %5, %6
  %35 = or disjoint i64 %34, 1792
  %add.ptr.7 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %35
  %36 = load i32, ptr addrspace(1) %add.ptr.7, align 1
  %add.ptr21.7 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %35
  %37 = load i32, ptr addrspace(1) %add.ptr21.7, align 1
  %38 = or disjoint i64 %5, %6
  %39 = or disjoint i64 %38, 2048
  %add.ptr.8 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %39
  %40 = load i32, ptr addrspace(1) %add.ptr.8, align 1
  %add.ptr21.8 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %39
  %41 = load i32, ptr addrspace(1) %add.ptr21.8, align 1
  %42 = or disjoint i64 %5, %6
  %43 = or disjoint i64 %42, 2304
  %add.ptr.9 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %43
  %44 = load i32, ptr addrspace(1) %add.ptr.9, align 1
  %add.ptr21.9 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %43
  %45 = load i32, ptr addrspace(1) %add.ptr21.9, align 1
  %46 = or disjoint i64 %5, %6
  %47 = or disjoint i64 %46, 2560
  %add.ptr.10 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %47
  %48 = load i32, ptr addrspace(1) %add.ptr.10, align 1
  %add.ptr21.10 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %47
  %49 = load i32, ptr addrspace(1) %add.ptr21.10, align 1
  %50 = or disjoint i64 %5, %6
  %51 = or disjoint i64 %50, 2816
  %add.ptr.11 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %51
  %52 = load i32, ptr addrspace(1) %add.ptr.11, align 1
  %add.ptr21.11 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %51
  %53 = load i32, ptr addrspace(1) %add.ptr21.11, align 1
  %54 = or disjoint i64 %5, %6
  %55 = or disjoint i64 %54, 3072
  %add.ptr.12 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %55
  %56 = load i32, ptr addrspace(1) %add.ptr.12, align 1
  %add.ptr21.12 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %55
  %57 = load i32, ptr addrspace(1) %add.ptr21.12, align 1
  %58 = or disjoint i64 %5, %6
  %59 = or disjoint i64 %58, 3328
  %add.ptr.13 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %59
  %60 = load i32, ptr addrspace(1) %add.ptr.13, align 1
  %add.ptr21.13 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %59
  %61 = load i32, ptr addrspace(1) %add.ptr21.13, align 1
  %62 = or disjoint i64 %5, %6
  %63 = or disjoint i64 %62, 3584
  %add.ptr.14 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %63
  %64 = load i32, ptr addrspace(1) %add.ptr.14, align 1
  %add.ptr21.14 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %63
  %65 = load i32, ptr addrspace(1) %add.ptr21.14, align 1
  %66 = or disjoint i64 %5, %6
  %67 = or disjoint i64 %66, 3840
  %add.ptr.15 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %67
  %68 = load i32, ptr addrspace(1) %add.ptr.15, align 1
  %add.ptr21.15 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %67
  %69 = load i32, ptr addrspace(1) %add.ptr21.15, align 1
  %70 = or disjoint i64 %5, %6
  %71 = or disjoint i64 %70, 4096
  %add.ptr.16 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %71
  %72 = load i32, ptr addrspace(1) %add.ptr.16, align 1
  %add.ptr21.16 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %71
  %73 = load i32, ptr addrspace(1) %add.ptr21.16, align 1
  %74 = or disjoint i64 %5, %6
  %75 = or disjoint i64 %74, 4352
  %add.ptr.17 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %75
  %76 = load i32, ptr addrspace(1) %add.ptr.17, align 1
  %add.ptr21.17 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %75
  %77 = load i32, ptr addrspace(1) %add.ptr21.17, align 1
  %78 = or disjoint i64 %5, %6
  %79 = or disjoint i64 %78, 4608
  %add.ptr.18 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %79
  %80 = load i32, ptr addrspace(1) %add.ptr.18, align 1
  %add.ptr21.18 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %79
  %81 = load i32, ptr addrspace(1) %add.ptr21.18, align 1
  %82 = or disjoint i64 %5, %6
  %83 = or disjoint i64 %82, 4864
  %add.ptr.19 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %83
  %84 = load i32, ptr addrspace(1) %add.ptr.19, align 1
  %add.ptr21.19 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %83
  %85 = load i32, ptr addrspace(1) %add.ptr21.19, align 1
  %86 = or disjoint i64 %5, %6
  %87 = or disjoint i64 %86, 5120
  %add.ptr.20 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %87
  %88 = load i32, ptr addrspace(1) %add.ptr.20, align 1
  %add.ptr21.20 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %87
  %89 = load i32, ptr addrspace(1) %add.ptr21.20, align 1
  %90 = or disjoint i64 %5, %6
  %91 = or disjoint i64 %90, 5376
  %add.ptr.21 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %91
  %92 = load i32, ptr addrspace(1) %add.ptr.21, align 1
  %add.ptr21.21 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %91
  %93 = load i32, ptr addrspace(1) %add.ptr21.21, align 1
  %94 = or disjoint i64 %5, %6
  %95 = or disjoint i64 %94, 5632
  %add.ptr.22 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %95
  %96 = load i32, ptr addrspace(1) %add.ptr.22, align 1
  %add.ptr21.22 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %95
  %97 = load i32, ptr addrspace(1) %add.ptr21.22, align 1
  %98 = or disjoint i64 %5, %6
  %99 = or disjoint i64 %98, 5888
  %add.ptr.23 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %99
  %100 = load i32, ptr addrspace(1) %add.ptr.23, align 1
  %add.ptr21.23 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %99
  %101 = load i32, ptr addrspace(1) %add.ptr21.23, align 1
  %102 = or disjoint i64 %5, %6
  %103 = or disjoint i64 %102, 6144
  %add.ptr.24 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %103
  %104 = load i32, ptr addrspace(1) %add.ptr.24, align 1
  %add.ptr21.24 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %103
  %105 = load i32, ptr addrspace(1) %add.ptr21.24, align 1
  %106 = or disjoint i64 %5, %6
  %107 = or disjoint i64 %106, 6400
  %add.ptr.25 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %107
  %108 = load i32, ptr addrspace(1) %add.ptr.25, align 1
  %add.ptr21.25 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %107
  %109 = load i32, ptr addrspace(1) %add.ptr21.25, align 1
  %110 = or disjoint i64 %5, %6
  %111 = or disjoint i64 %110, 6656
  %add.ptr.26 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %111
  %112 = load i32, ptr addrspace(1) %add.ptr.26, align 1
  %add.ptr21.26 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %111
  %113 = load i32, ptr addrspace(1) %add.ptr21.26, align 1
  %114 = or disjoint i64 %5, %6
  %115 = or disjoint i64 %114, 6912
  %add.ptr.27 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %115
  %116 = load i32, ptr addrspace(1) %add.ptr.27, align 1
  %add.ptr21.27 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %115
  %117 = load i32, ptr addrspace(1) %add.ptr21.27, align 1
  %118 = or disjoint i64 %5, %6
  %119 = or disjoint i64 %118, 7168
  %add.ptr.28 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %119
  %120 = load i32, ptr addrspace(1) %add.ptr.28, align 1
  %add.ptr21.28 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %119
  %121 = load i32, ptr addrspace(1) %add.ptr21.28, align 1
  %122 = or disjoint i64 %5, %6
  %123 = or disjoint i64 %122, 7424
  %add.ptr.29 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %123
  %124 = load i32, ptr addrspace(1) %add.ptr.29, align 1
  %add.ptr21.29 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %123
  %125 = load i32, ptr addrspace(1) %add.ptr21.29, align 1
  %cmp25104 = icmp sgt i32 %iterations, 0
  br i1 %cmp25104, label %for.cond30.preheader, label %for.cond49.preheader

for.cond30.preheader:                             ; preds = %entry, %for.cond30.preheader
  %sums.sroa.118.0 = phi <4 x i32> [ %155, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.114.0 = phi <4 x i32> [ %154, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.110.0 = phi <4 x i32> [ %153, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.106.0 = phi <4 x i32> [ %152, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.102.0 = phi <4 x i32> [ %151, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.98.0 = phi <4 x i32> [ %150, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.94.0 = phi <4 x i32> [ %149, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.90.0 = phi <4 x i32> [ %148, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.86.0 = phi <4 x i32> [ %147, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.82.0 = phi <4 x i32> [ %146, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.78.0 = phi <4 x i32> [ %145, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.74.0 = phi <4 x i32> [ %144, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.70.0 = phi <4 x i32> [ %143, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.66.0 = phi <4 x i32> [ %142, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.62.0 = phi <4 x i32> [ %141, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.58.0 = phi <4 x i32> [ %140, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.54.0 = phi <4 x i32> [ %139, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.50.0 = phi <4 x i32> [ %138, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.46.0 = phi <4 x i32> [ %137, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.42.0 = phi <4 x i32> [ %136, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.38.0 = phi <4 x i32> [ %135, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.34.0 = phi <4 x i32> [ %134, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.30.0 = phi <4 x i32> [ %133, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.26.0 = phi <4 x i32> [ %132, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.22.0 = phi <4 x i32> [ %131, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.18.0 = phi <4 x i32> [ %130, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.14.0 = phi <4 x i32> [ %129, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.10.0 = phi <4 x i32> [ %128, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.6.0 = phi <4 x i32> [ %127, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.0.0 = phi <4 x i32> [ %126, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %iteration.0105 = phi i32 [ %inc46, %for.cond30.preheader ], [ 0, %entry ]
  %126 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %8, i32 %9, <4 x i32> %sums.sroa.0.0), !call_argsrelate !27
  %127 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %12, i32 %13, <4 x i32> %sums.sroa.6.0), !call_argsrelate !27
  %128 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %16, i32 %17, <4 x i32> %sums.sroa.10.0), !call_argsrelate !27
  %129 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %20, i32 %21, <4 x i32> %sums.sroa.14.0), !call_argsrelate !27
  %130 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %24, i32 %25, <4 x i32> %sums.sroa.18.0), !call_argsrelate !27
  %131 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %28, i32 %29, <4 x i32> %sums.sroa.22.0), !call_argsrelate !27
  %132 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %32, i32 %33, <4 x i32> %sums.sroa.26.0), !call_argsrelate !27
  %133 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %36, i32 %37, <4 x i32> %sums.sroa.30.0), !call_argsrelate !27
  %134 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %40, i32 %41, <4 x i32> %sums.sroa.34.0), !call_argsrelate !27
  %135 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %44, i32 %45, <4 x i32> %sums.sroa.38.0), !call_argsrelate !27
  %136 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %48, i32 %49, <4 x i32> %sums.sroa.42.0), !call_argsrelate !27
  %137 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %52, i32 %53, <4 x i32> %sums.sroa.46.0), !call_argsrelate !27
  %138 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %56, i32 %57, <4 x i32> %sums.sroa.50.0), !call_argsrelate !27
  %139 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %60, i32 %61, <4 x i32> %sums.sroa.54.0), !call_argsrelate !27
  %140 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %64, i32 %65, <4 x i32> %sums.sroa.58.0), !call_argsrelate !27
  %141 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %68, i32 %69, <4 x i32> %sums.sroa.62.0), !call_argsrelate !27
  %142 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %72, i32 %73, <4 x i32> %sums.sroa.66.0), !call_argsrelate !27
  %143 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %76, i32 %77, <4 x i32> %sums.sroa.70.0), !call_argsrelate !27
  %144 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %80, i32 %81, <4 x i32> %sums.sroa.74.0), !call_argsrelate !27
  %145 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %84, i32 %85, <4 x i32> %sums.sroa.78.0), !call_argsrelate !27
  %146 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %88, i32 %89, <4 x i32> %sums.sroa.82.0), !call_argsrelate !27
  %147 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %92, i32 %93, <4 x i32> %sums.sroa.86.0), !call_argsrelate !27
  %148 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %96, i32 %97, <4 x i32> %sums.sroa.90.0), !call_argsrelate !27
  %149 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %100, i32 %101, <4 x i32> %sums.sroa.94.0), !call_argsrelate !27
  %150 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %104, i32 %105, <4 x i32> %sums.sroa.98.0), !call_argsrelate !27
  %151 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %108, i32 %109, <4 x i32> %sums.sroa.102.0), !call_argsrelate !27
  %152 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %112, i32 %113, <4 x i32> %sums.sroa.106.0), !call_argsrelate !27
  %153 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %116, i32 %117, <4 x i32> %sums.sroa.110.0), !call_argsrelate !27
  %154 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %120, i32 %121, <4 x i32> %sums.sroa.114.0), !call_argsrelate !27
  %155 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %124, i32 %125, <4 x i32> %sums.sroa.118.0), !call_argsrelate !27
  %inc46 = add nuw nsw i32 %iteration.0105, 1
  %exitcond.not = icmp eq i32 %inc46, %iterations
  br i1 %exitcond.not, label %for.cond49.preheader, label %for.cond30.preheader, !llvm.loop !47

for.cond49.preheader:                             ; preds = %for.cond30.preheader, %entry
  %sums.sroa.118.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %155, %for.cond30.preheader ]
  %sums.sroa.114.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %154, %for.cond30.preheader ]
  %sums.sroa.110.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %153, %for.cond30.preheader ]
  %sums.sroa.106.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %152, %for.cond30.preheader ]
  %sums.sroa.102.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %151, %for.cond30.preheader ]
  %sums.sroa.98.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %150, %for.cond30.preheader ]
  %sums.sroa.94.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %149, %for.cond30.preheader ]
  %sums.sroa.90.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %148, %for.cond30.preheader ]
  %sums.sroa.86.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %147, %for.cond30.preheader ]
  %sums.sroa.82.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %146, %for.cond30.preheader ]
  %sums.sroa.78.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %145, %for.cond30.preheader ]
  %sums.sroa.74.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %144, %for.cond30.preheader ]
  %sums.sroa.70.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %143, %for.cond30.preheader ]
  %sums.sroa.66.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %142, %for.cond30.preheader ]
  %sums.sroa.62.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %141, %for.cond30.preheader ]
  %sums.sroa.58.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %140, %for.cond30.preheader ]
  %sums.sroa.54.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %139, %for.cond30.preheader ]
  %sums.sroa.50.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %138, %for.cond30.preheader ]
  %sums.sroa.46.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %137, %for.cond30.preheader ]
  %sums.sroa.42.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %136, %for.cond30.preheader ]
  %sums.sroa.38.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %135, %for.cond30.preheader ]
  %sums.sroa.34.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %134, %for.cond30.preheader ]
  %sums.sroa.30.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %133, %for.cond30.preheader ]
  %sums.sroa.26.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %132, %for.cond30.preheader ]
  %sums.sroa.22.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %131, %for.cond30.preheader ]
  %sums.sroa.18.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %130, %for.cond30.preheader ]
  %sums.sroa.14.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %129, %for.cond30.preheader ]
  %sums.sroa.10.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %128, %for.cond30.preheader ]
  %sums.sroa.6.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %127, %for.cond30.preheader ]
  %sums.sroa.0.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %126, %for.cond30.preheader ]
  %156 = lshr i16 %3, 6
  %conv7 = zext nneg i16 %156 to i64
  %157 = tail call noundef range(i32 0, 2147483647) i32 @llvm.mxc.block.id.x(), !range !15
  %conv = zext nneg i32 %157 to i64
  %mul = mul nuw nsw i64 %conv7, %conv
  %div9100 = lshr i32 %0, 6
  %conv10 = zext nneg i32 %div9100 to i64
  %add = add nuw nsw i64 %mul, %conv10
  %conv70 = zext nneg i32 %rem11 to i64
  %mul56 = mul nuw nsw i64 %add, 7680
  %vecext = extractelement <4 x i32> %sums.sroa.0.1, i64 0
  %158 = shl nuw nsw i64 %6, 4
  %add69 = or disjoint i64 %mul56, %158
  %add71 = or disjoint i64 %add69, %conv70
  %arrayidx72 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71
  store i32 %vecext, ptr addrspace(1) %arrayidx72, align 4, !tbaa !16
  %vecext.1 = extractelement <4 x i32> %sums.sroa.0.1, i64 1
  %159 = shl nuw nsw i64 %6, 4
  %160 = or disjoint i64 %159, 16
  %add69.1 = or disjoint i64 %mul56, %160
  %add71.1 = or disjoint i64 %add69.1, %conv70
  %arrayidx72.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1
  store i32 %vecext.1, ptr addrspace(1) %arrayidx72.1, align 4, !tbaa !16
  %vecext.2 = extractelement <4 x i32> %sums.sroa.0.1, i64 2
  %161 = shl nuw nsw i64 %6, 4
  %162 = or disjoint i64 %161, 32
  %add69.2 = or disjoint i64 %mul56, %162
  %add71.2 = or disjoint i64 %add69.2, %conv70
  %arrayidx72.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2
  store i32 %vecext.2, ptr addrspace(1) %arrayidx72.2, align 4, !tbaa !16
  %vecext.3 = extractelement <4 x i32> %sums.sroa.0.1, i64 3
  %163 = shl nuw nsw i64 %6, 4
  %164 = or disjoint i64 %163, 48
  %add69.3 = or disjoint i64 %mul56, %164
  %add71.3 = or disjoint i64 %add69.3, %conv70
  %arrayidx72.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3
  store i32 %vecext.3, ptr addrspace(1) %arrayidx72.3, align 4, !tbaa !16
  %add55.1 = mul nuw nsw i64 %add, 7680
  %mul56.1 = or disjoint i64 %add55.1, 256
  %vecext.1118 = extractelement <4 x i32> %sums.sroa.6.1, i64 0
  %add69.1119 = or disjoint i64 %mul56.1, %158
  %add71.1120 = or disjoint i64 %add69.1119, %conv70
  %arrayidx72.1121 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1120
  store i32 %vecext.1118, ptr addrspace(1) %arrayidx72.1121, align 4, !tbaa !16
  %vecext.1.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 1
  %add69.1.1 = or disjoint i64 %mul56.1, %160
  %add71.1.1 = or disjoint i64 %add69.1.1, %conv70
  %arrayidx72.1.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.1
  store i32 %vecext.1.1, ptr addrspace(1) %arrayidx72.1.1, align 4, !tbaa !16
  %vecext.2.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 2
  %add69.2.1 = or disjoint i64 %mul56.1, %162
  %add71.2.1 = or disjoint i64 %add69.2.1, %conv70
  %arrayidx72.2.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.1
  store i32 %vecext.2.1, ptr addrspace(1) %arrayidx72.2.1, align 4, !tbaa !16
  %vecext.3.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 3
  %add69.3.1 = or disjoint i64 %mul56.1, %164
  %add71.3.1 = or disjoint i64 %add69.3.1, %conv70
  %arrayidx72.3.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.1
  store i32 %vecext.3.1, ptr addrspace(1) %arrayidx72.3.1, align 4, !tbaa !16
  %add55.2 = mul nuw nsw i64 %add, 7680
  %mul56.2 = add nuw nsw i64 %add55.2, 512
  %vecext.2122 = extractelement <4 x i32> %sums.sroa.10.1, i64 0
  %add69.2123 = or disjoint i64 %mul56.2, %158
  %add71.2124 = or disjoint i64 %add69.2123, %conv70
  %arrayidx72.2125 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2124
  store i32 %vecext.2122, ptr addrspace(1) %arrayidx72.2125, align 4, !tbaa !16
  %vecext.1.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 1
  %add69.1.2 = or disjoint i64 %mul56.2, %160
  %add71.1.2 = or disjoint i64 %add69.1.2, %conv70
  %arrayidx72.1.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.2
  store i32 %vecext.1.2, ptr addrspace(1) %arrayidx72.1.2, align 4, !tbaa !16
  %vecext.2.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 2
  %add69.2.2 = or disjoint i64 %mul56.2, %162
  %add71.2.2 = or disjoint i64 %add69.2.2, %conv70
  %arrayidx72.2.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.2
  store i32 %vecext.2.2, ptr addrspace(1) %arrayidx72.2.2, align 4, !tbaa !16
  %vecext.3.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 3
  %add69.3.2 = or disjoint i64 %mul56.2, %164
  %add71.3.2 = or disjoint i64 %add69.3.2, %conv70
  %arrayidx72.3.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.2
  store i32 %vecext.3.2, ptr addrspace(1) %arrayidx72.3.2, align 4, !tbaa !16
  %add55.3 = mul nuw nsw i64 %add, 7680
  %mul56.3 = add nuw nsw i64 %add55.3, 768
  %vecext.3126 = extractelement <4 x i32> %sums.sroa.14.1, i64 0
  %add69.3127 = or disjoint i64 %mul56.3, %158
  %add71.3128 = or disjoint i64 %add69.3127, %conv70
  %arrayidx72.3129 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3128
  store i32 %vecext.3126, ptr addrspace(1) %arrayidx72.3129, align 4, !tbaa !16
  %vecext.1.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 1
  %add69.1.3 = or disjoint i64 %mul56.3, %160
  %add71.1.3 = or disjoint i64 %add69.1.3, %conv70
  %arrayidx72.1.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.3
  store i32 %vecext.1.3, ptr addrspace(1) %arrayidx72.1.3, align 4, !tbaa !16
  %vecext.2.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 2
  %add69.2.3 = or disjoint i64 %mul56.3, %162
  %add71.2.3 = or disjoint i64 %add69.2.3, %conv70
  %arrayidx72.2.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.3
  store i32 %vecext.2.3, ptr addrspace(1) %arrayidx72.2.3, align 4, !tbaa !16
  %vecext.3.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 3
  %add69.3.3 = or disjoint i64 %mul56.3, %164
  %add71.3.3 = or disjoint i64 %add69.3.3, %conv70
  %arrayidx72.3.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.3
  store i32 %vecext.3.3, ptr addrspace(1) %arrayidx72.3.3, align 4, !tbaa !16
  %add55.4 = mul nuw nsw i64 %add, 7680
  %mul56.4 = add nuw nsw i64 %add55.4, 1024
  %vecext.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 0
  %add69.4 = or disjoint i64 %mul56.4, %158
  %add71.4 = or disjoint i64 %add69.4, %conv70
  %arrayidx72.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.4
  store i32 %vecext.4, ptr addrspace(1) %arrayidx72.4, align 4, !tbaa !16
  %vecext.1.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 1
  %add69.1.4 = or disjoint i64 %mul56.4, %160
  %add71.1.4 = or disjoint i64 %add69.1.4, %conv70
  %arrayidx72.1.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.4
  store i32 %vecext.1.4, ptr addrspace(1) %arrayidx72.1.4, align 4, !tbaa !16
  %vecext.2.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 2
  %add69.2.4 = or disjoint i64 %mul56.4, %162
  %add71.2.4 = or disjoint i64 %add69.2.4, %conv70
  %arrayidx72.2.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.4
  store i32 %vecext.2.4, ptr addrspace(1) %arrayidx72.2.4, align 4, !tbaa !16
  %vecext.3.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 3
  %add69.3.4 = or disjoint i64 %mul56.4, %164
  %add71.3.4 = or disjoint i64 %add69.3.4, %conv70
  %arrayidx72.3.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.4
  store i32 %vecext.3.4, ptr addrspace(1) %arrayidx72.3.4, align 4, !tbaa !16
  %add55.5 = mul nuw nsw i64 %add, 7680
  %mul56.5 = add nuw nsw i64 %add55.5, 1280
  %vecext.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 0
  %add69.5 = or disjoint i64 %mul56.5, %158
  %add71.5 = or disjoint i64 %add69.5, %conv70
  %arrayidx72.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.5
  store i32 %vecext.5, ptr addrspace(1) %arrayidx72.5, align 4, !tbaa !16
  %vecext.1.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 1
  %add69.1.5 = or disjoint i64 %mul56.5, %160
  %add71.1.5 = or disjoint i64 %add69.1.5, %conv70
  %arrayidx72.1.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.5
  store i32 %vecext.1.5, ptr addrspace(1) %arrayidx72.1.5, align 4, !tbaa !16
  %vecext.2.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 2
  %add69.2.5 = or disjoint i64 %mul56.5, %162
  %add71.2.5 = or disjoint i64 %add69.2.5, %conv70
  %arrayidx72.2.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.5
  store i32 %vecext.2.5, ptr addrspace(1) %arrayidx72.2.5, align 4, !tbaa !16
  %vecext.3.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 3
  %add69.3.5 = or disjoint i64 %mul56.5, %164
  %add71.3.5 = or disjoint i64 %add69.3.5, %conv70
  %arrayidx72.3.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.5
  store i32 %vecext.3.5, ptr addrspace(1) %arrayidx72.3.5, align 4, !tbaa !16
  %add55.6 = mul nuw nsw i64 %add, 7680
  %mul56.6 = add nuw nsw i64 %add55.6, 1536
  %vecext.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 0
  %add69.6 = or disjoint i64 %mul56.6, %158
  %add71.6 = or disjoint i64 %add69.6, %conv70
  %arrayidx72.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.6
  store i32 %vecext.6, ptr addrspace(1) %arrayidx72.6, align 4, !tbaa !16
  %vecext.1.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 1
  %add69.1.6 = or disjoint i64 %mul56.6, %160
  %add71.1.6 = or disjoint i64 %add69.1.6, %conv70
  %arrayidx72.1.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.6
  store i32 %vecext.1.6, ptr addrspace(1) %arrayidx72.1.6, align 4, !tbaa !16
  %vecext.2.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 2
  %add69.2.6 = or disjoint i64 %mul56.6, %162
  %add71.2.6 = or disjoint i64 %add69.2.6, %conv70
  %arrayidx72.2.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.6
  store i32 %vecext.2.6, ptr addrspace(1) %arrayidx72.2.6, align 4, !tbaa !16
  %vecext.3.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 3
  %add69.3.6 = or disjoint i64 %mul56.6, %164
  %add71.3.6 = or disjoint i64 %add69.3.6, %conv70
  %arrayidx72.3.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.6
  store i32 %vecext.3.6, ptr addrspace(1) %arrayidx72.3.6, align 4, !tbaa !16
  %add55.7 = mul nuw nsw i64 %add, 7680
  %mul56.7 = add nuw nsw i64 %add55.7, 1792
  %vecext.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 0
  %add69.7 = or disjoint i64 %mul56.7, %158
  %add71.7 = or disjoint i64 %add69.7, %conv70
  %arrayidx72.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.7
  store i32 %vecext.7, ptr addrspace(1) %arrayidx72.7, align 4, !tbaa !16
  %vecext.1.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 1
  %add69.1.7 = or disjoint i64 %mul56.7, %160
  %add71.1.7 = or disjoint i64 %add69.1.7, %conv70
  %arrayidx72.1.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.7
  store i32 %vecext.1.7, ptr addrspace(1) %arrayidx72.1.7, align 4, !tbaa !16
  %vecext.2.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 2
  %add69.2.7 = or disjoint i64 %mul56.7, %162
  %add71.2.7 = or disjoint i64 %add69.2.7, %conv70
  %arrayidx72.2.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.7
  store i32 %vecext.2.7, ptr addrspace(1) %arrayidx72.2.7, align 4, !tbaa !16
  %vecext.3.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 3
  %add69.3.7 = or disjoint i64 %mul56.7, %164
  %add71.3.7 = or disjoint i64 %add69.3.7, %conv70
  %arrayidx72.3.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.7
  store i32 %vecext.3.7, ptr addrspace(1) %arrayidx72.3.7, align 4, !tbaa !16
  %add55.8 = mul nuw nsw i64 %add, 7680
  %mul56.8 = add nuw nsw i64 %add55.8, 2048
  %vecext.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 0
  %add69.8 = or disjoint i64 %mul56.8, %158
  %add71.8 = or disjoint i64 %add69.8, %conv70
  %arrayidx72.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.8
  store i32 %vecext.8, ptr addrspace(1) %arrayidx72.8, align 4, !tbaa !16
  %vecext.1.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 1
  %add69.1.8 = or disjoint i64 %mul56.8, %160
  %add71.1.8 = or disjoint i64 %add69.1.8, %conv70
  %arrayidx72.1.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.8
  store i32 %vecext.1.8, ptr addrspace(1) %arrayidx72.1.8, align 4, !tbaa !16
  %vecext.2.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 2
  %add69.2.8 = or disjoint i64 %mul56.8, %162
  %add71.2.8 = or disjoint i64 %add69.2.8, %conv70
  %arrayidx72.2.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.8
  store i32 %vecext.2.8, ptr addrspace(1) %arrayidx72.2.8, align 4, !tbaa !16
  %vecext.3.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 3
  %add69.3.8 = or disjoint i64 %mul56.8, %164
  %add71.3.8 = or disjoint i64 %add69.3.8, %conv70
  %arrayidx72.3.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.8
  store i32 %vecext.3.8, ptr addrspace(1) %arrayidx72.3.8, align 4, !tbaa !16
  %add55.9 = mul nuw nsw i64 %add, 7680
  %mul56.9 = add nuw nsw i64 %add55.9, 2304
  %vecext.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 0
  %add69.9 = or disjoint i64 %mul56.9, %158
  %add71.9 = or disjoint i64 %add69.9, %conv70
  %arrayidx72.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.9
  store i32 %vecext.9, ptr addrspace(1) %arrayidx72.9, align 4, !tbaa !16
  %vecext.1.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 1
  %add69.1.9 = or disjoint i64 %mul56.9, %160
  %add71.1.9 = or disjoint i64 %add69.1.9, %conv70
  %arrayidx72.1.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.9
  store i32 %vecext.1.9, ptr addrspace(1) %arrayidx72.1.9, align 4, !tbaa !16
  %vecext.2.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 2
  %add69.2.9 = or disjoint i64 %mul56.9, %162
  %add71.2.9 = or disjoint i64 %add69.2.9, %conv70
  %arrayidx72.2.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.9
  store i32 %vecext.2.9, ptr addrspace(1) %arrayidx72.2.9, align 4, !tbaa !16
  %vecext.3.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 3
  %add69.3.9 = or disjoint i64 %mul56.9, %164
  %add71.3.9 = or disjoint i64 %add69.3.9, %conv70
  %arrayidx72.3.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.9
  store i32 %vecext.3.9, ptr addrspace(1) %arrayidx72.3.9, align 4, !tbaa !16
  %add55.10 = mul nuw nsw i64 %add, 7680
  %mul56.10 = add nuw nsw i64 %add55.10, 2560
  %vecext.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 0
  %add69.10 = or disjoint i64 %mul56.10, %158
  %add71.10 = or disjoint i64 %add69.10, %conv70
  %arrayidx72.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.10
  store i32 %vecext.10, ptr addrspace(1) %arrayidx72.10, align 4, !tbaa !16
  %vecext.1.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 1
  %add69.1.10 = or disjoint i64 %mul56.10, %160
  %add71.1.10 = or disjoint i64 %add69.1.10, %conv70
  %arrayidx72.1.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.10
  store i32 %vecext.1.10, ptr addrspace(1) %arrayidx72.1.10, align 4, !tbaa !16
  %vecext.2.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 2
  %add69.2.10 = or disjoint i64 %mul56.10, %162
  %add71.2.10 = or disjoint i64 %add69.2.10, %conv70
  %arrayidx72.2.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.10
  store i32 %vecext.2.10, ptr addrspace(1) %arrayidx72.2.10, align 4, !tbaa !16
  %vecext.3.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 3
  %add69.3.10 = or disjoint i64 %mul56.10, %164
  %add71.3.10 = or disjoint i64 %add69.3.10, %conv70
  %arrayidx72.3.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.10
  store i32 %vecext.3.10, ptr addrspace(1) %arrayidx72.3.10, align 4, !tbaa !16
  %add55.11 = mul nuw nsw i64 %add, 7680
  %mul56.11 = add nuw nsw i64 %add55.11, 2816
  %vecext.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 0
  %add69.11 = or disjoint i64 %mul56.11, %158
  %add71.11 = or disjoint i64 %add69.11, %conv70
  %arrayidx72.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.11
  store i32 %vecext.11, ptr addrspace(1) %arrayidx72.11, align 4, !tbaa !16
  %vecext.1.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 1
  %add69.1.11 = or disjoint i64 %mul56.11, %160
  %add71.1.11 = or disjoint i64 %add69.1.11, %conv70
  %arrayidx72.1.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.11
  store i32 %vecext.1.11, ptr addrspace(1) %arrayidx72.1.11, align 4, !tbaa !16
  %vecext.2.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 2
  %add69.2.11 = or disjoint i64 %mul56.11, %162
  %add71.2.11 = or disjoint i64 %add69.2.11, %conv70
  %arrayidx72.2.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.11
  store i32 %vecext.2.11, ptr addrspace(1) %arrayidx72.2.11, align 4, !tbaa !16
  %vecext.3.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 3
  %add69.3.11 = or disjoint i64 %mul56.11, %164
  %add71.3.11 = or disjoint i64 %add69.3.11, %conv70
  %arrayidx72.3.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.11
  store i32 %vecext.3.11, ptr addrspace(1) %arrayidx72.3.11, align 4, !tbaa !16
  %add55.12 = mul nuw nsw i64 %add, 7680
  %mul56.12 = add nuw nsw i64 %add55.12, 3072
  %vecext.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 0
  %add69.12 = or disjoint i64 %mul56.12, %158
  %add71.12 = or disjoint i64 %add69.12, %conv70
  %arrayidx72.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.12
  store i32 %vecext.12, ptr addrspace(1) %arrayidx72.12, align 4, !tbaa !16
  %vecext.1.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 1
  %add69.1.12 = or disjoint i64 %mul56.12, %160
  %add71.1.12 = or disjoint i64 %add69.1.12, %conv70
  %arrayidx72.1.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.12
  store i32 %vecext.1.12, ptr addrspace(1) %arrayidx72.1.12, align 4, !tbaa !16
  %vecext.2.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 2
  %add69.2.12 = or disjoint i64 %mul56.12, %162
  %add71.2.12 = or disjoint i64 %add69.2.12, %conv70
  %arrayidx72.2.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.12
  store i32 %vecext.2.12, ptr addrspace(1) %arrayidx72.2.12, align 4, !tbaa !16
  %vecext.3.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 3
  %add69.3.12 = or disjoint i64 %mul56.12, %164
  %add71.3.12 = or disjoint i64 %add69.3.12, %conv70
  %arrayidx72.3.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.12
  store i32 %vecext.3.12, ptr addrspace(1) %arrayidx72.3.12, align 4, !tbaa !16
  %add55.13 = mul nuw nsw i64 %add, 7680
  %mul56.13 = add nuw nsw i64 %add55.13, 3328
  %vecext.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 0
  %add69.13 = or disjoint i64 %mul56.13, %158
  %add71.13 = or disjoint i64 %add69.13, %conv70
  %arrayidx72.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.13
  store i32 %vecext.13, ptr addrspace(1) %arrayidx72.13, align 4, !tbaa !16
  %vecext.1.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 1
  %add69.1.13 = or disjoint i64 %mul56.13, %160
  %add71.1.13 = or disjoint i64 %add69.1.13, %conv70
  %arrayidx72.1.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.13
  store i32 %vecext.1.13, ptr addrspace(1) %arrayidx72.1.13, align 4, !tbaa !16
  %vecext.2.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 2
  %add69.2.13 = or disjoint i64 %mul56.13, %162
  %add71.2.13 = or disjoint i64 %add69.2.13, %conv70
  %arrayidx72.2.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.13
  store i32 %vecext.2.13, ptr addrspace(1) %arrayidx72.2.13, align 4, !tbaa !16
  %vecext.3.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 3
  %add69.3.13 = or disjoint i64 %mul56.13, %164
  %add71.3.13 = or disjoint i64 %add69.3.13, %conv70
  %arrayidx72.3.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.13
  store i32 %vecext.3.13, ptr addrspace(1) %arrayidx72.3.13, align 4, !tbaa !16
  %add55.14 = mul nuw nsw i64 %add, 7680
  %mul56.14 = add nuw nsw i64 %add55.14, 3584
  %vecext.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 0
  %add69.14 = or disjoint i64 %mul56.14, %158
  %add71.14 = or disjoint i64 %add69.14, %conv70
  %arrayidx72.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.14
  store i32 %vecext.14, ptr addrspace(1) %arrayidx72.14, align 4, !tbaa !16
  %vecext.1.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 1
  %add69.1.14 = or disjoint i64 %mul56.14, %160
  %add71.1.14 = or disjoint i64 %add69.1.14, %conv70
  %arrayidx72.1.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.14
  store i32 %vecext.1.14, ptr addrspace(1) %arrayidx72.1.14, align 4, !tbaa !16
  %vecext.2.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 2
  %add69.2.14 = or disjoint i64 %mul56.14, %162
  %add71.2.14 = or disjoint i64 %add69.2.14, %conv70
  %arrayidx72.2.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.14
  store i32 %vecext.2.14, ptr addrspace(1) %arrayidx72.2.14, align 4, !tbaa !16
  %vecext.3.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 3
  %add69.3.14 = or disjoint i64 %mul56.14, %164
  %add71.3.14 = or disjoint i64 %add69.3.14, %conv70
  %arrayidx72.3.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.14
  store i32 %vecext.3.14, ptr addrspace(1) %arrayidx72.3.14, align 4, !tbaa !16
  %add55.15 = mul nuw nsw i64 %add, 7680
  %mul56.15 = add nuw nsw i64 %add55.15, 3840
  %vecext.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 0
  %add69.15 = or disjoint i64 %mul56.15, %158
  %add71.15 = or disjoint i64 %add69.15, %conv70
  %arrayidx72.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.15
  store i32 %vecext.15, ptr addrspace(1) %arrayidx72.15, align 4, !tbaa !16
  %vecext.1.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 1
  %add69.1.15 = or disjoint i64 %mul56.15, %160
  %add71.1.15 = or disjoint i64 %add69.1.15, %conv70
  %arrayidx72.1.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.15
  store i32 %vecext.1.15, ptr addrspace(1) %arrayidx72.1.15, align 4, !tbaa !16
  %vecext.2.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 2
  %add69.2.15 = or disjoint i64 %mul56.15, %162
  %add71.2.15 = or disjoint i64 %add69.2.15, %conv70
  %arrayidx72.2.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.15
  store i32 %vecext.2.15, ptr addrspace(1) %arrayidx72.2.15, align 4, !tbaa !16
  %vecext.3.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 3
  %add69.3.15 = or disjoint i64 %mul56.15, %164
  %add71.3.15 = or disjoint i64 %add69.3.15, %conv70
  %arrayidx72.3.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.15
  store i32 %vecext.3.15, ptr addrspace(1) %arrayidx72.3.15, align 4, !tbaa !16
  %add55.16 = mul nuw nsw i64 %add, 7680
  %mul56.16 = add nuw nsw i64 %add55.16, 4096
  %vecext.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 0
  %add69.16 = or disjoint i64 %mul56.16, %158
  %add71.16 = or disjoint i64 %add69.16, %conv70
  %arrayidx72.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.16
  store i32 %vecext.16, ptr addrspace(1) %arrayidx72.16, align 4, !tbaa !16
  %vecext.1.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 1
  %add69.1.16 = or disjoint i64 %mul56.16, %160
  %add71.1.16 = or disjoint i64 %add69.1.16, %conv70
  %arrayidx72.1.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.16
  store i32 %vecext.1.16, ptr addrspace(1) %arrayidx72.1.16, align 4, !tbaa !16
  %vecext.2.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 2
  %add69.2.16 = or disjoint i64 %mul56.16, %162
  %add71.2.16 = or disjoint i64 %add69.2.16, %conv70
  %arrayidx72.2.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.16
  store i32 %vecext.2.16, ptr addrspace(1) %arrayidx72.2.16, align 4, !tbaa !16
  %vecext.3.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 3
  %add69.3.16 = or disjoint i64 %mul56.16, %164
  %add71.3.16 = or disjoint i64 %add69.3.16, %conv70
  %arrayidx72.3.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.16
  store i32 %vecext.3.16, ptr addrspace(1) %arrayidx72.3.16, align 4, !tbaa !16
  %add55.17 = mul nuw nsw i64 %add, 7680
  %mul56.17 = add nuw nsw i64 %add55.17, 4352
  %vecext.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 0
  %add69.17 = or disjoint i64 %mul56.17, %158
  %add71.17 = or disjoint i64 %add69.17, %conv70
  %arrayidx72.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.17
  store i32 %vecext.17, ptr addrspace(1) %arrayidx72.17, align 4, !tbaa !16
  %vecext.1.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 1
  %add69.1.17 = or disjoint i64 %mul56.17, %160
  %add71.1.17 = or disjoint i64 %add69.1.17, %conv70
  %arrayidx72.1.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.17
  store i32 %vecext.1.17, ptr addrspace(1) %arrayidx72.1.17, align 4, !tbaa !16
  %vecext.2.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 2
  %add69.2.17 = or disjoint i64 %mul56.17, %162
  %add71.2.17 = or disjoint i64 %add69.2.17, %conv70
  %arrayidx72.2.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.17
  store i32 %vecext.2.17, ptr addrspace(1) %arrayidx72.2.17, align 4, !tbaa !16
  %vecext.3.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 3
  %add69.3.17 = or disjoint i64 %mul56.17, %164
  %add71.3.17 = or disjoint i64 %add69.3.17, %conv70
  %arrayidx72.3.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.17
  store i32 %vecext.3.17, ptr addrspace(1) %arrayidx72.3.17, align 4, !tbaa !16
  %add55.18 = mul nuw nsw i64 %add, 7680
  %mul56.18 = add nuw nsw i64 %add55.18, 4608
  %vecext.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 0
  %add69.18 = or disjoint i64 %mul56.18, %158
  %add71.18 = or disjoint i64 %add69.18, %conv70
  %arrayidx72.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.18
  store i32 %vecext.18, ptr addrspace(1) %arrayidx72.18, align 4, !tbaa !16
  %vecext.1.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 1
  %add69.1.18 = or disjoint i64 %mul56.18, %160
  %add71.1.18 = or disjoint i64 %add69.1.18, %conv70
  %arrayidx72.1.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.18
  store i32 %vecext.1.18, ptr addrspace(1) %arrayidx72.1.18, align 4, !tbaa !16
  %vecext.2.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 2
  %add69.2.18 = or disjoint i64 %mul56.18, %162
  %add71.2.18 = or disjoint i64 %add69.2.18, %conv70
  %arrayidx72.2.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.18
  store i32 %vecext.2.18, ptr addrspace(1) %arrayidx72.2.18, align 4, !tbaa !16
  %vecext.3.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 3
  %add69.3.18 = or disjoint i64 %mul56.18, %164
  %add71.3.18 = or disjoint i64 %add69.3.18, %conv70
  %arrayidx72.3.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.18
  store i32 %vecext.3.18, ptr addrspace(1) %arrayidx72.3.18, align 4, !tbaa !16
  %add55.19 = mul nuw nsw i64 %add, 7680
  %mul56.19 = add nuw nsw i64 %add55.19, 4864
  %vecext.19 = extractelement <4 x i32> %sums.sroa.78.1, i64 0
  %add69.19 = or disjoint i64 %mul56.19, %158
  %add71.19 = or disjoint i64 %add69.19, %conv70
  %arrayidx72.19 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.19
  store i32 %vecext.19, ptr addrspace(1) %arrayidx72.19, align 4, !tbaa !16
  %vecext.1.19 = extractelement <4 x i32> %sums.sroa.78.1, i64 1
  %add69.1.19 = or disjoint i64 %mul56.19, %160
  %add71.1.19 = or disjoint i64 %add69.1.19, %conv70
  %arrayidx72.1.19 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.19
  store i32 %vecext.1.19, ptr addrspace(1) %arrayidx72.1.19, align 4, !tbaa !16
  %vecext.2.19 = extractelement <4 x i32> %sums.sroa.78.1, i64 2
  %add69.2.19 = or disjoint i64 %mul56.19, %162
  %add71.2.19 = or disjoint i64 %add69.2.19, %conv70
  %arrayidx72.2.19 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.19
  store i32 %vecext.2.19, ptr addrspace(1) %arrayidx72.2.19, align 4, !tbaa !16
  %vecext.3.19 = extractelement <4 x i32> %sums.sroa.78.1, i64 3
  %add69.3.19 = or disjoint i64 %mul56.19, %164
  %add71.3.19 = or disjoint i64 %add69.3.19, %conv70
  %arrayidx72.3.19 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.19
  store i32 %vecext.3.19, ptr addrspace(1) %arrayidx72.3.19, align 4, !tbaa !16
  %add55.20 = mul nuw nsw i64 %add, 7680
  %mul56.20 = add nuw nsw i64 %add55.20, 5120
  %vecext.20 = extractelement <4 x i32> %sums.sroa.82.1, i64 0
  %add69.20 = or disjoint i64 %mul56.20, %158
  %add71.20 = or disjoint i64 %add69.20, %conv70
  %arrayidx72.20 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.20
  store i32 %vecext.20, ptr addrspace(1) %arrayidx72.20, align 4, !tbaa !16
  %vecext.1.20 = extractelement <4 x i32> %sums.sroa.82.1, i64 1
  %add69.1.20 = or disjoint i64 %mul56.20, %160
  %add71.1.20 = or disjoint i64 %add69.1.20, %conv70
  %arrayidx72.1.20 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.20
  store i32 %vecext.1.20, ptr addrspace(1) %arrayidx72.1.20, align 4, !tbaa !16
  %vecext.2.20 = extractelement <4 x i32> %sums.sroa.82.1, i64 2
  %add69.2.20 = or disjoint i64 %mul56.20, %162
  %add71.2.20 = or disjoint i64 %add69.2.20, %conv70
  %arrayidx72.2.20 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.20
  store i32 %vecext.2.20, ptr addrspace(1) %arrayidx72.2.20, align 4, !tbaa !16
  %vecext.3.20 = extractelement <4 x i32> %sums.sroa.82.1, i64 3
  %add69.3.20 = or disjoint i64 %mul56.20, %164
  %add71.3.20 = or disjoint i64 %add69.3.20, %conv70
  %arrayidx72.3.20 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.20
  store i32 %vecext.3.20, ptr addrspace(1) %arrayidx72.3.20, align 4, !tbaa !16
  %add55.21 = mul nuw nsw i64 %add, 7680
  %mul56.21 = add nuw nsw i64 %add55.21, 5376
  %vecext.21 = extractelement <4 x i32> %sums.sroa.86.1, i64 0
  %add69.21 = or disjoint i64 %mul56.21, %158
  %add71.21 = or disjoint i64 %add69.21, %conv70
  %arrayidx72.21 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.21
  store i32 %vecext.21, ptr addrspace(1) %arrayidx72.21, align 4, !tbaa !16
  %vecext.1.21 = extractelement <4 x i32> %sums.sroa.86.1, i64 1
  %add69.1.21 = or disjoint i64 %mul56.21, %160
  %add71.1.21 = or disjoint i64 %add69.1.21, %conv70
  %arrayidx72.1.21 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.21
  store i32 %vecext.1.21, ptr addrspace(1) %arrayidx72.1.21, align 4, !tbaa !16
  %vecext.2.21 = extractelement <4 x i32> %sums.sroa.86.1, i64 2
  %add69.2.21 = or disjoint i64 %mul56.21, %162
  %add71.2.21 = or disjoint i64 %add69.2.21, %conv70
  %arrayidx72.2.21 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.21
  store i32 %vecext.2.21, ptr addrspace(1) %arrayidx72.2.21, align 4, !tbaa !16
  %vecext.3.21 = extractelement <4 x i32> %sums.sroa.86.1, i64 3
  %add69.3.21 = or disjoint i64 %mul56.21, %164
  %add71.3.21 = or disjoint i64 %add69.3.21, %conv70
  %arrayidx72.3.21 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.21
  store i32 %vecext.3.21, ptr addrspace(1) %arrayidx72.3.21, align 4, !tbaa !16
  %add55.22 = mul nuw nsw i64 %add, 7680
  %mul56.22 = add nuw nsw i64 %add55.22, 5632
  %vecext.22 = extractelement <4 x i32> %sums.sroa.90.1, i64 0
  %add69.22 = or disjoint i64 %mul56.22, %158
  %add71.22 = or disjoint i64 %add69.22, %conv70
  %arrayidx72.22 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.22
  store i32 %vecext.22, ptr addrspace(1) %arrayidx72.22, align 4, !tbaa !16
  %vecext.1.22 = extractelement <4 x i32> %sums.sroa.90.1, i64 1
  %add69.1.22 = or disjoint i64 %mul56.22, %160
  %add71.1.22 = or disjoint i64 %add69.1.22, %conv70
  %arrayidx72.1.22 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.22
  store i32 %vecext.1.22, ptr addrspace(1) %arrayidx72.1.22, align 4, !tbaa !16
  %vecext.2.22 = extractelement <4 x i32> %sums.sroa.90.1, i64 2
  %add69.2.22 = or disjoint i64 %mul56.22, %162
  %add71.2.22 = or disjoint i64 %add69.2.22, %conv70
  %arrayidx72.2.22 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.22
  store i32 %vecext.2.22, ptr addrspace(1) %arrayidx72.2.22, align 4, !tbaa !16
  %vecext.3.22 = extractelement <4 x i32> %sums.sroa.90.1, i64 3
  %add69.3.22 = or disjoint i64 %mul56.22, %164
  %add71.3.22 = or disjoint i64 %add69.3.22, %conv70
  %arrayidx72.3.22 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.22
  store i32 %vecext.3.22, ptr addrspace(1) %arrayidx72.3.22, align 4, !tbaa !16
  %add55.23 = mul nuw nsw i64 %add, 7680
  %mul56.23 = add nuw nsw i64 %add55.23, 5888
  %vecext.23 = extractelement <4 x i32> %sums.sroa.94.1, i64 0
  %add69.23 = or disjoint i64 %mul56.23, %158
  %add71.23 = or disjoint i64 %add69.23, %conv70
  %arrayidx72.23 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.23
  store i32 %vecext.23, ptr addrspace(1) %arrayidx72.23, align 4, !tbaa !16
  %vecext.1.23 = extractelement <4 x i32> %sums.sroa.94.1, i64 1
  %add69.1.23 = or disjoint i64 %mul56.23, %160
  %add71.1.23 = or disjoint i64 %add69.1.23, %conv70
  %arrayidx72.1.23 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.23
  store i32 %vecext.1.23, ptr addrspace(1) %arrayidx72.1.23, align 4, !tbaa !16
  %vecext.2.23 = extractelement <4 x i32> %sums.sroa.94.1, i64 2
  %add69.2.23 = or disjoint i64 %mul56.23, %162
  %add71.2.23 = or disjoint i64 %add69.2.23, %conv70
  %arrayidx72.2.23 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.23
  store i32 %vecext.2.23, ptr addrspace(1) %arrayidx72.2.23, align 4, !tbaa !16
  %vecext.3.23 = extractelement <4 x i32> %sums.sroa.94.1, i64 3
  %add69.3.23 = or disjoint i64 %mul56.23, %164
  %add71.3.23 = or disjoint i64 %add69.3.23, %conv70
  %arrayidx72.3.23 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.23
  store i32 %vecext.3.23, ptr addrspace(1) %arrayidx72.3.23, align 4, !tbaa !16
  %add55.24 = mul nuw nsw i64 %add, 7680
  %mul56.24 = add nuw nsw i64 %add55.24, 6144
  %vecext.24 = extractelement <4 x i32> %sums.sroa.98.1, i64 0
  %add69.24 = or disjoint i64 %mul56.24, %158
  %add71.24 = or disjoint i64 %add69.24, %conv70
  %arrayidx72.24 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.24
  store i32 %vecext.24, ptr addrspace(1) %arrayidx72.24, align 4, !tbaa !16
  %vecext.1.24 = extractelement <4 x i32> %sums.sroa.98.1, i64 1
  %add69.1.24 = or disjoint i64 %mul56.24, %160
  %add71.1.24 = or disjoint i64 %add69.1.24, %conv70
  %arrayidx72.1.24 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.24
  store i32 %vecext.1.24, ptr addrspace(1) %arrayidx72.1.24, align 4, !tbaa !16
  %vecext.2.24 = extractelement <4 x i32> %sums.sroa.98.1, i64 2
  %add69.2.24 = or disjoint i64 %mul56.24, %162
  %add71.2.24 = or disjoint i64 %add69.2.24, %conv70
  %arrayidx72.2.24 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.24
  store i32 %vecext.2.24, ptr addrspace(1) %arrayidx72.2.24, align 4, !tbaa !16
  %vecext.3.24 = extractelement <4 x i32> %sums.sroa.98.1, i64 3
  %add69.3.24 = or disjoint i64 %mul56.24, %164
  %add71.3.24 = or disjoint i64 %add69.3.24, %conv70
  %arrayidx72.3.24 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.24
  store i32 %vecext.3.24, ptr addrspace(1) %arrayidx72.3.24, align 4, !tbaa !16
  %add55.25 = mul nuw nsw i64 %add, 7680
  %mul56.25 = add nuw nsw i64 %add55.25, 6400
  %vecext.25 = extractelement <4 x i32> %sums.sroa.102.1, i64 0
  %add69.25 = or disjoint i64 %mul56.25, %158
  %add71.25 = or disjoint i64 %add69.25, %conv70
  %arrayidx72.25 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.25
  store i32 %vecext.25, ptr addrspace(1) %arrayidx72.25, align 4, !tbaa !16
  %vecext.1.25 = extractelement <4 x i32> %sums.sroa.102.1, i64 1
  %add69.1.25 = or disjoint i64 %mul56.25, %160
  %add71.1.25 = or disjoint i64 %add69.1.25, %conv70
  %arrayidx72.1.25 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.25
  store i32 %vecext.1.25, ptr addrspace(1) %arrayidx72.1.25, align 4, !tbaa !16
  %vecext.2.25 = extractelement <4 x i32> %sums.sroa.102.1, i64 2
  %add69.2.25 = or disjoint i64 %mul56.25, %162
  %add71.2.25 = or disjoint i64 %add69.2.25, %conv70
  %arrayidx72.2.25 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.25
  store i32 %vecext.2.25, ptr addrspace(1) %arrayidx72.2.25, align 4, !tbaa !16
  %vecext.3.25 = extractelement <4 x i32> %sums.sroa.102.1, i64 3
  %add69.3.25 = or disjoint i64 %mul56.25, %164
  %add71.3.25 = or disjoint i64 %add69.3.25, %conv70
  %arrayidx72.3.25 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.25
  store i32 %vecext.3.25, ptr addrspace(1) %arrayidx72.3.25, align 4, !tbaa !16
  %add55.26 = mul nuw nsw i64 %add, 7680
  %mul56.26 = add nuw nsw i64 %add55.26, 6656
  %vecext.26 = extractelement <4 x i32> %sums.sroa.106.1, i64 0
  %add69.26 = or disjoint i64 %mul56.26, %158
  %add71.26 = or disjoint i64 %add69.26, %conv70
  %arrayidx72.26 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.26
  store i32 %vecext.26, ptr addrspace(1) %arrayidx72.26, align 4, !tbaa !16
  %vecext.1.26 = extractelement <4 x i32> %sums.sroa.106.1, i64 1
  %add69.1.26 = or disjoint i64 %mul56.26, %160
  %add71.1.26 = or disjoint i64 %add69.1.26, %conv70
  %arrayidx72.1.26 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.26
  store i32 %vecext.1.26, ptr addrspace(1) %arrayidx72.1.26, align 4, !tbaa !16
  %vecext.2.26 = extractelement <4 x i32> %sums.sroa.106.1, i64 2
  %add69.2.26 = or disjoint i64 %mul56.26, %162
  %add71.2.26 = or disjoint i64 %add69.2.26, %conv70
  %arrayidx72.2.26 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.26
  store i32 %vecext.2.26, ptr addrspace(1) %arrayidx72.2.26, align 4, !tbaa !16
  %vecext.3.26 = extractelement <4 x i32> %sums.sroa.106.1, i64 3
  %add69.3.26 = or disjoint i64 %mul56.26, %164
  %add71.3.26 = or disjoint i64 %add69.3.26, %conv70
  %arrayidx72.3.26 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.26
  store i32 %vecext.3.26, ptr addrspace(1) %arrayidx72.3.26, align 4, !tbaa !16
  %add55.27 = mul nuw nsw i64 %add, 7680
  %mul56.27 = add nuw nsw i64 %add55.27, 6912
  %vecext.27 = extractelement <4 x i32> %sums.sroa.110.1, i64 0
  %add69.27 = or disjoint i64 %mul56.27, %158
  %add71.27 = or disjoint i64 %add69.27, %conv70
  %arrayidx72.27 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.27
  store i32 %vecext.27, ptr addrspace(1) %arrayidx72.27, align 4, !tbaa !16
  %vecext.1.27 = extractelement <4 x i32> %sums.sroa.110.1, i64 1
  %add69.1.27 = or disjoint i64 %mul56.27, %160
  %add71.1.27 = or disjoint i64 %add69.1.27, %conv70
  %arrayidx72.1.27 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.27
  store i32 %vecext.1.27, ptr addrspace(1) %arrayidx72.1.27, align 4, !tbaa !16
  %vecext.2.27 = extractelement <4 x i32> %sums.sroa.110.1, i64 2
  %add69.2.27 = or disjoint i64 %mul56.27, %162
  %add71.2.27 = or disjoint i64 %add69.2.27, %conv70
  %arrayidx72.2.27 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.27
  store i32 %vecext.2.27, ptr addrspace(1) %arrayidx72.2.27, align 4, !tbaa !16
  %vecext.3.27 = extractelement <4 x i32> %sums.sroa.110.1, i64 3
  %add69.3.27 = or disjoint i64 %mul56.27, %164
  %add71.3.27 = or disjoint i64 %add69.3.27, %conv70
  %arrayidx72.3.27 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.27
  store i32 %vecext.3.27, ptr addrspace(1) %arrayidx72.3.27, align 4, !tbaa !16
  %add55.28 = mul nuw nsw i64 %add, 7680
  %mul56.28 = add nuw nsw i64 %add55.28, 7168
  %vecext.28 = extractelement <4 x i32> %sums.sroa.114.1, i64 0
  %add69.28 = or disjoint i64 %mul56.28, %158
  %add71.28 = or disjoint i64 %add69.28, %conv70
  %arrayidx72.28 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.28
  store i32 %vecext.28, ptr addrspace(1) %arrayidx72.28, align 4, !tbaa !16
  %vecext.1.28 = extractelement <4 x i32> %sums.sroa.114.1, i64 1
  %add69.1.28 = or disjoint i64 %mul56.28, %160
  %add71.1.28 = or disjoint i64 %add69.1.28, %conv70
  %arrayidx72.1.28 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.28
  store i32 %vecext.1.28, ptr addrspace(1) %arrayidx72.1.28, align 4, !tbaa !16
  %vecext.2.28 = extractelement <4 x i32> %sums.sroa.114.1, i64 2
  %add69.2.28 = or disjoint i64 %mul56.28, %162
  %add71.2.28 = or disjoint i64 %add69.2.28, %conv70
  %arrayidx72.2.28 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.28
  store i32 %vecext.2.28, ptr addrspace(1) %arrayidx72.2.28, align 4, !tbaa !16
  %vecext.3.28 = extractelement <4 x i32> %sums.sroa.114.1, i64 3
  %add69.3.28 = or disjoint i64 %mul56.28, %164
  %add71.3.28 = or disjoint i64 %add69.3.28, %conv70
  %arrayidx72.3.28 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.28
  store i32 %vecext.3.28, ptr addrspace(1) %arrayidx72.3.28, align 4, !tbaa !16
  %add55.29 = mul nuw nsw i64 %add, 7680
  %mul56.29 = add nuw nsw i64 %add55.29, 7424
  %vecext.29 = extractelement <4 x i32> %sums.sroa.118.1, i64 0
  %add69.29 = or disjoint i64 %mul56.29, %158
  %add71.29 = or disjoint i64 %add69.29, %conv70
  %arrayidx72.29 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.29
  store i32 %vecext.29, ptr addrspace(1) %arrayidx72.29, align 4, !tbaa !16
  %vecext.1.29 = extractelement <4 x i32> %sums.sroa.118.1, i64 1
  %add69.1.29 = or disjoint i64 %mul56.29, %160
  %add71.1.29 = or disjoint i64 %add69.1.29, %conv70
  %arrayidx72.1.29 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.29
  store i32 %vecext.1.29, ptr addrspace(1) %arrayidx72.1.29, align 4, !tbaa !16
  %vecext.2.29 = extractelement <4 x i32> %sums.sroa.118.1, i64 2
  %add69.2.29 = or disjoint i64 %mul56.29, %162
  %add71.2.29 = or disjoint i64 %add69.2.29, %conv70
  %arrayidx72.2.29 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.29
  store i32 %vecext.2.29, ptr addrspace(1) %arrayidx72.2.29, align 4, !tbaa !16
  %vecext.3.29 = extractelement <4 x i32> %sums.sroa.118.1, i64 3
  %add69.3.29 = or disjoint i64 %mul56.29, %164
  %add71.3.29 = or disjoint i64 %add69.3.29, %conv70
  %arrayidx72.3.29 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.29
  store i32 %vecext.3.29, ptr addrspace(1) %arrayidx72.3.29, align 4, !tbaa !16
  ret void
}

; Function Attrs: convergent mustprogress nofree norecurse nounwind memory(argmem: readwrite)
define protected metaxgpu_kernel void @_Z13mmaPeakKernelILi31EEvPKaS1_Pii(ptr addrspace(1) noalias nocapture noundef readonly %a.coerce, ptr addrspace(1) noalias nocapture noundef readonly %b.coerce, ptr addrspace(1) noalias noundef writeonly %c.coerce, i32 noundef %iterations) local_unnamed_addr #3 comdat {
entry:
  %0 = tail call noundef range(i32 0, 1024) i32 @llvm.mxc.thread.id.x(), !range !25
  %1 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.mxc.dispatch.ptr()
  %2 = getelementptr inbounds i8, ptr addrspace(4) %1, i64 4
  %3 = load i16, ptr addrspace(4) %2, align 4, !range !26, !invariant.load !14
  %rem11 = and i32 %0, 15
  %4 = lshr i32 %0, 2
  %mul13 = and i32 %4, 12
  %mul15 = shl nuw nsw i32 %rem11, 4
  %5 = zext nneg i32 %mul15 to i64
  %6 = zext nneg i32 %mul13 to i64
  %7 = or disjoint i64 %5, %6
  %add.ptr = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %7
  %8 = load i32, ptr addrspace(1) %add.ptr, align 1
  %add.ptr21 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %7
  %9 = load i32, ptr addrspace(1) %add.ptr21, align 1
  %10 = or disjoint i64 %5, %6
  %11 = or disjoint i64 %10, 256
  %add.ptr.1 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %11
  %12 = load i32, ptr addrspace(1) %add.ptr.1, align 1
  %add.ptr21.1 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %11
  %13 = load i32, ptr addrspace(1) %add.ptr21.1, align 1
  %14 = or disjoint i64 %5, %6
  %15 = or disjoint i64 %14, 512
  %add.ptr.2 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %15
  %16 = load i32, ptr addrspace(1) %add.ptr.2, align 1
  %add.ptr21.2 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %15
  %17 = load i32, ptr addrspace(1) %add.ptr21.2, align 1
  %18 = or disjoint i64 %5, %6
  %19 = or disjoint i64 %18, 768
  %add.ptr.3 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %19
  %20 = load i32, ptr addrspace(1) %add.ptr.3, align 1
  %add.ptr21.3 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %19
  %21 = load i32, ptr addrspace(1) %add.ptr21.3, align 1
  %22 = or disjoint i64 %5, %6
  %23 = or disjoint i64 %22, 1024
  %add.ptr.4 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %23
  %24 = load i32, ptr addrspace(1) %add.ptr.4, align 1
  %add.ptr21.4 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %23
  %25 = load i32, ptr addrspace(1) %add.ptr21.4, align 1
  %26 = or disjoint i64 %5, %6
  %27 = or disjoint i64 %26, 1280
  %add.ptr.5 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %27
  %28 = load i32, ptr addrspace(1) %add.ptr.5, align 1
  %add.ptr21.5 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %27
  %29 = load i32, ptr addrspace(1) %add.ptr21.5, align 1
  %30 = or disjoint i64 %5, %6
  %31 = or disjoint i64 %30, 1536
  %add.ptr.6 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %31
  %32 = load i32, ptr addrspace(1) %add.ptr.6, align 1
  %add.ptr21.6 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %31
  %33 = load i32, ptr addrspace(1) %add.ptr21.6, align 1
  %34 = or disjoint i64 %5, %6
  %35 = or disjoint i64 %34, 1792
  %add.ptr.7 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %35
  %36 = load i32, ptr addrspace(1) %add.ptr.7, align 1
  %add.ptr21.7 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %35
  %37 = load i32, ptr addrspace(1) %add.ptr21.7, align 1
  %38 = or disjoint i64 %5, %6
  %39 = or disjoint i64 %38, 2048
  %add.ptr.8 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %39
  %40 = load i32, ptr addrspace(1) %add.ptr.8, align 1
  %add.ptr21.8 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %39
  %41 = load i32, ptr addrspace(1) %add.ptr21.8, align 1
  %42 = or disjoint i64 %5, %6
  %43 = or disjoint i64 %42, 2304
  %add.ptr.9 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %43
  %44 = load i32, ptr addrspace(1) %add.ptr.9, align 1
  %add.ptr21.9 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %43
  %45 = load i32, ptr addrspace(1) %add.ptr21.9, align 1
  %46 = or disjoint i64 %5, %6
  %47 = or disjoint i64 %46, 2560
  %add.ptr.10 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %47
  %48 = load i32, ptr addrspace(1) %add.ptr.10, align 1
  %add.ptr21.10 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %47
  %49 = load i32, ptr addrspace(1) %add.ptr21.10, align 1
  %50 = or disjoint i64 %5, %6
  %51 = or disjoint i64 %50, 2816
  %add.ptr.11 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %51
  %52 = load i32, ptr addrspace(1) %add.ptr.11, align 1
  %add.ptr21.11 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %51
  %53 = load i32, ptr addrspace(1) %add.ptr21.11, align 1
  %54 = or disjoint i64 %5, %6
  %55 = or disjoint i64 %54, 3072
  %add.ptr.12 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %55
  %56 = load i32, ptr addrspace(1) %add.ptr.12, align 1
  %add.ptr21.12 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %55
  %57 = load i32, ptr addrspace(1) %add.ptr21.12, align 1
  %58 = or disjoint i64 %5, %6
  %59 = or disjoint i64 %58, 3328
  %add.ptr.13 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %59
  %60 = load i32, ptr addrspace(1) %add.ptr.13, align 1
  %add.ptr21.13 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %59
  %61 = load i32, ptr addrspace(1) %add.ptr21.13, align 1
  %62 = or disjoint i64 %5, %6
  %63 = or disjoint i64 %62, 3584
  %add.ptr.14 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %63
  %64 = load i32, ptr addrspace(1) %add.ptr.14, align 1
  %add.ptr21.14 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %63
  %65 = load i32, ptr addrspace(1) %add.ptr21.14, align 1
  %66 = or disjoint i64 %5, %6
  %67 = or disjoint i64 %66, 3840
  %add.ptr.15 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %67
  %68 = load i32, ptr addrspace(1) %add.ptr.15, align 1
  %add.ptr21.15 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %67
  %69 = load i32, ptr addrspace(1) %add.ptr21.15, align 1
  %70 = or disjoint i64 %5, %6
  %71 = or disjoint i64 %70, 4096
  %add.ptr.16 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %71
  %72 = load i32, ptr addrspace(1) %add.ptr.16, align 1
  %add.ptr21.16 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %71
  %73 = load i32, ptr addrspace(1) %add.ptr21.16, align 1
  %74 = or disjoint i64 %5, %6
  %75 = or disjoint i64 %74, 4352
  %add.ptr.17 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %75
  %76 = load i32, ptr addrspace(1) %add.ptr.17, align 1
  %add.ptr21.17 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %75
  %77 = load i32, ptr addrspace(1) %add.ptr21.17, align 1
  %78 = or disjoint i64 %5, %6
  %79 = or disjoint i64 %78, 4608
  %add.ptr.18 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %79
  %80 = load i32, ptr addrspace(1) %add.ptr.18, align 1
  %add.ptr21.18 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %79
  %81 = load i32, ptr addrspace(1) %add.ptr21.18, align 1
  %82 = or disjoint i64 %5, %6
  %83 = or disjoint i64 %82, 4864
  %add.ptr.19 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %83
  %84 = load i32, ptr addrspace(1) %add.ptr.19, align 1
  %add.ptr21.19 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %83
  %85 = load i32, ptr addrspace(1) %add.ptr21.19, align 1
  %86 = or disjoint i64 %5, %6
  %87 = or disjoint i64 %86, 5120
  %add.ptr.20 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %87
  %88 = load i32, ptr addrspace(1) %add.ptr.20, align 1
  %add.ptr21.20 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %87
  %89 = load i32, ptr addrspace(1) %add.ptr21.20, align 1
  %90 = or disjoint i64 %5, %6
  %91 = or disjoint i64 %90, 5376
  %add.ptr.21 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %91
  %92 = load i32, ptr addrspace(1) %add.ptr.21, align 1
  %add.ptr21.21 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %91
  %93 = load i32, ptr addrspace(1) %add.ptr21.21, align 1
  %94 = or disjoint i64 %5, %6
  %95 = or disjoint i64 %94, 5632
  %add.ptr.22 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %95
  %96 = load i32, ptr addrspace(1) %add.ptr.22, align 1
  %add.ptr21.22 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %95
  %97 = load i32, ptr addrspace(1) %add.ptr21.22, align 1
  %98 = or disjoint i64 %5, %6
  %99 = or disjoint i64 %98, 5888
  %add.ptr.23 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %99
  %100 = load i32, ptr addrspace(1) %add.ptr.23, align 1
  %add.ptr21.23 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %99
  %101 = load i32, ptr addrspace(1) %add.ptr21.23, align 1
  %102 = or disjoint i64 %5, %6
  %103 = or disjoint i64 %102, 6144
  %add.ptr.24 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %103
  %104 = load i32, ptr addrspace(1) %add.ptr.24, align 1
  %add.ptr21.24 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %103
  %105 = load i32, ptr addrspace(1) %add.ptr21.24, align 1
  %106 = or disjoint i64 %5, %6
  %107 = or disjoint i64 %106, 6400
  %add.ptr.25 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %107
  %108 = load i32, ptr addrspace(1) %add.ptr.25, align 1
  %add.ptr21.25 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %107
  %109 = load i32, ptr addrspace(1) %add.ptr21.25, align 1
  %110 = or disjoint i64 %5, %6
  %111 = or disjoint i64 %110, 6656
  %add.ptr.26 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %111
  %112 = load i32, ptr addrspace(1) %add.ptr.26, align 1
  %add.ptr21.26 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %111
  %113 = load i32, ptr addrspace(1) %add.ptr21.26, align 1
  %114 = or disjoint i64 %5, %6
  %115 = or disjoint i64 %114, 6912
  %add.ptr.27 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %115
  %116 = load i32, ptr addrspace(1) %add.ptr.27, align 1
  %add.ptr21.27 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %115
  %117 = load i32, ptr addrspace(1) %add.ptr21.27, align 1
  %118 = or disjoint i64 %5, %6
  %119 = or disjoint i64 %118, 7168
  %add.ptr.28 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %119
  %120 = load i32, ptr addrspace(1) %add.ptr.28, align 1
  %add.ptr21.28 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %119
  %121 = load i32, ptr addrspace(1) %add.ptr21.28, align 1
  %122 = or disjoint i64 %5, %6
  %123 = or disjoint i64 %122, 7424
  %add.ptr.29 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %123
  %124 = load i32, ptr addrspace(1) %add.ptr.29, align 1
  %add.ptr21.29 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %123
  %125 = load i32, ptr addrspace(1) %add.ptr21.29, align 1
  %126 = or disjoint i64 %5, %6
  %127 = or disjoint i64 %126, 7680
  %add.ptr.30 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %127
  %128 = load i32, ptr addrspace(1) %add.ptr.30, align 1
  %add.ptr21.30 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %127
  %129 = load i32, ptr addrspace(1) %add.ptr21.30, align 1
  %cmp25104 = icmp sgt i32 %iterations, 0
  br i1 %cmp25104, label %for.cond30.preheader, label %for.cond49.preheader

for.cond30.preheader:                             ; preds = %entry, %for.cond30.preheader
  %sums.sroa.122.0 = phi <4 x i32> [ %160, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.118.0 = phi <4 x i32> [ %159, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.114.0 = phi <4 x i32> [ %158, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.110.0 = phi <4 x i32> [ %157, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.106.0 = phi <4 x i32> [ %156, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.102.0 = phi <4 x i32> [ %155, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.98.0 = phi <4 x i32> [ %154, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.94.0 = phi <4 x i32> [ %153, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.90.0 = phi <4 x i32> [ %152, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.86.0 = phi <4 x i32> [ %151, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.82.0 = phi <4 x i32> [ %150, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.78.0 = phi <4 x i32> [ %149, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.74.0 = phi <4 x i32> [ %148, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.70.0 = phi <4 x i32> [ %147, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.66.0 = phi <4 x i32> [ %146, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.62.0 = phi <4 x i32> [ %145, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.58.0 = phi <4 x i32> [ %144, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.54.0 = phi <4 x i32> [ %143, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.50.0 = phi <4 x i32> [ %142, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.46.0 = phi <4 x i32> [ %141, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.42.0 = phi <4 x i32> [ %140, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.38.0 = phi <4 x i32> [ %139, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.34.0 = phi <4 x i32> [ %138, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.30.0 = phi <4 x i32> [ %137, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.26.0 = phi <4 x i32> [ %136, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.22.0 = phi <4 x i32> [ %135, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.18.0 = phi <4 x i32> [ %134, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.14.0 = phi <4 x i32> [ %133, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.10.0 = phi <4 x i32> [ %132, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.6.0 = phi <4 x i32> [ %131, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.0.0 = phi <4 x i32> [ %130, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %iteration.0105 = phi i32 [ %inc46, %for.cond30.preheader ], [ 0, %entry ]
  %130 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %8, i32 %9, <4 x i32> %sums.sroa.0.0), !call_argsrelate !27
  %131 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %12, i32 %13, <4 x i32> %sums.sroa.6.0), !call_argsrelate !27
  %132 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %16, i32 %17, <4 x i32> %sums.sroa.10.0), !call_argsrelate !27
  %133 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %20, i32 %21, <4 x i32> %sums.sroa.14.0), !call_argsrelate !27
  %134 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %24, i32 %25, <4 x i32> %sums.sroa.18.0), !call_argsrelate !27
  %135 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %28, i32 %29, <4 x i32> %sums.sroa.22.0), !call_argsrelate !27
  %136 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %32, i32 %33, <4 x i32> %sums.sroa.26.0), !call_argsrelate !27
  %137 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %36, i32 %37, <4 x i32> %sums.sroa.30.0), !call_argsrelate !27
  %138 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %40, i32 %41, <4 x i32> %sums.sroa.34.0), !call_argsrelate !27
  %139 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %44, i32 %45, <4 x i32> %sums.sroa.38.0), !call_argsrelate !27
  %140 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %48, i32 %49, <4 x i32> %sums.sroa.42.0), !call_argsrelate !27
  %141 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %52, i32 %53, <4 x i32> %sums.sroa.46.0), !call_argsrelate !27
  %142 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %56, i32 %57, <4 x i32> %sums.sroa.50.0), !call_argsrelate !27
  %143 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %60, i32 %61, <4 x i32> %sums.sroa.54.0), !call_argsrelate !27
  %144 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %64, i32 %65, <4 x i32> %sums.sroa.58.0), !call_argsrelate !27
  %145 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %68, i32 %69, <4 x i32> %sums.sroa.62.0), !call_argsrelate !27
  %146 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %72, i32 %73, <4 x i32> %sums.sroa.66.0), !call_argsrelate !27
  %147 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %76, i32 %77, <4 x i32> %sums.sroa.70.0), !call_argsrelate !27
  %148 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %80, i32 %81, <4 x i32> %sums.sroa.74.0), !call_argsrelate !27
  %149 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %84, i32 %85, <4 x i32> %sums.sroa.78.0), !call_argsrelate !27
  %150 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %88, i32 %89, <4 x i32> %sums.sroa.82.0), !call_argsrelate !27
  %151 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %92, i32 %93, <4 x i32> %sums.sroa.86.0), !call_argsrelate !27
  %152 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %96, i32 %97, <4 x i32> %sums.sroa.90.0), !call_argsrelate !27
  %153 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %100, i32 %101, <4 x i32> %sums.sroa.94.0), !call_argsrelate !27
  %154 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %104, i32 %105, <4 x i32> %sums.sroa.98.0), !call_argsrelate !27
  %155 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %108, i32 %109, <4 x i32> %sums.sroa.102.0), !call_argsrelate !27
  %156 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %112, i32 %113, <4 x i32> %sums.sroa.106.0), !call_argsrelate !27
  %157 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %116, i32 %117, <4 x i32> %sums.sroa.110.0), !call_argsrelate !27
  %158 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %120, i32 %121, <4 x i32> %sums.sroa.114.0), !call_argsrelate !27
  %159 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %124, i32 %125, <4 x i32> %sums.sroa.118.0), !call_argsrelate !27
  %160 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %128, i32 %129, <4 x i32> %sums.sroa.122.0), !call_argsrelate !27
  %inc46 = add nuw nsw i32 %iteration.0105, 1
  %exitcond.not = icmp eq i32 %inc46, %iterations
  br i1 %exitcond.not, label %for.cond49.preheader, label %for.cond30.preheader, !llvm.loop !48

for.cond49.preheader:                             ; preds = %for.cond30.preheader, %entry
  %sums.sroa.122.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %160, %for.cond30.preheader ]
  %sums.sroa.118.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %159, %for.cond30.preheader ]
  %sums.sroa.114.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %158, %for.cond30.preheader ]
  %sums.sroa.110.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %157, %for.cond30.preheader ]
  %sums.sroa.106.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %156, %for.cond30.preheader ]
  %sums.sroa.102.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %155, %for.cond30.preheader ]
  %sums.sroa.98.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %154, %for.cond30.preheader ]
  %sums.sroa.94.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %153, %for.cond30.preheader ]
  %sums.sroa.90.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %152, %for.cond30.preheader ]
  %sums.sroa.86.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %151, %for.cond30.preheader ]
  %sums.sroa.82.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %150, %for.cond30.preheader ]
  %sums.sroa.78.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %149, %for.cond30.preheader ]
  %sums.sroa.74.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %148, %for.cond30.preheader ]
  %sums.sroa.70.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %147, %for.cond30.preheader ]
  %sums.sroa.66.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %146, %for.cond30.preheader ]
  %sums.sroa.62.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %145, %for.cond30.preheader ]
  %sums.sroa.58.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %144, %for.cond30.preheader ]
  %sums.sroa.54.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %143, %for.cond30.preheader ]
  %sums.sroa.50.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %142, %for.cond30.preheader ]
  %sums.sroa.46.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %141, %for.cond30.preheader ]
  %sums.sroa.42.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %140, %for.cond30.preheader ]
  %sums.sroa.38.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %139, %for.cond30.preheader ]
  %sums.sroa.34.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %138, %for.cond30.preheader ]
  %sums.sroa.30.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %137, %for.cond30.preheader ]
  %sums.sroa.26.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %136, %for.cond30.preheader ]
  %sums.sroa.22.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %135, %for.cond30.preheader ]
  %sums.sroa.18.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %134, %for.cond30.preheader ]
  %sums.sroa.14.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %133, %for.cond30.preheader ]
  %sums.sroa.10.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %132, %for.cond30.preheader ]
  %sums.sroa.6.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %131, %for.cond30.preheader ]
  %sums.sroa.0.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %130, %for.cond30.preheader ]
  %161 = lshr i16 %3, 6
  %conv7 = zext nneg i16 %161 to i64
  %162 = tail call noundef range(i32 0, 2147483647) i32 @llvm.mxc.block.id.x(), !range !15
  %conv = zext nneg i32 %162 to i64
  %mul = mul nuw nsw i64 %conv7, %conv
  %div9100 = lshr i32 %0, 6
  %conv10 = zext nneg i32 %div9100 to i64
  %add = add nuw nsw i64 %mul, %conv10
  %conv70 = zext nneg i32 %rem11 to i64
  %mul56 = mul nuw nsw i64 %add, 7936
  %vecext = extractelement <4 x i32> %sums.sroa.0.1, i64 0
  %163 = shl nuw nsw i64 %6, 4
  %add69 = or disjoint i64 %mul56, %163
  %add71 = or disjoint i64 %add69, %conv70
  %arrayidx72 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71
  store i32 %vecext, ptr addrspace(1) %arrayidx72, align 4, !tbaa !16
  %vecext.1 = extractelement <4 x i32> %sums.sroa.0.1, i64 1
  %164 = shl nuw nsw i64 %6, 4
  %165 = or disjoint i64 %164, 16
  %add69.1 = or disjoint i64 %mul56, %165
  %add71.1 = or disjoint i64 %add69.1, %conv70
  %arrayidx72.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1
  store i32 %vecext.1, ptr addrspace(1) %arrayidx72.1, align 4, !tbaa !16
  %vecext.2 = extractelement <4 x i32> %sums.sroa.0.1, i64 2
  %166 = shl nuw nsw i64 %6, 4
  %167 = or disjoint i64 %166, 32
  %add69.2 = or disjoint i64 %mul56, %167
  %add71.2 = or disjoint i64 %add69.2, %conv70
  %arrayidx72.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2
  store i32 %vecext.2, ptr addrspace(1) %arrayidx72.2, align 4, !tbaa !16
  %vecext.3 = extractelement <4 x i32> %sums.sroa.0.1, i64 3
  %168 = shl nuw nsw i64 %6, 4
  %169 = or disjoint i64 %168, 48
  %add69.3 = or disjoint i64 %mul56, %169
  %add71.3 = or disjoint i64 %add69.3, %conv70
  %arrayidx72.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3
  store i32 %vecext.3, ptr addrspace(1) %arrayidx72.3, align 4, !tbaa !16
  %add55.1 = mul nuw nsw i64 %add, 7936
  %mul56.1 = add nuw nsw i64 %add55.1, 256
  %vecext.1118 = extractelement <4 x i32> %sums.sroa.6.1, i64 0
  %add69.1119 = or disjoint i64 %mul56.1, %163
  %add71.1120 = or disjoint i64 %add69.1119, %conv70
  %arrayidx72.1121 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1120
  store i32 %vecext.1118, ptr addrspace(1) %arrayidx72.1121, align 4, !tbaa !16
  %vecext.1.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 1
  %add69.1.1 = or disjoint i64 %mul56.1, %165
  %add71.1.1 = or disjoint i64 %add69.1.1, %conv70
  %arrayidx72.1.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.1
  store i32 %vecext.1.1, ptr addrspace(1) %arrayidx72.1.1, align 4, !tbaa !16
  %vecext.2.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 2
  %add69.2.1 = or disjoint i64 %mul56.1, %167
  %add71.2.1 = or disjoint i64 %add69.2.1, %conv70
  %arrayidx72.2.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.1
  store i32 %vecext.2.1, ptr addrspace(1) %arrayidx72.2.1, align 4, !tbaa !16
  %vecext.3.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 3
  %add69.3.1 = or disjoint i64 %mul56.1, %169
  %add71.3.1 = or disjoint i64 %add69.3.1, %conv70
  %arrayidx72.3.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.1
  store i32 %vecext.3.1, ptr addrspace(1) %arrayidx72.3.1, align 4, !tbaa !16
  %add55.2 = mul nuw nsw i64 %add, 7936
  %mul56.2 = add nuw nsw i64 %add55.2, 512
  %vecext.2122 = extractelement <4 x i32> %sums.sroa.10.1, i64 0
  %add69.2123 = or disjoint i64 %mul56.2, %163
  %add71.2124 = or disjoint i64 %add69.2123, %conv70
  %arrayidx72.2125 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2124
  store i32 %vecext.2122, ptr addrspace(1) %arrayidx72.2125, align 4, !tbaa !16
  %vecext.1.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 1
  %add69.1.2 = or disjoint i64 %mul56.2, %165
  %add71.1.2 = or disjoint i64 %add69.1.2, %conv70
  %arrayidx72.1.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.2
  store i32 %vecext.1.2, ptr addrspace(1) %arrayidx72.1.2, align 4, !tbaa !16
  %vecext.2.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 2
  %add69.2.2 = or disjoint i64 %mul56.2, %167
  %add71.2.2 = or disjoint i64 %add69.2.2, %conv70
  %arrayidx72.2.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.2
  store i32 %vecext.2.2, ptr addrspace(1) %arrayidx72.2.2, align 4, !tbaa !16
  %vecext.3.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 3
  %add69.3.2 = or disjoint i64 %mul56.2, %169
  %add71.3.2 = or disjoint i64 %add69.3.2, %conv70
  %arrayidx72.3.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.2
  store i32 %vecext.3.2, ptr addrspace(1) %arrayidx72.3.2, align 4, !tbaa !16
  %add55.3 = mul nuw nsw i64 %add, 7936
  %mul56.3 = add nuw nsw i64 %add55.3, 768
  %vecext.3126 = extractelement <4 x i32> %sums.sroa.14.1, i64 0
  %add69.3127 = or disjoint i64 %mul56.3, %163
  %add71.3128 = or disjoint i64 %add69.3127, %conv70
  %arrayidx72.3129 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3128
  store i32 %vecext.3126, ptr addrspace(1) %arrayidx72.3129, align 4, !tbaa !16
  %vecext.1.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 1
  %add69.1.3 = or disjoint i64 %mul56.3, %165
  %add71.1.3 = or disjoint i64 %add69.1.3, %conv70
  %arrayidx72.1.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.3
  store i32 %vecext.1.3, ptr addrspace(1) %arrayidx72.1.3, align 4, !tbaa !16
  %vecext.2.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 2
  %add69.2.3 = or disjoint i64 %mul56.3, %167
  %add71.2.3 = or disjoint i64 %add69.2.3, %conv70
  %arrayidx72.2.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.3
  store i32 %vecext.2.3, ptr addrspace(1) %arrayidx72.2.3, align 4, !tbaa !16
  %vecext.3.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 3
  %add69.3.3 = or disjoint i64 %mul56.3, %169
  %add71.3.3 = or disjoint i64 %add69.3.3, %conv70
  %arrayidx72.3.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.3
  store i32 %vecext.3.3, ptr addrspace(1) %arrayidx72.3.3, align 4, !tbaa !16
  %add55.4 = mul nuw nsw i64 %add, 7936
  %mul56.4 = add nuw nsw i64 %add55.4, 1024
  %vecext.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 0
  %add69.4 = or disjoint i64 %mul56.4, %163
  %add71.4 = or disjoint i64 %add69.4, %conv70
  %arrayidx72.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.4
  store i32 %vecext.4, ptr addrspace(1) %arrayidx72.4, align 4, !tbaa !16
  %vecext.1.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 1
  %add69.1.4 = or disjoint i64 %mul56.4, %165
  %add71.1.4 = or disjoint i64 %add69.1.4, %conv70
  %arrayidx72.1.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.4
  store i32 %vecext.1.4, ptr addrspace(1) %arrayidx72.1.4, align 4, !tbaa !16
  %vecext.2.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 2
  %add69.2.4 = or disjoint i64 %mul56.4, %167
  %add71.2.4 = or disjoint i64 %add69.2.4, %conv70
  %arrayidx72.2.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.4
  store i32 %vecext.2.4, ptr addrspace(1) %arrayidx72.2.4, align 4, !tbaa !16
  %vecext.3.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 3
  %add69.3.4 = or disjoint i64 %mul56.4, %169
  %add71.3.4 = or disjoint i64 %add69.3.4, %conv70
  %arrayidx72.3.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.4
  store i32 %vecext.3.4, ptr addrspace(1) %arrayidx72.3.4, align 4, !tbaa !16
  %add55.5 = mul nuw nsw i64 %add, 7936
  %mul56.5 = add nuw nsw i64 %add55.5, 1280
  %vecext.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 0
  %add69.5 = or disjoint i64 %mul56.5, %163
  %add71.5 = or disjoint i64 %add69.5, %conv70
  %arrayidx72.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.5
  store i32 %vecext.5, ptr addrspace(1) %arrayidx72.5, align 4, !tbaa !16
  %vecext.1.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 1
  %add69.1.5 = or disjoint i64 %mul56.5, %165
  %add71.1.5 = or disjoint i64 %add69.1.5, %conv70
  %arrayidx72.1.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.5
  store i32 %vecext.1.5, ptr addrspace(1) %arrayidx72.1.5, align 4, !tbaa !16
  %vecext.2.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 2
  %add69.2.5 = or disjoint i64 %mul56.5, %167
  %add71.2.5 = or disjoint i64 %add69.2.5, %conv70
  %arrayidx72.2.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.5
  store i32 %vecext.2.5, ptr addrspace(1) %arrayidx72.2.5, align 4, !tbaa !16
  %vecext.3.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 3
  %add69.3.5 = or disjoint i64 %mul56.5, %169
  %add71.3.5 = or disjoint i64 %add69.3.5, %conv70
  %arrayidx72.3.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.5
  store i32 %vecext.3.5, ptr addrspace(1) %arrayidx72.3.5, align 4, !tbaa !16
  %add55.6 = mul nuw nsw i64 %add, 7936
  %mul56.6 = add nuw nsw i64 %add55.6, 1536
  %vecext.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 0
  %add69.6 = or disjoint i64 %mul56.6, %163
  %add71.6 = or disjoint i64 %add69.6, %conv70
  %arrayidx72.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.6
  store i32 %vecext.6, ptr addrspace(1) %arrayidx72.6, align 4, !tbaa !16
  %vecext.1.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 1
  %add69.1.6 = or disjoint i64 %mul56.6, %165
  %add71.1.6 = or disjoint i64 %add69.1.6, %conv70
  %arrayidx72.1.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.6
  store i32 %vecext.1.6, ptr addrspace(1) %arrayidx72.1.6, align 4, !tbaa !16
  %vecext.2.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 2
  %add69.2.6 = or disjoint i64 %mul56.6, %167
  %add71.2.6 = or disjoint i64 %add69.2.6, %conv70
  %arrayidx72.2.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.6
  store i32 %vecext.2.6, ptr addrspace(1) %arrayidx72.2.6, align 4, !tbaa !16
  %vecext.3.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 3
  %add69.3.6 = or disjoint i64 %mul56.6, %169
  %add71.3.6 = or disjoint i64 %add69.3.6, %conv70
  %arrayidx72.3.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.6
  store i32 %vecext.3.6, ptr addrspace(1) %arrayidx72.3.6, align 4, !tbaa !16
  %add55.7 = mul nuw nsw i64 %add, 7936
  %mul56.7 = add nuw nsw i64 %add55.7, 1792
  %vecext.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 0
  %add69.7 = or disjoint i64 %mul56.7, %163
  %add71.7 = or disjoint i64 %add69.7, %conv70
  %arrayidx72.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.7
  store i32 %vecext.7, ptr addrspace(1) %arrayidx72.7, align 4, !tbaa !16
  %vecext.1.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 1
  %add69.1.7 = or disjoint i64 %mul56.7, %165
  %add71.1.7 = or disjoint i64 %add69.1.7, %conv70
  %arrayidx72.1.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.7
  store i32 %vecext.1.7, ptr addrspace(1) %arrayidx72.1.7, align 4, !tbaa !16
  %vecext.2.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 2
  %add69.2.7 = or disjoint i64 %mul56.7, %167
  %add71.2.7 = or disjoint i64 %add69.2.7, %conv70
  %arrayidx72.2.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.7
  store i32 %vecext.2.7, ptr addrspace(1) %arrayidx72.2.7, align 4, !tbaa !16
  %vecext.3.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 3
  %add69.3.7 = or disjoint i64 %mul56.7, %169
  %add71.3.7 = or disjoint i64 %add69.3.7, %conv70
  %arrayidx72.3.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.7
  store i32 %vecext.3.7, ptr addrspace(1) %arrayidx72.3.7, align 4, !tbaa !16
  %add55.8 = mul nuw nsw i64 %add, 7936
  %mul56.8 = add nuw nsw i64 %add55.8, 2048
  %vecext.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 0
  %add69.8 = or disjoint i64 %mul56.8, %163
  %add71.8 = or disjoint i64 %add69.8, %conv70
  %arrayidx72.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.8
  store i32 %vecext.8, ptr addrspace(1) %arrayidx72.8, align 4, !tbaa !16
  %vecext.1.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 1
  %add69.1.8 = or disjoint i64 %mul56.8, %165
  %add71.1.8 = or disjoint i64 %add69.1.8, %conv70
  %arrayidx72.1.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.8
  store i32 %vecext.1.8, ptr addrspace(1) %arrayidx72.1.8, align 4, !tbaa !16
  %vecext.2.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 2
  %add69.2.8 = or disjoint i64 %mul56.8, %167
  %add71.2.8 = or disjoint i64 %add69.2.8, %conv70
  %arrayidx72.2.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.8
  store i32 %vecext.2.8, ptr addrspace(1) %arrayidx72.2.8, align 4, !tbaa !16
  %vecext.3.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 3
  %add69.3.8 = or disjoint i64 %mul56.8, %169
  %add71.3.8 = or disjoint i64 %add69.3.8, %conv70
  %arrayidx72.3.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.8
  store i32 %vecext.3.8, ptr addrspace(1) %arrayidx72.3.8, align 4, !tbaa !16
  %add55.9 = mul nuw nsw i64 %add, 7936
  %mul56.9 = add nuw nsw i64 %add55.9, 2304
  %vecext.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 0
  %add69.9 = or disjoint i64 %mul56.9, %163
  %add71.9 = or disjoint i64 %add69.9, %conv70
  %arrayidx72.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.9
  store i32 %vecext.9, ptr addrspace(1) %arrayidx72.9, align 4, !tbaa !16
  %vecext.1.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 1
  %add69.1.9 = or disjoint i64 %mul56.9, %165
  %add71.1.9 = or disjoint i64 %add69.1.9, %conv70
  %arrayidx72.1.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.9
  store i32 %vecext.1.9, ptr addrspace(1) %arrayidx72.1.9, align 4, !tbaa !16
  %vecext.2.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 2
  %add69.2.9 = or disjoint i64 %mul56.9, %167
  %add71.2.9 = or disjoint i64 %add69.2.9, %conv70
  %arrayidx72.2.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.9
  store i32 %vecext.2.9, ptr addrspace(1) %arrayidx72.2.9, align 4, !tbaa !16
  %vecext.3.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 3
  %add69.3.9 = or disjoint i64 %mul56.9, %169
  %add71.3.9 = or disjoint i64 %add69.3.9, %conv70
  %arrayidx72.3.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.9
  store i32 %vecext.3.9, ptr addrspace(1) %arrayidx72.3.9, align 4, !tbaa !16
  %add55.10 = mul nuw nsw i64 %add, 7936
  %mul56.10 = add nuw nsw i64 %add55.10, 2560
  %vecext.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 0
  %add69.10 = or disjoint i64 %mul56.10, %163
  %add71.10 = or disjoint i64 %add69.10, %conv70
  %arrayidx72.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.10
  store i32 %vecext.10, ptr addrspace(1) %arrayidx72.10, align 4, !tbaa !16
  %vecext.1.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 1
  %add69.1.10 = or disjoint i64 %mul56.10, %165
  %add71.1.10 = or disjoint i64 %add69.1.10, %conv70
  %arrayidx72.1.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.10
  store i32 %vecext.1.10, ptr addrspace(1) %arrayidx72.1.10, align 4, !tbaa !16
  %vecext.2.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 2
  %add69.2.10 = or disjoint i64 %mul56.10, %167
  %add71.2.10 = or disjoint i64 %add69.2.10, %conv70
  %arrayidx72.2.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.10
  store i32 %vecext.2.10, ptr addrspace(1) %arrayidx72.2.10, align 4, !tbaa !16
  %vecext.3.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 3
  %add69.3.10 = or disjoint i64 %mul56.10, %169
  %add71.3.10 = or disjoint i64 %add69.3.10, %conv70
  %arrayidx72.3.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.10
  store i32 %vecext.3.10, ptr addrspace(1) %arrayidx72.3.10, align 4, !tbaa !16
  %add55.11 = mul nuw nsw i64 %add, 7936
  %mul56.11 = add nuw nsw i64 %add55.11, 2816
  %vecext.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 0
  %add69.11 = or disjoint i64 %mul56.11, %163
  %add71.11 = or disjoint i64 %add69.11, %conv70
  %arrayidx72.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.11
  store i32 %vecext.11, ptr addrspace(1) %arrayidx72.11, align 4, !tbaa !16
  %vecext.1.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 1
  %add69.1.11 = or disjoint i64 %mul56.11, %165
  %add71.1.11 = or disjoint i64 %add69.1.11, %conv70
  %arrayidx72.1.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.11
  store i32 %vecext.1.11, ptr addrspace(1) %arrayidx72.1.11, align 4, !tbaa !16
  %vecext.2.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 2
  %add69.2.11 = or disjoint i64 %mul56.11, %167
  %add71.2.11 = or disjoint i64 %add69.2.11, %conv70
  %arrayidx72.2.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.11
  store i32 %vecext.2.11, ptr addrspace(1) %arrayidx72.2.11, align 4, !tbaa !16
  %vecext.3.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 3
  %add69.3.11 = or disjoint i64 %mul56.11, %169
  %add71.3.11 = or disjoint i64 %add69.3.11, %conv70
  %arrayidx72.3.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.11
  store i32 %vecext.3.11, ptr addrspace(1) %arrayidx72.3.11, align 4, !tbaa !16
  %add55.12 = mul nuw nsw i64 %add, 7936
  %mul56.12 = add nuw nsw i64 %add55.12, 3072
  %vecext.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 0
  %add69.12 = or disjoint i64 %mul56.12, %163
  %add71.12 = or disjoint i64 %add69.12, %conv70
  %arrayidx72.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.12
  store i32 %vecext.12, ptr addrspace(1) %arrayidx72.12, align 4, !tbaa !16
  %vecext.1.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 1
  %add69.1.12 = or disjoint i64 %mul56.12, %165
  %add71.1.12 = or disjoint i64 %add69.1.12, %conv70
  %arrayidx72.1.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.12
  store i32 %vecext.1.12, ptr addrspace(1) %arrayidx72.1.12, align 4, !tbaa !16
  %vecext.2.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 2
  %add69.2.12 = or disjoint i64 %mul56.12, %167
  %add71.2.12 = or disjoint i64 %add69.2.12, %conv70
  %arrayidx72.2.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.12
  store i32 %vecext.2.12, ptr addrspace(1) %arrayidx72.2.12, align 4, !tbaa !16
  %vecext.3.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 3
  %add69.3.12 = or disjoint i64 %mul56.12, %169
  %add71.3.12 = or disjoint i64 %add69.3.12, %conv70
  %arrayidx72.3.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.12
  store i32 %vecext.3.12, ptr addrspace(1) %arrayidx72.3.12, align 4, !tbaa !16
  %add55.13 = mul nuw nsw i64 %add, 7936
  %mul56.13 = add nuw nsw i64 %add55.13, 3328
  %vecext.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 0
  %add69.13 = or disjoint i64 %mul56.13, %163
  %add71.13 = or disjoint i64 %add69.13, %conv70
  %arrayidx72.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.13
  store i32 %vecext.13, ptr addrspace(1) %arrayidx72.13, align 4, !tbaa !16
  %vecext.1.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 1
  %add69.1.13 = or disjoint i64 %mul56.13, %165
  %add71.1.13 = or disjoint i64 %add69.1.13, %conv70
  %arrayidx72.1.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.13
  store i32 %vecext.1.13, ptr addrspace(1) %arrayidx72.1.13, align 4, !tbaa !16
  %vecext.2.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 2
  %add69.2.13 = or disjoint i64 %mul56.13, %167
  %add71.2.13 = or disjoint i64 %add69.2.13, %conv70
  %arrayidx72.2.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.13
  store i32 %vecext.2.13, ptr addrspace(1) %arrayidx72.2.13, align 4, !tbaa !16
  %vecext.3.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 3
  %add69.3.13 = or disjoint i64 %mul56.13, %169
  %add71.3.13 = or disjoint i64 %add69.3.13, %conv70
  %arrayidx72.3.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.13
  store i32 %vecext.3.13, ptr addrspace(1) %arrayidx72.3.13, align 4, !tbaa !16
  %add55.14 = mul nuw nsw i64 %add, 7936
  %mul56.14 = add nuw nsw i64 %add55.14, 3584
  %vecext.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 0
  %add69.14 = or disjoint i64 %mul56.14, %163
  %add71.14 = or disjoint i64 %add69.14, %conv70
  %arrayidx72.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.14
  store i32 %vecext.14, ptr addrspace(1) %arrayidx72.14, align 4, !tbaa !16
  %vecext.1.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 1
  %add69.1.14 = or disjoint i64 %mul56.14, %165
  %add71.1.14 = or disjoint i64 %add69.1.14, %conv70
  %arrayidx72.1.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.14
  store i32 %vecext.1.14, ptr addrspace(1) %arrayidx72.1.14, align 4, !tbaa !16
  %vecext.2.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 2
  %add69.2.14 = or disjoint i64 %mul56.14, %167
  %add71.2.14 = or disjoint i64 %add69.2.14, %conv70
  %arrayidx72.2.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.14
  store i32 %vecext.2.14, ptr addrspace(1) %arrayidx72.2.14, align 4, !tbaa !16
  %vecext.3.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 3
  %add69.3.14 = or disjoint i64 %mul56.14, %169
  %add71.3.14 = or disjoint i64 %add69.3.14, %conv70
  %arrayidx72.3.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.14
  store i32 %vecext.3.14, ptr addrspace(1) %arrayidx72.3.14, align 4, !tbaa !16
  %add55.15 = mul nuw nsw i64 %add, 7936
  %mul56.15 = add nuw nsw i64 %add55.15, 3840
  %vecext.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 0
  %add69.15 = or disjoint i64 %mul56.15, %163
  %add71.15 = or disjoint i64 %add69.15, %conv70
  %arrayidx72.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.15
  store i32 %vecext.15, ptr addrspace(1) %arrayidx72.15, align 4, !tbaa !16
  %vecext.1.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 1
  %add69.1.15 = or disjoint i64 %mul56.15, %165
  %add71.1.15 = or disjoint i64 %add69.1.15, %conv70
  %arrayidx72.1.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.15
  store i32 %vecext.1.15, ptr addrspace(1) %arrayidx72.1.15, align 4, !tbaa !16
  %vecext.2.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 2
  %add69.2.15 = or disjoint i64 %mul56.15, %167
  %add71.2.15 = or disjoint i64 %add69.2.15, %conv70
  %arrayidx72.2.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.15
  store i32 %vecext.2.15, ptr addrspace(1) %arrayidx72.2.15, align 4, !tbaa !16
  %vecext.3.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 3
  %add69.3.15 = or disjoint i64 %mul56.15, %169
  %add71.3.15 = or disjoint i64 %add69.3.15, %conv70
  %arrayidx72.3.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.15
  store i32 %vecext.3.15, ptr addrspace(1) %arrayidx72.3.15, align 4, !tbaa !16
  %add55.16 = mul nuw nsw i64 %add, 7936
  %mul56.16 = add nuw nsw i64 %add55.16, 4096
  %vecext.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 0
  %add69.16 = or disjoint i64 %mul56.16, %163
  %add71.16 = or disjoint i64 %add69.16, %conv70
  %arrayidx72.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.16
  store i32 %vecext.16, ptr addrspace(1) %arrayidx72.16, align 4, !tbaa !16
  %vecext.1.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 1
  %add69.1.16 = or disjoint i64 %mul56.16, %165
  %add71.1.16 = or disjoint i64 %add69.1.16, %conv70
  %arrayidx72.1.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.16
  store i32 %vecext.1.16, ptr addrspace(1) %arrayidx72.1.16, align 4, !tbaa !16
  %vecext.2.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 2
  %add69.2.16 = or disjoint i64 %mul56.16, %167
  %add71.2.16 = or disjoint i64 %add69.2.16, %conv70
  %arrayidx72.2.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.16
  store i32 %vecext.2.16, ptr addrspace(1) %arrayidx72.2.16, align 4, !tbaa !16
  %vecext.3.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 3
  %add69.3.16 = or disjoint i64 %mul56.16, %169
  %add71.3.16 = or disjoint i64 %add69.3.16, %conv70
  %arrayidx72.3.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.16
  store i32 %vecext.3.16, ptr addrspace(1) %arrayidx72.3.16, align 4, !tbaa !16
  %add55.17 = mul nuw nsw i64 %add, 7936
  %mul56.17 = add nuw nsw i64 %add55.17, 4352
  %vecext.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 0
  %add69.17 = or disjoint i64 %mul56.17, %163
  %add71.17 = or disjoint i64 %add69.17, %conv70
  %arrayidx72.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.17
  store i32 %vecext.17, ptr addrspace(1) %arrayidx72.17, align 4, !tbaa !16
  %vecext.1.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 1
  %add69.1.17 = or disjoint i64 %mul56.17, %165
  %add71.1.17 = or disjoint i64 %add69.1.17, %conv70
  %arrayidx72.1.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.17
  store i32 %vecext.1.17, ptr addrspace(1) %arrayidx72.1.17, align 4, !tbaa !16
  %vecext.2.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 2
  %add69.2.17 = or disjoint i64 %mul56.17, %167
  %add71.2.17 = or disjoint i64 %add69.2.17, %conv70
  %arrayidx72.2.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.17
  store i32 %vecext.2.17, ptr addrspace(1) %arrayidx72.2.17, align 4, !tbaa !16
  %vecext.3.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 3
  %add69.3.17 = or disjoint i64 %mul56.17, %169
  %add71.3.17 = or disjoint i64 %add69.3.17, %conv70
  %arrayidx72.3.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.17
  store i32 %vecext.3.17, ptr addrspace(1) %arrayidx72.3.17, align 4, !tbaa !16
  %add55.18 = mul nuw nsw i64 %add, 7936
  %mul56.18 = add nuw nsw i64 %add55.18, 4608
  %vecext.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 0
  %add69.18 = or disjoint i64 %mul56.18, %163
  %add71.18 = or disjoint i64 %add69.18, %conv70
  %arrayidx72.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.18
  store i32 %vecext.18, ptr addrspace(1) %arrayidx72.18, align 4, !tbaa !16
  %vecext.1.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 1
  %add69.1.18 = or disjoint i64 %mul56.18, %165
  %add71.1.18 = or disjoint i64 %add69.1.18, %conv70
  %arrayidx72.1.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.18
  store i32 %vecext.1.18, ptr addrspace(1) %arrayidx72.1.18, align 4, !tbaa !16
  %vecext.2.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 2
  %add69.2.18 = or disjoint i64 %mul56.18, %167
  %add71.2.18 = or disjoint i64 %add69.2.18, %conv70
  %arrayidx72.2.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.18
  store i32 %vecext.2.18, ptr addrspace(1) %arrayidx72.2.18, align 4, !tbaa !16
  %vecext.3.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 3
  %add69.3.18 = or disjoint i64 %mul56.18, %169
  %add71.3.18 = or disjoint i64 %add69.3.18, %conv70
  %arrayidx72.3.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.18
  store i32 %vecext.3.18, ptr addrspace(1) %arrayidx72.3.18, align 4, !tbaa !16
  %add55.19 = mul nuw nsw i64 %add, 7936
  %mul56.19 = add nuw nsw i64 %add55.19, 4864
  %vecext.19 = extractelement <4 x i32> %sums.sroa.78.1, i64 0
  %add69.19 = or disjoint i64 %mul56.19, %163
  %add71.19 = or disjoint i64 %add69.19, %conv70
  %arrayidx72.19 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.19
  store i32 %vecext.19, ptr addrspace(1) %arrayidx72.19, align 4, !tbaa !16
  %vecext.1.19 = extractelement <4 x i32> %sums.sroa.78.1, i64 1
  %add69.1.19 = or disjoint i64 %mul56.19, %165
  %add71.1.19 = or disjoint i64 %add69.1.19, %conv70
  %arrayidx72.1.19 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.19
  store i32 %vecext.1.19, ptr addrspace(1) %arrayidx72.1.19, align 4, !tbaa !16
  %vecext.2.19 = extractelement <4 x i32> %sums.sroa.78.1, i64 2
  %add69.2.19 = or disjoint i64 %mul56.19, %167
  %add71.2.19 = or disjoint i64 %add69.2.19, %conv70
  %arrayidx72.2.19 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.19
  store i32 %vecext.2.19, ptr addrspace(1) %arrayidx72.2.19, align 4, !tbaa !16
  %vecext.3.19 = extractelement <4 x i32> %sums.sroa.78.1, i64 3
  %add69.3.19 = or disjoint i64 %mul56.19, %169
  %add71.3.19 = or disjoint i64 %add69.3.19, %conv70
  %arrayidx72.3.19 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.19
  store i32 %vecext.3.19, ptr addrspace(1) %arrayidx72.3.19, align 4, !tbaa !16
  %add55.20 = mul nuw nsw i64 %add, 7936
  %mul56.20 = add nuw nsw i64 %add55.20, 5120
  %vecext.20 = extractelement <4 x i32> %sums.sroa.82.1, i64 0
  %add69.20 = or disjoint i64 %mul56.20, %163
  %add71.20 = or disjoint i64 %add69.20, %conv70
  %arrayidx72.20 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.20
  store i32 %vecext.20, ptr addrspace(1) %arrayidx72.20, align 4, !tbaa !16
  %vecext.1.20 = extractelement <4 x i32> %sums.sroa.82.1, i64 1
  %add69.1.20 = or disjoint i64 %mul56.20, %165
  %add71.1.20 = or disjoint i64 %add69.1.20, %conv70
  %arrayidx72.1.20 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.20
  store i32 %vecext.1.20, ptr addrspace(1) %arrayidx72.1.20, align 4, !tbaa !16
  %vecext.2.20 = extractelement <4 x i32> %sums.sroa.82.1, i64 2
  %add69.2.20 = or disjoint i64 %mul56.20, %167
  %add71.2.20 = or disjoint i64 %add69.2.20, %conv70
  %arrayidx72.2.20 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.20
  store i32 %vecext.2.20, ptr addrspace(1) %arrayidx72.2.20, align 4, !tbaa !16
  %vecext.3.20 = extractelement <4 x i32> %sums.sroa.82.1, i64 3
  %add69.3.20 = or disjoint i64 %mul56.20, %169
  %add71.3.20 = or disjoint i64 %add69.3.20, %conv70
  %arrayidx72.3.20 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.20
  store i32 %vecext.3.20, ptr addrspace(1) %arrayidx72.3.20, align 4, !tbaa !16
  %add55.21 = mul nuw nsw i64 %add, 7936
  %mul56.21 = add nuw nsw i64 %add55.21, 5376
  %vecext.21 = extractelement <4 x i32> %sums.sroa.86.1, i64 0
  %add69.21 = or disjoint i64 %mul56.21, %163
  %add71.21 = or disjoint i64 %add69.21, %conv70
  %arrayidx72.21 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.21
  store i32 %vecext.21, ptr addrspace(1) %arrayidx72.21, align 4, !tbaa !16
  %vecext.1.21 = extractelement <4 x i32> %sums.sroa.86.1, i64 1
  %add69.1.21 = or disjoint i64 %mul56.21, %165
  %add71.1.21 = or disjoint i64 %add69.1.21, %conv70
  %arrayidx72.1.21 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.21
  store i32 %vecext.1.21, ptr addrspace(1) %arrayidx72.1.21, align 4, !tbaa !16
  %vecext.2.21 = extractelement <4 x i32> %sums.sroa.86.1, i64 2
  %add69.2.21 = or disjoint i64 %mul56.21, %167
  %add71.2.21 = or disjoint i64 %add69.2.21, %conv70
  %arrayidx72.2.21 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.21
  store i32 %vecext.2.21, ptr addrspace(1) %arrayidx72.2.21, align 4, !tbaa !16
  %vecext.3.21 = extractelement <4 x i32> %sums.sroa.86.1, i64 3
  %add69.3.21 = or disjoint i64 %mul56.21, %169
  %add71.3.21 = or disjoint i64 %add69.3.21, %conv70
  %arrayidx72.3.21 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.21
  store i32 %vecext.3.21, ptr addrspace(1) %arrayidx72.3.21, align 4, !tbaa !16
  %add55.22 = mul nuw nsw i64 %add, 7936
  %mul56.22 = add nuw nsw i64 %add55.22, 5632
  %vecext.22 = extractelement <4 x i32> %sums.sroa.90.1, i64 0
  %add69.22 = or disjoint i64 %mul56.22, %163
  %add71.22 = or disjoint i64 %add69.22, %conv70
  %arrayidx72.22 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.22
  store i32 %vecext.22, ptr addrspace(1) %arrayidx72.22, align 4, !tbaa !16
  %vecext.1.22 = extractelement <4 x i32> %sums.sroa.90.1, i64 1
  %add69.1.22 = or disjoint i64 %mul56.22, %165
  %add71.1.22 = or disjoint i64 %add69.1.22, %conv70
  %arrayidx72.1.22 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.22
  store i32 %vecext.1.22, ptr addrspace(1) %arrayidx72.1.22, align 4, !tbaa !16
  %vecext.2.22 = extractelement <4 x i32> %sums.sroa.90.1, i64 2
  %add69.2.22 = or disjoint i64 %mul56.22, %167
  %add71.2.22 = or disjoint i64 %add69.2.22, %conv70
  %arrayidx72.2.22 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.22
  store i32 %vecext.2.22, ptr addrspace(1) %arrayidx72.2.22, align 4, !tbaa !16
  %vecext.3.22 = extractelement <4 x i32> %sums.sroa.90.1, i64 3
  %add69.3.22 = or disjoint i64 %mul56.22, %169
  %add71.3.22 = or disjoint i64 %add69.3.22, %conv70
  %arrayidx72.3.22 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.22
  store i32 %vecext.3.22, ptr addrspace(1) %arrayidx72.3.22, align 4, !tbaa !16
  %add55.23 = mul nuw nsw i64 %add, 7936
  %mul56.23 = add nuw nsw i64 %add55.23, 5888
  %vecext.23 = extractelement <4 x i32> %sums.sroa.94.1, i64 0
  %add69.23 = or disjoint i64 %mul56.23, %163
  %add71.23 = or disjoint i64 %add69.23, %conv70
  %arrayidx72.23 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.23
  store i32 %vecext.23, ptr addrspace(1) %arrayidx72.23, align 4, !tbaa !16
  %vecext.1.23 = extractelement <4 x i32> %sums.sroa.94.1, i64 1
  %add69.1.23 = or disjoint i64 %mul56.23, %165
  %add71.1.23 = or disjoint i64 %add69.1.23, %conv70
  %arrayidx72.1.23 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.23
  store i32 %vecext.1.23, ptr addrspace(1) %arrayidx72.1.23, align 4, !tbaa !16
  %vecext.2.23 = extractelement <4 x i32> %sums.sroa.94.1, i64 2
  %add69.2.23 = or disjoint i64 %mul56.23, %167
  %add71.2.23 = or disjoint i64 %add69.2.23, %conv70
  %arrayidx72.2.23 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.23
  store i32 %vecext.2.23, ptr addrspace(1) %arrayidx72.2.23, align 4, !tbaa !16
  %vecext.3.23 = extractelement <4 x i32> %sums.sroa.94.1, i64 3
  %add69.3.23 = or disjoint i64 %mul56.23, %169
  %add71.3.23 = or disjoint i64 %add69.3.23, %conv70
  %arrayidx72.3.23 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.23
  store i32 %vecext.3.23, ptr addrspace(1) %arrayidx72.3.23, align 4, !tbaa !16
  %add55.24 = mul nuw nsw i64 %add, 7936
  %mul56.24 = add nuw nsw i64 %add55.24, 6144
  %vecext.24 = extractelement <4 x i32> %sums.sroa.98.1, i64 0
  %add69.24 = or disjoint i64 %mul56.24, %163
  %add71.24 = or disjoint i64 %add69.24, %conv70
  %arrayidx72.24 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.24
  store i32 %vecext.24, ptr addrspace(1) %arrayidx72.24, align 4, !tbaa !16
  %vecext.1.24 = extractelement <4 x i32> %sums.sroa.98.1, i64 1
  %add69.1.24 = or disjoint i64 %mul56.24, %165
  %add71.1.24 = or disjoint i64 %add69.1.24, %conv70
  %arrayidx72.1.24 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.24
  store i32 %vecext.1.24, ptr addrspace(1) %arrayidx72.1.24, align 4, !tbaa !16
  %vecext.2.24 = extractelement <4 x i32> %sums.sroa.98.1, i64 2
  %add69.2.24 = or disjoint i64 %mul56.24, %167
  %add71.2.24 = or disjoint i64 %add69.2.24, %conv70
  %arrayidx72.2.24 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.24
  store i32 %vecext.2.24, ptr addrspace(1) %arrayidx72.2.24, align 4, !tbaa !16
  %vecext.3.24 = extractelement <4 x i32> %sums.sroa.98.1, i64 3
  %add69.3.24 = or disjoint i64 %mul56.24, %169
  %add71.3.24 = or disjoint i64 %add69.3.24, %conv70
  %arrayidx72.3.24 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.24
  store i32 %vecext.3.24, ptr addrspace(1) %arrayidx72.3.24, align 4, !tbaa !16
  %add55.25 = mul nuw nsw i64 %add, 7936
  %mul56.25 = add nuw nsw i64 %add55.25, 6400
  %vecext.25 = extractelement <4 x i32> %sums.sroa.102.1, i64 0
  %add69.25 = or disjoint i64 %mul56.25, %163
  %add71.25 = or disjoint i64 %add69.25, %conv70
  %arrayidx72.25 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.25
  store i32 %vecext.25, ptr addrspace(1) %arrayidx72.25, align 4, !tbaa !16
  %vecext.1.25 = extractelement <4 x i32> %sums.sroa.102.1, i64 1
  %add69.1.25 = or disjoint i64 %mul56.25, %165
  %add71.1.25 = or disjoint i64 %add69.1.25, %conv70
  %arrayidx72.1.25 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.25
  store i32 %vecext.1.25, ptr addrspace(1) %arrayidx72.1.25, align 4, !tbaa !16
  %vecext.2.25 = extractelement <4 x i32> %sums.sroa.102.1, i64 2
  %add69.2.25 = or disjoint i64 %mul56.25, %167
  %add71.2.25 = or disjoint i64 %add69.2.25, %conv70
  %arrayidx72.2.25 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.25
  store i32 %vecext.2.25, ptr addrspace(1) %arrayidx72.2.25, align 4, !tbaa !16
  %vecext.3.25 = extractelement <4 x i32> %sums.sroa.102.1, i64 3
  %add69.3.25 = or disjoint i64 %mul56.25, %169
  %add71.3.25 = or disjoint i64 %add69.3.25, %conv70
  %arrayidx72.3.25 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.25
  store i32 %vecext.3.25, ptr addrspace(1) %arrayidx72.3.25, align 4, !tbaa !16
  %add55.26 = mul nuw nsw i64 %add, 7936
  %mul56.26 = add nuw nsw i64 %add55.26, 6656
  %vecext.26 = extractelement <4 x i32> %sums.sroa.106.1, i64 0
  %add69.26 = or disjoint i64 %mul56.26, %163
  %add71.26 = or disjoint i64 %add69.26, %conv70
  %arrayidx72.26 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.26
  store i32 %vecext.26, ptr addrspace(1) %arrayidx72.26, align 4, !tbaa !16
  %vecext.1.26 = extractelement <4 x i32> %sums.sroa.106.1, i64 1
  %add69.1.26 = or disjoint i64 %mul56.26, %165
  %add71.1.26 = or disjoint i64 %add69.1.26, %conv70
  %arrayidx72.1.26 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.26
  store i32 %vecext.1.26, ptr addrspace(1) %arrayidx72.1.26, align 4, !tbaa !16
  %vecext.2.26 = extractelement <4 x i32> %sums.sroa.106.1, i64 2
  %add69.2.26 = or disjoint i64 %mul56.26, %167
  %add71.2.26 = or disjoint i64 %add69.2.26, %conv70
  %arrayidx72.2.26 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.26
  store i32 %vecext.2.26, ptr addrspace(1) %arrayidx72.2.26, align 4, !tbaa !16
  %vecext.3.26 = extractelement <4 x i32> %sums.sroa.106.1, i64 3
  %add69.3.26 = or disjoint i64 %mul56.26, %169
  %add71.3.26 = or disjoint i64 %add69.3.26, %conv70
  %arrayidx72.3.26 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.26
  store i32 %vecext.3.26, ptr addrspace(1) %arrayidx72.3.26, align 4, !tbaa !16
  %add55.27 = mul nuw nsw i64 %add, 7936
  %mul56.27 = add nuw nsw i64 %add55.27, 6912
  %vecext.27 = extractelement <4 x i32> %sums.sroa.110.1, i64 0
  %add69.27 = or disjoint i64 %mul56.27, %163
  %add71.27 = or disjoint i64 %add69.27, %conv70
  %arrayidx72.27 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.27
  store i32 %vecext.27, ptr addrspace(1) %arrayidx72.27, align 4, !tbaa !16
  %vecext.1.27 = extractelement <4 x i32> %sums.sroa.110.1, i64 1
  %add69.1.27 = or disjoint i64 %mul56.27, %165
  %add71.1.27 = or disjoint i64 %add69.1.27, %conv70
  %arrayidx72.1.27 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.27
  store i32 %vecext.1.27, ptr addrspace(1) %arrayidx72.1.27, align 4, !tbaa !16
  %vecext.2.27 = extractelement <4 x i32> %sums.sroa.110.1, i64 2
  %add69.2.27 = or disjoint i64 %mul56.27, %167
  %add71.2.27 = or disjoint i64 %add69.2.27, %conv70
  %arrayidx72.2.27 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.27
  store i32 %vecext.2.27, ptr addrspace(1) %arrayidx72.2.27, align 4, !tbaa !16
  %vecext.3.27 = extractelement <4 x i32> %sums.sroa.110.1, i64 3
  %add69.3.27 = or disjoint i64 %mul56.27, %169
  %add71.3.27 = or disjoint i64 %add69.3.27, %conv70
  %arrayidx72.3.27 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.27
  store i32 %vecext.3.27, ptr addrspace(1) %arrayidx72.3.27, align 4, !tbaa !16
  %add55.28 = mul nuw nsw i64 %add, 7936
  %mul56.28 = add nuw nsw i64 %add55.28, 7168
  %vecext.28 = extractelement <4 x i32> %sums.sroa.114.1, i64 0
  %add69.28 = or disjoint i64 %mul56.28, %163
  %add71.28 = or disjoint i64 %add69.28, %conv70
  %arrayidx72.28 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.28
  store i32 %vecext.28, ptr addrspace(1) %arrayidx72.28, align 4, !tbaa !16
  %vecext.1.28 = extractelement <4 x i32> %sums.sroa.114.1, i64 1
  %add69.1.28 = or disjoint i64 %mul56.28, %165
  %add71.1.28 = or disjoint i64 %add69.1.28, %conv70
  %arrayidx72.1.28 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.28
  store i32 %vecext.1.28, ptr addrspace(1) %arrayidx72.1.28, align 4, !tbaa !16
  %vecext.2.28 = extractelement <4 x i32> %sums.sroa.114.1, i64 2
  %add69.2.28 = or disjoint i64 %mul56.28, %167
  %add71.2.28 = or disjoint i64 %add69.2.28, %conv70
  %arrayidx72.2.28 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.28
  store i32 %vecext.2.28, ptr addrspace(1) %arrayidx72.2.28, align 4, !tbaa !16
  %vecext.3.28 = extractelement <4 x i32> %sums.sroa.114.1, i64 3
  %add69.3.28 = or disjoint i64 %mul56.28, %169
  %add71.3.28 = or disjoint i64 %add69.3.28, %conv70
  %arrayidx72.3.28 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.28
  store i32 %vecext.3.28, ptr addrspace(1) %arrayidx72.3.28, align 4, !tbaa !16
  %add55.29 = mul nuw nsw i64 %add, 7936
  %mul56.29 = add nuw nsw i64 %add55.29, 7424
  %vecext.29 = extractelement <4 x i32> %sums.sroa.118.1, i64 0
  %add69.29 = or disjoint i64 %mul56.29, %163
  %add71.29 = or disjoint i64 %add69.29, %conv70
  %arrayidx72.29 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.29
  store i32 %vecext.29, ptr addrspace(1) %arrayidx72.29, align 4, !tbaa !16
  %vecext.1.29 = extractelement <4 x i32> %sums.sroa.118.1, i64 1
  %add69.1.29 = or disjoint i64 %mul56.29, %165
  %add71.1.29 = or disjoint i64 %add69.1.29, %conv70
  %arrayidx72.1.29 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.29
  store i32 %vecext.1.29, ptr addrspace(1) %arrayidx72.1.29, align 4, !tbaa !16
  %vecext.2.29 = extractelement <4 x i32> %sums.sroa.118.1, i64 2
  %add69.2.29 = or disjoint i64 %mul56.29, %167
  %add71.2.29 = or disjoint i64 %add69.2.29, %conv70
  %arrayidx72.2.29 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.29
  store i32 %vecext.2.29, ptr addrspace(1) %arrayidx72.2.29, align 4, !tbaa !16
  %vecext.3.29 = extractelement <4 x i32> %sums.sroa.118.1, i64 3
  %add69.3.29 = or disjoint i64 %mul56.29, %169
  %add71.3.29 = or disjoint i64 %add69.3.29, %conv70
  %arrayidx72.3.29 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.29
  store i32 %vecext.3.29, ptr addrspace(1) %arrayidx72.3.29, align 4, !tbaa !16
  %add55.30 = mul nuw nsw i64 %add, 7936
  %mul56.30 = add nuw nsw i64 %add55.30, 7680
  %vecext.30 = extractelement <4 x i32> %sums.sroa.122.1, i64 0
  %add69.30 = or disjoint i64 %mul56.30, %163
  %add71.30 = or disjoint i64 %add69.30, %conv70
  %arrayidx72.30 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.30
  store i32 %vecext.30, ptr addrspace(1) %arrayidx72.30, align 4, !tbaa !16
  %vecext.1.30 = extractelement <4 x i32> %sums.sroa.122.1, i64 1
  %add69.1.30 = or disjoint i64 %mul56.30, %165
  %add71.1.30 = or disjoint i64 %add69.1.30, %conv70
  %arrayidx72.1.30 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.30
  store i32 %vecext.1.30, ptr addrspace(1) %arrayidx72.1.30, align 4, !tbaa !16
  %vecext.2.30 = extractelement <4 x i32> %sums.sroa.122.1, i64 2
  %add69.2.30 = or disjoint i64 %mul56.30, %167
  %add71.2.30 = or disjoint i64 %add69.2.30, %conv70
  %arrayidx72.2.30 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.30
  store i32 %vecext.2.30, ptr addrspace(1) %arrayidx72.2.30, align 4, !tbaa !16
  %vecext.3.30 = extractelement <4 x i32> %sums.sroa.122.1, i64 3
  %add69.3.30 = or disjoint i64 %mul56.30, %169
  %add71.3.30 = or disjoint i64 %add69.3.30, %conv70
  %arrayidx72.3.30 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.30
  store i32 %vecext.3.30, ptr addrspace(1) %arrayidx72.3.30, align 4, !tbaa !16
  ret void
}

; Function Attrs: convergent mustprogress nofree norecurse nounwind memory(argmem: readwrite)
define protected metaxgpu_kernel void @_Z13mmaPeakKernelILi32EEvPKaS1_Pii(ptr addrspace(1) noalias nocapture noundef readonly %a.coerce, ptr addrspace(1) noalias nocapture noundef readonly %b.coerce, ptr addrspace(1) noalias noundef writeonly %c.coerce, i32 noundef %iterations) local_unnamed_addr #3 comdat {
entry:
  %0 = tail call noundef range(i32 0, 1024) i32 @llvm.mxc.thread.id.x(), !range !25
  %1 = tail call align 4 dereferenceable(64) ptr addrspace(4) @llvm.mxc.dispatch.ptr()
  %2 = getelementptr inbounds i8, ptr addrspace(4) %1, i64 4
  %3 = load i16, ptr addrspace(4) %2, align 4, !range !26, !invariant.load !14
  %rem11 = and i32 %0, 15
  %4 = lshr i32 %0, 2
  %mul13 = and i32 %4, 12
  %mul15 = shl nuw nsw i32 %rem11, 4
  %5 = zext nneg i32 %mul15 to i64
  %6 = zext nneg i32 %mul13 to i64
  %7 = or disjoint i64 %5, %6
  %add.ptr = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %7
  %8 = load i32, ptr addrspace(1) %add.ptr, align 1
  %add.ptr21 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %7
  %9 = load i32, ptr addrspace(1) %add.ptr21, align 1
  %10 = or disjoint i64 %5, %6
  %11 = or disjoint i64 %10, 256
  %add.ptr.1 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %11
  %12 = load i32, ptr addrspace(1) %add.ptr.1, align 1
  %add.ptr21.1 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %11
  %13 = load i32, ptr addrspace(1) %add.ptr21.1, align 1
  %14 = or disjoint i64 %5, %6
  %15 = or disjoint i64 %14, 512
  %add.ptr.2 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %15
  %16 = load i32, ptr addrspace(1) %add.ptr.2, align 1
  %add.ptr21.2 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %15
  %17 = load i32, ptr addrspace(1) %add.ptr21.2, align 1
  %18 = or disjoint i64 %5, %6
  %19 = or disjoint i64 %18, 768
  %add.ptr.3 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %19
  %20 = load i32, ptr addrspace(1) %add.ptr.3, align 1
  %add.ptr21.3 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %19
  %21 = load i32, ptr addrspace(1) %add.ptr21.3, align 1
  %22 = or disjoint i64 %5, %6
  %23 = or disjoint i64 %22, 1024
  %add.ptr.4 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %23
  %24 = load i32, ptr addrspace(1) %add.ptr.4, align 1
  %add.ptr21.4 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %23
  %25 = load i32, ptr addrspace(1) %add.ptr21.4, align 1
  %26 = or disjoint i64 %5, %6
  %27 = or disjoint i64 %26, 1280
  %add.ptr.5 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %27
  %28 = load i32, ptr addrspace(1) %add.ptr.5, align 1
  %add.ptr21.5 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %27
  %29 = load i32, ptr addrspace(1) %add.ptr21.5, align 1
  %30 = or disjoint i64 %5, %6
  %31 = or disjoint i64 %30, 1536
  %add.ptr.6 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %31
  %32 = load i32, ptr addrspace(1) %add.ptr.6, align 1
  %add.ptr21.6 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %31
  %33 = load i32, ptr addrspace(1) %add.ptr21.6, align 1
  %34 = or disjoint i64 %5, %6
  %35 = or disjoint i64 %34, 1792
  %add.ptr.7 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %35
  %36 = load i32, ptr addrspace(1) %add.ptr.7, align 1
  %add.ptr21.7 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %35
  %37 = load i32, ptr addrspace(1) %add.ptr21.7, align 1
  %38 = or disjoint i64 %5, %6
  %39 = or disjoint i64 %38, 2048
  %add.ptr.8 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %39
  %40 = load i32, ptr addrspace(1) %add.ptr.8, align 1
  %add.ptr21.8 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %39
  %41 = load i32, ptr addrspace(1) %add.ptr21.8, align 1
  %42 = or disjoint i64 %5, %6
  %43 = or disjoint i64 %42, 2304
  %add.ptr.9 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %43
  %44 = load i32, ptr addrspace(1) %add.ptr.9, align 1
  %add.ptr21.9 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %43
  %45 = load i32, ptr addrspace(1) %add.ptr21.9, align 1
  %46 = or disjoint i64 %5, %6
  %47 = or disjoint i64 %46, 2560
  %add.ptr.10 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %47
  %48 = load i32, ptr addrspace(1) %add.ptr.10, align 1
  %add.ptr21.10 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %47
  %49 = load i32, ptr addrspace(1) %add.ptr21.10, align 1
  %50 = or disjoint i64 %5, %6
  %51 = or disjoint i64 %50, 2816
  %add.ptr.11 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %51
  %52 = load i32, ptr addrspace(1) %add.ptr.11, align 1
  %add.ptr21.11 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %51
  %53 = load i32, ptr addrspace(1) %add.ptr21.11, align 1
  %54 = or disjoint i64 %5, %6
  %55 = or disjoint i64 %54, 3072
  %add.ptr.12 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %55
  %56 = load i32, ptr addrspace(1) %add.ptr.12, align 1
  %add.ptr21.12 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %55
  %57 = load i32, ptr addrspace(1) %add.ptr21.12, align 1
  %58 = or disjoint i64 %5, %6
  %59 = or disjoint i64 %58, 3328
  %add.ptr.13 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %59
  %60 = load i32, ptr addrspace(1) %add.ptr.13, align 1
  %add.ptr21.13 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %59
  %61 = load i32, ptr addrspace(1) %add.ptr21.13, align 1
  %62 = or disjoint i64 %5, %6
  %63 = or disjoint i64 %62, 3584
  %add.ptr.14 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %63
  %64 = load i32, ptr addrspace(1) %add.ptr.14, align 1
  %add.ptr21.14 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %63
  %65 = load i32, ptr addrspace(1) %add.ptr21.14, align 1
  %66 = or disjoint i64 %5, %6
  %67 = or disjoint i64 %66, 3840
  %add.ptr.15 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %67
  %68 = load i32, ptr addrspace(1) %add.ptr.15, align 1
  %add.ptr21.15 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %67
  %69 = load i32, ptr addrspace(1) %add.ptr21.15, align 1
  %70 = or disjoint i64 %5, %6
  %71 = or disjoint i64 %70, 4096
  %add.ptr.16 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %71
  %72 = load i32, ptr addrspace(1) %add.ptr.16, align 1
  %add.ptr21.16 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %71
  %73 = load i32, ptr addrspace(1) %add.ptr21.16, align 1
  %74 = or disjoint i64 %5, %6
  %75 = or disjoint i64 %74, 4352
  %add.ptr.17 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %75
  %76 = load i32, ptr addrspace(1) %add.ptr.17, align 1
  %add.ptr21.17 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %75
  %77 = load i32, ptr addrspace(1) %add.ptr21.17, align 1
  %78 = or disjoint i64 %5, %6
  %79 = or disjoint i64 %78, 4608
  %add.ptr.18 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %79
  %80 = load i32, ptr addrspace(1) %add.ptr.18, align 1
  %add.ptr21.18 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %79
  %81 = load i32, ptr addrspace(1) %add.ptr21.18, align 1
  %82 = or disjoint i64 %5, %6
  %83 = or disjoint i64 %82, 4864
  %add.ptr.19 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %83
  %84 = load i32, ptr addrspace(1) %add.ptr.19, align 1
  %add.ptr21.19 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %83
  %85 = load i32, ptr addrspace(1) %add.ptr21.19, align 1
  %86 = or disjoint i64 %5, %6
  %87 = or disjoint i64 %86, 5120
  %add.ptr.20 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %87
  %88 = load i32, ptr addrspace(1) %add.ptr.20, align 1
  %add.ptr21.20 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %87
  %89 = load i32, ptr addrspace(1) %add.ptr21.20, align 1
  %90 = or disjoint i64 %5, %6
  %91 = or disjoint i64 %90, 5376
  %add.ptr.21 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %91
  %92 = load i32, ptr addrspace(1) %add.ptr.21, align 1
  %add.ptr21.21 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %91
  %93 = load i32, ptr addrspace(1) %add.ptr21.21, align 1
  %94 = or disjoint i64 %5, %6
  %95 = or disjoint i64 %94, 5632
  %add.ptr.22 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %95
  %96 = load i32, ptr addrspace(1) %add.ptr.22, align 1
  %add.ptr21.22 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %95
  %97 = load i32, ptr addrspace(1) %add.ptr21.22, align 1
  %98 = or disjoint i64 %5, %6
  %99 = or disjoint i64 %98, 5888
  %add.ptr.23 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %99
  %100 = load i32, ptr addrspace(1) %add.ptr.23, align 1
  %add.ptr21.23 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %99
  %101 = load i32, ptr addrspace(1) %add.ptr21.23, align 1
  %102 = or disjoint i64 %5, %6
  %103 = or disjoint i64 %102, 6144
  %add.ptr.24 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %103
  %104 = load i32, ptr addrspace(1) %add.ptr.24, align 1
  %add.ptr21.24 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %103
  %105 = load i32, ptr addrspace(1) %add.ptr21.24, align 1
  %106 = or disjoint i64 %5, %6
  %107 = or disjoint i64 %106, 6400
  %add.ptr.25 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %107
  %108 = load i32, ptr addrspace(1) %add.ptr.25, align 1
  %add.ptr21.25 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %107
  %109 = load i32, ptr addrspace(1) %add.ptr21.25, align 1
  %110 = or disjoint i64 %5, %6
  %111 = or disjoint i64 %110, 6656
  %add.ptr.26 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %111
  %112 = load i32, ptr addrspace(1) %add.ptr.26, align 1
  %add.ptr21.26 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %111
  %113 = load i32, ptr addrspace(1) %add.ptr21.26, align 1
  %114 = or disjoint i64 %5, %6
  %115 = or disjoint i64 %114, 6912
  %add.ptr.27 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %115
  %116 = load i32, ptr addrspace(1) %add.ptr.27, align 1
  %add.ptr21.27 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %115
  %117 = load i32, ptr addrspace(1) %add.ptr21.27, align 1
  %118 = or disjoint i64 %5, %6
  %119 = or disjoint i64 %118, 7168
  %add.ptr.28 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %119
  %120 = load i32, ptr addrspace(1) %add.ptr.28, align 1
  %add.ptr21.28 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %119
  %121 = load i32, ptr addrspace(1) %add.ptr21.28, align 1
  %122 = or disjoint i64 %5, %6
  %123 = or disjoint i64 %122, 7424
  %add.ptr.29 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %123
  %124 = load i32, ptr addrspace(1) %add.ptr.29, align 1
  %add.ptr21.29 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %123
  %125 = load i32, ptr addrspace(1) %add.ptr21.29, align 1
  %126 = or disjoint i64 %5, %6
  %127 = or disjoint i64 %126, 7680
  %add.ptr.30 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %127
  %128 = load i32, ptr addrspace(1) %add.ptr.30, align 1
  %add.ptr21.30 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %127
  %129 = load i32, ptr addrspace(1) %add.ptr21.30, align 1
  %130 = or disjoint i64 %5, %6
  %131 = or disjoint i64 %130, 7936
  %add.ptr.31 = getelementptr inbounds i8, ptr addrspace(1) %a.coerce, i64 %131
  %132 = load i32, ptr addrspace(1) %add.ptr.31, align 1
  %add.ptr21.31 = getelementptr inbounds i8, ptr addrspace(1) %b.coerce, i64 %131
  %133 = load i32, ptr addrspace(1) %add.ptr21.31, align 1
  %cmp25104 = icmp sgt i32 %iterations, 0
  br i1 %cmp25104, label %for.cond30.preheader, label %for.cond49.preheader

for.cond30.preheader:                             ; preds = %entry, %for.cond30.preheader
  %sums.sroa.126.0 = phi <4 x i32> [ %165, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.122.0 = phi <4 x i32> [ %164, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.118.0 = phi <4 x i32> [ %163, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.114.0 = phi <4 x i32> [ %162, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.110.0 = phi <4 x i32> [ %161, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.106.0 = phi <4 x i32> [ %160, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.102.0 = phi <4 x i32> [ %159, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.98.0 = phi <4 x i32> [ %158, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.94.0 = phi <4 x i32> [ %157, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.90.0 = phi <4 x i32> [ %156, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.86.0 = phi <4 x i32> [ %155, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.82.0 = phi <4 x i32> [ %154, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.78.0 = phi <4 x i32> [ %153, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.74.0 = phi <4 x i32> [ %152, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.70.0 = phi <4 x i32> [ %151, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.66.0 = phi <4 x i32> [ %150, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.62.0 = phi <4 x i32> [ %149, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.58.0 = phi <4 x i32> [ %148, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.54.0 = phi <4 x i32> [ %147, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.50.0 = phi <4 x i32> [ %146, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.46.0 = phi <4 x i32> [ %145, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.42.0 = phi <4 x i32> [ %144, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.38.0 = phi <4 x i32> [ %143, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.34.0 = phi <4 x i32> [ %142, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.30.0 = phi <4 x i32> [ %141, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.26.0 = phi <4 x i32> [ %140, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.22.0 = phi <4 x i32> [ %139, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.18.0 = phi <4 x i32> [ %138, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.14.0 = phi <4 x i32> [ %137, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.10.0 = phi <4 x i32> [ %136, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.6.0 = phi <4 x i32> [ %135, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %sums.sroa.0.0 = phi <4 x i32> [ %134, %for.cond30.preheader ], [ zeroinitializer, %entry ]
  %iteration.0105 = phi i32 [ %inc46, %for.cond30.preheader ], [ 0, %entry ]
  %134 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %8, i32 %9, <4 x i32> %sums.sroa.0.0), !call_argsrelate !27
  %135 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %12, i32 %13, <4 x i32> %sums.sroa.6.0), !call_argsrelate !27
  %136 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %16, i32 %17, <4 x i32> %sums.sroa.10.0), !call_argsrelate !27
  %137 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %20, i32 %21, <4 x i32> %sums.sroa.14.0), !call_argsrelate !27
  %138 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %24, i32 %25, <4 x i32> %sums.sroa.18.0), !call_argsrelate !27
  %139 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %28, i32 %29, <4 x i32> %sums.sroa.22.0), !call_argsrelate !27
  %140 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %32, i32 %33, <4 x i32> %sums.sroa.26.0), !call_argsrelate !27
  %141 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %36, i32 %37, <4 x i32> %sums.sroa.30.0), !call_argsrelate !27
  %142 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %40, i32 %41, <4 x i32> %sums.sroa.34.0), !call_argsrelate !27
  %143 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %44, i32 %45, <4 x i32> %sums.sroa.38.0), !call_argsrelate !27
  %144 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %48, i32 %49, <4 x i32> %sums.sroa.42.0), !call_argsrelate !27
  %145 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %52, i32 %53, <4 x i32> %sums.sroa.46.0), !call_argsrelate !27
  %146 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %56, i32 %57, <4 x i32> %sums.sroa.50.0), !call_argsrelate !27
  %147 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %60, i32 %61, <4 x i32> %sums.sroa.54.0), !call_argsrelate !27
  %148 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %64, i32 %65, <4 x i32> %sums.sroa.58.0), !call_argsrelate !27
  %149 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %68, i32 %69, <4 x i32> %sums.sroa.62.0), !call_argsrelate !27
  %150 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %72, i32 %73, <4 x i32> %sums.sroa.66.0), !call_argsrelate !27
  %151 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %76, i32 %77, <4 x i32> %sums.sroa.70.0), !call_argsrelate !27
  %152 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %80, i32 %81, <4 x i32> %sums.sroa.74.0), !call_argsrelate !27
  %153 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %84, i32 %85, <4 x i32> %sums.sroa.78.0), !call_argsrelate !27
  %154 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %88, i32 %89, <4 x i32> %sums.sroa.82.0), !call_argsrelate !27
  %155 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %92, i32 %93, <4 x i32> %sums.sroa.86.0), !call_argsrelate !27
  %156 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %96, i32 %97, <4 x i32> %sums.sroa.90.0), !call_argsrelate !27
  %157 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %100, i32 %101, <4 x i32> %sums.sroa.94.0), !call_argsrelate !27
  %158 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %104, i32 %105, <4 x i32> %sums.sroa.98.0), !call_argsrelate !27
  %159 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %108, i32 %109, <4 x i32> %sums.sroa.102.0), !call_argsrelate !27
  %160 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %112, i32 %113, <4 x i32> %sums.sroa.106.0), !call_argsrelate !27
  %161 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %116, i32 %117, <4 x i32> %sums.sroa.110.0), !call_argsrelate !27
  %162 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %120, i32 %121, <4 x i32> %sums.sroa.114.0), !call_argsrelate !27
  %163 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %124, i32 %125, <4 x i32> %sums.sroa.118.0), !call_argsrelate !27
  %164 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %128, i32 %129, <4 x i32> %sums.sroa.122.0), !call_argsrelate !27
  %165 = tail call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8(i32 %132, i32 %133, <4 x i32> %sums.sroa.126.0), !call_argsrelate !27
  %inc46 = add nuw nsw i32 %iteration.0105, 1
  %exitcond.not = icmp eq i32 %inc46, %iterations
  br i1 %exitcond.not, label %for.cond49.preheader, label %for.cond30.preheader, !llvm.loop !49

for.cond49.preheader:                             ; preds = %for.cond30.preheader, %entry
  %sums.sroa.126.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %165, %for.cond30.preheader ]
  %sums.sroa.122.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %164, %for.cond30.preheader ]
  %sums.sroa.118.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %163, %for.cond30.preheader ]
  %sums.sroa.114.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %162, %for.cond30.preheader ]
  %sums.sroa.110.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %161, %for.cond30.preheader ]
  %sums.sroa.106.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %160, %for.cond30.preheader ]
  %sums.sroa.102.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %159, %for.cond30.preheader ]
  %sums.sroa.98.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %158, %for.cond30.preheader ]
  %sums.sroa.94.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %157, %for.cond30.preheader ]
  %sums.sroa.90.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %156, %for.cond30.preheader ]
  %sums.sroa.86.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %155, %for.cond30.preheader ]
  %sums.sroa.82.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %154, %for.cond30.preheader ]
  %sums.sroa.78.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %153, %for.cond30.preheader ]
  %sums.sroa.74.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %152, %for.cond30.preheader ]
  %sums.sroa.70.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %151, %for.cond30.preheader ]
  %sums.sroa.66.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %150, %for.cond30.preheader ]
  %sums.sroa.62.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %149, %for.cond30.preheader ]
  %sums.sroa.58.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %148, %for.cond30.preheader ]
  %sums.sroa.54.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %147, %for.cond30.preheader ]
  %sums.sroa.50.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %146, %for.cond30.preheader ]
  %sums.sroa.46.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %145, %for.cond30.preheader ]
  %sums.sroa.42.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %144, %for.cond30.preheader ]
  %sums.sroa.38.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %143, %for.cond30.preheader ]
  %sums.sroa.34.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %142, %for.cond30.preheader ]
  %sums.sroa.30.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %141, %for.cond30.preheader ]
  %sums.sroa.26.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %140, %for.cond30.preheader ]
  %sums.sroa.22.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %139, %for.cond30.preheader ]
  %sums.sroa.18.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %138, %for.cond30.preheader ]
  %sums.sroa.14.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %137, %for.cond30.preheader ]
  %sums.sroa.10.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %136, %for.cond30.preheader ]
  %sums.sroa.6.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %135, %for.cond30.preheader ]
  %sums.sroa.0.1 = phi <4 x i32> [ zeroinitializer, %entry ], [ %134, %for.cond30.preheader ]
  %166 = lshr i16 %3, 6
  %conv7 = zext nneg i16 %166 to i64
  %167 = tail call noundef range(i32 0, 2147483647) i32 @llvm.mxc.block.id.x(), !range !15
  %conv = zext nneg i32 %167 to i64
  %mul = mul nuw nsw i64 %conv7, %conv
  %div9100 = lshr i32 %0, 6
  %conv10 = zext nneg i32 %div9100 to i64
  %add = add nuw nsw i64 %mul, %conv10
  %168 = shl nuw nsw i64 %add, 13
  %conv70 = zext nneg i32 %rem11 to i64
  %vecext = extractelement <4 x i32> %sums.sroa.0.1, i64 0
  %169 = shl nuw nsw i64 %6, 4
  %add69 = or disjoint i64 %168, %169
  %add71 = or disjoint i64 %add69, %conv70
  %arrayidx72 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71
  store i32 %vecext, ptr addrspace(1) %arrayidx72, align 4, !tbaa !16
  %vecext.1 = extractelement <4 x i32> %sums.sroa.0.1, i64 1
  %170 = shl nuw nsw i64 %6, 4
  %171 = or disjoint i64 %170, 16
  %add69.1 = or disjoint i64 %168, %171
  %add71.1 = or disjoint i64 %add69.1, %conv70
  %arrayidx72.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1
  store i32 %vecext.1, ptr addrspace(1) %arrayidx72.1, align 4, !tbaa !16
  %vecext.2 = extractelement <4 x i32> %sums.sroa.0.1, i64 2
  %172 = shl nuw nsw i64 %6, 4
  %173 = or disjoint i64 %172, 32
  %add69.2 = or disjoint i64 %168, %173
  %add71.2 = or disjoint i64 %add69.2, %conv70
  %arrayidx72.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2
  store i32 %vecext.2, ptr addrspace(1) %arrayidx72.2, align 4, !tbaa !16
  %vecext.3 = extractelement <4 x i32> %sums.sroa.0.1, i64 3
  %174 = shl nuw nsw i64 %6, 4
  %175 = or disjoint i64 %174, 48
  %add69.3 = or disjoint i64 %168, %175
  %add71.3 = or disjoint i64 %add69.3, %conv70
  %arrayidx72.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3
  store i32 %vecext.3, ptr addrspace(1) %arrayidx72.3, align 4, !tbaa !16
  %mul56.1 = or disjoint i64 %168, 256
  %vecext.1118 = extractelement <4 x i32> %sums.sroa.6.1, i64 0
  %add69.1119 = or disjoint i64 %mul56.1, %169
  %add71.1120 = or disjoint i64 %add69.1119, %conv70
  %arrayidx72.1121 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1120
  store i32 %vecext.1118, ptr addrspace(1) %arrayidx72.1121, align 4, !tbaa !16
  %vecext.1.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 1
  %add69.1.1 = or disjoint i64 %mul56.1, %171
  %add71.1.1 = or disjoint i64 %add69.1.1, %conv70
  %arrayidx72.1.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.1
  store i32 %vecext.1.1, ptr addrspace(1) %arrayidx72.1.1, align 4, !tbaa !16
  %vecext.2.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 2
  %add69.2.1 = or disjoint i64 %mul56.1, %173
  %add71.2.1 = or disjoint i64 %add69.2.1, %conv70
  %arrayidx72.2.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.1
  store i32 %vecext.2.1, ptr addrspace(1) %arrayidx72.2.1, align 4, !tbaa !16
  %vecext.3.1 = extractelement <4 x i32> %sums.sroa.6.1, i64 3
  %add69.3.1 = or disjoint i64 %mul56.1, %175
  %add71.3.1 = or disjoint i64 %add69.3.1, %conv70
  %arrayidx72.3.1 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.1
  store i32 %vecext.3.1, ptr addrspace(1) %arrayidx72.3.1, align 4, !tbaa !16
  %mul56.2 = or disjoint i64 %168, 512
  %vecext.2122 = extractelement <4 x i32> %sums.sroa.10.1, i64 0
  %add69.2123 = or disjoint i64 %mul56.2, %169
  %add71.2124 = or disjoint i64 %add69.2123, %conv70
  %arrayidx72.2125 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2124
  store i32 %vecext.2122, ptr addrspace(1) %arrayidx72.2125, align 4, !tbaa !16
  %vecext.1.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 1
  %add69.1.2 = or disjoint i64 %mul56.2, %171
  %add71.1.2 = or disjoint i64 %add69.1.2, %conv70
  %arrayidx72.1.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.2
  store i32 %vecext.1.2, ptr addrspace(1) %arrayidx72.1.2, align 4, !tbaa !16
  %vecext.2.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 2
  %add69.2.2 = or disjoint i64 %mul56.2, %173
  %add71.2.2 = or disjoint i64 %add69.2.2, %conv70
  %arrayidx72.2.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.2
  store i32 %vecext.2.2, ptr addrspace(1) %arrayidx72.2.2, align 4, !tbaa !16
  %vecext.3.2 = extractelement <4 x i32> %sums.sroa.10.1, i64 3
  %add69.3.2 = or disjoint i64 %mul56.2, %175
  %add71.3.2 = or disjoint i64 %add69.3.2, %conv70
  %arrayidx72.3.2 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.2
  store i32 %vecext.3.2, ptr addrspace(1) %arrayidx72.3.2, align 4, !tbaa !16
  %mul56.3 = or disjoint i64 %168, 768
  %vecext.3126 = extractelement <4 x i32> %sums.sroa.14.1, i64 0
  %add69.3127 = or disjoint i64 %mul56.3, %169
  %add71.3128 = or disjoint i64 %add69.3127, %conv70
  %arrayidx72.3129 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3128
  store i32 %vecext.3126, ptr addrspace(1) %arrayidx72.3129, align 4, !tbaa !16
  %vecext.1.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 1
  %add69.1.3 = or disjoint i64 %mul56.3, %171
  %add71.1.3 = or disjoint i64 %add69.1.3, %conv70
  %arrayidx72.1.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.3
  store i32 %vecext.1.3, ptr addrspace(1) %arrayidx72.1.3, align 4, !tbaa !16
  %vecext.2.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 2
  %add69.2.3 = or disjoint i64 %mul56.3, %173
  %add71.2.3 = or disjoint i64 %add69.2.3, %conv70
  %arrayidx72.2.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.3
  store i32 %vecext.2.3, ptr addrspace(1) %arrayidx72.2.3, align 4, !tbaa !16
  %vecext.3.3 = extractelement <4 x i32> %sums.sroa.14.1, i64 3
  %add69.3.3 = or disjoint i64 %mul56.3, %175
  %add71.3.3 = or disjoint i64 %add69.3.3, %conv70
  %arrayidx72.3.3 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.3
  store i32 %vecext.3.3, ptr addrspace(1) %arrayidx72.3.3, align 4, !tbaa !16
  %mul56.4 = or disjoint i64 %168, 1024
  %vecext.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 0
  %add69.4 = or disjoint i64 %mul56.4, %169
  %add71.4 = or disjoint i64 %add69.4, %conv70
  %arrayidx72.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.4
  store i32 %vecext.4, ptr addrspace(1) %arrayidx72.4, align 4, !tbaa !16
  %vecext.1.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 1
  %add69.1.4 = or disjoint i64 %mul56.4, %171
  %add71.1.4 = or disjoint i64 %add69.1.4, %conv70
  %arrayidx72.1.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.4
  store i32 %vecext.1.4, ptr addrspace(1) %arrayidx72.1.4, align 4, !tbaa !16
  %vecext.2.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 2
  %add69.2.4 = or disjoint i64 %mul56.4, %173
  %add71.2.4 = or disjoint i64 %add69.2.4, %conv70
  %arrayidx72.2.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.4
  store i32 %vecext.2.4, ptr addrspace(1) %arrayidx72.2.4, align 4, !tbaa !16
  %vecext.3.4 = extractelement <4 x i32> %sums.sroa.18.1, i64 3
  %add69.3.4 = or disjoint i64 %mul56.4, %175
  %add71.3.4 = or disjoint i64 %add69.3.4, %conv70
  %arrayidx72.3.4 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.4
  store i32 %vecext.3.4, ptr addrspace(1) %arrayidx72.3.4, align 4, !tbaa !16
  %mul56.5 = or disjoint i64 %168, 1280
  %vecext.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 0
  %add69.5 = or disjoint i64 %mul56.5, %169
  %add71.5 = or disjoint i64 %add69.5, %conv70
  %arrayidx72.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.5
  store i32 %vecext.5, ptr addrspace(1) %arrayidx72.5, align 4, !tbaa !16
  %vecext.1.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 1
  %add69.1.5 = or disjoint i64 %mul56.5, %171
  %add71.1.5 = or disjoint i64 %add69.1.5, %conv70
  %arrayidx72.1.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.5
  store i32 %vecext.1.5, ptr addrspace(1) %arrayidx72.1.5, align 4, !tbaa !16
  %vecext.2.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 2
  %add69.2.5 = or disjoint i64 %mul56.5, %173
  %add71.2.5 = or disjoint i64 %add69.2.5, %conv70
  %arrayidx72.2.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.5
  store i32 %vecext.2.5, ptr addrspace(1) %arrayidx72.2.5, align 4, !tbaa !16
  %vecext.3.5 = extractelement <4 x i32> %sums.sroa.22.1, i64 3
  %add69.3.5 = or disjoint i64 %mul56.5, %175
  %add71.3.5 = or disjoint i64 %add69.3.5, %conv70
  %arrayidx72.3.5 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.5
  store i32 %vecext.3.5, ptr addrspace(1) %arrayidx72.3.5, align 4, !tbaa !16
  %mul56.6 = or disjoint i64 %168, 1536
  %vecext.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 0
  %add69.6 = or disjoint i64 %mul56.6, %169
  %add71.6 = or disjoint i64 %add69.6, %conv70
  %arrayidx72.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.6
  store i32 %vecext.6, ptr addrspace(1) %arrayidx72.6, align 4, !tbaa !16
  %vecext.1.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 1
  %add69.1.6 = or disjoint i64 %mul56.6, %171
  %add71.1.6 = or disjoint i64 %add69.1.6, %conv70
  %arrayidx72.1.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.6
  store i32 %vecext.1.6, ptr addrspace(1) %arrayidx72.1.6, align 4, !tbaa !16
  %vecext.2.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 2
  %add69.2.6 = or disjoint i64 %mul56.6, %173
  %add71.2.6 = or disjoint i64 %add69.2.6, %conv70
  %arrayidx72.2.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.6
  store i32 %vecext.2.6, ptr addrspace(1) %arrayidx72.2.6, align 4, !tbaa !16
  %vecext.3.6 = extractelement <4 x i32> %sums.sroa.26.1, i64 3
  %add69.3.6 = or disjoint i64 %mul56.6, %175
  %add71.3.6 = or disjoint i64 %add69.3.6, %conv70
  %arrayidx72.3.6 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.6
  store i32 %vecext.3.6, ptr addrspace(1) %arrayidx72.3.6, align 4, !tbaa !16
  %mul56.7 = or disjoint i64 %168, 1792
  %vecext.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 0
  %add69.7 = or disjoint i64 %mul56.7, %169
  %add71.7 = or disjoint i64 %add69.7, %conv70
  %arrayidx72.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.7
  store i32 %vecext.7, ptr addrspace(1) %arrayidx72.7, align 4, !tbaa !16
  %vecext.1.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 1
  %add69.1.7 = or disjoint i64 %mul56.7, %171
  %add71.1.7 = or disjoint i64 %add69.1.7, %conv70
  %arrayidx72.1.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.7
  store i32 %vecext.1.7, ptr addrspace(1) %arrayidx72.1.7, align 4, !tbaa !16
  %vecext.2.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 2
  %add69.2.7 = or disjoint i64 %mul56.7, %173
  %add71.2.7 = or disjoint i64 %add69.2.7, %conv70
  %arrayidx72.2.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.7
  store i32 %vecext.2.7, ptr addrspace(1) %arrayidx72.2.7, align 4, !tbaa !16
  %vecext.3.7 = extractelement <4 x i32> %sums.sroa.30.1, i64 3
  %add69.3.7 = or disjoint i64 %mul56.7, %175
  %add71.3.7 = or disjoint i64 %add69.3.7, %conv70
  %arrayidx72.3.7 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.7
  store i32 %vecext.3.7, ptr addrspace(1) %arrayidx72.3.7, align 4, !tbaa !16
  %mul56.8 = or disjoint i64 %168, 2048
  %vecext.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 0
  %add69.8 = or disjoint i64 %mul56.8, %169
  %add71.8 = or disjoint i64 %add69.8, %conv70
  %arrayidx72.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.8
  store i32 %vecext.8, ptr addrspace(1) %arrayidx72.8, align 4, !tbaa !16
  %vecext.1.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 1
  %add69.1.8 = or disjoint i64 %mul56.8, %171
  %add71.1.8 = or disjoint i64 %add69.1.8, %conv70
  %arrayidx72.1.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.8
  store i32 %vecext.1.8, ptr addrspace(1) %arrayidx72.1.8, align 4, !tbaa !16
  %vecext.2.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 2
  %add69.2.8 = or disjoint i64 %mul56.8, %173
  %add71.2.8 = or disjoint i64 %add69.2.8, %conv70
  %arrayidx72.2.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.8
  store i32 %vecext.2.8, ptr addrspace(1) %arrayidx72.2.8, align 4, !tbaa !16
  %vecext.3.8 = extractelement <4 x i32> %sums.sroa.34.1, i64 3
  %add69.3.8 = or disjoint i64 %mul56.8, %175
  %add71.3.8 = or disjoint i64 %add69.3.8, %conv70
  %arrayidx72.3.8 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.8
  store i32 %vecext.3.8, ptr addrspace(1) %arrayidx72.3.8, align 4, !tbaa !16
  %mul56.9 = or disjoint i64 %168, 2304
  %vecext.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 0
  %add69.9 = or disjoint i64 %mul56.9, %169
  %add71.9 = or disjoint i64 %add69.9, %conv70
  %arrayidx72.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.9
  store i32 %vecext.9, ptr addrspace(1) %arrayidx72.9, align 4, !tbaa !16
  %vecext.1.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 1
  %add69.1.9 = or disjoint i64 %mul56.9, %171
  %add71.1.9 = or disjoint i64 %add69.1.9, %conv70
  %arrayidx72.1.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.9
  store i32 %vecext.1.9, ptr addrspace(1) %arrayidx72.1.9, align 4, !tbaa !16
  %vecext.2.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 2
  %add69.2.9 = or disjoint i64 %mul56.9, %173
  %add71.2.9 = or disjoint i64 %add69.2.9, %conv70
  %arrayidx72.2.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.9
  store i32 %vecext.2.9, ptr addrspace(1) %arrayidx72.2.9, align 4, !tbaa !16
  %vecext.3.9 = extractelement <4 x i32> %sums.sroa.38.1, i64 3
  %add69.3.9 = or disjoint i64 %mul56.9, %175
  %add71.3.9 = or disjoint i64 %add69.3.9, %conv70
  %arrayidx72.3.9 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.9
  store i32 %vecext.3.9, ptr addrspace(1) %arrayidx72.3.9, align 4, !tbaa !16
  %mul56.10 = or disjoint i64 %168, 2560
  %vecext.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 0
  %add69.10 = or disjoint i64 %mul56.10, %169
  %add71.10 = or disjoint i64 %add69.10, %conv70
  %arrayidx72.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.10
  store i32 %vecext.10, ptr addrspace(1) %arrayidx72.10, align 4, !tbaa !16
  %vecext.1.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 1
  %add69.1.10 = or disjoint i64 %mul56.10, %171
  %add71.1.10 = or disjoint i64 %add69.1.10, %conv70
  %arrayidx72.1.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.10
  store i32 %vecext.1.10, ptr addrspace(1) %arrayidx72.1.10, align 4, !tbaa !16
  %vecext.2.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 2
  %add69.2.10 = or disjoint i64 %mul56.10, %173
  %add71.2.10 = or disjoint i64 %add69.2.10, %conv70
  %arrayidx72.2.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.10
  store i32 %vecext.2.10, ptr addrspace(1) %arrayidx72.2.10, align 4, !tbaa !16
  %vecext.3.10 = extractelement <4 x i32> %sums.sroa.42.1, i64 3
  %add69.3.10 = or disjoint i64 %mul56.10, %175
  %add71.3.10 = or disjoint i64 %add69.3.10, %conv70
  %arrayidx72.3.10 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.10
  store i32 %vecext.3.10, ptr addrspace(1) %arrayidx72.3.10, align 4, !tbaa !16
  %mul56.11 = or disjoint i64 %168, 2816
  %vecext.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 0
  %add69.11 = or disjoint i64 %mul56.11, %169
  %add71.11 = or disjoint i64 %add69.11, %conv70
  %arrayidx72.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.11
  store i32 %vecext.11, ptr addrspace(1) %arrayidx72.11, align 4, !tbaa !16
  %vecext.1.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 1
  %add69.1.11 = or disjoint i64 %mul56.11, %171
  %add71.1.11 = or disjoint i64 %add69.1.11, %conv70
  %arrayidx72.1.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.11
  store i32 %vecext.1.11, ptr addrspace(1) %arrayidx72.1.11, align 4, !tbaa !16
  %vecext.2.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 2
  %add69.2.11 = or disjoint i64 %mul56.11, %173
  %add71.2.11 = or disjoint i64 %add69.2.11, %conv70
  %arrayidx72.2.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.11
  store i32 %vecext.2.11, ptr addrspace(1) %arrayidx72.2.11, align 4, !tbaa !16
  %vecext.3.11 = extractelement <4 x i32> %sums.sroa.46.1, i64 3
  %add69.3.11 = or disjoint i64 %mul56.11, %175
  %add71.3.11 = or disjoint i64 %add69.3.11, %conv70
  %arrayidx72.3.11 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.11
  store i32 %vecext.3.11, ptr addrspace(1) %arrayidx72.3.11, align 4, !tbaa !16
  %mul56.12 = or disjoint i64 %168, 3072
  %vecext.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 0
  %add69.12 = or disjoint i64 %mul56.12, %169
  %add71.12 = or disjoint i64 %add69.12, %conv70
  %arrayidx72.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.12
  store i32 %vecext.12, ptr addrspace(1) %arrayidx72.12, align 4, !tbaa !16
  %vecext.1.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 1
  %add69.1.12 = or disjoint i64 %mul56.12, %171
  %add71.1.12 = or disjoint i64 %add69.1.12, %conv70
  %arrayidx72.1.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.12
  store i32 %vecext.1.12, ptr addrspace(1) %arrayidx72.1.12, align 4, !tbaa !16
  %vecext.2.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 2
  %add69.2.12 = or disjoint i64 %mul56.12, %173
  %add71.2.12 = or disjoint i64 %add69.2.12, %conv70
  %arrayidx72.2.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.12
  store i32 %vecext.2.12, ptr addrspace(1) %arrayidx72.2.12, align 4, !tbaa !16
  %vecext.3.12 = extractelement <4 x i32> %sums.sroa.50.1, i64 3
  %add69.3.12 = or disjoint i64 %mul56.12, %175
  %add71.3.12 = or disjoint i64 %add69.3.12, %conv70
  %arrayidx72.3.12 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.12
  store i32 %vecext.3.12, ptr addrspace(1) %arrayidx72.3.12, align 4, !tbaa !16
  %mul56.13 = or disjoint i64 %168, 3328
  %vecext.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 0
  %add69.13 = or disjoint i64 %mul56.13, %169
  %add71.13 = or disjoint i64 %add69.13, %conv70
  %arrayidx72.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.13
  store i32 %vecext.13, ptr addrspace(1) %arrayidx72.13, align 4, !tbaa !16
  %vecext.1.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 1
  %add69.1.13 = or disjoint i64 %mul56.13, %171
  %add71.1.13 = or disjoint i64 %add69.1.13, %conv70
  %arrayidx72.1.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.13
  store i32 %vecext.1.13, ptr addrspace(1) %arrayidx72.1.13, align 4, !tbaa !16
  %vecext.2.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 2
  %add69.2.13 = or disjoint i64 %mul56.13, %173
  %add71.2.13 = or disjoint i64 %add69.2.13, %conv70
  %arrayidx72.2.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.13
  store i32 %vecext.2.13, ptr addrspace(1) %arrayidx72.2.13, align 4, !tbaa !16
  %vecext.3.13 = extractelement <4 x i32> %sums.sroa.54.1, i64 3
  %add69.3.13 = or disjoint i64 %mul56.13, %175
  %add71.3.13 = or disjoint i64 %add69.3.13, %conv70
  %arrayidx72.3.13 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.13
  store i32 %vecext.3.13, ptr addrspace(1) %arrayidx72.3.13, align 4, !tbaa !16
  %mul56.14 = or disjoint i64 %168, 3584
  %vecext.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 0
  %add69.14 = or disjoint i64 %mul56.14, %169
  %add71.14 = or disjoint i64 %add69.14, %conv70
  %arrayidx72.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.14
  store i32 %vecext.14, ptr addrspace(1) %arrayidx72.14, align 4, !tbaa !16
  %vecext.1.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 1
  %add69.1.14 = or disjoint i64 %mul56.14, %171
  %add71.1.14 = or disjoint i64 %add69.1.14, %conv70
  %arrayidx72.1.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.14
  store i32 %vecext.1.14, ptr addrspace(1) %arrayidx72.1.14, align 4, !tbaa !16
  %vecext.2.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 2
  %add69.2.14 = or disjoint i64 %mul56.14, %173
  %add71.2.14 = or disjoint i64 %add69.2.14, %conv70
  %arrayidx72.2.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.14
  store i32 %vecext.2.14, ptr addrspace(1) %arrayidx72.2.14, align 4, !tbaa !16
  %vecext.3.14 = extractelement <4 x i32> %sums.sroa.58.1, i64 3
  %add69.3.14 = or disjoint i64 %mul56.14, %175
  %add71.3.14 = or disjoint i64 %add69.3.14, %conv70
  %arrayidx72.3.14 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.14
  store i32 %vecext.3.14, ptr addrspace(1) %arrayidx72.3.14, align 4, !tbaa !16
  %mul56.15 = or disjoint i64 %168, 3840
  %vecext.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 0
  %add69.15 = or disjoint i64 %mul56.15, %169
  %add71.15 = or disjoint i64 %add69.15, %conv70
  %arrayidx72.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.15
  store i32 %vecext.15, ptr addrspace(1) %arrayidx72.15, align 4, !tbaa !16
  %vecext.1.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 1
  %add69.1.15 = or disjoint i64 %mul56.15, %171
  %add71.1.15 = or disjoint i64 %add69.1.15, %conv70
  %arrayidx72.1.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.15
  store i32 %vecext.1.15, ptr addrspace(1) %arrayidx72.1.15, align 4, !tbaa !16
  %vecext.2.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 2
  %add69.2.15 = or disjoint i64 %mul56.15, %173
  %add71.2.15 = or disjoint i64 %add69.2.15, %conv70
  %arrayidx72.2.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.15
  store i32 %vecext.2.15, ptr addrspace(1) %arrayidx72.2.15, align 4, !tbaa !16
  %vecext.3.15 = extractelement <4 x i32> %sums.sroa.62.1, i64 3
  %add69.3.15 = or disjoint i64 %mul56.15, %175
  %add71.3.15 = or disjoint i64 %add69.3.15, %conv70
  %arrayidx72.3.15 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.15
  store i32 %vecext.3.15, ptr addrspace(1) %arrayidx72.3.15, align 4, !tbaa !16
  %mul56.16 = or disjoint i64 %168, 4096
  %vecext.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 0
  %add69.16 = or disjoint i64 %mul56.16, %169
  %add71.16 = or disjoint i64 %add69.16, %conv70
  %arrayidx72.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.16
  store i32 %vecext.16, ptr addrspace(1) %arrayidx72.16, align 4, !tbaa !16
  %vecext.1.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 1
  %add69.1.16 = or disjoint i64 %mul56.16, %171
  %add71.1.16 = or disjoint i64 %add69.1.16, %conv70
  %arrayidx72.1.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.16
  store i32 %vecext.1.16, ptr addrspace(1) %arrayidx72.1.16, align 4, !tbaa !16
  %vecext.2.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 2
  %add69.2.16 = or disjoint i64 %mul56.16, %173
  %add71.2.16 = or disjoint i64 %add69.2.16, %conv70
  %arrayidx72.2.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.16
  store i32 %vecext.2.16, ptr addrspace(1) %arrayidx72.2.16, align 4, !tbaa !16
  %vecext.3.16 = extractelement <4 x i32> %sums.sroa.66.1, i64 3
  %add69.3.16 = or disjoint i64 %mul56.16, %175
  %add71.3.16 = or disjoint i64 %add69.3.16, %conv70
  %arrayidx72.3.16 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.16
  store i32 %vecext.3.16, ptr addrspace(1) %arrayidx72.3.16, align 4, !tbaa !16
  %mul56.17 = or disjoint i64 %168, 4352
  %vecext.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 0
  %add69.17 = or disjoint i64 %mul56.17, %169
  %add71.17 = or disjoint i64 %add69.17, %conv70
  %arrayidx72.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.17
  store i32 %vecext.17, ptr addrspace(1) %arrayidx72.17, align 4, !tbaa !16
  %vecext.1.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 1
  %add69.1.17 = or disjoint i64 %mul56.17, %171
  %add71.1.17 = or disjoint i64 %add69.1.17, %conv70
  %arrayidx72.1.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.17
  store i32 %vecext.1.17, ptr addrspace(1) %arrayidx72.1.17, align 4, !tbaa !16
  %vecext.2.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 2
  %add69.2.17 = or disjoint i64 %mul56.17, %173
  %add71.2.17 = or disjoint i64 %add69.2.17, %conv70
  %arrayidx72.2.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.17
  store i32 %vecext.2.17, ptr addrspace(1) %arrayidx72.2.17, align 4, !tbaa !16
  %vecext.3.17 = extractelement <4 x i32> %sums.sroa.70.1, i64 3
  %add69.3.17 = or disjoint i64 %mul56.17, %175
  %add71.3.17 = or disjoint i64 %add69.3.17, %conv70
  %arrayidx72.3.17 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.17
  store i32 %vecext.3.17, ptr addrspace(1) %arrayidx72.3.17, align 4, !tbaa !16
  %mul56.18 = or disjoint i64 %168, 4608
  %vecext.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 0
  %add69.18 = or disjoint i64 %mul56.18, %169
  %add71.18 = or disjoint i64 %add69.18, %conv70
  %arrayidx72.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.18
  store i32 %vecext.18, ptr addrspace(1) %arrayidx72.18, align 4, !tbaa !16
  %vecext.1.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 1
  %add69.1.18 = or disjoint i64 %mul56.18, %171
  %add71.1.18 = or disjoint i64 %add69.1.18, %conv70
  %arrayidx72.1.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.18
  store i32 %vecext.1.18, ptr addrspace(1) %arrayidx72.1.18, align 4, !tbaa !16
  %vecext.2.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 2
  %add69.2.18 = or disjoint i64 %mul56.18, %173
  %add71.2.18 = or disjoint i64 %add69.2.18, %conv70
  %arrayidx72.2.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.18
  store i32 %vecext.2.18, ptr addrspace(1) %arrayidx72.2.18, align 4, !tbaa !16
  %vecext.3.18 = extractelement <4 x i32> %sums.sroa.74.1, i64 3
  %add69.3.18 = or disjoint i64 %mul56.18, %175
  %add71.3.18 = or disjoint i64 %add69.3.18, %conv70
  %arrayidx72.3.18 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.18
  store i32 %vecext.3.18, ptr addrspace(1) %arrayidx72.3.18, align 4, !tbaa !16
  %mul56.19 = or disjoint i64 %168, 4864
  %vecext.19 = extractelement <4 x i32> %sums.sroa.78.1, i64 0
  %add69.19 = or disjoint i64 %mul56.19, %169
  %add71.19 = or disjoint i64 %add69.19, %conv70
  %arrayidx72.19 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.19
  store i32 %vecext.19, ptr addrspace(1) %arrayidx72.19, align 4, !tbaa !16
  %vecext.1.19 = extractelement <4 x i32> %sums.sroa.78.1, i64 1
  %add69.1.19 = or disjoint i64 %mul56.19, %171
  %add71.1.19 = or disjoint i64 %add69.1.19, %conv70
  %arrayidx72.1.19 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.19
  store i32 %vecext.1.19, ptr addrspace(1) %arrayidx72.1.19, align 4, !tbaa !16
  %vecext.2.19 = extractelement <4 x i32> %sums.sroa.78.1, i64 2
  %add69.2.19 = or disjoint i64 %mul56.19, %173
  %add71.2.19 = or disjoint i64 %add69.2.19, %conv70
  %arrayidx72.2.19 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.19
  store i32 %vecext.2.19, ptr addrspace(1) %arrayidx72.2.19, align 4, !tbaa !16
  %vecext.3.19 = extractelement <4 x i32> %sums.sroa.78.1, i64 3
  %add69.3.19 = or disjoint i64 %mul56.19, %175
  %add71.3.19 = or disjoint i64 %add69.3.19, %conv70
  %arrayidx72.3.19 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.19
  store i32 %vecext.3.19, ptr addrspace(1) %arrayidx72.3.19, align 4, !tbaa !16
  %mul56.20 = or disjoint i64 %168, 5120
  %vecext.20 = extractelement <4 x i32> %sums.sroa.82.1, i64 0
  %add69.20 = or disjoint i64 %mul56.20, %169
  %add71.20 = or disjoint i64 %add69.20, %conv70
  %arrayidx72.20 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.20
  store i32 %vecext.20, ptr addrspace(1) %arrayidx72.20, align 4, !tbaa !16
  %vecext.1.20 = extractelement <4 x i32> %sums.sroa.82.1, i64 1
  %add69.1.20 = or disjoint i64 %mul56.20, %171
  %add71.1.20 = or disjoint i64 %add69.1.20, %conv70
  %arrayidx72.1.20 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.20
  store i32 %vecext.1.20, ptr addrspace(1) %arrayidx72.1.20, align 4, !tbaa !16
  %vecext.2.20 = extractelement <4 x i32> %sums.sroa.82.1, i64 2
  %add69.2.20 = or disjoint i64 %mul56.20, %173
  %add71.2.20 = or disjoint i64 %add69.2.20, %conv70
  %arrayidx72.2.20 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.20
  store i32 %vecext.2.20, ptr addrspace(1) %arrayidx72.2.20, align 4, !tbaa !16
  %vecext.3.20 = extractelement <4 x i32> %sums.sroa.82.1, i64 3
  %add69.3.20 = or disjoint i64 %mul56.20, %175
  %add71.3.20 = or disjoint i64 %add69.3.20, %conv70
  %arrayidx72.3.20 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.20
  store i32 %vecext.3.20, ptr addrspace(1) %arrayidx72.3.20, align 4, !tbaa !16
  %mul56.21 = or disjoint i64 %168, 5376
  %vecext.21 = extractelement <4 x i32> %sums.sroa.86.1, i64 0
  %add69.21 = or disjoint i64 %mul56.21, %169
  %add71.21 = or disjoint i64 %add69.21, %conv70
  %arrayidx72.21 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.21
  store i32 %vecext.21, ptr addrspace(1) %arrayidx72.21, align 4, !tbaa !16
  %vecext.1.21 = extractelement <4 x i32> %sums.sroa.86.1, i64 1
  %add69.1.21 = or disjoint i64 %mul56.21, %171
  %add71.1.21 = or disjoint i64 %add69.1.21, %conv70
  %arrayidx72.1.21 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.21
  store i32 %vecext.1.21, ptr addrspace(1) %arrayidx72.1.21, align 4, !tbaa !16
  %vecext.2.21 = extractelement <4 x i32> %sums.sroa.86.1, i64 2
  %add69.2.21 = or disjoint i64 %mul56.21, %173
  %add71.2.21 = or disjoint i64 %add69.2.21, %conv70
  %arrayidx72.2.21 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.21
  store i32 %vecext.2.21, ptr addrspace(1) %arrayidx72.2.21, align 4, !tbaa !16
  %vecext.3.21 = extractelement <4 x i32> %sums.sroa.86.1, i64 3
  %add69.3.21 = or disjoint i64 %mul56.21, %175
  %add71.3.21 = or disjoint i64 %add69.3.21, %conv70
  %arrayidx72.3.21 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.21
  store i32 %vecext.3.21, ptr addrspace(1) %arrayidx72.3.21, align 4, !tbaa !16
  %mul56.22 = or disjoint i64 %168, 5632
  %vecext.22 = extractelement <4 x i32> %sums.sroa.90.1, i64 0
  %add69.22 = or disjoint i64 %mul56.22, %169
  %add71.22 = or disjoint i64 %add69.22, %conv70
  %arrayidx72.22 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.22
  store i32 %vecext.22, ptr addrspace(1) %arrayidx72.22, align 4, !tbaa !16
  %vecext.1.22 = extractelement <4 x i32> %sums.sroa.90.1, i64 1
  %add69.1.22 = or disjoint i64 %mul56.22, %171
  %add71.1.22 = or disjoint i64 %add69.1.22, %conv70
  %arrayidx72.1.22 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.22
  store i32 %vecext.1.22, ptr addrspace(1) %arrayidx72.1.22, align 4, !tbaa !16
  %vecext.2.22 = extractelement <4 x i32> %sums.sroa.90.1, i64 2
  %add69.2.22 = or disjoint i64 %mul56.22, %173
  %add71.2.22 = or disjoint i64 %add69.2.22, %conv70
  %arrayidx72.2.22 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.22
  store i32 %vecext.2.22, ptr addrspace(1) %arrayidx72.2.22, align 4, !tbaa !16
  %vecext.3.22 = extractelement <4 x i32> %sums.sroa.90.1, i64 3
  %add69.3.22 = or disjoint i64 %mul56.22, %175
  %add71.3.22 = or disjoint i64 %add69.3.22, %conv70
  %arrayidx72.3.22 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.22
  store i32 %vecext.3.22, ptr addrspace(1) %arrayidx72.3.22, align 4, !tbaa !16
  %mul56.23 = or disjoint i64 %168, 5888
  %vecext.23 = extractelement <4 x i32> %sums.sroa.94.1, i64 0
  %add69.23 = or disjoint i64 %mul56.23, %169
  %add71.23 = or disjoint i64 %add69.23, %conv70
  %arrayidx72.23 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.23
  store i32 %vecext.23, ptr addrspace(1) %arrayidx72.23, align 4, !tbaa !16
  %vecext.1.23 = extractelement <4 x i32> %sums.sroa.94.1, i64 1
  %add69.1.23 = or disjoint i64 %mul56.23, %171
  %add71.1.23 = or disjoint i64 %add69.1.23, %conv70
  %arrayidx72.1.23 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.23
  store i32 %vecext.1.23, ptr addrspace(1) %arrayidx72.1.23, align 4, !tbaa !16
  %vecext.2.23 = extractelement <4 x i32> %sums.sroa.94.1, i64 2
  %add69.2.23 = or disjoint i64 %mul56.23, %173
  %add71.2.23 = or disjoint i64 %add69.2.23, %conv70
  %arrayidx72.2.23 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.23
  store i32 %vecext.2.23, ptr addrspace(1) %arrayidx72.2.23, align 4, !tbaa !16
  %vecext.3.23 = extractelement <4 x i32> %sums.sroa.94.1, i64 3
  %add69.3.23 = or disjoint i64 %mul56.23, %175
  %add71.3.23 = or disjoint i64 %add69.3.23, %conv70
  %arrayidx72.3.23 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.23
  store i32 %vecext.3.23, ptr addrspace(1) %arrayidx72.3.23, align 4, !tbaa !16
  %mul56.24 = or disjoint i64 %168, 6144
  %vecext.24 = extractelement <4 x i32> %sums.sroa.98.1, i64 0
  %add69.24 = or disjoint i64 %mul56.24, %169
  %add71.24 = or disjoint i64 %add69.24, %conv70
  %arrayidx72.24 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.24
  store i32 %vecext.24, ptr addrspace(1) %arrayidx72.24, align 4, !tbaa !16
  %vecext.1.24 = extractelement <4 x i32> %sums.sroa.98.1, i64 1
  %add69.1.24 = or disjoint i64 %mul56.24, %171
  %add71.1.24 = or disjoint i64 %add69.1.24, %conv70
  %arrayidx72.1.24 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.24
  store i32 %vecext.1.24, ptr addrspace(1) %arrayidx72.1.24, align 4, !tbaa !16
  %vecext.2.24 = extractelement <4 x i32> %sums.sroa.98.1, i64 2
  %add69.2.24 = or disjoint i64 %mul56.24, %173
  %add71.2.24 = or disjoint i64 %add69.2.24, %conv70
  %arrayidx72.2.24 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.24
  store i32 %vecext.2.24, ptr addrspace(1) %arrayidx72.2.24, align 4, !tbaa !16
  %vecext.3.24 = extractelement <4 x i32> %sums.sroa.98.1, i64 3
  %add69.3.24 = or disjoint i64 %mul56.24, %175
  %add71.3.24 = or disjoint i64 %add69.3.24, %conv70
  %arrayidx72.3.24 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.24
  store i32 %vecext.3.24, ptr addrspace(1) %arrayidx72.3.24, align 4, !tbaa !16
  %mul56.25 = or disjoint i64 %168, 6400
  %vecext.25 = extractelement <4 x i32> %sums.sroa.102.1, i64 0
  %add69.25 = or disjoint i64 %mul56.25, %169
  %add71.25 = or disjoint i64 %add69.25, %conv70
  %arrayidx72.25 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.25
  store i32 %vecext.25, ptr addrspace(1) %arrayidx72.25, align 4, !tbaa !16
  %vecext.1.25 = extractelement <4 x i32> %sums.sroa.102.1, i64 1
  %add69.1.25 = or disjoint i64 %mul56.25, %171
  %add71.1.25 = or disjoint i64 %add69.1.25, %conv70
  %arrayidx72.1.25 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.25
  store i32 %vecext.1.25, ptr addrspace(1) %arrayidx72.1.25, align 4, !tbaa !16
  %vecext.2.25 = extractelement <4 x i32> %sums.sroa.102.1, i64 2
  %add69.2.25 = or disjoint i64 %mul56.25, %173
  %add71.2.25 = or disjoint i64 %add69.2.25, %conv70
  %arrayidx72.2.25 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.25
  store i32 %vecext.2.25, ptr addrspace(1) %arrayidx72.2.25, align 4, !tbaa !16
  %vecext.3.25 = extractelement <4 x i32> %sums.sroa.102.1, i64 3
  %add69.3.25 = or disjoint i64 %mul56.25, %175
  %add71.3.25 = or disjoint i64 %add69.3.25, %conv70
  %arrayidx72.3.25 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.25
  store i32 %vecext.3.25, ptr addrspace(1) %arrayidx72.3.25, align 4, !tbaa !16
  %mul56.26 = or disjoint i64 %168, 6656
  %vecext.26 = extractelement <4 x i32> %sums.sroa.106.1, i64 0
  %add69.26 = or disjoint i64 %mul56.26, %169
  %add71.26 = or disjoint i64 %add69.26, %conv70
  %arrayidx72.26 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.26
  store i32 %vecext.26, ptr addrspace(1) %arrayidx72.26, align 4, !tbaa !16
  %vecext.1.26 = extractelement <4 x i32> %sums.sroa.106.1, i64 1
  %add69.1.26 = or disjoint i64 %mul56.26, %171
  %add71.1.26 = or disjoint i64 %add69.1.26, %conv70
  %arrayidx72.1.26 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.26
  store i32 %vecext.1.26, ptr addrspace(1) %arrayidx72.1.26, align 4, !tbaa !16
  %vecext.2.26 = extractelement <4 x i32> %sums.sroa.106.1, i64 2
  %add69.2.26 = or disjoint i64 %mul56.26, %173
  %add71.2.26 = or disjoint i64 %add69.2.26, %conv70
  %arrayidx72.2.26 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.26
  store i32 %vecext.2.26, ptr addrspace(1) %arrayidx72.2.26, align 4, !tbaa !16
  %vecext.3.26 = extractelement <4 x i32> %sums.sroa.106.1, i64 3
  %add69.3.26 = or disjoint i64 %mul56.26, %175
  %add71.3.26 = or disjoint i64 %add69.3.26, %conv70
  %arrayidx72.3.26 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.26
  store i32 %vecext.3.26, ptr addrspace(1) %arrayidx72.3.26, align 4, !tbaa !16
  %mul56.27 = or disjoint i64 %168, 6912
  %vecext.27 = extractelement <4 x i32> %sums.sroa.110.1, i64 0
  %add69.27 = or disjoint i64 %mul56.27, %169
  %add71.27 = or disjoint i64 %add69.27, %conv70
  %arrayidx72.27 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.27
  store i32 %vecext.27, ptr addrspace(1) %arrayidx72.27, align 4, !tbaa !16
  %vecext.1.27 = extractelement <4 x i32> %sums.sroa.110.1, i64 1
  %add69.1.27 = or disjoint i64 %mul56.27, %171
  %add71.1.27 = or disjoint i64 %add69.1.27, %conv70
  %arrayidx72.1.27 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.27
  store i32 %vecext.1.27, ptr addrspace(1) %arrayidx72.1.27, align 4, !tbaa !16
  %vecext.2.27 = extractelement <4 x i32> %sums.sroa.110.1, i64 2
  %add69.2.27 = or disjoint i64 %mul56.27, %173
  %add71.2.27 = or disjoint i64 %add69.2.27, %conv70
  %arrayidx72.2.27 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.27
  store i32 %vecext.2.27, ptr addrspace(1) %arrayidx72.2.27, align 4, !tbaa !16
  %vecext.3.27 = extractelement <4 x i32> %sums.sroa.110.1, i64 3
  %add69.3.27 = or disjoint i64 %mul56.27, %175
  %add71.3.27 = or disjoint i64 %add69.3.27, %conv70
  %arrayidx72.3.27 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.27
  store i32 %vecext.3.27, ptr addrspace(1) %arrayidx72.3.27, align 4, !tbaa !16
  %mul56.28 = or disjoint i64 %168, 7168
  %vecext.28 = extractelement <4 x i32> %sums.sroa.114.1, i64 0
  %add69.28 = or disjoint i64 %mul56.28, %169
  %add71.28 = or disjoint i64 %add69.28, %conv70
  %arrayidx72.28 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.28
  store i32 %vecext.28, ptr addrspace(1) %arrayidx72.28, align 4, !tbaa !16
  %vecext.1.28 = extractelement <4 x i32> %sums.sroa.114.1, i64 1
  %add69.1.28 = or disjoint i64 %mul56.28, %171
  %add71.1.28 = or disjoint i64 %add69.1.28, %conv70
  %arrayidx72.1.28 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.28
  store i32 %vecext.1.28, ptr addrspace(1) %arrayidx72.1.28, align 4, !tbaa !16
  %vecext.2.28 = extractelement <4 x i32> %sums.sroa.114.1, i64 2
  %add69.2.28 = or disjoint i64 %mul56.28, %173
  %add71.2.28 = or disjoint i64 %add69.2.28, %conv70
  %arrayidx72.2.28 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.28
  store i32 %vecext.2.28, ptr addrspace(1) %arrayidx72.2.28, align 4, !tbaa !16
  %vecext.3.28 = extractelement <4 x i32> %sums.sroa.114.1, i64 3
  %add69.3.28 = or disjoint i64 %mul56.28, %175
  %add71.3.28 = or disjoint i64 %add69.3.28, %conv70
  %arrayidx72.3.28 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.28
  store i32 %vecext.3.28, ptr addrspace(1) %arrayidx72.3.28, align 4, !tbaa !16
  %mul56.29 = or disjoint i64 %168, 7424
  %vecext.29 = extractelement <4 x i32> %sums.sroa.118.1, i64 0
  %add69.29 = or disjoint i64 %mul56.29, %169
  %add71.29 = or disjoint i64 %add69.29, %conv70
  %arrayidx72.29 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.29
  store i32 %vecext.29, ptr addrspace(1) %arrayidx72.29, align 4, !tbaa !16
  %vecext.1.29 = extractelement <4 x i32> %sums.sroa.118.1, i64 1
  %add69.1.29 = or disjoint i64 %mul56.29, %171
  %add71.1.29 = or disjoint i64 %add69.1.29, %conv70
  %arrayidx72.1.29 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.29
  store i32 %vecext.1.29, ptr addrspace(1) %arrayidx72.1.29, align 4, !tbaa !16
  %vecext.2.29 = extractelement <4 x i32> %sums.sroa.118.1, i64 2
  %add69.2.29 = or disjoint i64 %mul56.29, %173
  %add71.2.29 = or disjoint i64 %add69.2.29, %conv70
  %arrayidx72.2.29 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.29
  store i32 %vecext.2.29, ptr addrspace(1) %arrayidx72.2.29, align 4, !tbaa !16
  %vecext.3.29 = extractelement <4 x i32> %sums.sroa.118.1, i64 3
  %add69.3.29 = or disjoint i64 %mul56.29, %175
  %add71.3.29 = or disjoint i64 %add69.3.29, %conv70
  %arrayidx72.3.29 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.29
  store i32 %vecext.3.29, ptr addrspace(1) %arrayidx72.3.29, align 4, !tbaa !16
  %mul56.30 = or disjoint i64 %168, 7680
  %vecext.30 = extractelement <4 x i32> %sums.sroa.122.1, i64 0
  %add69.30 = or disjoint i64 %mul56.30, %169
  %add71.30 = or disjoint i64 %add69.30, %conv70
  %arrayidx72.30 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.30
  store i32 %vecext.30, ptr addrspace(1) %arrayidx72.30, align 4, !tbaa !16
  %vecext.1.30 = extractelement <4 x i32> %sums.sroa.122.1, i64 1
  %add69.1.30 = or disjoint i64 %mul56.30, %171
  %add71.1.30 = or disjoint i64 %add69.1.30, %conv70
  %arrayidx72.1.30 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.30
  store i32 %vecext.1.30, ptr addrspace(1) %arrayidx72.1.30, align 4, !tbaa !16
  %vecext.2.30 = extractelement <4 x i32> %sums.sroa.122.1, i64 2
  %add69.2.30 = or disjoint i64 %mul56.30, %173
  %add71.2.30 = or disjoint i64 %add69.2.30, %conv70
  %arrayidx72.2.30 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.30
  store i32 %vecext.2.30, ptr addrspace(1) %arrayidx72.2.30, align 4, !tbaa !16
  %vecext.3.30 = extractelement <4 x i32> %sums.sroa.122.1, i64 3
  %add69.3.30 = or disjoint i64 %mul56.30, %175
  %add71.3.30 = or disjoint i64 %add69.3.30, %conv70
  %arrayidx72.3.30 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.30
  store i32 %vecext.3.30, ptr addrspace(1) %arrayidx72.3.30, align 4, !tbaa !16
  %mul56.31 = or disjoint i64 %168, 7936
  %vecext.31 = extractelement <4 x i32> %sums.sroa.126.1, i64 0
  %add69.31 = or disjoint i64 %mul56.31, %169
  %add71.31 = or disjoint i64 %add69.31, %conv70
  %arrayidx72.31 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.31
  store i32 %vecext.31, ptr addrspace(1) %arrayidx72.31, align 4, !tbaa !16
  %vecext.1.31 = extractelement <4 x i32> %sums.sroa.126.1, i64 1
  %add69.1.31 = or disjoint i64 %mul56.31, %171
  %add71.1.31 = or disjoint i64 %add69.1.31, %conv70
  %arrayidx72.1.31 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.1.31
  store i32 %vecext.1.31, ptr addrspace(1) %arrayidx72.1.31, align 4, !tbaa !16
  %vecext.2.31 = extractelement <4 x i32> %sums.sroa.126.1, i64 2
  %add69.2.31 = or disjoint i64 %mul56.31, %173
  %add71.2.31 = or disjoint i64 %add69.2.31, %conv70
  %arrayidx72.2.31 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.2.31
  store i32 %vecext.2.31, ptr addrspace(1) %arrayidx72.2.31, align 4, !tbaa !16
  %vecext.3.31 = extractelement <4 x i32> %sums.sroa.126.1, i64 3
  %add69.3.31 = or disjoint i64 %mul56.31, %175
  %add71.3.31 = or disjoint i64 %add69.3.31, %conv70
  %arrayidx72.3.31 = getelementptr inbounds i32, ptr addrspace(1) %c.coerce, i64 %add71.3.31
  store i32 %vecext.3.31, ptr addrspace(1) %arrayidx72.3.31, align 4, !tbaa !16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind speculatable willreturn memory(none)
declare align 4 ptr addrspace(4) @llvm.mxc.implicitarg.ptr() #5

; Function Attrs: mustprogress nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.mxc.block.id.z() #5

; Function Attrs: mustprogress nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.mxc.block.id.y() #5

; Function Attrs: mustprogress nofree nosync nounwind speculatable willreturn memory(none)
declare i1 @llvm.mxc.is.private(ptr nocapture) #5

; Function Attrs: mustprogress nounwind willreturn
declare void @llvm.mxc.sleep(i32 immarg) #6

attributes #0 = { mustprogress noreturn nounwind "disable-promote-alloca-to-bsm"="true" "disable-promote-alloca-to-vector"="false" "enable-ldg-bsm-opt"="false" "fixed-function-abi"="true" "metaxgpu-bsm-direct-address"="true" "metaxgpu-inline-scope"="11" "metaxgpu-max-block-size"="512" "metaxgpu-new-streg-abi"="false" "metaxgpu-pk-fma"="false" "metaxgpu-resource-usage"="false" "metaxgpu-sched-select"="default" "metaxgpu-use-dim-intrinsic"="false" "no-trapping-math"="true" "scalarize-global-loads"="true" "shfl-combine"="true" "stack-protector-buffer-size"="8" "target-cpu"="xcore1000" "target-features"="+xcore1000" }
attributes #1 = { cold noreturn nounwind memory(inaccessiblemem: write) }
attributes #2 = { nounwind "disable-promote-alloca-to-bsm"="true" "disable-promote-alloca-to-vector"="false" "enable-ldg-bsm-opt"="false" "fixed-function-abi"="true" "metaxgpu-bsm-direct-address"="true" "metaxgpu-inline-scope"="11" "metaxgpu-max-block-size"="512" "metaxgpu-new-streg-abi"="false" "metaxgpu-pk-fma"="false" "metaxgpu-resource-usage"="false" "metaxgpu-sched-select"="default" "metaxgpu-use-dim-intrinsic"="false" "no-trapping-math"="true" "scalarize-global-loads"="true" "shfl-combine"="true" "stack-protector-buffer-size"="8" "target-cpu"="xcore1000" "target-features"="+xcore1000" }
attributes #3 = { convergent mustprogress nofree norecurse nounwind memory(argmem: readwrite) "disable-promote-alloca-to-bsm"="true" "disable-promote-alloca-to-vector"="false" "enable-ldg-bsm-opt"="false" "fixed-function-abi"="true" "metaxgpu-bsm-direct-address"="true" "metaxgpu-implicitarg-num-bytes"="80" "metaxgpu-inline-scope"="11" "metaxgpu-max-block-size"="512" "metaxgpu-new-streg-abi"="false" "metaxgpu-pk-fma"="false" "metaxgpu-resource-usage"="false" "metaxgpu-sched-select"="default" "metaxgpu-use-dim-intrinsic"="false" "no-trapping-math"="true" "scalarize-global-loads"="true" "shfl-combine"="true" "stack-protector-buffer-size"="8" "target-cpu"="xcore1000" "target-features"="+xcore1000" "uniform-work-group-size"="true" }
attributes #4 = { convergent mustprogress nofree nounwind willreturn memory(none) }
attributes #5 = { mustprogress nofree nosync nounwind speculatable willreturn memory(none) }
attributes #6 = { mustprogress nounwind willreturn }

!llvm.module.flags = !{!0, !1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 1}
!2 = !{!3, !3, i64 0}
!3 = !{!"long", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C++ TBAA"}
!6 = !{!7, !9, i64 16}
!7 = !{!"_ZTS21_DynamicParallMqlWrap", !8, i64 0, !8, i64 4, !8, i64 8, !8, i64 12, !9, i64 16, !9, i64 24, !10, i64 32}
!8 = !{!"int", !4, i64 0}
!9 = !{!"any pointer", !4, i64 0}
!10 = !{!"_ZTS28mxc_kernel_dispatch_packet_s", !11, i64 0, !11, i64 2, !11, i64 4, !11, i64 6, !11, i64 8, !11, i64 10, !8, i64 12, !8, i64 16, !8, i64 20, !8, i64 24, !8, i64 28, !3, i64 32, !9, i64 40, !3, i64 48, !12, i64 56}
!11 = !{!"short", !4, i64 0}
!12 = !{!"_ZTS12mxc_signal_s", !3, i64 0}
!13 = !{i32 1, i32 -2147483648}
!14 = !{}
!15 = !{i32 0, i32 2147483647}
!16 = !{!8, !8, i64 0}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.mustprogress"}
!19 = !{!7, !8, i64 4}
!20 = !{!7, !9, i64 24}
!21 = !{!7, !8, i64 0}
!22 = !{!23, !9, i64 24}
!23 = !{!"_ZTS28_DynamicParallSchedulerParam", !3, i64 0, !9, i64 8, !9, i64 16, !9, i64 24, !3, i64 32, !3, i64 40, !3, i64 48, !3, i64 56, !3, i64 64, !3, i64 72, !3, i64 80, !3, i64 88, !3, i64 96, !8, i64 104, !8, i64 108, !8, i64 112, !8, i64 116, !8, i64 120, !8, i64 124}
!24 = !{!23, !3, i64 80}
!25 = !{i32 0, i32 1024}
!26 = !{i16 1, i16 1025}
!27 = !{i32 0, i32 1, i32 -1}
!28 = distinct !{!28, !18, !29}
!29 = !{!"llvm.loop.unroll.disable"}
!30 = distinct !{!30, !18, !29}
!31 = distinct !{!31, !18, !29}
!32 = distinct !{!32, !18, !29}
!33 = distinct !{!33, !18, !29}
!34 = distinct !{!34, !18, !29}
!35 = distinct !{!35, !18, !29}
!36 = distinct !{!36, !18, !29}
!37 = distinct !{!37, !18, !29}
!38 = distinct !{!38, !18, !29}
!39 = distinct !{!39, !18, !29}
!40 = distinct !{!40, !18, !29}
!41 = distinct !{!41, !18, !29}
!42 = distinct !{!42, !18, !29}
!43 = distinct !{!43, !18, !29}
!44 = distinct !{!44, !18, !29}
!45 = distinct !{!45, !18, !29}
!46 = distinct !{!46, !18, !29}
!47 = distinct !{!47, !18, !29}
!48 = distinct !{!48, !18, !29}
!49 = distinct !{!49, !18, !29}
