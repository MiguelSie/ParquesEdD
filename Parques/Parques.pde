//Se carga todo el parqués
public int pantalla;
public inicio I;

public void setup(){
  size (1200, 600);
  pantalla=0;
  I = new inicio();
}

public void draw(){
  switch (pantalla){
  case 0:
    I.mostrar();
  }
  
}

//Revisa qué ocurre si el mouse fue presionado según qué pantalla esté
void mousePressed(){
  if(pantalla==0){
    I.pressed();
  }
}

//Revisa qué hacer según en qué pantalla fue presionada una tecla
void keyPressed(){
  if(pantalla==0){
    I.kpressed();
  }
}
