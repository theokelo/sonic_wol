SynthDef(\sampleplay,{|out= 0 bufnum = 0 amp = 0.1 gate=1 pan = 0.0|
	var playbuf, env;
	playbuf = PlayBuf.ar(1,bufnum);
	env = EnvGen.ar(Env.adsr(0.0,0.0,1.0,0.1),gate,doneAction:2);
	Out.ar(out,Pan2.ar(playbuf*env*amp,pan));
})