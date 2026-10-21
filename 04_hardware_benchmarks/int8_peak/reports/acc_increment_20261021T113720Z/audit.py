import pathlib,subprocess,json,re,hashlib
root=pathlib.Path('/root/MOE/C500_int8_02All/04_hardware_benchmarks/int8_peak')
p=max((root/'reports').glob('acc_increment_*'))
compiler='/opt/maca/mxgpu_llvm/bin/mxcc'
flags=[compiler,'-O3','-std=c++17','-x','maca','-offload-arch=xcore1000','-I/opt/maca/include','-I/opt/maca/include/mcr']
probe=(p/'occupancy_probe_source.txt').read_text()
command=flags+[str(p/'occupancy_probe_source.txt'),'-L/opt/maca/lib','-lmcruntime','-Wl,-rpath,/opt/maca/lib:/opt/mxdriver/lib','-o',str(root/'build/acc_occupancy_probe')]
with open(p/'occupancy_build.log','w') as log:
 r=subprocess.run(command,input=probe,text=True,stdout=log,stderr=subprocess.STDOUT)
assert r.returncode==0
with open(p/'occupancy.csv','w') as out:
 r=subprocess.run([str(root/'build/acc_occupancy_probe')],stdout=out,stderr=subprocess.STDOUT)
assert r.returncode==0
command=flags+['-maca-device-only','-S','-emit-llvm',str(root/'int8_mma_peak.cpp'),'-o',str(p/'compiler_device.ll')]
with open(p/'ir_build.log','w') as log: r=subprocess.run(command,stdout=log,stderr=subprocess.STDOUT)
assert r.returncode==0
ir=(p/'compiler_device.ll').read_text()
checks=[]
for n in range(16,33):
 match=re.search(r'define[^\n]*@_Z13mmaPeakKernelILi'+str(n)+r'EE[^\n]*\{\n(.*?)\n\}',ir,re.S)
 assert match
 body=match[1]
 count=len(re.findall(r'call[^\n]*@llvm.mxc.mma.i32.16x16x16i8',body))
 assert count==n
 checks.append({'accumulators':n,'mma_calls_in_kernel_body':count})
(p/'compiler_audit.json').write_text(json.dumps({'checks':checks,'scope':'Optimized device LLVM IR, not native ISA. Occupancy API is theoretical maximum, not measured achieved occupancy.'},indent=2))
print((p/'occupancy.csv').read_text())
print('IR AUDIT PASSED',len(checks))
