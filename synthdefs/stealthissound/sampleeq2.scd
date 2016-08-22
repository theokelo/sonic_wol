SynthDef(\sampleeq2,{|out =0 gate= 1|
	var source = In.ar(out,2);
	var env = Linen.kr(gate, 0.0, 1, 0.1, 2);
	var eq;
	eq= BHiPass(150,0.3);
	XOut.ar(out,env,eq);
})