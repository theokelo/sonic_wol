SynthDef(\samplecompress,{|out =0 gain=2 reduction=8 ratio=3 gate= 1 attackTime=0.016 relaxTime=0.05|
	var source = In.ar(out,2);
	var compression;
	var env = Linen.kr(gate, 0.0, 1, 0.1, 2);
	compression= Compander.ar(2*source,source,(-8).dbamp,1.0,ratio.reciprocal,attackTime,relaxTime);
	XOut.ar(out,env, compression);
})