SynthDef(\eightoeightkick,{|out= 0 freq = 440 amp = 0.1 ringTime=10.0 releaseTime=1.0 distortion = 0.1 pan=(-0.1)|
	var impulse, filter, env;
  	impulse = Impulse.ar(0);
	filter = Ringz.ar(impulse,XLine.ar(freq,60,0.1),ringTime);
	env = EnvGen.ar(Env.perc(0.001,releaseTime),doneAction:2);
	filter = (1.0-distortion)*filter + (distortion*(filter.distort));
	Out.ar(out,Pan2.ar(filter*env*amp,pan));
})