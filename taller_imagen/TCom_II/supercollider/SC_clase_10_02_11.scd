SynthDef(\seno_perc_st, {
	|out=0,amp=0.5,freq=440, pan = 0,release=0.5,detune=1.01|
	var snd;
	snd = SinOsc.ar([freq,freq*detune])*Env.perc(releaseTime:release).ar(2)*amp;
	Out.ar(out,Pan2.ar(snd.sum,pan))
}).add

Synth(\seno_perc_st,[\freq,1000.rand,\pan,0])


~do = Pbind(\instrument,\seno_perc_st,
//	\midinote,[60,67,71,74],
	\midinote,Pseq([ [60,67] , 74 , [71,67],78],inf),
//	\midinote,63,
	\dur,1/4,
	\detune,2,
	\mod_index,20,
	\release,0.5,
	\amp,0.1,
	\stretch,1.5,
	\pan,Prand([-1,0,1],inf)
)

~sol = Pbind(\instrument,\seno_perc_st,
	\midinote,12.rand +60,
	\dur,1/4,
	\detune,1.66666,
	\mod_index,20,
	\release,0.1,
	\amp,0.2,
	\pan,Prand([-1,0,1],inf)
)


// PROXY SPACE

// LIVE CODING
// JIT Just In Time Programming
p = ProxySpace.push

~do.play(quant:1);~sol.play(quant:1)
~do.release(5);~sol.release(7)

~sol.stop

~sol.fadeTime = 3

p.makeTempoClock(2.0);

p.clock.tempo = 960/60 // BPM/60
~do.play

p.fadeTime = 1


~sol = {SinOsc.ar(500*LFNoise0.ar([10,15],4),0,0.25)}

~sol = Pbind(\instrument,\fm_simple,
	\midinote,12.rand +60,
	\dur,1/4,
	\detune,1.66666,
	\mod_index,2,
	\release,0.1,
	\amp,0.2,
	\pan,Prand([-1,0,1],inf)
)

// live coding
https://toplap.org/
