import processing.serial.*;
Serial myPort;
String val;

void setup() {
//  String portName = Serial.list()[3]; //change the 0 to a 1 or 2 etc. to match your port
  String portName = "/dev/cu.usbserial-A700dXPU";
  println(portName);
  myPort = new Serial(this, portName, 9600);
}
void draw() {
  if ( myPort.available() > 0) { // If data is available,
    int val = myPort.read(); // read it and store it in val
    println(val); //print it out
  }
  //rect(0,0,val,val);
}
