SynthDef(\delayeffect, {|out =0 gate= 1|
	var source = In.ar(out,2);
	var delay;
	var env = Linen.kr(gate, 0.1, 1, 0.1, 2);
	delay= CombC.ar(source,0.25,0.25,2.0);
	XOut.ar(out,env, delay);
})