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
