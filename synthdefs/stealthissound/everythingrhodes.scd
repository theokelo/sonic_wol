SynthDef(\everythingrhodes,{|out= 0 freq = 440 amp = 0.1 gate=1 lforate = 4.85 lfowidth= 0.5 cutoff= 2000 rq=0.5 pan = 0.0|
	var pulse, filter, env;
	pulse = Pulse.ar(freq*[1,33.5.midiratio],[0.2,0.1],[0.7,0.3]);
	env = EnvGen.ar(Env.adsr(0.0,1.0,0.8,3.0),gate,doneAction:2);
	filter = BLowPass4.ar(pulse,(cutoff*(env.squared))+200+freq,rq);
	Out.ar(out,Pan2.ar(Mix(filter)*env*amp,pan));
})