import pathlib,subprocess,os,json,hashlib,fcntl,threading,datetime,time,re
root=pathlib.Path('/root/MOE/C500_int8_02All/04_hardware_benchmarks/int8_peak')
p=root/'reports'/time.strftime('mxvs_int8_%Y%m%dT%H%M%SZ',time.gmtime());p.mkdir()
lock=open(root.parent.parent/'int8_peak.lock','w');fcntl.flock(lock,fcntl.LOCK_EX|fcntl.LOCK_NB)
exe=pathlib.Path('/opt/maca/bin/mxvs')
cmd=[str(exe),'ops','--devices','0','--models','int8','--detail']
meta={'command':cmd,'env_override':{'APPIMAGE_EXTRACT_AND_RUN':'1'},'executable_sha256':hashlib.sha256(exe.read_bytes()).hexdigest(),'start_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'hostname':os.uname().nodename}
(p/'command.json').write_text(json.dumps(meta,indent=2))
(p/'environment_before.txt').write_text(subprocess.check_output(['mx-smi'],text=True))
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
   out.write(json.dumps(d)+'\n');out.flush();stop.wait(1)
t=threading.Thread(target=monitor);t.start()
start=time.monotonic()
try:
 env=os.environ.copy();env['APPIMAGE_EXTRACT_AND_RUN']='1'
 with open(p/'mxvs_ops_int8.log','x') as log:
  r=subprocess.run(cmd,env=env,cwd=root,stdout=log,stderr=subprocess.STDOUT,timeout=600)
 meta['returncode']=r.returncode
finally:
 stop.set();t.join()
meta['end_utc']=datetime.datetime.now(datetime.timezone.utc).isoformat()
meta['wrapper_wall_seconds_including_startup']=time.monotonic()-start
(p/'command.json').write_text(json.dumps(meta,indent=2))
(p/'environment_after.txt').write_text(subprocess.check_output(['mx-smi'],text=True))
print('REPORT',p,flush=True)
print('META',json.dumps(meta),flush=True)
print((p/'mxvs_ops_int8.log').read_text(),flush=True)
