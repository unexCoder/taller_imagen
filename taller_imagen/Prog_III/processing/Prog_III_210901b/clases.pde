// declaracion de la clase Nave

// un objeto es una entidad que encapsula una serie de datos
// y una cantidad de funciones que operan con esos datos

class Nave {
  int x, y;
  float escala, rota;
  boolean disparo;
  float angulo;
  Onda o = new Onda(0, 0, 0);
  int vel;
  int shot;

  // funciones o METODOS

  // default constructor
  Nave() {
    x = (int) random(100,width-100);
    y = (int) random(-1800,-600);
    escala = 0.5;
    rota = random(PI);
    disparo = false;
    angulo = random(PI);
    vel = 2;
    shot = (int) random(25,50);
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
    shot = (int) random(25,50);
  }

  void rotacion() {
    angulo += 0.1;
    rota += 0.1+(0.05 * abs(sin(angulo)));
  }

  void arma() {
    if (disparo) {
      o = new Onda(this.x, this.y, this.escala);
      disparo = false;
      shot = (int) random(100,300);
    }
    o.display();
  }

  void disparo() {
    disparo = true;
  }
  
  void shot() {
    if(frameCount % shot == 0) {
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
    if(y > height + 100) {
      y = -100; x =(int) random(100,width-100);
    }
  }
  
  void chekCollision(Nave n) {
    // chequeamos que la distancia entre este objeto
    // y otros objetos no sea menor a cierto valor
    float distancia = dist(x,y,n.x,n.y);  
    if(distancia < 100) {
      println(".....");        
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
    fill(255, 0, 255);
    ellipse(0, 0, 50, 100);
    fill(0, 255, 255);
    ellipse(0, 0, 100, 50);
    popMatrix();
  }
}

class Onda {
  int x, y;
  float escala;
  int alcance;

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
    stroke(255);
    strokeWeight(3);
    noFill();
    ellipse(0, 0, alcance, alcance);
    popMatrix();
  }
}

class Estrella {
  float x,y;
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
    if(y < -5) {
      x = (int)random(width);
      y = height;
    }
    fill(255);
    ellipse(x,y,size,size);
  }
}
