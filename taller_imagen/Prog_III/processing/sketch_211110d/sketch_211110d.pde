float x, y;

void setup() {
  size(800, 300);
  background(0);
  stroke(255);

  strokeWeight(5);
  int n = 30;
  for (int i = 0; i < n; i++) {

//    int offset = (int)random(50);
//    point(i*width/n,offset+height/2);
    float offset = fibonacci(i)/fibonacci(i+1);
    println(offset);
    point(i*width/n,150*offset);
  }
}


float fibonacci(int n) {
  if (n == 0)
    return 0;
  else if (n == 1)
    return 1;
  else
    return fibonacci(n - 1) + fibonacci(n - 2);
}
