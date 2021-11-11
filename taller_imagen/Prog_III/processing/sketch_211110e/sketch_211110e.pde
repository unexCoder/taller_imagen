void setup() {
  size(800,800);
  background(0);
  stroke(255);
  fill(120,1);
  recursiva(20,20);
}

void recursiva(float x, float y) {
  rect(x,y,x*y,x/0.9*y);
  if(x<500) {
    recursiva(x*1.1,y*1.1);
  }
}
