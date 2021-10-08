// clase onda de choque
class Onda {
  int x, y;
  float escala;
  int alcance;
  int t = 255;

  Onda(int _x, int _y, float _escala ) {
    x = _x;
    y = _y;
    escala = _escala;
    alcance = 0;
  }

  void checkBulletColision  (Bala b) {
    float dist = dist(this.x,this.y,b.x,b.y); 
    if (dist <= alcance) {
      b = null;
    }
  }
  
  void display() {
    alcance +=50;
    pushMatrix();
    translate(x, y);
    scale(escala);
    stroke(255,t);
    strokeWeight(3);
    noFill();
    ellipse(0, 0, alcance, alcance);
    popMatrix();
  }
}
