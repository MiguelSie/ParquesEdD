class Dado {
  
  private int resultados[];
  
  public Dado() {
    resultados = new int[5];
  }
  
  public int getResultado (){
    return resultados[int(random(1, 7))];
  }
  
  
  //Se dibuja el dado
  public void mostrar(){
    
  }
  
  
}
