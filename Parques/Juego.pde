class Juego{
  Tablero t;
  Ficha FA;
  Ficha FV;
  Ficha FR;
  
  public Juego(){
    t = new Tablero();
    t.setJuego(this);
    FR = new Ficha(#990000, 565, 160);
    FV = new Ficha(#009924, 485, 285);
    FA = new Ficha(#0f0099, 645, 285);
  }
  
  void mostrar(){
    t.mostrar();
    FR.mostrar();
    FV.mostrar();
    FA.mostrar();
  }

}
