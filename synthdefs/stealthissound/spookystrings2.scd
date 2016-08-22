SynthDef(\spookystrings2,{|out= 0 freq = 440 amp = 0.1 gate=1 cutoff=8000 rq=0.2 pan=0.0|
	var saw, pulse, filter, env, lfo, pulsewidthlfo;
	lfo = LFTri.kr([3.5,5],Rand(0,2.0)!2);
	pulsewidthlfo = SinOsc.kr(4.5);
	saw = Saw.ar(freq*(1.0+(0.052*lfo[0])));
	pulse = Pulse.ar(freq*(1.0+(0.072*lfo[1])),pulsewidthlfo*0.25+0.5);
	pulse = 0.5*(saw+pulse);
	filter = BLowPass.ar(pulse,XLine.kr(678,cutoff,0.378),rq);
	env = EnvGen.ar(Env.adsr(0.1,0.0,1.0,3),gate,doneAction:2);
	Out.ar(out,Pan2.ar(filter*env*amp,pan));
})