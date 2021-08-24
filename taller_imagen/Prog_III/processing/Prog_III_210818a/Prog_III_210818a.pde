// variables globales

// declaracion de variable
int entero;
// declaracion e inicializacion de la variable
float decimal = 1.5;

// declaracion de Arrays e inicializacion
int [] enteros = new int [50]; // operador new es tipico 
//en inicializacion de objetos
PImage [] fotos;

PImage imagen;
PVector vector;


// setting primario
void setup() {
  size(800, 800);
  entero = 20;

  // estructuras de control
  // condicinales y loops
  for (int i = 0; i <= 49; i++) {
    //enteros[i] = (int) random(20,40);
    enteros[i] = (2+i)*i;
  }
  
  imagen = loadImage("IMG_5111.jpg");  
  
  println(enteros);
}

// main loop
void draw() {
  background(0);
  image(imagen,0,0);
  
  entero = entero + 1;
  decimal = entero / 1.1;

  println(mouseX+":"+mouseY);
  
  int x = (int) map(mouseX,0,width,2,13);
  int y = int(map(mouseY,0,height,3,21));
  
  for (int i = 0; i < enteros.length; i++) {
    fill(255, 30);
    if((i % x == 0) && ( (enteros[i] % y) == 0)) {
      fill(255,0,0, 30);
    }
    ellipse(enteros[i]/4, enteros[i]/4, enteros[i]/4, enteros[i]/4);
  }
  //println(entero);
  //println(decimal);
}

// BLOQUES SETUP Y DRAW (MAIN LOOP)
// VARIABLES Y SCOPE (ALCANCE) DE LAS MISMAS
// VARIABLES GLOBALES Y VARIABLES LOCALES
// ESTRUCTURAS DE CONTROL CONDICIONALES Y LOOPS
// TESTS BOOLEANOS Y OPERADORES RELACIONES

// MODULO 
// X MOD Y = RESTO DE LA DIVISION Y/X

// MAPEO DE VALORES 
// OBJETOS >> INSTANCIAS DE ALGUNA CLASE
