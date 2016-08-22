SynthDef(\basshighend,{|out= 0 freq = 440 amp = 0.1 gate=1 cutoff= 3000 rq=0.1 drive = 2.0 pan=0.0|
	var osc, filter, env, filterenv;
	var ab;
	osc = Mix(Saw.ar(freq*[0.25,1,1.5],[0.5,0.4,0.1]));
	filterenv = EnvGen.ar(Env.adsr(0.0,0.5,0.2,0.2),gate,doneAction:2);
	filter =  RLPF.ar(osc,cutoff*filterenv+100,rq);
	ab = abs(filter);
 	filter = (filter*(ab + drive)/(filter ** 2 + (drive - 1) * ab + 1));
	filter = BLowShelf.ar(filter,300,1.0,-12);
	filter = BPeakEQ.ar(filter,1600,1.0,-6);
	env = EnvGen.ar(Env.adsr(0.01,0.0,0.9,0.05),gate,doneAction:2);
	Out.ar(out,Pan2.ar(filter*env*amp*2,pan));
})