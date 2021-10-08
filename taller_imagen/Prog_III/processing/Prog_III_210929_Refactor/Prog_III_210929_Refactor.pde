Nave [] naves;
Estrella [] fondo;
NaveAmiga player;
ArrayList<Bala> balas = new ArrayList<Bala>();
ArrayList<Onda> ondas = new ArrayList<Onda>();

void setup() {
  size(displayWidth, displayHeight);
  frameRate(60);
  // enemies >> constructor 
  naves = new Nave [6];
  for (int i = 0; i < naves.length-1; i++) {
    naves[i] = new Nave();
  }
  // fondo
  fondo = new Estrella [300];
  for (int i = 0; i < fondo.length-1; i++) {
    fondo[i] = new Estrella();
  }
  // player 1 >> constructor
  player = new NaveAmiga();
}

void draw() {
  background(0);
  
  // display fondo
  for (int i = 0; i < fondo.length-1; i++) {
    fondo[i].display();
  }

  // display and move enemies
  for (int i = 0; i < naves.length-1; i++) {
    naves[i].move();
    naves[i].display();
    for (int j = i+1; j < naves.length-1; j++) {
      naves[i].chekCollision(naves[j]);
    }
  }

  // display player 1
  player.display();

  // display player bullets
  for (Bala b : balas) {
    b.display();
  }
  println(balas.size());
  // display ondas
  for (Onda o : ondas) {
    o.display();
  }
}

// calback
void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      player.move(-1);
    } else if (keyCode == RIGHT) {
      player.move(1);
    }
  } else if (key == 32) {
    //player.disparo();
    balas = player.disparo(balas);
  }
}
