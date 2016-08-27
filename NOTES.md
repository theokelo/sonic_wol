# SCD integration
# 2016-08-27

- https://github.com/samaaron/sonic-pi/blob/master/SYNTH_DESIGN.md

```
(
SynthDef("piTest",
         {|freq = 200, amp = 1, out_bus = 0 |
           Out.ar(out_bus,
                  SinOsc.ar([freq,freq],0,0.5)* Line.kr(1, 0, 5, amp, doneAction: 2))}
).writeDefFile("/home/justin/work/") ;
)
```