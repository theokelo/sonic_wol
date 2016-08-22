SynthDef(\organdonor,{|out= 0 freq = 440 amp = 0.1 gate=1 lforate = 10 lfowidth= 0.0 cutoff= 100 rq=0.5 pan=0.0|
	var vibrato, pulse, filter, env;
	vibrato = SinOsc.ar(lforate,Rand(0,2.0));
	pulse = Mix(VarSaw.ar(([1,1.9953843530485,3.0139733629359]*freq)*(1.0+(lfowidth*vibrato)),Rand(0.0,1.0)!3,Rand(0.3,0.5)!3,[1.0,0.7,0.3]))*0.5;
	filter = RLPF.ar(pulse,cutoff,rq);
	env = EnvGen.ar(Env.adsr(0.01,0.5,1.0,0.5),gate,doneAction:2);
	Out.ar(out,Pan2.ar(filter*env*amp,pan));
})