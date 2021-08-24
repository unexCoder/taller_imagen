import processing.serial.*;
Serial arduino;
int analogValue;

void setup() {
  size(400, 400);
  String portName = Serial.list()[3];
  println(portName);
  try {
    arduino = new Serial(this, portName, 9600);
    arduino.bufferUntil('\n');
  }
  catch(Exception e) {
    System.err.println("Error initializing Serial port!\nPlease check connections and port settings");
    e.printStackTrace();
  }
  rectMode(CENTER);  
}

void draw(){
  background(0);
  fill(analogValue/2);
  rect(width/2, height/2, analogValue/4, analogValue/4);
}

void serialEvent(Serial s) {
  String rawString = s.readString();
  println("received arduino message: " + rawString);
  try {
    rawString = rawString.trim();//remove any white space characters (if present)
    analogValue  = int(rawString);
  }
  catch(Exception e) {
    println("Error parsing String from serial port:");
    e.printStackTrace();
  }
}
