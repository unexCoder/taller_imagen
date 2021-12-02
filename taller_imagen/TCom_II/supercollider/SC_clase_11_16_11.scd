
// docs
ProxySpace examples
jitlib_basic_concepts_01


p = ProxySpace.push
// play some output to the hardware busses, this could be any audio rate key.
~out.play;

~out = { SinOsc.ar([400, 408] * 0.8, 0, 0.2) };


// replacing the node. the crossfade envelope is created internally.
~out = { SinOsc.ar([443, 600 - Rand(0,200)], 0, 0.2) };
~out = { Resonz.ar(Saw.ar(140 + [0,0.2], 1), [1200, 1600], 0.1) + SinOsc.ar(60 * [1,1.1],0,0.2) };
~out = { Pan2.ar(PinkNoise.ar(0.1), LFClipNoise.kr(200)) };
~out.clear;


~out = { |rate = 2, freq = 100| Pan2.ar(SinOsc.ar(freq*SinOsc.ar(150,0,100),0,0.1), LFClipNoise.kr(rate)) };


~out.set(\rate, 300.rand);
~out.set(\freq, 3000.rand);

~out.gui


~out = { arg rate = 2; Pan2.ar(Dust.ar(2000, 0.2), LFClipNoise.kr(rate)) };
~out.set(\rate, 2);


~out.play
// referenciar proxys entre si
~out = { SinOsc.ar(~lfo.kr, 0, 0.5) };
p.gui

~lfo = { LFNoise2.kr(30, 300, 500) };
~out = { SinOsc.ar(~lfo.kr * [1, 1.2], 0, 0.1) * Pulse.ar(~lfo.kr * [0.1, 0.125], 0.5) };

~lfo = { LFNoise1.kr(30, 40) + SinOsc.kr(0.1, 0, 200, 500) };
~out = { SinOsc.ar(~lfo.kr * [1, 1.2], 0, 1) };
~lfo = 410;
~out.clear

p.clear
~out.play
// unary operators
~lfo.scope
~lfo2 = { SinOsc.kr(0.5, 0, 60, 100) };
~lfo = ~lfo2.abs;
~lfo2 = { SinOsc.kr(1.3, 0, 60, 100) };

// binary operators
~lfo3 = { LFTri.kr(0.5, 0, 80, 300) };
~lfo = ~lfo2 + ~lfo3;
~lfo = ~lfo3;
~lfo = (~lfo3 / 50).sin * 200 + 500 * { LFTri.kr(~lfo.kr * 0.0015, 0, 0.1 * ~lfo3.kr / 90, 1) };
~lfo3 = { Mix(~lfo2.kr * [1, 1.2]) };

currentEnvironment.free; // free all node proxies
~out.stop; // free the playback synth.




~out.play;
p.gui
~out = { arg freq=500, ffreq=120; SinOsc.ar(freq*[1,1.1], SinOsc.ar(ffreq, 0, pi), 0.2) };
~out.set(\freq, 400 + 100.rand2);
~out.set(\freq, 400 + 100.rand2);
~out.set(\ffreq, 30 + 20.rand2);
~out.unset(\freq, \ffreq);    // remove the setting
~out.set(\ffreq, 30 + 10.rand2, \freq, 500 + 200.rand2);


// argument settings and mappings are applied to every new function
~out = { arg freq=100, ffreq=20; SinOsc.ar(freq, SinOsc.ar(SinOsc.ar(ffreq)*ffreq, 0, pi), 1) };

// mapping to other proxies
~lfo = { SinOsc.kr(3, 0, 80, 100) };
~out.map(\ffreq, ~lfo);

~out = { arg freq=300, ffreq=20; Pulse.ar(freq * [1, 1.1] + SinOsc.ar(ffreq, 0, freq), 0.3, 0.1) };
~out = { arg freq=300, ffreq=20; BPF.ar(LFSaw.ar(ffreq * [1, 1.1], 0, 1), freq, 0.2) };

~lfo = { FSinOsc.kr(0.3, 0, 30, 200) + FSinOsc.kr(10, 0, 10) };
~out = { arg freq=300, ffreq=20; SinOsc.ar(freq*[1,1.1], SinOsc.ar(ffreq, 0, pi), 0.1) };


// crossfaded setting and mapping: fadeTime is used
~out.fadeTime = 2;
~out.xset(\freq, 9000);
~out.xset(\freq, rrand(400, 700));

~lfo = { FSinOsc.kr(0.1, 0, 30, 100) };
~lfo2 = { LFClipNoise.kr(3, 100, 200) };
~lfo3 = StreamKrDur(Pseq([Prand([530, 600],1), 700, 400, 800, 500].scramble, inf) / 3, 0.2);

~out.xmap(\ffreq, ~lfo2);
~out.xmap(\ffreq, ~lfo);
~out.xmap(\ffreq, ~lfo3);

// argument rates: just like a synthdef has input 'rates' (like \ir or \tr), a nodeproxy control
// can be given a rate. this rate is used for each function passed into the proxy.

// trigger inputs
~out = { arg trig, dt=1; Decay2.kr(trig, 0.01, dt) * Mix(SinOsc.ar(7000 * [1.2, 1.3, 0.2])) }
~out.setRates(\trig, \tr);

// set the group, so the node proxy does not store the new value
~out.group.set(\trig, 1, \dt, 2.1);
~out.group.set(\trig, 0.4, \dt, 0.31);
~out.group.set(\trig, 0.13, \dt, 2);

// lagging controls:
~out.lag(\xfreq, 1); // equivalent to ~out.setRates(\xfreq, 1);
(
~out = { arg trig, dt=1, xfreq=700;
    Decay2.kr(trig, 0.01, dt) * Mix(SinOsc.ar(xfreq * [1.2, 1.3, 0.2]))
};
)
~out.group.set(\trig, 0.1, \dt, 1, \xfreq, rrand(2000,9000));
~out.group.set(\trig, 0.1, \dt, 0.5, \xfreq, rrand(2000,9000));
~out.group.set(\trig, 0.1, \dt, 1, \xfreq, rrand(2000,9000));

// changing the lag, the synth is reconstructed with the new lag:

~out.lag(\xfreq, 0.01);
~out.group.set(\trig, 0.1, \dt, 1, \xfreq, rrand(2000,9000));
~out.group.set(\trig, 0.1, \dt, 1, \xfreq, rrand(2000,9000));
~out.group.set(\trig, 0.1, \dt, 1, \xfreq, rrand(2000,9000));

// removing the trig rate:
~out.setRates(\trig, nil);

// note that the same works with the i_ and the t_ arguments, just as it does in SynthDef



// using a synthdef as input
// you have the responsibility for the right number of channels and output rate
// you have to supply an 'out' argument so it can be mapped to the right channel.

~out.play;
~out = SynthDef("w", { arg out=0; Out.ar(out,SinOsc.ar([Rand(430, 600), 600], 0, 0.2)) });
~out = SynthDef("w", { arg out=0; Out.ar(out,SinOsc.ar([Rand(430, 600), 500], 0, 0.2)) });
​
​
// if you supply a gate it fades in and out. evaluate this several times
(
~out = SynthDef("w", { arg out=0, gate=1.0, fadeTime = 0.1;
    Out.ar(out,
        SinOsc.ar([Rand(430, 800), Rand(430, 800)], 0, 0.2)
            * EnvGen.kr(Env.asr(fadeTime, 1, fadeTime), gate, doneAction: Done.freeSelf)
    )
    });
)
​
// once the SynthDef is sent, it can be assigned by name.
// using this method, a gate argument should be
// provided that releases the synth. (doneAction: Done.freeSelf)
// this is very efficient, as the def is on the server already.
​
// if the synth def is in the synthdesc lib (.add) its gate is detected.
​
(
SynthDef("staub", { arg out, gate=1, fadeTime = 0.1;
    Out.ar(out,
        Ringz.ar(Dust.ar(15), Rand(1, 3) * 3000*[1,1], 0.001)
        * EnvGen.kr(Env.asr(fadeTime, 1, fadeTime), gate, doneAction: Done.freeSelf)
    )
}).add;
)
​
~out = \staub;
​
​
​
// if you supply an envelope that frees itself, no bundle is sent to free it
(
~out = SynthDef("w", { arg out, lfo, f0=430;
    Out.ar(out,
        SinOsc.ar([Rand(f0, 800), Rand(f0, 800)]+lfo, 0, 0.2)
            * EnvGen.kr(Env.perc(0.01, 0.03), doneAction: Done.freeSelf)
    )
    });
)
​
~out.spawn;
~out.spawn([\f0, 5000]);
fork { 500.do { ~out.spawn([\f0, 5000 + 1000.0.rand]); 0.01.wait; } }
​
​
// when the synth description in the SynthDescLib is found for the symbol,
// the proxy can determine whether to release or to free the synth.
// so if there is no 'gate' arg provided and the def has a desc, the synth is
// freed and not released.
​
(
SynthDef("staub", { arg out;
    Out.ar(out, Ringz.ar(WhiteNoise.ar(0.01), 1000 * [1,1], 0.001))
}).add; // store the synth def so it is added to the SynthDescLib
)
​
​
~out = \staub;
~out = \staub;    // watching the synth count shows that the old synth is freed.
~out = 0;    // now out plays continuous stream of zero.
~out = nil;    // removes object and stops it.