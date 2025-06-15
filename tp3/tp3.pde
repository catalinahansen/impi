// video explicación: https://youtu.be/abhR_2X5JKE 
PImage patron;

float tam = 40;        // Tamaño de cada figura
boolean animar = false; // Comienza apagada

void setup() {
  size(800, 400);
  patron = loadImage("F_47.jpg");
}

void draw() {
  background(255);

  // Parte izquierda: imagen original
  image(patron, 0, 0, 400, 400);

  // Parte derecha: animación o copia de la imagen
  if (animar) {
    for (int i = 400; i < 800; i += int(tam)) {
      for (int j = 0; j < 400; j += int(tam)) {
        float x = i + tam / 2;
        float y = j + tam / 2;
        color c = colorSegunPosicion(x, y); // función que retorna color
        dibujarRombo(x, y, tam, c);         // función que NO retorna
      }
    }
  } else {
    // Imagen original en la derecha hasta que se presione el mouse
    image(patron, 400, 0, 400, 400);
  }
}

// Función que NO retorna valor: dibuja rombo
void dibujarRombo(float x, float y, float size, color c) {
  pushMatrix();
  translate(x, y);
  rotate(radians(45)); // convierte cuadrado en rombo
  fill(c);
  noStroke();
  rectMode(CENTER);
  rect(0, 0, size * 0.9, size * 0.9);
  popMatrix();
}

// Función que RETORNA un color
color colorSegunPosicion(float x, float y) {
  float d = dist(x, y, mouseX, mouseY);
  float r = map(sin(d * 0.05 + frameCount * 0.05), -1, 1, 100, 255);
  float g = map(cos(d * 0.05), -1, 1, 50, 200);
  float b = random(100, 180);
  return color(r, g, b);
}

// Click en la parte derecha: inicia animación
void mousePressed() {
  if (mouseX > 400) {
    animar = true;
    tam = random(30, 60); // también cambia el tamaño
  }
}

// Tecla R reinicia todo
void keyPressed() {
  if (key == 'r' || key == 'R') {
    tam = 40;
    animar = false;
  }
}
