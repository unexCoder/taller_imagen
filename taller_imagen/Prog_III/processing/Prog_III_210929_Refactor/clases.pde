// declaracion de la clase Nave

// un objeto es una entidad que encapsula una serie de datos
// y una cantidad de funciones que operan con esos datos

class Nave {
  int x, y;
  float escala, rota;
  boolean disparo;
  float angulo;
  int vel;
  int shot;
  int t = 255;

  // funciones o METODOS

  // default constructor
  Nave() {
    x = (int) random(100, width-100);
    y = (int) random(-1800, -600);
    escala = 0.5;
    rota = random(PI);
    disparo = false;
    angulo = random(PI);
    vel = 2;
    shot = (int) random(25, 50);
  }
  // constructor
  Nave(int _x, int _y, float _escala) {
    x = _x;
    y = _y;
    escala = _escala;
    rota = random(PI);
    disparo = false;
    angulo = random(PI);
    vel = 1;
    shot = (int) random(25, 50);
  }

  void rotacion() {
    angulo += 0.1;
    rota += 0.1+(0.05 * abs(sin(angulo)));
  }
  /*
  void arma() {
   if (disparo) {
   o = new Onda(this.x, this.y, this.escala);
   disparo = false;
   shot = (int) random(100, 300);
   }
   o.display();
   }
   */
  ArrayList arma(ArrayList ondas) {
    if (disparo) {
      Onda o = new Onda(this.x, this.y, this.escala);
      ondas.add(o);
      disparo = false;
      shot = (int) random(100, 300);
    }
    return ondas;
  }

  void shot() {
    if (frameCount % shot == 0) {
      disparo = true;
    }
  }

  // setter
  void position(int _x, int _y) {
    x = _x;
    y = _y;
  }

  void move() {
    y += vel;
    if (y > height + 100) {
      y = -100;
      x =(int) random(100, width-100);
    }
  }

  void chekCollision(Nave n) {
    // chequeamos que la distancia entre este objeto
    // y otros objetos no sea menor a cierto valor
    float distancia = dist(x, y, n.x, n.y);
    if (distancia < 100) {
      println(".....");
      x+=distancia;
      y+=distancia;
    }
  }

  void display() {
    this.rotacion();
    this.arma();
    this.shot();

    noStroke();
    // STACK 3D
    pushMatrix();
    translate(x, y);
    scale(escala);
    rotate(rota);
    fill(255, 0, 255, t);
    ellipse(0, 0, 50, 100);
    fill(0, 255, 255, t);
    ellipse(0, 0, 100, 50);
    popMatrix();
  }
}

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

  void display() {
    alcance +=50;
    pushMatrix();
    translate(x, y);
    scale(escala);
    stroke(255, t);
    strokeWeight(3);
    noFill();
    ellipse(0, 0, alcance, alcance);
    popMatrix();
  }
}

class Estrella {
  float x, y;
  float vel;
  float size;

  Estrella() {
    x = (int)random(width);
    y = (int)random(height);
    size = random(4);
    vel = 0.5;
  }

  void display() {
    y = y - vel;
    if (y < -5) {
      x = (int)random(width);
      y = height;
    }
    fill(255);
    ellipse(x, y, size, size);
  }
}

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
  /*
  void disparo () {
   Bala b = new Bala(this.x, this.y);
   balas.add(b);
   println(balas.size());
   }
   */
  ArrayList disparo (ArrayList balas) {
    Bala b = new Bala(this.x, this.y);
    balas.add(b);
    return balas;
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
