{
	var snd,filtro;
	snd = WhiteNoise.ar;
	filtro = BRF.ar(snd,300,MouseX.kr(1.0,0.001));
	filtro!2
}.play


// resonz y ringz
{ Resonz.ar(WhiteNoise.ar, 2000, 0.01) }.play

// modulacion de frecuencia de corte
{ Resonz.ar(WhiteNoise.ar, XLine.kr(1000,8000,10), 0.05) }.play

// modulacion de ancho de banda
{ Resonz.ar(WhiteNoise.ar, 2000, XLine.kr(1, 0.001, 8)) }.play

// modulacion periodica de ancho de banda
{ Resonz.ar(WhiteNoise.ar, SinOsc.ar(0.33,mul:400,add:600), SinOsc.ar(0.25,mul:0.125,add:0.1251)) }.play
s.freqscope

{SinOsc.ar(mul:0.5,add:0.5001)}.plot
//mul: multiplica la salida x el numero correspondiente-escala
// add: suma el valor a la salida-offset



// Klank
// banco de filtros resonantes

{ Klank.ar(`[[800, 1071, 1153, 1723], nil, [1, 1, 1, 1]], Impulse.ar(2, 0, 0.5)) }.play;

{Impulse.ar}.plot

specificationsArrayRef
`[[800, 1071, 1153, 1723], nil, [1, 1, 1, 1]]


[[2,3,5],(2,5..30)]

{ Klank.ar(`[[800, 1071, 1353, 1723], nil, [1, 1, 1, 1]], Dust.ar(2, 0.5)) }.play;

{Dust.ar(20,1)}.plot(1)



{ Klank.ar(`[[800, 1071, 1353, 1723], nil, [1, 1, 1, 1]], PinkNoise.ar(0.007)) }.play;

{ Klank.ar(`[[200, 671, 1153, 1723], nil, [1, 1, 1, 1]], PinkNoise.ar([0.007, 0.007])) }.play;

// experimentacion
{
	var n,freqs,amps,rings,exiter;
	n = 50;
	freqs = {2500.rand}!n;
	amps = {1.0.rand}!n;
	rings = {3.0.rand}!n;
//	exiter = PinkNoise.ar([0.007, 0.007]);
//	exiter = Impulse.ar(0.2,0.1);
	exiter = In.ar(2);
	Klank.ar(`[freqs,amps,rings],exiter)*0.25;
}.play;
///////////////////////////////////////////////////

// Sintesis por modulación de frecuencia
// Síntesis FM

OSC(modulador) >> (freq) OSC (carrier)

// fm simple
{SinOsc.ar(SinOsc.ar(100,0,2000)+200,0,0.5)}.play

modulador y un carrier
carrier es el escilador de salida (oscilador modulado)
modulador es el oscilador cuya salida usamos para modular la frecuencia del carrier

{
	var carrier, modulador;
	modulador = SinOsc.ar(404,0,2000);
	carrier = SinOsc.ar(modulador+200,0,0.5);
	carrier = carrier * Env.perc.ar(2);
}.play
