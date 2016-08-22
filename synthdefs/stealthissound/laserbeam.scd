SynthDef(\laserbeam,{|out= 0 freq = 440 amp = 0.1 attackTime= 0.04 gate=1 pan=0.0|
	var osc1, freqenv, ampenv;
	freqenv = EnvGen.ar(Env([4,0.5,1,1],[attackTime,0.01,1.0]));
	osc1 = LFTri.ar(freq*freqenv);
	ampenv = EnvGen.ar(Env([0,1,0.5,0.0],[0.02,0.2,0.1]),doneAction:2);
	Out.ar(out,Pan2.ar(osc1*ampenv*amp,pan));
})