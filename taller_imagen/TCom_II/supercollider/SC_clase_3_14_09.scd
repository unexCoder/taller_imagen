
{Pulse.ar}.plot // oscilador o generador de onda
{WhiteNoise.ar}.plot // generador un ruido


Env.perc.plot

// cadena de audio
osc >> envolvente >> salida_de_audio


{Pulse.ar * Env.new([0,1,0.25,0.75,0],[2,0.1,1,3],[-2,2,2,-1]).ar}.play

// drones

// multichannel expansion
// frecuencia se mide en ciclos x segundo (Hertz)
{x=rand(1500); Pulse.ar(freq:x)!2 * Env.perc(attackTime:0.5,releaseTime:3).kr}.play;

// sintaxis

{Pulse.ar!6}.plot

{Pulse.ar(rand(1500)!6)}.plot

1500.rand // dot notacion
rand(1500) // notacion funcional

{rand(1500)}!600

{Pulse.ar({rand(1500)}!6)}.plot

{x={rand(1500)}!6; Pulse.ar(freq:x) * Env.perc(attackTime:0.5,releaseTime:3).ar}.play;

// sintesis aditiva
{Pulse.ar({rand(1500)}!6).sum}.plot

{x={rand(1500)}!6; Pulse.ar(freq:x,mul:0.3).sum * Env.perc(attackTime:0.5,releaseTime:3).ar!2}.play;

{"sasha".scramble}!20

{x={rand(1500)}!6; Mix(Pulse.ar(freq:x,mul:0.3)) * Env.perc(attackTime:0.5,releaseTime:3).ar!2}.play;

// auriculares
{x={rand(1500)}!6; Splay.ar(Pulse.ar(freq:x,mul:0.5)) * Env.perc(attackTime:0.5,releaseTime:3).ar}.play;

{x={rand(1500)}!6; Splay.ar(Pulse.ar(freq:x,mul:0.5) * Env.perc(attackTime:{1.0.rand}!6,releaseTime:{3.0.rand}!6).ar)}.play;


// doneAction para liberar la memoria en el server

(
{
	var notas =6;
	var freqs, ataques, extinciones, snd;
	freqs={rand(1500)}!notas;
	ataques={1.0.rand}!notas;
	extinciones={3.0.rand}!notas;
	snd = Splay.ar(
		Pulse.ar(freqs,mul:0.5) *        // oscilador
		Env.perc(ataques,extinciones).ar; // envolvente
	);
//	DetectSilence.ar(snd,doneAction:2);
}.play;
)


{x={rand(1500)}!6;
	Pulse.ar(freq:x,mul:0.3).sum *
	Env.perc(attackTime:0.5,releaseTime:3).ar(doneAction:2)
	!2
}.play;
