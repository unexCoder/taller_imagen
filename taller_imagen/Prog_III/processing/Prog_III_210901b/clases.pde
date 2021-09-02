// declaracion de la clase Nave

// un objeto es una entidad que encapsula una serie de datos
// y una cantidad de funciones que operan con esos datos

class Nave {
  int x, y;
  float escala, rota;
  boolean disparo;

  float angulo;
  //int onda;
  
  Onda o = new Onda(0,0,0);  
  // funciones o METODOS
  // constructor
  Nave(int _x, int _y, float _escala) {
    x = _x;
    y = _y;
    escala = _escala;
    rota = 0;
    disparo = false;
    angulo = 0;
  }

  void rotacion() {
    angulo += 0.1;
    rota += 0.1+(0.05 * abs(sin(angulo)));
  }

  void arma() {
    if (disparo) {
      o = new Onda(this.x,this.y,this.escala);
      disparo = false;
    }
    o.display();
  }

  void disparo() {
    disparo = true;
  }
  
  // setter 
  void position(int _x, int _y) {
    x = _x; y = _y;
  }

  void display() {
    this.rotacion();
    this.arma();

    noStroke();  
    // STACK 3D
    pushMatrix();
    translate(x, y);
    scale(escala);
    rotate(rota);
    fill(255, 0, 255, 150);
    ellipse(0, 0, 50, 100);  
    fill(0, 255, 255, 150);
    ellipse(0, 0, 100, 50);
    popMatrix();
  }
}

class Onda {
  int x, y;
  float escala;
  int alcance;
  
  Onda(int _x,int _y,float _escala ) {
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

/*
   Nave() {
     new Onda();
   }
*/
