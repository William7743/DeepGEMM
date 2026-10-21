import pathlib,subprocess,json,re,hashlib,fcntl
root=pathlib.Path('/root/MOE/C500_int8_02All/04_hardware_benchmarks/int8_peak')
p=max((root/'reports').glob('small_unroll_*'))
lock=open(root.parent.parent/'int8_peak.lock','w');fcntl.flock(lock,fcntl.LOCK_EX|fcntl.LOCK_NB)
audits=[]
for u in [1,2,4,8,16]:
 args=['/opt/maca/mxgpu_llvm/bin/mxcc','-O3','-std=c++17','-x','maca','-offload-arch=xcore1000','-DMMA_PEAK_UNROLL='+str(u),'-I/opt/maca/include','-I/opt/maca/include/mcr','-maca-device-only','-S','-emit-llvm',str(root/'int8_mma_peak.cpp'),'-o',str(root/f'build/unroll_u{u}.ll')]
 with open(p/f'ir_u{u}.log','w') as log:r=subprocess.run(args,stdout=log,stderr=subprocess.STDOUT)
 assert r.returncode==0
 ir=(root/f'build/unroll_u{u}.ll').read_text()
 m=re.search(r'define[^\n]*@_Z13mmaPeakKernelILi16EE[^\n]*\{\n(.*?)\n\}',ir,re.S)
 assert m
 body=m[0]
 (p/f'kernel16_u{u}.ll.txt').write_text(body)
 blocks=re.split(r'\n(?=[A-Za-z0-9_.]+:)',body)
 counts=[{'block':b.split(':')[0].split('\n')[0],'mma_calls':len(re.findall(r'call[^\n]*@llvm.mxc.mma.i32.16x16x16i8',b)),'loads':len(re.findall(r' = load ',b)),'stores':len(re.findall(r'\n\s*store ',b))} for b in blocks if 'call <4 x i32> @llvm.mxc.mma.i32.16x16x16i8' in b]
 assert max(b['mma_calls'] for b in counts)==16*u,counts
 audits.append({'unroll':u,'ir_sha256':hashlib.sha256(ir.encode()).hexdigest(),'mma_blocks':counts,'scope':'Optimized LLVM IR, native ISA not disassembled'})
 for n in [1,17,4097]:
  with open(p/f'smoke_u{u}_i{n}.log','w') as log:
   r=subprocess.run([str(root/f'build/int8_mma_peak_u{u}'),'1','64','16',str(n)],stdout=log,stderr=subprocess.STDOUT)
  assert r.returncode==0
 print('AUDIT+TAIL PASS',u,flush=True)
(p/'compiler_audit.json').write_text(json.dumps(audits,indent=2))
print('ALL UNROLL AUDITS PASSED',flush=True)
