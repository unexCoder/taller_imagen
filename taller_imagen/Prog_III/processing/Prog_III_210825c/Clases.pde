// CLASES >> INSTANCIAS U OBJETOS

// OBJETO ES UNA INSTANCIA DE UNA CLASE

// mi clase nave va a ser el encapsulado
// de una serie de datos acompañado de un
// numero de funciones para operar esos 
// datos

class Nave {
  int x, y;
  float escala, rota;
  int disparo;

  // constructor
  Nave(int _x, int _y, float _escala, float _rota) {
    x = _x;
    y = _y;
    escala = _escala;
    rota = _rota;
    disparo = 0;
  }

  void rotacion(float r) {
    rota = r;
  }

  void arma() {
    disparo += 50;
  }
  
  void disparo() {
    disparo = 0;
  }
  
  void display() {
    noStroke();  
    pushMatrix();
    translate(x, y);
    scale(escala);
    rotate(rota);
    fill(255, 0, 255, 150);
    ellipse(0, 0, 50, 100);  
    fill(0, 255, 255, 150);
    ellipse(0, 0, 100, 50);
    stroke(255);
    strokeWeight(3);
    noFill();
    ellipse(0,0,disparo,disparo);
    popMatrix();
  }
}
