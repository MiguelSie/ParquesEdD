class Tablero {
private Juego j;
private int filas;
private int columnas;
private int CasillasX;
private int CasillasY;
private int fichaJugar = 2; //Si la variable tiene un valor de 1, juega azul, 2 verde y 3 roja
private int n = 1, sw = 0, c = 0, contR = 0, contV = 0, contA = 0;
private boolean primeraV = true, primeraA = true, primeraR = true;
Dado d;
Casilla ptr, casillaRoja, casillaAzul, casillaVerde;
int numCasillas = 48;

public Tablero(){
this.filas = 15;
this.columnas = 1;
this.CasillasX = 60;
this.CasillasY = 35;
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
  background(fondo);
  
  fill(0);
  text("Jugador:",80,330);
  switch(fichaJugar){
    case 1:
      text("Azul",160,330);
      break;
    case 2:
      text("Verde",160,330);
      break;
    case 3:
      text("Rojo",160,330);
      break;
    default:
      text("Indeterminado",160,330);
  }
  noFill();
  d.mostrar(n);
  
  fill(255);
  strokeWeight(5);
  poligono(310,159,68,6);
  poligono(830,159,68,6);
  poligono(570,610,68,6);
  strokeWeight(8);
  noFill();
  
  pushMatrix();
  translate(600, 300);
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
  line(310, 95, 565, 245);
  line(835, 95, 565, 245);
  line(570, 540, 565, 245);
  
  rectMode(CENTER);
  fill(255,0,0);
  rect(565,160,130,105,20);
  
  pushMatrix();
  fill(0,255,0);
  translate(490,230);
  rotate(radians(60));
  rect(50,30,130,100,20);
  popMatrix();
  
  pushMatrix();
  fill(0,0,255);
  translate(640,230);
  rotate(radians(-60));
  rect(-50,35,130,105,20);
  popMatrix();
  
  stroke(0);
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
  
  
void dibujarCasillas(int i){
  int cont = i;
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
    while (c < n && contA < 48){
      p = p.link;
      c++;
      contA++;
    }
    if(contA == 48){
      j.FA.setGanador();
    }
    p.fichaAON = true;
    case 2:
    p.fichaVON = false;
    while (c < n && contV < 48){
      p = p.link;
      c++;
      contV++;
    }
    if(contR == 48){
      j.FV.setGanador();
    }
    p.fichaVON = true;
    case 3:
    p.fichaRON = false;
    while (c < n && contR < 48){
      p = p.link;
      c++;
      contR++;
    }
    if(contR == 48){
      j.FR.setGanador();
    }
    p.fichaRON = true;
  }
}

public void jugar(int n){
  if (fichaJugar == 1){
    if(n == 6 && primeraA == true){
      j.FA.setXY(725,340);
      actualizarPos(0,casillaAzul,1);
      primeraA = false;
      fichaJugar = 2;
    } else if (n!= 6 && primeraA == true){
      fichaJugar = 2;
    } else if (primeraA == false) {
        j.FA.setXY(j.FA.getX()+40*n, j.FA.getY());
        actualizarPos(n, casillaAzul, 1);
        fichaJugar = 2;
      }
    } else if (fichaJugar == 2){
        if(n == 6 && primeraV == true){
            j.FV.setXY(420,340);
            actualizarPos(0,casillaVerde,2);
            primeraV = false;
            fichaJugar = 3;
        }else if (n!= 6 && primeraV == true) {
          fichaJugar = 3;
        }else if (primeraV == false){
            j.FV.setXY(j.FV.getX()+40*n, j.FV.getY());
            actualizarPos(n, casillaVerde, 2);
            fichaJugar = 3;
          }
    } else if (fichaJugar == 3){
        if(n == 6 && primeraR == true){
            j.FR.setXY(570,70);
            actualizarPos(0,casillaRoja,3);
            primeraR = false;
            fichaJugar = 1;
        }else if(n!=6 && primeraR==true) {
            fichaJugar = 1;
        }else if (primeraR == false) {
          if (contR < 8 || (contR >= 40 && contR < 48)){
            j.FR.setXY(j.FR.getX()+35*n, j.FR.getY());
            contR+=n;
            System.out.println(contR);             
          } if (contR >= 8 && contR < 24){
            j.FR.setXY(j.FR.getX()-10*n, j.FR.getY()-10*n);
            contR+=n;
            System.out.println(contR);
          } if (contR >= 24 && contR < 40){
            j.FR.setXY(j.FR.getX()-10*n, j.FR.getY()+10*n);
            contR+=n;
            System.out.println(contR);
          }
          actualizarPos(n, casillaRoja, 3);
          fichaJugar = 1;
          }
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
