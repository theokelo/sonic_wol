SynthDef(\handclapsmash,{|out= 0 amp = 0.1 gate=1 cutoff= 12000 rq=0.5 releaseTime=0.5 pan=0.0|
	var noise, filter, filterenv, env;
	noise = WhiteNoise.ar;
	filterenv = EnvGen.ar(Env([0.0,1.0,0.3,0.0],[0.0,0.3,0.3]));
	filter = BHiPass.ar(RLPF.ar(noise,cutoff*filterenv,rq),150);
	filter = BPeakEQ.ar(filter,440,1.0,8);
	filter = BPeakEQ.ar(filter,1200,1.0,14);
	env = EnvGen.ar(Env.perc(0.005,releaseTime),doneAction:2);
	Out.ar(out,Pan2.ar(filter*env*amp,pan));
})