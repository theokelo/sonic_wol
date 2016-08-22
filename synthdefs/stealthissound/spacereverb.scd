SynthDef(\spacereverb,{|out =0 gate= 1 threshold= 0.1 amp=0.1|
	var a,c,z,y,in;
	var env = Linen.kr(gate, 0.1, 1, 0.1, 2);
	c = 6; // number of comb delays
	a = 4; // number of allpass delays
	in=In.ar(out,2);
	z = DelayN.ar(in, 0.048,0.048);
	y=Mix.arFill(c,{CombL.ar(z,0.1,rrand(0.01, 0.1),5)});
	a.do({ y = AllpassN.ar(y, 0.051, [rrand(0.01, 0.05),rrand(0.01, 0.05)], 1) });
	Out.ar(out,Pan2.ar(y,0)*env*amp);
})