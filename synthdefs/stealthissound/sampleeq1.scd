SynthDef(\sampleeq1,{|out =0 gate= 1|
	var source = In.ar(out,2);
	var env = Linen.kr(gate, 0.0, 1, 0.1, 2);
	var eq;
	eq= BLowShelf.ar(source,100,1.0,3);
	eq= BPeakEQ.ar(eq,600,1.0,-3);
	XOut.ar(out,env,eq);
})