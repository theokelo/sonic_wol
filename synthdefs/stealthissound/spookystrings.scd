SynthDef(\spookystrings,{|out= 0 freq = 440 amp = 0.1 gate=1 cutoff=8000 rq=0.2 lfowidth=0.01 lforate=3.8 pan=0.0|
	var pulse, filter, env, lfo;
	lfo = LFTri.kr(lforate,Rand(0,2.0)!2);
	pulse = Mix(Saw.ar(freq*[1,1.001]*[1.0,1.0+(lfowidth*lfo)]))*0.5;
	filter = BHiPass.ar(pulse,cutoff,rq);
	env = EnvGen.ar(Env.adsr(0.1,0.0,1.0,3),gate,doneAction:2);
	Out.ar(out,Pan2.ar(filter*env*amp,pan));
})