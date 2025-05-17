PImage fotoUno;
PImage fotoDos;
PImage fotoTres;
PFont fuente;

int pantalla = 0;
int totalPantallas = 3;
int tiempoPorPantalla = 3000; // 3 segundos por pantalla
int tiempoInicio;
boolean mostrarBoton = false;

float textoX = -300; // posición inicial para animación de entrada
float textoVelocidad = 2;

void setup() {
  size(640, 480);
  fotoUno = loadImage("ca-times.brightspotcdn.jpg");
  fotoDos = loadImage("RAIN+ROOM,+2012++.jpeg");
  fotoTres = loadImage("rainroomheader_lead.jpg");
  
  fuente = createFont("BLUE OCEAN.ttf", 38);
  textFont(fuente);
  
  tiempoInicio = millis();
}

void draw() {
  background(0);
  
  if (pantalla < totalPantallas) {
    // Mostrar imagen correspondiente a la pantalla
    if (pantalla == 0) {
      image(fotoUno, 0, 0, width, height);
    } else if (pantalla == 1) {
      image(fotoDos, 0, 0, width, height);
    } else if (pantalla == 2) {
      image(fotoTres, 0, 0, width, height);
    }

    // Mostrar texto animado
    fill(255);
    textSize(15);
    text(textoDePantalla(pantalla), textoX, height - 50);
    textoX += textoVelocidad;

    // Avanzar automáticamente a la siguiente pantalla
    if (millis() - tiempoInicio > tiempoPorPantalla) {
      pantalla++;
      textoX = -300;
      tiempoInicio = millis();
    }
  } else {
    mostrarBoton = true;
    mostrarPantallaFinal();
  }
}

String textoDePantalla(int num) {
  if (num == 0) return "RAIN ROOM, DE RANDOM INTERNATIONAL";
  if (num == 1) return "ES UN CAMPO DE100M² DE AGUA QUE CAE, DEL CUAL ES POSIBLE CAMINAR.";
  if (num == 2) return "CONFIANDO EN QUE UN CAMINO PUEDE SER RECORRIDO SIN MOJARSE.";
  return "";
}

void mostrarPantallaFinal() {
  background(50);
  fill(255);
  textAlign(CENTER);
  textSize(32);
  text("Fin de la presentación", width / 2, height / 2 - 50);

  // Botón de reinicio
  fill(100, 200, 255);
  rect(width / 2 - 60, height / 2, 120, 40, 10);
  fill(0);
  text("Reiniciar", width / 2, height / 2 + 25);
}

void mousePressed() {
  if (mostrarBoton) {
    if (mouseX > width / 2 - 60 && mouseX < width / 2 + 60 &&
        mouseY > height / 2 && mouseY < height / 2 + 40) {
      pantalla = 0;
      textoX = -300;
      tiempoInicio = millis();
      mostrarBoton = false;
    }
  }
}
