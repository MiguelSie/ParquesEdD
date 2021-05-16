//Se carga todo el parqués
public int pantalla;
private inicio I;
private Juego j;

public void setup(){
  size (1200, 600);
  pantalla=0;
  I = new inicio();
  j = new Juego();
}

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
void mousePressed(){
  if(pantalla==0){
    I.pressed();
  }
}

void mouseClicked(){
  
}

//Revisa qué hacer según en qué pantalla fue presionada una tecla
void keyPressed(){
  if(pantalla==0){
    I.kpressed();
  }
}
