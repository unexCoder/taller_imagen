Nave n, n2;
float r;

void setup() {
  size(800, 800);
  n = new Nave(width/2, height/2, 1, 0);
  n2 = new Nave(width/3, height/4, 0.5, 2);
}

void draw() {
  background(0);
  r+=0.1;
  n.rotacion(r);
  n2.rotacion(-r);

  n.arma();
  n2.arma();

  n.display();
  n2.display();
}

void keyPressed() {
  if (key == 32) {
    n.disparo();
    n2.disparo();
  }
}
