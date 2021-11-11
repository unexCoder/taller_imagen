void setup() {
  //println(fibonacci(0)); // 0
  //println(fibonacci(1)); // 1
  //println(fibonacci(2)); // 1
  //println(fibonacci(3)); // 2
  //println(fibonacci(4)); // 3
  //println(fibonacci(5));   // 5
  //println(fibonacci(6));   // 8  


  for (int i = 0; i < 25; i++) {
    println(fibonacci(i));
  }
}

// funcion recursiva
int fibonacci(int n) {
  if (n == 0)
    return 0;
  else if (n == 1)
    return 1;
  else
    return fibonacci(n - 1) + fibonacci(n - 2);
}
