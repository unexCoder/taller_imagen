//IntegratedDevelopmentEnvironment

// funcion de seteo de aplicacion
// definimos todo el estado inicial del programa
// carga de archivos necesarios (multimedia) etc

// declaramos una variable 
int numero;

void setup() {
  // iniciamos la variable
  numero = 1;

  size(800,600); //seteo de ventana principal en pixels
  //background(155); // tono 0-255
  background(209,57,207); // RGB 24BITS 888
}

// loop principal o "main loop"
void draw() {
  numero = numero + 1; 
  println(numero);
 
  fill(120);
  stroke(random(255));
  strokeWeight(random(50));
  point(mouseX,mouseY);
  //rectMode(CENTER);
  //rect(width/2,height/2,100,100);
}

// callback
void keyPressed() {
  if(key == 32) {
    noLoop();
  } else if (key == 'l') {
    loop();
  } else if (key == 's') {
    saveFrame();
  }
}
