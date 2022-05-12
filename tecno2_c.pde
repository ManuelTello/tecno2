Line [] lineas = new Line[222];

int gros, rnd, offset, index, spacing, color_op;
float color1, color2, angle_off;
boolean debase;
float [] limits = {random(30,50), random(80,120), random(100,140), random(140,160)};

void setup() {
  size(500, 800, P2D);
  colorMode(HSB, 259, 100, 100);

  // Globales
  gros = 4;
  offset = 0;
  index = 0;
  spacing = 40;
  debase = false;
  rnd = int(random(30, 100));
  angle_off = 10;

  // Set classes
  for (int i=0; i<lineas.length; i++) {
    lineas [i] = new Line();
  }
}

void draw() {
  background(0, 0, 0);
  strokeWeight(gros);
  translate(width/2, 0);

  drawGroup();
}

void drawGroup() {
  stroke(0, 100, 100);
  for (int i=0; i<lineas.length; i++) {
    color1 = map(mouseY, 0, height, limits[0],limits[1]);
    color2 = map(mouseY, 0, height, limits[2], limits[3]);
    stroke(i < lineas.length / 2 ? color1 + i / 2 : color2 + i / 2, 100, i %  2 == 0 ? 0 : map(angle_off,10,200,40,100));

    offset = i > lineas.length / 2 - 1 ? rnd : int(map(i, 0, lineas.length / 2 - 1, rnd / 3, (rnd / 3) * - 1));
    lineas[i].setPosition(x(index+i), gros * i, width/2, gros * i - offset);
    lineas[i].drawLine();
  }
  
  simulatePressing();
  index++;
}

float x(float t) {
  return sin(t/spacing) * angle_off;
}

void simulatePressing() {
  println(angle_off);
  if (mousePressed && frameCount % 8 == 0 && angle_off < 200) {
    angle_off ++ ;
  } else if(!mousePressed && frameCount % 8 == 0 && angle_off > 10){
    angle_off -- ;
  }
}
