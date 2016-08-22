SynthDef(\samplereverb,{|out =0 gate= 1|
	var source = In.ar(out,2);
	var env = Linen.kr(gate, 0.0, 0.3, 0.1, 2);
	var reverb;
	reverb= FreeVerb.ar(source,1.0,0.6,0.6);
	XOut.ar(out,env,reverb);
})