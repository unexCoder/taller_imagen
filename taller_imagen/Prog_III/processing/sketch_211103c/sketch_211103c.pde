void setup() {
  size(200, 200);
  background(255);
  smooth();
  noStroke();
}
void draw() {
  // Probabilities for 3 different cases
  // These need to add up to 100%!
  float red_prob = 0.60; // 60% chance of red color float green_prob = 0.10; // 10% chance of green color float blue_prob = 0.30; // 30% chance of blue color
  float green_prob = 0.10; // 10% chance of green color float blue_prob = 0.30; // 30% chance of blue color
  float blue_prob = 0.30; // 30% chance of blue color
  float num = random(1); // pick a random number between 0 and 1
  // If random number is less than .6
  if (num < red_prob) {
    fill(255, 53, 2, 150);
    // If random number is between .6 and .7
  } else if (num < green_prob + red_prob) {
    fill(156, 255, 28, 150);
    // All other cases (i.e. between .7 and 1.0)
  } else {
    fill(10, 52, 178, 150);
  }
  ellipse(random(width), random(height), 64, 64);
}
