SynthDef(\spookyeffect, {|out =0 gate= 1 delaytime=0.25 phaserate=0.1|
	var source = In.ar(out,2);
	var delay,phaser;
	var env = Linen.kr(gate, 0.0, 1, 0.1, 2);
	delay= DelayN.ar(source,0.8,delaytime);
	phaser = delay;
	Out.ar(out,phaser);
})