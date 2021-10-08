// fondo estrellado
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
    strokeWeight(1);
    ellipse(x, y, size, size);
  }
}
