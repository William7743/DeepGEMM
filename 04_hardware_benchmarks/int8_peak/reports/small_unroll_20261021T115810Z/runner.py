import pathlib,subprocess,json,time,random,hashlib,fcntl,threading,datetime,re
root=pathlib.Path('/root/MOE/C500_int8_02All/04_hardware_benchmarks/int8_peak')
p=max((root/'reports').glob('small_unroll_*'))
lock=open(root.parent.parent/'int8_peak.lock','w');fcntl.flock(lock,fcntl.LOCK_EX|fcntl.LOCK_NB)
meta={'blocks':6656,'threads':512,'accumulators':16,'iterations':4096,'batch':4,'samples':5,'rounds':3,'unroll_factors':[1,2,4,8,16],'order':[],'source_sha256':hashlib.sha256((root/'int8_mma_peak.cpp').read_bytes()).hexdigest()}
stop=threading.Event()
def monitor():
 with open(p/'telemetry.jsonl','x') as out:
  while not stop.is_set():
   r=subprocess.run(['mx-smi','--show-clock','--show-temperature','--show-board-power','--show-clk-tr'],text=True,stdout=subprocess.PIPE,stderr=subprocess.STDOUT)
   d={'utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'returncode':r.returncode,'raw':r.stdout}
   for k,pat in [('core_mhz',r'XCORE\s+:\s+([0-9.]+) MHz'),('board_power_w',r'Total\s+:\s+([0-9.]+) W')]:
    m=re.search(pat,r.stdout)
    if m:d[k]=float(m.group(1))
   temps=re.findall(r'hotspot\(sensor\d+\)\s+:\s+([0-9.]+) C',r.stdout)
   if temps:d['temperature_c']=max(map(float,temps))
   out.write(json.dumps(d)+'\n');out.flush()
   stop.wait(1)
t=threading.Thread(target=monitor);t.start()
try:
 for rnd in range(1,4):
  order=meta['unroll_factors'].copy()
  random.Random(20261021+rnd).shuffle(order)
  for u in order:
   name=f'r{rnd}_u{u}'
   with open(p/(name+'.log'),'x') as log:
    r=subprocess.run([str(root/f'build/int8_mma_peak_u{u}'),'--sustain','6656','512','16','4096','5','4',str(p/(name+'.csv'))],stdout=log,stderr=subprocess.STDOUT)
   assert r.returncode==0,(rnd,u,r.returncode)
   meta['order'].append(name)
   (p/'protocol.json').write_text(json.dumps(meta,indent=2))
   print('MEASURED',rnd,u,flush=True)
finally:
 stop.set();t.join()
print('UNROLL TIMING DONE',p,flush=True)
