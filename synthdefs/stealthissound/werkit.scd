SynthDef(\werkit,{|out= 0 freq = 440 amp = 0.1 gate=1 cutoff= 100 rq=0.1 pan=0.0|
	var source, filter, env;
	source = WhiteNoise.ar;
	filter = BLowPass4.ar(source,freq,rq)*0.3;
	env = EnvGen.ar(Env([0,1,0.5,0.0],[0.02,0.1,0.1]),doneAction:2);
	Out.ar(out,Pan2.ar((0.7*filter+(0.3*filter.distort))*env*amp,pan));
})