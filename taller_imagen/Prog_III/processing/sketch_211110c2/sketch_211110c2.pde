float radio = 1;
float x, y;
float tetha = 0;

void setup() {
  size(800, 800);
  background(0);
  stroke(255);

  int n = 30;
  for (int i = 0; i < n; i++) {

    x = sin(tetha) * radio;
    y = cos(tetha) * radio;

    line(width/2, height/2, (width/2) + x, (height/2) + y);
    tetha += TWO_PI/n;
    //    println(tetha);
    radio += fibonacci(i+1)/200;
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
