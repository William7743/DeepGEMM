import pathlib,csv,json,re,statistics as st,hashlib
p=max(pathlib.Path('/root/MOE/C500_int8_02All/04_hardware_benchmarks/int8_peak/reports').glob('acc_increment_*'))
meta=json.loads((p/'protocol.json').read_text())
rows=[]
for f in sorted(p.glob('r*_a*.csv')):
 for r in csv.DictReader(f.open()):
  assert int(r['correct'])==1
  a=int(r['accumulators'])
  assert int(r['ops_per_kernel'])==6656*8*a*4096*8192
  assert int(r['batch_ops'])==int(r['ops_per_kernel'])*2
  r['round']=int(f.name.split('_')[0][1:]); rows.append(r)
summary={'protocol':meta,'sample_count':len(rows),'results':[]}
for a in range(16,33):
 sel=[r for r in rows if int(r['accumulators'])==a]
 if not sel: continue
 times=[float(r['event_ms'])/2 for r in sel]
 walls=[float(r['wall_ms'])/2 for r in sel]
 mean=st.mean(times); ops=6656*8*a*4096*8192
 log=(p/f'r1_a{a}.log').read_text()
 match=re.search(r'Kernel resources: accumulators=(\d+), registers=(\d+), local_bytes=(\d+), max_threads=(\d+)',log)
 assert match
 rd=[st.mean(float(r['event_ms'])/2 for r in sel if r['round']==n) for n in range(1,4)]
 result={'accumulators':a,'samples':len(sel),'registers':int(match[2]),'local_bytes':int(match[3]),'max_threads':int(match[4]),'event_ms_per_kernel':mean,'event_tops':ops/(mean*1e9),'wall_tops':ops/(st.mean(walls)*1e9),'sample_range_over_median':(max(times)-min(times))/st.median(times),'round_range_over_median':(max(rd)-min(rd))/st.median(rd),'round_tops':[ops/(t*1e9) for t in rd]}
 summary['results'].append(result)
summary['best']=max(summary['results'],key=lambda r:r['event_tops'])
assert len(rows)==153 and len(summary['results'])==17 and not meta['failures']
(p/'summary.json').write_text(json.dumps(summary,indent=2))
with open(p/'summary.csv','w',newline='') as out:
 keys=[k for k in summary['results'][0] if k!='round_tops']
 w=csv.DictWriter(out,fieldnames=keys);w.writeheader()
 for r in summary['results']: w.writerow({k:r[k] for k in keys})
print(json.dumps(summary))
