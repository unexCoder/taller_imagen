void nave(int x, int y) {
  noStroke();
  fill(255, 0, 255, 150);
  ellipse(x, y, 50, 100);  
  fill(0, 255, 255, 150);
  ellipse(x, y, 100, 50);
}

void nave(int x, int y, float escala) {
  noStroke();
  scale(escala);
  fill(255, 0, 255, 150);
  ellipse(x, y, 50, 100);  
  fill(0, 255, 255, 150);
  ellipse(x, y, 100, 50);
}
void nave() {
  noStroke();
  fill(255, 0, 255, 150);
  ellipse(width/2, height/2, 50, 100);  
  fill(0, 255, 255, 150);
  ellipse(width/2, height/2, 100, 50);
}

int operacion(int divisor) {
  int respuesta = 50/divisor;
  return respuesta;
}
