Nave [] naves;
Estrella [] fondo;
NaveAmiga player;

void setup() {
  size(displayWidth, displayHeight);
  frameRate(60);
  // naves
  naves = new Nave [6];
  for (int i = 0; i < naves.length-1; i++) {
    naves[i] = new Nave();
  }
  // fondo
  fondo = new Estrella [300];
  for (int i = 0; i < fondo.length-1; i++) {
    fondo[i] = new Estrella();
  }
  // jugador
  player = new NaveAmiga();
}

void draw() {
  background(0);

  for (int i = 0; i < fondo.length-1; i++) {
    fondo[i].display();
  }

  for (int i = 0; i < naves.length-1; i++) {
    naves[i].move();
    naves[i].display();
    for (int j = i+1; j < naves.length-1; j++) {
      naves[i].chekCollision(naves[j]);
    }
  }

  player.display();
}

// calback
void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      player.move(-1);
    } else if (keyCode == RIGHT) {
      player.move(1);
    }
  }
}
