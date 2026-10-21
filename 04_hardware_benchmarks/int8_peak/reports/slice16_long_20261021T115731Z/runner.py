import pathlib,subprocess,json,datetime,threading,re,time,csv,statistics as st,hashlib
root=pathlib.Path('/root/MOE/C500_int8_02All/04_hardware_benchmarks/int8_peak')
p=max((root/'reports').glob('slice16_long_*'))
stop=threading.Event()
def monitor():
 with open(p/'telemetry.jsonl','x') as out:
  while not stop.is_set():
   try:
    r=subprocess.run(['mx-smi','--show-clock','--show-temperature','--show-board-power','--show-clk-tr'],text=True,stdout=subprocess.PIPE,stderr=subprocess.STDOUT,timeout=10)
    d={'utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'returncode':r.returncode,'raw':r.stdout}
    for k,pat in [('core_mhz',r'XCORE\s+:\s+([0-9.]+) MHz'),('board_power_w',r'Total\s+:\s+([0-9.]+) W')]:
     m=re.search(pat,r.stdout)
     if m:d[k]=float(m.group(1))
    temps=re.findall(r'hotspot\(sensor\d+\)\s+:\s+([0-9.]+) C',r.stdout)
    if temps:d['temperature_c']=max(map(float,temps))
    out.write(json.dumps(d)+'\n');out.flush()
   except Exception as e:out.write(json.dumps({'error':str(e)})+'\n');out.flush()
   stop.wait(1)
(p/'environment_before.txt').write_text(subprocess.check_output(['mx-smi'],text=True))
meta={'blocks':26624,'threads':512,'accumulators':8,'iterations':4096,'unroll':1,'samples':3,'batch':256,'user_confirmed_quiet':True,'physical_other_slice_activity_observed_before_build':True,'source_sha256':hashlib.sha256((p/'source_snapshot.cpp').read_bytes()).hexdigest(),'start_utc':datetime.datetime.now(datetime.timezone.utc).isoformat()}
(p/'protocol.json').write_text(json.dumps(meta,indent=2))
t=threading.Thread(target=monitor);t.start()
try:
 with open(p/'continuous_3x256.log','x') as log:
  r=subprocess.run([str(root/'build/int8_mma_peak_long_u1'),'--sustain','26624','512','8','4096','3','256',str(p/'continuous_3x256.csv')],stdout=log,stderr=subprocess.STDOUT,timeout=900)
 assert r.returncode==0,r.returncode
finally:
 stop.set();t.join()
meta['end_utc']=datetime.datetime.now(datetime.timezone.utc).isoformat()
(p/'protocol.json').write_text(json.dumps(meta,indent=2))
(p/'environment_after.txt').write_text(subprocess.check_output(['mx-smi'],text=True))
rows=list(csv.DictReader((p/'continuous_3x256.csv').open()))
assert len(rows)==3 and all(r['correct']=='1' for r in rows)
e=st.mean(float(r['event_ms']) for r in rows);w=st.mean(float(r['wall_ms']) for r in rows)
ops=26624*8*8*4096*8192*256
assert all(int(r['batch_ops'])==ops for r in rows)
s={'protocol':meta,'mean_event_ms':e,'mean_wall_ms':w,'event_tops':ops/(e*1e9),'wall_tops':ops/(w*1e9),'event_range_over_median':(max(float(r['event_ms']) for r in rows)-min(float(r['event_ms']) for r in rows))/st.median(float(r['event_ms']) for r in rows)}
(p/'summary.json').write_text(json.dumps(s,indent=2))
print('SLICE LONG DONE',json.dumps(s),flush=True)
