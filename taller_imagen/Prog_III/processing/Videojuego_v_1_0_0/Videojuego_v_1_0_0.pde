// variables globales
Estrella [] fondo;
ArrayList<Nave> naves = new ArrayList<Nave>();
NaveAmiga player;
ArrayList<Bala> balas = new ArrayList<Bala>();
ArrayList<Onda> ondas = new ArrayList<Onda>();

int score;
PFont f;

void setup() {
  size(displayWidth, displayHeight);
  frameRate(60);

  // enemies >> constructor
  int num_enemies = 12;
  for (int i = 0; i < num_enemies; i++) {
    float r = random(1);
    if (r > 0.5) {
      naves.add(new Nave4());
    } else {
      naves.add(new Nave4());
    }
  }
  // fondo
  fondo = new Estrella [300];
  for (int i = 0; i < fondo.length-1; i++) {
    fondo[i] = new Estrella();
  }
  // player 1 >> constructor
  player = new NaveAmiga();

  score = 0;
  f = createFont("HelveticaNeue-Bold", 48);
}

void draw() {
  background(0);

  // display fondo
  for (int i = 0; i < fondo.length-1; i++) {
    fondo[i].display();
  }

  // move and display enemies
  for (Nave n : naves) {
    n.move();
    ondas = n.shot(ondas);
    n.display();
  }

  // display player 1
  player.display();

  if (balas.size()>0) {
    // display player bullets
    for (Bala b : balas) {
      b.display();
    }

    // remove offscreen bullets
    for (int i = 0; i < balas.size(); i++) {
      Bala b = balas.get(i);
      if (b.y < -10) {
        balas.remove(i);
      }
    }
  }
  println("balas: "+balas.size());

  if (ondas.size()>0) {
    // display ondas
    for (Onda o : ondas) {
      o.display();
    }
    // remove offscreen ondas
    for (int i = 0; i < ondas.size(); i++) {
      Onda o = ondas.get(i);
      if (o.alcance > 1500) {
        ondas.remove(i);
      }
    }
  }
  println("ondas: "+ondas.size());


  // colisiones
  if ((naves.size()>0) && (balas.size()>0)) {
    for (int i = 0; i < naves.size()-1; i++) {
      for (int j = 0; j < balas.size()-1; j++) {


        Bala b = balas.get(j);
        Nave n = naves.get(i);

        boolean shot =  n.checkBulletColision(b);
        if (shot) {
          balas.remove(j);
          naves.remove(i);
          score += 20;
        }
      }
    }
  }

  if (ondas.size()>0) {
    for (int i = 0; i <= ondas.size()-1; i++) {
      Onda o = ondas.get(i);
      boolean shoted = player.checkWaveColision(o);
      if (shoted) {
        println("...>>>> shoted");
        ondas.remove(i);
        score -= 10;
      }
    }
  }

  // colision balas/ondas
  // try catch para evitar crash!
  try { 
    if ((ondas.size()>0) && (balas.size()>0)) {
      for (int i = 0; i < ondas.size(); i++) {
        for (int j = 0; j < balas.size(); j++) {
          Onda o = ondas.get(i);
          Bala b = balas.get(j);
          boolean shotOnda =  o.checkBulletColision(b);
          if (shotOnda) {
            balas.remove(j);
            ondas.remove(i);
            score+=5;
          }
        }
      }
    }
  } 
  catch (Exception e) {
    println("error inesperado >>>>>");
  }


  textFont(f);
  textSize(88);
  fill(255, 0, 0);
  text(score, 20, 120);
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
