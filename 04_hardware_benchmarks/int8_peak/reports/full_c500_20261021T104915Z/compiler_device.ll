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
