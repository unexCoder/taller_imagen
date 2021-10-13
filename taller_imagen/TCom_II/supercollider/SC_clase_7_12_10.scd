// funciones y argumentos

{
	var carrier, modulador;
	modulador = SinOsc.ar(420,0,90000);
	carrier = SinOsc.ar(modulador+200,0,0.5);
	carrier = carrier * Env.perc(releaseTime:3).ar(2);
}.play


// funciones en java y c++
random(100); // funcion

void diez_rectangulos(int x, int y) {
	for (...) {
		rect(...); // funcion
	}
}

diez_rectangulos(20,20);

// en supercollider las funciones son objetos
{}.class

// como argumentar funciones
{
	arg a,b;
	(a * b).postln
}.value(3, 10);

{
	|a=3,b=2|
	(a * b).postln;
}.value(4,6);

// funciones en variables globales
~media_freq = {
	|freq = 200|
	freq/2;
}

~media_freq.value(3457)

// variables globales
// variables globales pre-declaradas

a..z (menos la letras s) // variables de entorno (environment variables)

// variables globales
~sonido_1 = {
	var carrier, modulador;
	modulador = SinOsc.ar(420,0,90000);
	carrier = SinOsc.ar(modulador+200,0,0.5);
	carrier = carrier * Env.perc(releaseTime:3).ar(2);
}

~sonido_1.play

~sonido_2 = {
	|freq = 100, ratio = 1, mod_index = 200|
	var carrier, modulador, freq_mod;
	freq_mod = freq * ratio;
	modulador = SinOsc.ar(freq_mod,0,mod_index);
	carrier = SinOsc.ar(modulador+freq,0,0.5);
	carrier = carrier
	//* Env.perc(releaseTime:3).ar(2);
}.play

~sonido_2.set(\freq,500);
~sonido_2.set(\ratio,1.618);
~sonido_2.set(\mod_index,1000000);


// PMOsc
~fm_simple = {
	|freq = 100, ratio = 1, mod_index = 20, detune = 1.02, atack = 0.05, release = 2, amp = 0.5|
	PMOsc.ar( [freq,freq*detune],freq*ratio,mod_index) *
	Env.perc(atack,release).ar(2) * amp;
}

~notas = [60,62,63,66,67,69]-12
~fm_simple.play(args:[\freq,~notas.choose.midicps,\mod_index,10.rand,\release,3.0.rand+1,\detune,3.5])


// Synthdef

SynthDef(\fm_simple,{
	|freq = 100, ratio = 1, mod_index = 20, detune = 1.02, atack = 0.05, release = 2, amp = 0.5|
	var snd = PMOsc.ar( [freq,freq*detune],freq*ratio,mod_index) *
	Env.perc(atack,release).ar(2) * amp;
	Out.ar(0,snd);
}).add

Synth(\fm_simple,[\freq,~notas.choose.midicps,\mod_index,10.rand,\release,3.0.rand+1,\detune,3.5])

// uso de patterns con synthdefs

// pattern (patron)
Pbind(\instrument,\fm_simple,
	\freq, Prand([1, 1.2, 2, 2.5, 3, 4], inf) * 200,
	\dur, 0.1)
.play;

Pbind(\instrument,\fm_simple,
	\midinote, Pseq([60,67,62,65,67,69,67], inf),
	\dur, 0.5).play;

~melodia = Pbind(\instrument,\fm_simple,
	\midinote, Pseq([60,67,62,65,67,69,67], inf),
	\dur, Prand([0.5,0.25],12),
	\detune,1.01,
	\mod_index,Pseq([5,10,15,20],inf)
).play;

~melodia.reset;
~melodia.play

s.makeWindow