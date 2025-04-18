PImage fotoretrato;
fotoretrato = loadImage ("mi_Foto.jpg");
//marco
size (800,400);
background (207,255,144);
image (fotoretrato, 0, 0 , 400,400);
// PELO
fill (0,0,0);
rect (500,100,200,200,20,20,20,20);

//CARA
fill (242,203,144);
ellipse (600,200,200,200);
arc(595, 240, 80, 40, 0, PI);
// OJOS 
fill (255,255,255);
strokeWeight(4);

ellipse (550,200,50,50);
ellipse (650,200,50,50);
fill (0,0,0);
ellipse (550,200,10,10);
ellipse (650,200,10,10);
strokeWeight(4);
line (555, 175, 655, 175);

//CUERPO
fill (111,201,255);
strokeWeight(1);
rect (500,300,200,200);
rect (400,300,100,100);
rect (700,300,100,100);
// PELO
fill (0,0,0);
arc (600,200,200,200, PI,PI*3/2, CHORD);
