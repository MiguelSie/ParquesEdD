class Tablero {
private Juego j;
private int filas;
private int columnas;
private int CasillasX;
private int CasillasY;
private int cont;
private int n = 1;
private int sw = 0;
private int c = 0;
private int fichaJugar = 1; //Si la variable tiene un valor de 1, juega azul, 2 verde y 3 roja
Dado d;
Casilla ptr;
Casilla casillaRoja;
Casilla casillaAzul;
Casilla casillaVerde;
int numCasillas = 48;

public Tablero(){
this.filas = 15;
this.columnas = 1;
this.CasillasX = 60;
this.CasillasY = 35;
this.cont = 0;
d = new Dado();
ptr = null;
for (int i = 1; i<=48; i++){
  ptr = addCasilla(ptr);
}
casillaRoja = ptr;
casillaAzul = ptr;
casillaVerde = ptr;
}

public void mostrar(){
  background(255);
  
  d.mostrar(n);
  
  pushMatrix();
  translate(width*0.5, height*0.5);
  fill(255);
  rotate(74.88);
  poligono(0, 0, 300, 3);
  noFill();
  popMatrix();
  
  pushMatrix();
  translate(833, 40);
  rotate(radians(90));
  dibujarCasillas(1);
  translate(510,260);
  rotate(radians(60));
  dibujarCasillas(2);
  translate(-25, -50);
  rotate(radians(60));
  dibujarCasillas(3);
  popMatrix();

  strokeWeight(5);
  line(310, 95, 560, 250);
  line(835, 95, 560, 250);
  line(570, 540, 560, 250);

  line(310, 40, 260, 120);
  line(830, 40, 882, 123);
  line(520, 580, 615, 580);
  strokeWeight(8);
  
  acciones();
  c++;
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
  
  
void dibujarCasillas(int n){
  cont = n;
  for(int c=0; c<columnas; c++){
      for(int r=0; r<filas; r++){
        float sx = c*CasillasX;
        float sy = r*CasillasY;
        if(r == 7 && cont == 1){
           color cl = color(200, 0, 0);
           stroke(0);
           strokeWeight(5);
           rectMode(CORNER);
           fill(cl);
           rect(sx, sy, CasillasX, CasillasY);
           fill(0);
           text("E/S", sx+30, sy+15);
           strokeWeight(8);
        } else {
          if(r == 7 && cont == 2){
             color cl = color(0, 200, 0);stroke(0);
             strokeWeight(5);
             rectMode(CORNER);
             fill(cl);
             rect(sx, sy, CasillasX, CasillasY);
             fill(0);
             text("E/S", sx+30, sy+15);
             strokeWeight(8);
          } else{
            if(r == 7 && cont == 3){
               color cl = color(0, 0, 200);
               stroke(0);
               strokeWeight(5);
               rectMode(CORNER);
               fill(cl);
               rect(sx, sy, CasillasX, CasillasY);
               fill(0);
               text("E/S", sx+30, sy+15);
               strokeWeight(8);
            } else {
               color cl = color(255);
               stroke(0);
               strokeWeight(5);
               rectMode(CORNER);
               fill(cl);
               rect(sx, sy, CasillasX, CasillasY);
               strokeWeight(8);
              }
            }
          }
       }
  }
}

public Casilla addCasilla (Casilla ptr){
  Casilla p = ptr;
  Casilla q = new Casilla();
  if (ptr == null){
    ptr = q;
    q.link = ptr;
  } else {
    while (p.link != ptr){
      p = p.link;
    }
    p.link = q;
    q.link = ptr;
  }
  return ptr;
}

public void actualizarPos(int n, Casilla p, int t){
  int c = 0;
  switch (t){
    case 1:
    p.fichaAON = false;
    while (c < n){
      p = p.link;
      c++;
    }
    p.fichaAON = true;
    case 2:
    p.fichaVON = false;
    while (c < n){
      p = p.link;
      c++;
    }
    p.fichaVON = true;
    case 3:
    p.fichaRON = false;
    while (c < n){
      p = p.link;
      c++;
    }
    p.fichaRON = true;
  }
}

public void jugar(int n){
  if (fichaJugar == 1){
    j.FA.setXY(j.FA.getX()+10*n, j.FA.getY());
    actualizarPos(n, casillaAzul, 1);
    fichaJugar = 2;
  } else if (fichaJugar == 2){
    j.FV.setXY(j.FV.getX()+10*n, j.FV.getY());
    fichaJugar = 3;
  } else if (fichaJugar == 3){
    j.FR.setXY(j.FR.getX()+10*n, j.FR.getY());
    fichaJugar = 1;
  }
}

public void acciones(){
    if(mousePressed){
      if (d.isInside() && sw==0){
       n = d.getResultado();
       jugar(n);
       sw = 1;
      }  
    }
    if (c%60==0){
    sw = 0;
    c = 0;
  }
}

public void setJuego(Juego j){
  this.j = j;
}

}
