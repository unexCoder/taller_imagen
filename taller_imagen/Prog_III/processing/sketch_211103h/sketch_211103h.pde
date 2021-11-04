int factorial(int n) {
  int f = 1;
  for (int i = 0; i < n; i++) {
    f = f * (i+1);
  }
  return f;
}

int factorial_recursiva(int n) {
  if (n == 1) {
    return 1;
  } else {
    return n * factorial_recursiva(n-1);
  }
}

void drawCircle(int x, int y, float radius) {
  ellipse(x, y, radius, radius);
  if(radius > 2) {
    radius *=  0.75f;
    drawCircle(x, y, radius);
  }
}

void setup() {
  println(factorial(4));
  println(factorial_recursiva(4));
  noFill();
  size(400,400);
  background(0);
  stroke(255);
  drawCircle(width/2,height/2,width);
}

// serie de fibonacci y el numero de oro
