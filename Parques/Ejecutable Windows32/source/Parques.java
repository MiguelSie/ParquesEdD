import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Parques extends PApplet {

//Se carga todo el parqués
public int pantalla;
public PImage fondo;
private inicio I;
private Juego j;

//Se carga la imagen de fondo, el tamaño del proyecto y el objeto Pantalla de inicio y el Objeto Juego.
public void setup(){
  fondo = loadImage("/Accesorios/Imagenes/Madera.jpg");
  fondo.resize(1200,650);
  
  pantalla=0;
  I = new inicio();
  j = new Juego();
}

//Se dibuja la pantalla dependiendo del caso.
public void draw(){
  switch (pantalla){
  case 0:
    I.mostrar();
    break;
  case 1:
    j.mostrar();
    break;
  }
  
}

//Revisa qué ocurre si el mouse fue presionado según qué pantalla esté
public void mousePressed(){
  if(pantalla==0){
    I.pressed();
  }
}

//Revisa qué hacer según en qué pantalla fue presionada una tecla
public void keyPressed(){
  if(pantalla==0){
    I.kpressed();
  }
}
//Cambiar el color del botón a grís y el highlight a negro
class boton{
  private String txt;
  private float txtSize, x, y, w, h;
  
  //Constructor del boton
  public boton(String txt, float txtSize, float x, float y, float w, float h){
    this.txt= txt;
    this.txtSize= txtSize;
    this.x= x;
    this.y= y;
    this.w= w;
    this.h= h;
  }
  
  //Dibuja el boton
  public void display(){
    rectMode(CENTER);
    fill(240);
    stroke(isInside()? color(120) : color(0));
    strokeWeight(8);
    rect(x,y,w,h, 10);
    
    //Dibuja el texto del boton
    textAlign(CENTER, CENTER);
    textSize(txtSize);
    fill(0);
    text(txt, x, y-2);
  }
  
  //Verifica si el cursor esta dentro del boton
  public boolean isInside() {
    return mouseX > (x-w/2) & mouseX < (x+w/2) & mouseY > (y-h/2) & mouseY < (y+h/2);
  }
}
class Casilla {
  
  //Booleanos para determinar si la ficha está en la casilla/nodo o no y su respectivo apuntador.
  boolean fichaVON = false;
  boolean fichaRON = false;
  boolean fichaAON = false;
  
  Casilla link;
}
class Dado {
  
  //Se declara un arreglo con los valores posibles de resultado y las variables de posición, ancho y alto.
  private int [] resultados = {1,2,3,4,5,6};
  private int x, y, w, h;
  
  public Dado() {
    this.x= 120;
    this.y= 400;
    this.w = 80;
    this.h = 80;
  }
  
  //Función random para generar un numero aleatorio entre 1 y 6
  public int getResultado(){
    int indice = PApplet.parseInt(random(6));
    int n = resultados[indice];
    return n;   
  }
  
  
  //Se dibuja el dado
  public void mostrar(int num){
    int n = num;
    rectMode(CENTER);
    fill(255);
    stroke(isInside()? color(200) : color(0));
    strokeWeight(8);
    rect(x, y, w, h, 20);
    
    //Se dibuja el número del dado dependiendo del caso
    switch(n){
      case 1:
          fill(0);
          circle(x, y, 5);
          noFill();
          break;
      case 2:
          fill(0);
          circle(x-20, y-20, 5);
          circle(x+20, y+20, 5);
          noFill();
          break;
      case 3:
          fill(0);
          circle(x-20, y-20, 5);
          circle(x, y, 5);
          circle(x+20, y+20, 5);
          noFill();
          break;
      case 4:
          fill(0);
          circle(x-20, y-20, 5);
          circle(x-20, y+20, 5);
          circle(x+20, y-20, 5);
          circle(x+20, y+20, 5);
          noFill();
          break;
      case 5:
          fill(0);
          circle(x-20, y-20, 5);
          circle(x-20, y+20, 5);
          circle(x, y, 5);
          circle(x+20, y-20, 5);
          circle(x+20, y+20, 5);
          noFill();
          break;
      case 6:
          fill(0);
          circle(x-20, y-20, 5);
          circle(x-20, y+20, 5);
          circle(x-20, y, 5);
          circle(x+20, y, 5);
          circle(x+20, y-20, 5);
          circle(x+20, y+20, 5);
          noFill();
          break;
    }
    stroke(0);
  }
  
  //Se verifica si el raton está encima del dado
  public boolean isInside() {
    return mouseX > (x-w/2) & mouseX < (x+w/2) & mouseY > (y-h/2) & mouseY < (y+h/2);
  }

}
//Clase ficha para cada una

class Ficha {
  private String nombre;
  private int Color;
  private float x, y;
  private int spawnX, spawnY;
  private boolean ganador = false;
  
  public Ficha (int Color, int x, int y){
    this.Color = Color;
    this.x = x;
    this.y = y;
    this.spawnX = x;
    this.spawnY = y;
  }
  
  //Muestra la ficha
  public void mostrar(){
    fill(Color);
    circle (x,y,20);
    noFill();
  }
  
  //Getters y setters.
  public void setGanador(){
    this.ganador = true;
  }
  
  public void setNombre (String nombre){
    this.nombre = nombre;
  }
  
  //Funcion para que se mueva en x o en y en funcion del número que haya salido en el dado, esta se llamaría desde juego
  public void setXY(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  public float getX (){
    return x;
  }
  
  public float getY(){
    return y;
  }
  
  public int getSpawnX(){
    return spawnX;
  }
  
  public int getSpawnY(){
    return spawnY;
  }
  
  public String getNombre(){
      return nombre;
  }
  
  public boolean getGanador(){
     return this.ganador;
  }

}
class inicio {
  textBox txtBoxAzul;
  textBox txtBoxVerde;
  textBox txtBoxRojo;
  boton b;
  
  public inicio(){
    b = new boton("LISTO", 30, width/2, 500, 400, 50);
    txtBoxAzul = new textBox(700, 200, 200, 50);
    txtBoxVerde = new textBox(700, 270, 200, 50);
    txtBoxRojo = new textBox(700, 340, 200, 50);
  }
  
  public void mostrar(){
  background(fondo);
  textAlign(CENTER);
  fill(0);
  textSize(64);
  text("PARQUÉS", width/2, height/6); 
  b.display();
  fill(0);
  strokeWeight(8);
  textSize(48);
  text("Ficha", 350, 195);
  text("Ficha", 350, 265);
  text("Ficha", 350, 335);
  fill(0, 0, 100);
  text("Azul", 480, 195);
  fill (0,100,0);
  text ("Verde", 490, 265);
  fill (100,0,0);
  text ("Rojo", 480, 335);
  strokeWeight(5);
  txtBoxAzul.mostrar();
  txtBoxVerde.mostrar();
  txtBoxRojo.mostrar();
  acciones();
  }
  
  public void acciones(){
    if (mousePressed){
      if (b.isInside()){
        pantalla=1;
        j.FA.setNombre(txtBoxAzul.getText());
        j.FV.setNombre(txtBoxVerde.getText());
        j.FR.setNombre(txtBoxRojo.getText());
        }
    }
  }
  
  //Se verifica donde se presionó el botón (si está encima del textBox se selecciona y se permite escribir)
  public void pressed(){
    txtBoxAzul.pressed(mouseX, mouseY);
    txtBoxVerde.pressed(mouseX, mouseY);
    txtBoxRojo.pressed(mouseX, mouseY);
    
  }
  //Se verifica qué teclas fueron oprimidas para representarlas en pantalla
  public void kpressed(){
    txtBoxAzul.keyPresseD(key, keyCode);
    txtBoxVerde.keyPresseD(key, keyCode);
    txtBoxRojo.keyPresseD(key, keyCode);
    
  }


}
class Juego{
  Tablero t;
  Ficha FA;
  Ficha FV;
  Ficha FR;
  
  //Se declaran e inicializan todos los objetos necesarios para el juego, se inicializa el tablero.
  public Juego(){
    FR = new Ficha(0xff990000, 565,160);
    FV = new Ficha(0xff009924, 485,285);
    FA = new Ficha(0xff0f0099, 645,285);
    t = new Tablero();
    t.setJuego(this);
  }
  
  public void mostrar(){
    t.mostrar();
    FR.mostrar();
    FV.mostrar();
    FA.mostrar();
  }

}
//Clase tablero, aquí se realiza toda la parte lógica y gráfica de la pantalla del Tablero

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

//Se crea la lista circular con las 48 casillas existentes del tablero
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
  rotate(74.88f);
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
  verificarGanador();
}

//Función para dibujar el triangulo de base para el tablero
public void poligono(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius-60;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
  
//Función para dibujar las casillas del tablero
public void dibujarCasillas(int i){
  int cont = i;
  for(int c=0; c<columnas; c++){
      for(int r=0; r<filas; r++){
        float sx = c*CasillasX;
        float sy = r*CasillasY;
        if(r == 7 && cont == 1){
           int cl = color(200, 0, 0);
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
             int cl = color(0, 200, 0);stroke(0);
             strokeWeight(5);
             rectMode(CORNER);
             fill(cl);
             rect(sx, sy, CasillasX, CasillasY);
             fill(0);
             text("E/S", sx+30, sy+15);
             strokeWeight(8);
          } else{
            if(r == 7 && cont == 3){
               int cl = color(0, 0, 200);
               stroke(0);
               strokeWeight(5);
               rectMode(CORNER);
               fill(cl);
               rect(sx, sy, CasillasX, CasillasY);
               fill(0);
               text("E/S", sx+30, sy+15);
               strokeWeight(8);
            } else {
               int cl = color(255);
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

//Función para la creación de cada nodo de la lista circular
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

//Función para actualizar la posición de las fichas en la lista circular, también se verifica si hay dos fichas en una misma casilla
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
    casillaAzul = p;
    if(casillaAzul.fichaVON == true){
       j.FV.setXY(j.FV.getSpawnX(),j.FV.getSpawnY());
       contV = 0;
       primeraV = true;
       casillaAzul.fichaVON = false;
    } else {
        if(casillaAzul.fichaRON == true){
            j.FR.setXY(j.FR.getSpawnX(),j.FR.getSpawnY());
            contR = 0;
            primeraR = true;
            casillaAzul.fichaRON = false;
        }
    }
    casillaAzul.fichaAON = true;
    break;
    case 2:
    p.fichaVON = false;
    while (c < n && contV < 48){
      p = p.link;
      c++;
      contV++;
    }
    casillaVerde = p;
    if(casillaVerde.fichaAON == true){
      j.FA.setXY(j.FA.getSpawnX(),j.FA.getSpawnY());
      contA = 0;
      primeraA = true;
      casillaVerde.fichaAON = false;
    } else {
        if(casillaVerde.fichaRON == true){
          j.FR.setXY(j.FR.getSpawnX(),j.FR.getSpawnY());
          contR = 0;
          primeraR = true;
          casillaVerde.fichaRON = false;
        }
    }
    casillaVerde.fichaVON = true;
    break;
    case 3:
    p.fichaRON = false;
    while (c < n && contR < 48){
      p = p.link;
      c++;
      contR++;
    }
    casillaRoja = p;
    if(casillaRoja.fichaAON == true){
        j.FA.setXY(j.FA.getSpawnX(),j.FA.getSpawnY());
        contA = 0;
        primeraA = true;
        casillaRoja.fichaAON = false;
    } else {
        if(casillaRoja.fichaVON == true){
          j.FV.setXY(j.FV.getSpawnX(),j.FV.getSpawnY());
          contV = 0;
          primeraV = true;
          casillaRoja.fichaVON = false;
        }
    }
    casillaRoja.fichaRON = true;
    break;
  }
}

//Función jugar donde se recibe el valor del dado y se llama a los movimientos de cada ficha dependiendo del turno.
public void jugar(int n){
  if (fichaJugar == 1){
    movimientosAzul(n);
    } else if (fichaJugar == 2){
        movimientosVerde(n);
    } else if (fichaJugar == 3){
        movimientosRojo(n);
    }
}

//Función del movimiento de la ficha Azul
public void movimientosAzul(int n){
    if(n == 6 && primeraA == true){
      j.FA.setXY(725,340);
      actualizarPos(0,casillaAzul,1);
      primeraA = false;
      fichaJugar = 2;
    } else if (n!= 6 && primeraA == true){
      fichaJugar = 2;
    } else if (primeraA == false) {
          if (contA < 8){
            if (contA+n <= 8){
              j.FA.setXY(j.FA.getX()-(18*n), j.FA.getY()+(32*n));
              actualizarPos(n, casillaAzul, 1);
            } else {
              n = contA+n-8;
              int aux = 8-contA;
              j.FA.setXY(570,590);
              actualizarPos(aux, casillaAzul, 1);
            }
          } if (contA >= 8 && contA < 24){
            if (contA+n<=24){
            j.FA.setXY(j.FA.getX()-(18*n), j.FA.getY()-(32*n));
            actualizarPos(n, casillaAzul, 1);
            } else {
              n = contA+n-24;
              int aux = 24-contA;
              j.FA.setXY(280,70);
              actualizarPos(aux, casillaAzul, 1);
            }
          } if (contA >= 24 && contA < 40){
            if (contA+n<=40){
            j.FA.setXY(j.FA.getX()+36*n, j.FA.getY());
            actualizarPos(n, casillaAzul, 1);
            }else {
              n = contA+n-40;
              int aux = 40-contA;
              j.FA.setXY(880,90);
              actualizarPos(aux, casillaAzul, 1);
            }
          }
          if(contA >= 40 && contA < 48){
            if(contA+n <=48){
              j.FA.setXY(j.FA.getX()-(18*n), j.FA.getY()+(32*n));
              actualizarPos(n, casillaAzul, 1);
            }
          }
          if(contA+n >=48){
            j.FA.setGanador();
          }
          fichaJugar = 2;
      }
}

//Función de movimiento de la ficha Verde
public void movimientosVerde(int n){
    if(n == 6 && primeraV == true){
            j.FV.setXY(420,340);
            actualizarPos(0,casillaVerde,2);
            primeraV = false;
            fichaJugar = 3;
        }else if (n!= 6 && primeraV == true) {
          fichaJugar = 3;
        }else if (primeraV == false){
          if (contV < 8){
            if (contV+n <= 8){
              j.FV.setXY(j.FV.getX()-(18*n), j.FV.getY()-(32*n));
              actualizarPos(n, casillaVerde, 2);
            } else {
              n = contV+n-8;
              int aux = 8-contV;
              j.FV.setXY(280,70);
              actualizarPos(aux, casillaVerde, 2);
            }
          } if (contV >= 8 && contV < 24){
            if (contV+n<=24){
            j.FV.setXY(j.FV.getX()+36*n, j.FV.getY());
            actualizarPos(n, casillaVerde, 2);
            } else {
              n = contV+n-24;
              int aux = 24-contV;
              j.FV.setXY(880,90);
              actualizarPos(aux, casillaVerde, 2);
            }
          } if (contV >= 24 && contV < 40){
            if (contV+n<=40){
            j.FV.setXY(j.FV.getX()-(18*n), j.FV.getY()+(32*n));
            actualizarPos(n, casillaVerde, 2);
            }else {
              n = contV+n-40;
              int aux = 40-contV;
              j.FV.setXY(570,590);
              actualizarPos(aux, casillaVerde, 2);
            }
          }
          if(contV >= 40 && contV < 48){
            if(contV+n <=48){
              j.FV.setXY(j.FV.getX()-(18*n), j.FV.getY()-(32*n));
              actualizarPos(n, casillaVerde, 2);
            }
          }
          if(contV+n >=48){
            j.FV.setGanador();
          }
          fichaJugar = 3;
          }
}

//Función de movimiento de la ficha Roja
public void movimientosRojo(int n){
    if(n == 6 && primeraR == true){
            j.FR.setXY(570,70);
            actualizarPos(0,casillaRoja,3);
            primeraR = false;
            fichaJugar = 1;
        }else if(n!=6 && primeraR==true) {
            fichaJugar = 1;
        }else if (primeraR == false) {
            if (contR+n <= 8){
              j.FR.setXY(j.FR.getX()+36*n, j.FR.getY());
              actualizarPos(n, casillaRoja, 3);
            } else {
              n = contR+n-8;
              int aux = 8-contR;
              j.FR.setXY(880,90);
              actualizarPos(aux, casillaRoja, 3);
            }
          } if (contR >= 8 && contR < 24){
            if (contR+n<=24){
            j.FR.setXY(j.FR.getX()-(18*n), j.FR.getY()+(32*n));
            actualizarPos(n, casillaRoja, 3);
            } else {
              n = contR+n-24;
              int aux = 24-contR;
              j.FR.setXY(570,590);
              actualizarPos(aux, casillaRoja, 3);
            }
          } if (contR >= 24 && contR < 40){
            if (contR+n<=40){
            j.FR.setXY(j.FR.getX()-(18*n), j.FR.getY()-(32*n));
            actualizarPos(n, casillaRoja, 3);
            }else {
              n = contR+n-40;
              int aux = 40-contR;
              j.FR.setXY(280,70);
              actualizarPos(aux, casillaRoja, 3);
            }
          }
          if(contR >= 40 && contR < 48){
            if(contR+n <=48){
              j.FR.setXY(j.FR.getX()+36*n, j.FR.getY());
              actualizarPos(n, casillaRoja, 3);
            }
          }
          if(contR+n >=48){
            j.FR.setGanador();
          }
          fichaJugar = 1;
          }


//Función donde se verifica si el raton está encima del dado y si lo presiona
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

//Función para verificar el ganador
public void verificarGanador(){
  if(j.FA.getGanador() == true) {
     stroke(0);
     strokeWeight(8);
     fill(255);
     rect(1000,500, 350, 100, 20);
     noFill();
     fill(0);
     text("Ha ganado el Jugador Azul!", 1000, 480);
     text(j.FA.getNombre(), 1000, 520);
     noFill();
  } else {
    if(j.FV.getGanador() == true) {
      stroke(0);
      strokeWeight(8);
      fill(255);
      rect(1000, 500, 350, 100, 20);
      noFill();
      fill(0);
      text("Ha ganado el Jugador Verde!", 1000,480);
      text(j.FV.getNombre(), 1000, 520);
      noFill();
    } else {
      if(j.FR.getGanador() == true) {
        stroke(0);
        strokeWeight(8);
        fill(255);
        rect(1000, 500, 350, 100, 20);
        noFill();
        fill(0);
        text("Ha ganado el Jugador Rojo!", 1000, 480);
        text(j.FR.getNombre(), 1000, 520);
        noFill();
      }
    }
  }
}

public void setJuego(Juego j){
  this.j = j;
}

}
class textBox{
   public int x, y, h, w;
   public int txtSize = 24;
   public int background = color(240, 240, 240);
   public int foreground = color(0, 0, 0);
   public int backgroundSelected = color(200, 200, 200);
   public int border = color(30, 30, 30);
   
   public boolean borderEnable = true;
   public int borderWeight = 1;
   
   public String text = "";
   public int textLength = 0;

   private boolean selected = false;
   
   textBox() {
      // txtBox por defecto
      x = width/2;
      y = height/2;
      w = 100;
      h = 50;
   }
   
   textBox(int x, int y, int w, int h) {
      this.x = x; 
      this.y = y; 
      this.w = w; 
      this.h = h;
   }
   
   public void mostrar() {
      // dibuja el txtBox
      if (selected) {
         fill(backgroundSelected);
      } else {
         fill(background);
      }
      
      if (borderEnable) {
         strokeWeight(borderWeight);
         stroke(border);
      } else {
         noStroke();
      }
      
      stroke(isInside()? color(120) : color(0));
      strokeWeight(8);
      rect(x,y,w,h, 10);
      
      rect(x, y, w, h, 10);
      fill(foreground);
      textSize(txtSize);
      text(text, x + (textWidth("a") / 2), y);
   }
   
   public String getText(){
     return text;
   }
   
   //Verifica la tecla presionada y realiza una acción acorde a la misma
   public void keyPresseD(char Key, int KeyCode) {
      if (selected) {
         if (KeyCode == (int)BACKSPACE) {
            backspace();
         } else {
            boolean isKeyCapitalLetter = (Key >= 'A' && Key <= 'Z');
            boolean isKeySmallLetter = (Key >= 'a' && Key <= 'z');
            boolean isKeyNumber = (Key >= '0' && Key <= '9');
            if (isKeyCapitalLetter || isKeySmallLetter || isKeyNumber) {
               addText(Key);
            }
         }
      }
   }
   //Añade texto a la cadena
   private void addText(char text) {
      if (this.text.length() < 14) {
         this.text += text;
         textLength++;
      }
   }
   
   private void backspace() {
      if (textLength - 1 >= 0) {
         text = text.substring(0, textLength - 1);
         textLength--;
      }
   }
   
   //Revisa si el mouse está sobre el txtBox
   public boolean isInside() {
    return mouseX > (x-w/2) & mouseX < (x+w/2) & mouseY > (y-h/2) & mouseY < (y+h/2);
  }
   
   //Verifica si, estando el cursor sobre el txtBox, este fue oprimido
   public void pressed(int x, int y) {
      if (isInside()) {
         selected = true;
      } else {
         selected = false;
      }
   }
}
  public void settings() {  size (1200, 650); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Parques" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
