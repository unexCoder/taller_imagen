// ENCAPSULADO
// funciones y objetos

// FUNCIONES
// override (sobreescritura) de la funcion setup()
void setup() {
  float f = random(255);
  size(600, 600);
  background(f);

  // operatoria >>>>>
  // int a =  50;
  int b = (int) random(10, 35);
  int c = 50/b;
  println(c); 

  int d = operacion(b);
  println(d);
}

// override de una funcion draw() predeclarada
void draw() {    
  nave(mouseX, mouseY, map(mouseX, 0, width, 0.1, 10));
}
