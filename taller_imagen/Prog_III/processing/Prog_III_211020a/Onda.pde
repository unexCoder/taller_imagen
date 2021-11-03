// clase onda de choque
class Onda {
  int x, y;
  float escala;
  int alcance;
  int t = 255;

  Onda(int _x, int _y) {
    x = _x;
    y = _y;
    alcance = 0;
  }

  boolean checkBulletColision (Bala b) {
    boolean shotedOnda = false;
    float dist = dist(this.x,this.y,b.x,b.y); 
    if (dist <= alcance/2) {
      shotedOnda = true;
    }
    return shotedOnda; 
  }
  
  void display() {
    alcance +=10;
    pushMatrix();
    translate(x, y);
    //scale(escala);
    stroke(255,t);
    strokeWeight(3);
    noFill();
    ellipse(0, 0, alcance, alcance);
    popMatrix();
  }
}
