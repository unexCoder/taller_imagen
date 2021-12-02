// Temario exámen Tec. Comunicaciones II

1)

- programar 4 funciones de audio {sonido}.play
- utilizar al menos dos diferentes métodos de síntesis
- utilizar envolventes dinámicas y de control de otros parámetros
- utilizar recursos aleatorios (generatividad)
- desarrollar teóricamente cada funcion

2)

- elegir una de esas funciones y re programar como SynthDef
- utilizar argumentos
- programar un Pattern que use como \instrument dicha SynthDef

3)

trabajo integrador

- construir y programar una interfaz hardware con arduino
- crear un enlace entre la interfaz y Supercollider
- programar una funcion que reciba los datos de la interfaz
y permita controlar un sonido de tipo "DRONE"

>> INTERFAZ
la interfaz debe tener potenciómetros, botones (push) y/o fotorresistencias (en total 2 o 3 actuadores)

https://www.tinkercad.com/users/1pD5FYcNXVS-luis-tamagnini?category=circuits&sort=likes&view_mode=default

https://classroom.google.com/w/Mjk5NDg2NjE5OTQ0/t/all
// mapeo algunos casos útiles

453.linexp(0,1023,200,800) // mapear a frecuencia
453.linexp(0,1023,0.0,1.0) // mapear a amplitud


453.linlin(0,1023,0.1,2.0) // tiempo de release
