import pathlib,csv,json,statistics as st,hashlib
p=max(pathlib.Path('/root/MOE/C500_int8_02All/04_hardware_benchmarks/int8_peak/reports').glob('slope_*'))
meta=json.loads((p/'protocol.json').read_text())
rows=[]
for f in sorted(p.glob('r*_i*.csv')):
 for r in csv.DictReader(f.open()):
  assert int(r['correct'])==1
  r['round']=int(f.name.split('_')[0][1:])
  rows.append(r)
def fit(points):
 xs=[x for x,y in points]; ys=[y for x,y in points]
 xm=st.mean(xs); ym=st.mean(ys)
 slope=sum((x-xm)*(y-ym) for x,y in points)/sum((x-xm)**2 for x in xs)
 intercept=ym-slope*xm
 residual=[y-intercept-slope*x for x,y in points]
 return dict(intercept_ms=intercept,slope_ms_per_iteration=slope,r_squared=1-sum(z*z for z in residual)/sum((y-ym)**2 for y in ys),max_abs_residual_ms=max(map(abs,residual)),slope_tops=(26624*8*8*8192)/(slope*1e9))
summary={'protocol':meta,'sample_count':len(rows),'timing_scope':'Per-kernel durations = raw two-kernel batch durations / 2. Loops and scheduling remain in slope.','means':[],'fits':{}}
for n in meta['iterations']:
 selected=[r for r in rows if int(r['iterations'])==n]
 e=st.mean(float(r['event_ms'])/2 for r in selected); w=st.mean(float(r['wall_ms'])/2 for r in selected)
 summary['means'].append(dict(iterations=n,event_ms=e,wall_ms=w,event_tops=26624*8*8*8192*n/(e*1e9),wall_tops=26624*8*8*8192*n/(w*1e9)))
for field in ['event','wall']:
 summary['fits'][field]=fit([(r['iterations'],r[field+'_ms']) for r in summary['means']])
 summary['fits'][field]['per_round']=[fit([(n,st.mean(float(r[field+'_ms'])/2 for r in rows if r['round']==rnd and int(r['iterations'])==n)) for n in meta['iterations']]) for rnd in range(1,4)]
 means=summary['means']
 summary['fits'][field]['adjacent_tops']=[26624*8*8*8192*(b['iterations']-a['iterations'])/((b[field+'_ms']-a[field+'_ms'])*1e9) for a,b in zip(means,means[1:])]
a=next(r for r in summary['means'] if r['iterations']==4000);b=next(r for r in summary['means'] if r['iterations']==8000)
summary['pair_4000_8000_tops']=26624*8*8*8192*4000/((b['event_ms']-a['event_ms'])*1e9)
(p/'summary.json').write_text(json.dumps(summary,indent=2))
print(json.dumps(summary))
