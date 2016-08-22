SynthDef(\choruseffect2, {|out =0 gate= 1|
	var source = In.ar(out,2);
	var chorus;
	var env = Linen.kr(gate, 0.1, 1, 0.1, 2);
	chorus= Mix.fill(17, {
		var maxdelaytime= rrand(0.005,0.02);
		DelayC.ar(source, maxdelaytime,LFNoise1.kr(Rand(4.5,10.5),0.25*maxdelaytime,0.75*maxdelaytime) )
	});
	XOut.ar(out,env,0.5*chorus);
})