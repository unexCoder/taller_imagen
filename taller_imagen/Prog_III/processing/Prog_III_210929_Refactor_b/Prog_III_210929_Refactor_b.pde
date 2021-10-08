// variables globales
Estrella [] fondo;
Nave [] naves;
NaveAmiga player;
ArrayList<Bala> balas = new ArrayList<Bala>();
ArrayList<Onda> ondas = new ArrayList<Onda>();

void setup() {
  size(displayWidth, displayHeight);
  frameRate(60);
  // enemies >> constructor 
  naves = new Nave [2];
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
    ondas = naves[i].shot(ondas);
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
  println("balas: "+balas.size());
  
  // display ondas
  for (Onda o : ondas) {
    o.display();
  }
  println("ondas: "+ondas.size());
  
  // colisiones
  for (int i = 0; i < naves.length-1; i++) {
    for (Bala b : balas) {
      naves[i].checkBulletColision(b);
    }
  }
  for (Onda o : ondas) {
    player.checkWaveColision(o);
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
    balas = player.disparo(balas);
  }
}
