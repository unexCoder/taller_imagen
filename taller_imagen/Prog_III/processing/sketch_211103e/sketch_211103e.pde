
void setup () {
  size(800,400);
  background(0);
  stroke(255);
  float t = 0;
  for (int x = 0; x < width; x++) {
    ellipse(x,((2*height)/3)*noise(t),1,1);
    t += 0.01;
  }
}
