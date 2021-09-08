

// Live coding >> codear en tiempo real o en vivo

// lenguaje  <<    Open Sound Control    >> motor de audio


s.boot

// SC es un lenguaje True OOP

// objeto.metodo(args...)

"Sasha".toUpper

{}.class

// funcion dentro del sclang

/*
float operacion(float a, float b, float c) {
	return (a*b)+c;
}
*/

{ arg a,b,c; ((a * b) + c) }.valueArray([2,3,4])
f = { |a, b, c| ((a * b) + c) }
f.valueArray([2,3,5])


// funciones de audio >> UGENS
SinOsc >> oscilador sinusoidal
Saw >> oscilador diente de sierra
Pulse >> oscilador de onda cuadrada (pulso)
PMOsc >> par de osciladores de FM

{SinOsc.kr(200,mul:0.5)}.plot
{Saw.ar}.plot
{Pulse.ar}.plot

{PMOsc.ar(200,100,4.5,mul:0.5)}.scope


// sintesis aditiva de espectro armónico
{SinOsc.ar(500.rand ,0,0.1)}.play

s.scope
500.rand    // notacion de metodo
rand(500)   // notacion funcional


500.0.rand.round(1.544).sqrt

sonido de dinamica constante
lo debo multiplicar por una funcion temporal (ENVOLVENTE DINAMICA)


Env.perc.plot
Env.sine.plot
Env.new([0,1,0.1,0.75,0],[0.1,0.4,1,0.5]).plot
Env([0,1,0.1,0.75,0],[0.1,0.4,1,0.5],[0,-4,4,-6]).plot


{SinOsc.ar(500.rand ,0,1)*Env.new([0,1,0.1,0.75,0],[0.1,0.4,1,0.5]).ar}.play

{SinOsc.ar(500.rand ,0,1)* Env.perc(0.1,3.0.rand).kr}.play

// diferencia entre metodos .ar y .kr en ugens
// ar (audio rate) >> osciladores
// kr (control rate) >> envolventes y moduladores

s.sampleRate // 44100 samples x segundo

// MULTICHANNEL EXPANSION
// TIMBRE O SONIDO ARMONICO
{SinOsc.ar(500.rand*(1..16) ,0,0.05).sum * Env.perc(0.1,3.0.rand).kr}.play

(1..16) // ABREVIATURA DE GENERAR UN ARRAY

// SONIDO O TIMBRE INARMONICO
{SinOsc.ar({1000.rand}!16,0,0.05).sum * Env.perc(0.1,3.0.rand).kr}.play

{1000.rand}!16

s.makeWindow
//////////////////////////////////////////
/////////////////////
/////////////////////
/////////////////////

