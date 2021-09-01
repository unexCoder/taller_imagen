UGen unidades generadoras >> algoritmos que sirven como unidades de construcción para aplicaciones que generan o procesan audio digital (sintesis y procesadores)

Server servidor de audio >> el programa que interpreta el código que escribimos y produce el audio >> el motor de audio o scsynth


sclang o Lenguaje >> es el lenguaje en si mismo, el código que usamos para construir los algoritmos que son transmitidos al motor de audio via OSC. Además podemos vincular sclang con dispositivos externos de hardware via MIDI (controladores) o Puerto Serial (x ej. con Arduino)


Open Sound Control >> es un protocolo de transmision de datos en redes >> lenguaje que me permite comunicar aplicaciones entre si

Arquitectura de Supercollider

   cliente                                 servidor
Lenguaje (sclang)       <<<<  OSC  >>>>   Server (scsynth)

Processing              <<<<  OSC  >>>>   Server (scsynth)

Arduino                 <<<<  OSC  >>>>   Server (scsynth)


scide >> Entorno Integrado de Desarrollo que es esta misma ventana
es lo primero que vemos al iniciar Supercollider


Lenguaje interpretado
<< Livecoding >>

a =20;

b=15

a + b

s.boot // activar el server o tambien Cntrl + B
s.quit

Lenguaje de programacion orientado a objetos

PImage img;

img.resize(xx,yy);

Objeto.metodo()

Serial.println(val)



>> True OOP >> en Supercollider cualquier codigo ejecutable es un objeto

(
a = 23578.rand.sqrt;
b = (1..10).choose;
c = pow(a,b);
[a,b,c]
)


// combinaciones de teclas para interactuar con el código
Shift + Enter >> interpretamos código
Ctrl + . >> detener la ejecución de ese código


// FUNCION DE AUDIO

// funciones
rect(20,20,100,100); // processing
delay(1000);  // arduino

{  SinOsc.ar(2000.rand,0,0.1) /*UGens*/ }.play

s.scope

{ SinOsc.ar( MouseX.kr(100,1000), 0, 0.5)  }.scope // oscilador sinusoidal

audio digital normalizado
valor numerico en el rango -1.0 <<>> 1.0
valores que puede adoptar cada sample o muestra de audio

// sintesis aditiva de espectro armónico
{SinOsc.ar(500.rand*(1..16),0,0.1).sum*Env.perc.ar}.play





