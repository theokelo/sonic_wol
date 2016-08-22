SynthDef(\handclapsmash2,{|out= 0 amp = 0.1 gate=1 cutoff= 12000 cutoff2=10000 rq=0.5 modamount=0.0 modrate=50 releaseTime=0.7 pan=0.0|
	var noise, filter, filterenv, modulation, env;
	noise = WhiteNoise.ar;
	filterenv = EnvGen.ar(Env([0.0,1.0,0.3,0.0],[0.0,0.3,0.3]));
	modulation = (LFSaw.ar(modrate).range(0.0,1.0))*EnvGen.ar(Env([1,1,0,0],[0.1,0.0,1.0]));
	filter = BHiPass.ar(RLPF.ar(noise,cutoff*filterenv+ (cutoff2*modamount*modulation),rq),150);
	filter = BPeakEQ.ar(filter,440,1.0,8);
	filter = BPeakEQ.ar(filter,1200,1.0,14);
	env = EnvGen.ar(Env.perc(0.005,releaseTime),doneAction:2);
	Out.ar(out,Pan2.ar(filter*env*amp,pan));
})