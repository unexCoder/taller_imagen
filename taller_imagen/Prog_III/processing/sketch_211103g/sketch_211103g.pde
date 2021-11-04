// A Polar coordinate
float r = 75;
float theta = 0;
void setup() {
  size(200, 200);
  background(0);
  smooth();
}
void draw() {
  // Polar to Cartesian conversion
  float x = (r + noise(theta)*22) * cos(theta);
  float y = (r + noise(theta)*22)* sin(theta);
  // Draw an ellipse at x,y
  noStroke();
  fill(255,50);
  ellipse(x+width/2, y+height/2, 1, 1); // Adjust for center of window
  // Increment the angle
  theta += 0.01;
}
