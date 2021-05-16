class Juego{
  Tablero t;
  Ficha FA;
  Ficha FV;
  Ficha FR;
  
  public Juego(){
    t = new Tablero();
    FR = new Ficha(#990000, 50, 50);
    FV = new Ficha(#009924, 100, 50);
    FA = new Ficha(#0f0099, 150, 50);
  }
  
  
  void mostrar(){
    t.mostrar();
    FR.mostrar();
    FV.mostrar();
    FA.mostrar();
  }

}
