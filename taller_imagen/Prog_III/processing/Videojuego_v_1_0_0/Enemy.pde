// declaracion de la clase Nave

// un objeto es una entidad que encapsula una serie de datos
// y una cantidad de funciones que operan con esos datos

class Nave {
  int x, y;
  float rota;
  float angulo;
  int vel;
  int shot;

  // funciones o METODOS

  // default constructor
  Nave() {
    x = (int) random(100, width-100);
    y = (int) random(-1800, -600);
    rota = random(PI);
    angulo = random(PI);
    vel = 2;
    shot = (int) random(25, 50);
  }

  void rotacion() {
    angulo += 0.1;
    rota += 0.1+(0.05 * abs(sin(angulo)));
  }

  ArrayList shot(ArrayList ondas) {
    if (frameCount % shot == 0) {
      Onda o = new Onda(this.x, this.y);
      ondas.add(o);
      shot = (int) random(300, 600);
    }
    return ondas;
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
      x+=distancia;
      y+=distancia;
    }
  }
  
  boolean checkBulletColision(Bala b) {
    boolean shoted = false;
    float dist = dist(this.x,this.y,b.x,b.y);
    if(dist <= 50) {
      shoted = true;
      println("shoted>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    }
    return shoted;
  }

  void display() {
    this.rotacion();
    noStroke();
    // STACK 3D
    pushMatrix();
    translate(x, y);
    rotate(rota);
    fill(255, 0, 255);
    ellipse(0, 0, 25, 50);
    fill(0, 255, 255);
    ellipse(0, 0, 50, 25);
    popMatrix();
  }
}

///////////

class Nave2 extends Nave {
   
  Nave2() {
    super(); // llamada al constructor de la superclase
  }
  
  void display() {
    this.rotacion();
    noStroke();
    // STACK 3D
    pushMatrix();
    translate(x, y);
    rotate(rota);
    fill(255, 255, 0);
    ellipse(0, 0, 25, 50);
    fill(255, 0, 255);
    ellipse(0, 0, 50, 25);
    popMatrix();
  } 
}

// 
class Nave3 extends Nave2 {
    Nave3() {
      super(); // llamada al constructor de la superclase
  }
  
  void display() {
    this.rotacion();
    noStroke();
    // STACK 3D
    pushMatrix();
    translate(x, y);
    rotate(rota);
    fill(0);
    ellipse(0, 0, 25, 50);
    fill(255);
    ellipse(0, 0, 50, 25);
    popMatrix();
  } 
}

// 
class Nave4 extends Nave {
    Nave4() {
      super(); // llamada al constructor de la superclase
  }
  
  void display() {
    noStroke();
    // STACK 3D
    pushMatrix();
    translate(x, y);

///
//DIBUJO
    rectMode(CENTER);
    fill(255,0,0);
    rect(0,0,30,30);
///
    
    
    popMatrix();
  } 
}
