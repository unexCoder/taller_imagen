class Bala {
  float x, y;
  float escala = 5;

  Bala(float x_, float y_) {
    x = x_;
    y = y_;
  }
  
  void display() {
    y -= 10;
    pushMatrix();
    translate(x, y);
    scale(escala);
    fill(255);
    rectMode(CENTER);
    rect(0, 0, 1, 2);
    popMatrix();
  }
}
