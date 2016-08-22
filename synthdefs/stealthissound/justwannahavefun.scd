SynthDef(\justwannahavefun,{|out= 0 freq = 440 amp = 0.1 ringTime=10.0 pan=(-0.1)|
	var impulse, filter, env;
  	impulse = Impulse.ar(0);
	filter = Ringz.ar(impulse,(freq.cpsmidi + (Rand(0.2,1.2)*SinOsc.kr(Rand(10,50)))).midicps,ringTime);
	env = EnvGen.ar(Env([0.0,1.0,1.0,0.0],[0.001,0.04,0.04]),doneAction:2);
	Out.ar(out,Pan2.ar((filter.softclip(0.9))*env*amp,pan));
})