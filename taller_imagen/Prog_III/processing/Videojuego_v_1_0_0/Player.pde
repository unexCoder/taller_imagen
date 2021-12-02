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
  
  boolean checkWaveColision(Onda o) {
    boolean shoted = false;
    float dist = dist(this.x,this.y,o.x,o.y);
    if(dist <= o.alcance/2) {
      //println("onda");
      shoted = true;
    }
    return shoted;
  }
  
  void display() {
    pushMatrix();
    translate(x, y);
    //scale(escala);
//    fill(c);
//    triangle(0, -20, -20, 20, 20, 20);
    rectMode(CORNER);
    fill(216, 216, 216 );
    rect(5, -40, 6, 20);
    fill(216, 216, 216 );
    rect(5, 30, 6, 20);
    fill(216, 216, 216 );
    rect(0, -20, 15, 60);
    fill(216, 216, 216 );
    rect(14, 0, 8, 28);
    fill(216, 216, 216 );
    rect(22, 10, 8, 18);
    fill(216, 216, 216 );
    rect(28, 17, 8, 18);
    fill(216, 216, 216 );
    rect(36, 24, 8, 18);
    fill(216, 216, 216 );
    rect(44, 10, 8, 50);
    fill(240, 60, 60 );
    rect(44, -2, 8, 18);
    fill(216, 216, 216 );
    rect(-7, 0, 8, 28);
    fill(216, 216, 216 );
    rect(-14, 10, 8, 18);
    fill(216, 216, 216 );
    rect(-22, 17, 8, 18);
    fill(216, 216, 216 );
    rect(-30, 24, 8, 18);
    fill(216, 216, 216 );
    rect(-38, 10, 8, 50);
    fill(240, 60, 60 );
    rect(-38, -2, 8, 18);

    
    popMatrix();
  }
}
