import pathlib,json,csv,re,statistics as st
root=pathlib.Path('/root/MOE/C500_int8_02All/04_hardware_benchmarks/int8_peak')
p=max((root/'reports').glob('large_unroll_*'))
meta=json.loads((p/'protocol.json').read_text())
rows=[]
for f in sorted(p.glob('r*_u*.csv')):
 for r in csv.DictReader(f.open()):
  r['round']=int(f.name.split('_')[0][1:]);r['unroll']=int(f.name.split('_')[1].split('.')[0][1:])
  assert r['correct']=='1'
  assert int(r['ops_per_kernel'])==6656*8*16*4096*8192
  assert int(r['batch_ops'])==int(r['ops_per_kernel'])*4
  rows.append(r)
assert len(rows)==90
summary={'protocol':meta,'samples':len(rows),'results':[]}
for u in [1,16,32,64,128,256]:
 sel=[r for r in rows if r['unroll']==u]
 e=[float(r['event_ms'])/4 for r in sel];w=[float(r['wall_ms'])/4 for r in sel]
 ops=int(sel[0]['ops_per_kernel'])
 log=(p/f'r1_u{u}.log').read_text()
 m=re.search(r'Kernel resources: accumulators=(\d+), registers=(\d+), local_bytes=(\d+), max_threads=(\d+)',log)
 assert m
 rounds=[ops/(st.mean(float(r['event_ms'])/4 for r in sel if r['round']==rnd)*1e9) for rnd in range(1,4)]
 summary['results'].append({'unroll':u,'event_ms_per_kernel':st.mean(e),'event_tops':ops/(st.mean(e)*1e9),'wall_tops':ops/(st.mean(w)*1e9),'registers':int(m[2]),'local_bytes':int(m[3]),'round_tops':rounds,'sample_range_over_median':(max(e)-min(e))/st.median(e)})
base=summary['results'][0]['event_tops']
base16=next(r['event_tops'] for r in summary['results'] if r['unroll']==16)
builds=json.loads((p/'builds.json').read_text())['builds']
for r in summary['results']:
 r['gain_vs_u16_pct']=100*(r['event_tops']/base16-1)
 r['binary_bytes']=next(b['binary_bytes'] for b in builds if b['unroll']==r['unroll'])
 r['outer_groups_for_4096']=4096//r['unroll']
for r in summary['results']:r['gain_vs_u1_pct']=100*(r['event_tops']/base-1)
summary['best']=max(summary['results'],key=lambda x:x['event_tops'])
(p/'summary.json').write_text(json.dumps(summary,indent=2))
with open(p/'summary.csv','w',newline='') as out:
 keys=[k for k in summary['results'][0] if k!='round_tops']
 w=csv.DictWriter(out,fieldnames=keys);w.writeheader()
 for r in summary['results']:w.writerow({k:r[k] for k in keys})
print(json.dumps(summary))
