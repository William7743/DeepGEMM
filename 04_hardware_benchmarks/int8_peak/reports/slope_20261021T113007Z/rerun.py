import os, pathlib, subprocess, random, json, time, hashlib, fcntl
root=pathlib.Path('/root/MOE/C500_int8_02All/04_hardware_benchmarks/int8_peak')
out=root/'reports'/time.strftime('slope_%Y%m%dT%H%M%SZ',time.gmtime())
out.mkdir()
lock=open(root.parent.parent/'int8_peak.lock','w')
fcntl.flock(lock,fcntl.LOCK_EX|fcntl.LOCK_NB)
binary=root/'build/int8_mma_peak'
(out/'environment.txt').write_text(subprocess.check_output(['mx-smi'],text=True))
meta={'blocks':26624,'threads':512,'accumulators':8,'batch':2,'samples':5,'iterations':[1000,2000,4000,6000,8000],'rounds':3,'source_sha256':hashlib.sha256((root/'int8_mma_peak.cpp').read_bytes()).hexdigest(),'order':[]}
(out/'protocol.json').write_text(json.dumps(meta,indent=2))
for r in range(1,4):
 order=meta['iterations'].copy()
 random.Random(20261021+r).shuffle(order)
 for n in order:
  name=f'r{r}_i{n}'
  meta['order'].append(name)
  with open(out/(name+'.log'),'w') as log:
   result=subprocess.run([str(binary),'--sustain','26624','512','8',str(n),'5','2',str(out/(name+'.csv'))],stdout=log,stderr=subprocess.STDOUT)
  print(name,result.returncode,flush=True)
  if result.returncode: raise RuntimeError(name)
(out/'protocol.json').write_text(json.dumps(meta,indent=2))
(out/'environment_after.txt').write_text(subprocess.check_output(['mx-smi'],text=True))
print('REPORT',out,flush=True)
