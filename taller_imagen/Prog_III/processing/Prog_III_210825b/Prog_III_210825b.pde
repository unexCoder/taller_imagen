float r = 1;

void setup() {
  size(800, 800);
}

void draw() {
  background(0);
  nave(mouseX, mouseY, 1, r);
  r = r+0.1;
}
