import pathlib,subprocess,json,time,random,hashlib,fcntl,threading
root=pathlib.Path('/root/MOE/C500_int8_02All/04_hardware_benchmarks/int8_peak')
p=max((root/'reports').glob('acc_increment_*'))
lock=open(root.parent.parent/'int8_peak.lock','w')
fcntl.flock(lock,fcntl.LOCK_EX|fcntl.LOCK_NB)
exe=root/'build/int8_mma_peak'
meta={'blocks':6656,'threads':512,'iterations':4096,'samples':3,'batch':2,'accumulators':list(range(16,33)),'rounds':3,'order':[],'failures':[]}
meta['source_sha256']=hashlib.sha256((root/'int8_mma_peak.cpp').read_bytes()).hexdigest()
stop=threading.Event()
def monitor():
 with open(p/'telemetry.jsonl','w') as out:
  while not stop.is_set():
   r=subprocess.run(['mx-smi'],stdout=subprocess.PIPE,stderr=subprocess.STDOUT,text=True)
   out.write(json.dumps({'utc':time.strftime('%Y-%m-%dT%H:%M:%SZ',time.gmtime()),'returncode':r.returncode,'output':r.stdout})+'\n')
   out.flush()
   stop.wait(1)
t=threading.Thread(target=monitor)
t.start()
try:
 for rnd in range(1,4):
  order=list(range(16,33))
  if rnd==2: order.reverse()
  if rnd==3: random.Random(20261021).shuffle(order)
  for acc in order:
   name=f'r{rnd}_a{acc}'
   with open(p/(name+'.log'),'w') as log:
    r=subprocess.run([str(exe),'--sustain','6656','512',str(acc),'4096','3','2',str(p/(name+'.csv'))],stdout=log,stderr=subprocess.STDOUT)
   meta['order'].append(name)
   if r.returncode: meta['failures'].append({'case':name,'returncode':r.returncode})
   (p/'protocol.json').write_text(json.dumps(meta,indent=2))
   print(name,r.returncode,flush=True)
finally:
 stop.set()
 t.join()
print('DONE',p,flush=True)
