Nave n, n2, n3;

void setup() {
  size(800, 800);
  frameRate(60);
  // llamadas al constructor de la clase Nave(2 veces!)
  n = new Nave(width/2, height/2, 1);
  n2 = new Nave(width/3, height/4, 0.5);
  n3 = new Nave(0, 0, 0.75);
}

void draw() {
  background(0);
  //fill(0,30);
  //rect(0,0,width,height);

  n.display();
  n2.display();
  n3.position(mouseX,mouseY);
  n3.display();
}

// calback
void keyPressed() {
  if (key == 32) {
    n.disparo();
  } 
  if (key == 'a') {
    n2.disparo();
  }
  if (key == 's') {
    n3.disparo();
  }
}
