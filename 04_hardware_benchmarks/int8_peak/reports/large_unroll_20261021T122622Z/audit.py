import pathlib,subprocess,json,re,hashlib,fcntl,time
root=pathlib.Path('/root/MOE/C500_int8_02All/04_hardware_benchmarks/int8_peak')
p=max((root/'reports').glob('large_unroll_*'))
lock=open(root.parent.parent/'int8_peak.lock','w');fcntl.flock(lock,fcntl.LOCK_EX|fcntl.LOCK_NB)
meta=json.loads((p/'builds.json').read_text());audits=[]
for build in meta['builds']:
 if build['returncode']!=0:continue
 u=build['unroll']
 args=['/opt/maca/mxgpu_llvm/bin/mxcc','-O3','-std=c++17','-x','maca','-offload-arch=xcore1000','-DMMA_PEAK_UNROLL='+str(u),'-I/opt/maca/include','-I/opt/maca/include/mcr','-maca-device-only','-S','-emit-llvm',str(root/'int8_mma_peak.cpp'),'-o',str(root/f'build/large_unroll_u{u}.ll')]
 with open(p/f'ir_u{u}.log','w') as log:r=subprocess.run(['timeout','--kill-after=10s','180s']+args,stdout=log,stderr=subprocess.STDOUT)
 assert r.returncode==0,(u,r.returncode)
 raw=(root/f'build/large_unroll_u{u}.ll').read_bytes()
 ir=raw.decode()
 match=re.search(r'define[^\n]*@_Z13mmaPeakKernelILi16EE[^\n]*\{\n(.*?)\n\}',ir,re.S)
 assert match
 body=match[0];(p/f'kernel16_u{u}.ll.txt').write_text(body)
 blocks=re.split(r'\n(?=[A-Za-z0-9_.]+:)',body)
 counts=[{'block':b.split(':')[0].split('\n')[0],'mma_calls':len(re.findall(r'call[^\n]*@llvm.mxc.mma.i32.16x16x16i8',b)),'loads':len(re.findall(r' = load ',b)),'stores':len(re.findall(r'\n\s*store ',b))} for b in blocks if 'call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8' in b]
 applied=max(b['mma_calls'] for b in counts)==16*u
 audit={'unroll':u,'applied_in_IR':applied,'kernel_IR_text_bytes':len(body.encode()),'whole_device_IR_sha256':hashlib.sha256(raw).hexdigest(),'mma_blocks':counts,'tail_checks':[]}
 if applied:
  for n in [17,257,4097]:
   with open(p/f'smoke_u{u}_i{n}.log','w') as log:r=subprocess.run([str(root/f'build/int8_mma_peak_large_u{u}'),'1','64','16',str(n)],stdout=log,stderr=subprocess.STDOUT,timeout=30)
   audit['tail_checks'].append({'iterations':n,'returncode':r.returncode})
   assert r.returncode==0,(u,n,r.returncode)
 audits.append(audit);(p/'compiler_audit.json').write_text(json.dumps(audits,indent=2))
 print('AUDIT',u,'APPLIED',applied,'MAX MMA',max(b['mma_calls'] for b in counts),flush=True)
print('LARGE AUDITS DONE',flush=True)
