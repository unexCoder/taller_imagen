
void setup () {
  rectMode(CENTER);
}

void draw () {
  background(0);

  translate(width/2,height/2);
  rotate(frameCount/100.0);
  rect(0, 0, 80, 80);
}
