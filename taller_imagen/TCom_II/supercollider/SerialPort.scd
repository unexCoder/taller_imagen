(
u = SerialPort(
    "/dev/cu.usbserial-A700dXPU",    //edit to match your port. SerialPort.listDevices
    baudrate: 9600,    //check that baudrate is the same as in arduino sketch
    crtscts: true);
)

//read 10bit serial data sent from Arduino's Serial.println
(
a= Routine({
    var byte, str, res;
    99999.do{|i|
        if(u.read==10, {
            str = "";
            while({byte = u.read; byte !=10 }, {
                str= str++byte.asAscii;
            });
            res= str.asInteger;
            ("read value:"+res).postln;
			{Env.perc.ar(2)*SinOsc.ar(res,0,0.01)!2}.play
        });
    };
}).play;
)

a.stop;
u.close;