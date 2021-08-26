void nave(int x, int y, float escala, float rotacion) {
  noStroke();  
  pushMatrix();
  translate(x,y);
  scale(escala);
  rotate(rotacion);
  fill(255,0,255,150);
  ellipse(0,0,50,100);  
  fill(0,255,255,150);
  ellipse(0,0,100,50);
  stroke(255);
  strokeWeight(3);
  noFill();
  ellipse(0,0,rotacion*30,rotacion*30);
  popMatrix();
}
