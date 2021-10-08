// nave amiga
class NaveAmiga {
  float x, y;
  float escala;
  color c;

  NaveAmiga() {
    escala = 20;
    c = #F75AE3;
    x = width/2;
    y = 4.2*(height/5);
  }

  void move(int dir) {
    if (dir == -1) {
      x-=10;
    } else if (dir == 1) {
      x+=10;
    }
  }
  
  ArrayList disparo (ArrayList balas) {
    Bala b = new Bala(this.x, this.y);
    balas.add(b);
    return balas;
  }
  
  void checkWaveColision(Onda o) {
    float dist = dist(this.x,this.y,o.x,o.y);
    if(dist <= o.alcance) {
      //println("onda");
    }
  }
  
  void display() {
    pushMatrix();
    translate(x, y);
    scale(escala);
    fill(c);
    triangle(0, -1, -1, 1, 1, 1);
    popMatrix();
  }
}
