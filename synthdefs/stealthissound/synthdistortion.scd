SynthDef(\synthdistortion, {|out =0 gate= 1|
	var source = In.ar(out,2);
	var env = Linen.kr(gate, 0.0, 1, 0.1, 2);
	var abs, excess,output;
	abs = source.abs;
	excess = (abs-0.1).max(0.0).min(0.9)/0.9;
	output = source+(excess*(sin(excess*2pi*5)*0.5-0.5));
	XOut.ar(out,env,output*env);
})