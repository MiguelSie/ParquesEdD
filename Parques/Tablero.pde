class Tablero {
private int filas;
private int columnas;
private int CasillasX;
private int CasillasY;

public Tablero(){
this.filas = 15;
this.columnas = 1;
this.CasillasX = 60;
this.CasillasY = 35;
}

public void mostrar(){
  background(255);
  pushMatrix();
  translate(width*0.5, height*0.5);
  fill(255);
  rotate(74.88);
  poligono(0, 0, 300, 3);
  noFill();
  popMatrix();
  
  translate(833, 40);
  rotate(radians(90));
  dibujarCasillas();
  translate(510,260);
  rotate(radians(60));
  dibujarCasillas();
  translate(0, 0);
  rotate(radians(60));
  dibujarCasillas();
  
}

void poligono(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius-60;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
  
  
void dibujarCasillas(){
  for(int r=0; r<filas; r++){
      for(int c=0; c<columnas; c++){
        float sx = c*CasillasX;
        float sy = r*CasillasY;
        stroke(0);
        strokeWeight(5);
        fill(255);
        rectMode(CORNER);
        rect(sx, sy, CasillasX, CasillasY);
        strokeWeight(8);
      }
  }
}

  
}
