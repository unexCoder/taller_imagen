niveles

(procesador)   bajo nivel <<   ----  >> alto nivel

machine code o assembler

abstraccion


// MIDI
musical instruments digital interface

interface midi >> placa midi

en una red local yo puedo conectar programas entre si a traves
de un protocolo de comunicacion digital

los protocolos que podemos usar son

MIDI y OSC (Open Sound Control)

//

MIDI

teclado (o software en red local >> computadora
computadora >> teclado (o software en red local)

	una coneccion >> 16 canales

	mensaje de sistema (valor para los 16 canales)
	y mensaje de canal (mensajes que envío para un canal independiente)

dentro de los mensajes de canal
	mensaje de nota y mensaje de control

	note on 0-127
	note off 0-127

	numeracion de notas midi
	https://lh3.googleusercontent.com/proxy/nyAEOrjPtlAvPhdcHutGtTuwmpyiUIimivYtrmcBREp_-3C77V0YlR0nYpaiCbhNjBlpAET_wL0t__iqHPi4r50

	los mensajes de control estan asociados a controles continuos

/////////////////////

OPEN SOUND CONTROL

https://cnmat.berkeley.edu/opensoundcontrol

	flag / valor o valores

	el flag lo define el usuario
	los valores asociados pueden ser numeros enteros, numeros flotantes o strings

	\trig, 1
	\nota, 60
	\nota, 'do'
	\release, 3.25
	\filtros, 120,256,345,'pasabajo'


server y el lenguaje se comunican con OSC


// PMOsc
~fm_simple = {
	|freq = 100, ratio = 1, mod_index = 20, detune = 1.02, atack = 0.05, release = 2, amp = 0.5|
	PMOsc.ar( [freq,freq*detune],freq*ratio,mod_index) *
	Env.perc(atack,release).ar(2) * amp;
}

~fm_simple.play(args:[\freq,1500.rand,\mod_index,10.rand,\release,3.0.rand+1,\detune,3.5])

~fm_simple.play(args:[\freq,(21..108).choose.midicps,\mod_index,10.rand,\release,3.0.rand+1,\detune,3.5])

~notas = [60,62,63,66,67,69]-12 //do -re - mib - fa# -sol - la >> representa un modo o escala

~fm_simple.play(args:[\freq,~notas.choose.midicps,\mod_index,10.rand,\release,3.0.rand+1,\detune,3.5])

~fm_simple.play(args:[\freq,440,\mod_index,10.rand,\release,3.0.rand+1,\detune,3.5])

~fm_simple.play(args:[\freq,69.midicps,\mod_index,10.rand,\release,3.0.rand+1,\detune,3.5])

// Synthdef

SynthDef(\fm_simple,{
	|freq = 100, ratio = 1, mod_index = 20, detune = 1.02, atack = 0.05, release = 2, amp = 0.5|
	var snd = PMOsc.ar( [freq,freq*detune],freq*ratio,mod_index) *
	Env.perc(atack,release).ar(2) * amp;
	Out.ar(0,snd);
}).add

Synth(\fm_simple,[\freq,~notas.choose.midicps,\mod_index,10.rand,\release,3.0.rand+1,\detune,3.5])


SynthDef(\seno_perc, {
	|out=0,amp=0.5,freq=440|
	var snd;
	snd = SinOsc.ar([freq,freq*1.01])*Env.perc.ar(2)*amp;
	Out.ar(out,snd)
}).add

Synth(\seno_perc)
// uso de patterns con synthdefs

// pattern (patron)
Pbind(
	\instrument,Pwrand([\seno_perc,\fm_simple],[0.8,0.2],inf),
//	\freq, Prand([1, 1.2, 2, 2.5, 3, 4], inf) * 200,
	\freq, Prand( (0.8,1.4..9.9), inf) * 100,
	\dur, 0.1,
	\amp,0.25
).play;

Pbind(\instrument,\fm_simple,
	\midinote, Pseq([60,67,62,65,67,69,67], inf),
	\dur, 0.5).play;

Pbind(\instrument,\fm_simple,
	\midinote, Pseq(~notas, inf),
	\dur, 0.5).play;


~melodia = Pbind(\instrument,\fm_simple,
	\midinote, Pseq([60,67,62,65,67,69,67], inf),
	\dur, Prand([0.5,0.25],inf),
	\detune,1.01,
	\mod_index,Pseq([5,10,15,20],inf),
	\amp,0.2
).play;


~bajo = Pbind(\instrument,\fm_simple,
	\midinote, Pseq([60,67,62,65,67,69,67]-24, inf),
	\dur, Prand([0.5,0.25],inf)*2,
	\detune,1.01,
	\mod_index,20,
	\release,3,
	\amp,0.2
).play;



~melodia.play(quant:1);~bajo.play(guant:1)

~melodia.reset;
~bajo.reset;

~melodia.stop;~bajo.stop

// reloj o clock