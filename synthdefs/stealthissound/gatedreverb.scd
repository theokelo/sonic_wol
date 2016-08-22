SynthDef(\gatedreverb,{|out =0 gate= 1 threshold= 0.1 amp=0.1|
	var a,c,z,y,in;
	var env = Linen.kr(gate, 0.1, 1, 0.1, 2);
	c = 5; // number of comb delays
	a = 4; // number of allpass delays
	in=In.ar(out,2);
	gate = if((in.mean)>threshold,in.mean,DC.ar(0)!2);
	z = gate; //DelayN.ar(gate, 0.048,0.048);
	y=Mix.arFill(c,{CombL.ar(z,0.1,rrand(0.01, 0.1),rrand(1.5,4))});
	a.do({ y = AllpassN.ar(y, 0.051, [rrand(0.01, 0.05),rrand(0.01, 0.05)], 1) });
	Out.ar(out,Pan2.ar(y,0)*env*amp);
})