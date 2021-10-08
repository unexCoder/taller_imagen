// SINTESIS ADITIVA

// timbre de espectro armónico
{
	var osc,env,f,n;
	//f = 500.rand;
	f = (36..72).choose.midicps;
	//f = [60,62,64,67,69].choose.midicps;
	n = 3;
	osc = SinOsc.ar(freq:f*(1..n),mul:0.5/(1..n)).sum;
	env = Env.perc(attackTime:0.5,releaseTime:3).ar(doneAction:2);
	osc!2 * env;
}.play;

// formas de onda teóricas
// formas de onda mas comunes en sinteizadords
// sinusoide, diente de sierra,cuadrada y triangular
SinOsc
Saw
Pulse
LFTri

s.scope


// timbre de espectro inarmonico
{
	var osc, env, n;
	n = 16;
	osc = SinOsc.ar(freq:{2000.rand}!n,mul:{0.1.rand}!n).sum;
	env = Env.perc(0.05,3).ar(2);
	osc!2 * env;
}.play;


//!!!!!!!!!!
///
uso de arrays como argumentos

ugen(array,arg,arg)

// atajo de creacion de arrays
(1..16)
(1,3..16)


int [] numeros = new int [16];
for (int i = 1; i < 17; i++) {
	numeros[i-1]=i;
}

// caso de multichannel expansion en
// creacion de array

{2000.rand}!16



// SINTESIS SUSTRACTIVA
       ENV >>
OSC >>  FILTRO   >> ENV

{
	var osc,filtro,env,f,fc,fenv;
	//fc = 350;
	//fc = {600}!4;
	f = (36..72).choose.midicps;
	//f = [60,62,64,67,69].choose.midicps;
	osc = Saw.ar(f);
	env = Env.perc(2,3).ar(2);
	fenv = Env.perc(0.05,2,40).ar(2);
	filtro = LPF.ar(osc,(10*env)*f);
	//filtro = LPF.ar(osc,fenv*f);
	filtro!2 * env;
}.play;


// FILTROS
// PASA BAJOS
LPF, RLPF
// PASA ALTOS
HPF, RHPF
// PASA BANDA
BPF
// BANDA ELIMINADA
BRF

// filtros resonantes
// CLASICO SUSTRACTIVO
{
	var osc,filtro,env,f,fc,fenv;
	//fc = 350;
	//fc = {600}!4;
	f = (24..48).choose.midicps;
	//f = [60,62,64,67,69].choose.midicps;
	osc = Saw.ar(f);
	env = Env.perc(0.02,3).ar(2);
	//fenv = Env.perc(0.05,2,40).ar(2);
	filtro = RLPF.ar(osc,(10*env)*f,0.25);
	//filtro = RLPF.ar(osc,fenv*f);
	filtro!2 * env;
}.play;



// MAS EXPERIMENTAL
{
	var osc,filtro,env,f,fc;
	fc = {600}!4;
	f = (48..72).choose.midicps;
	//f = [60,62,64,67,69].choose.midicps;
	osc = Saw.ar(f);
	env = Env.perc(0.02,3).ar(2);
	filtro = RLPF.ar(osc,fc,0.5).sum;
	filtro!2 * env * 0.25;
}.play;


{
	var snd,filtro;
	snd = WhiteNoise.ar;
	filtro = BRF.ar(snd,300,MouseX.kr(1.0,0.001));
	filtro!2
}.play

s.freqscope