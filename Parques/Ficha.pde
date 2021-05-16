//Clase ficha para cada una

class Ficha {
  private String nombre;
  private color Color;
  private int x, y;
  
  public Ficha (color Color, int x, int y){
    this.Color = Color;
    this.x = x;
    this.y = y;
  }
  
  public void setNombre (String nombre){
    this.nombre = nombre;
  }
  
  public void mostrar (){
    fill(Color);
    circle (x,y,30);
  }
  
  //Función para que se mueva directo a la carcel, llamada desde el método de cárcel, el cual se llama al cumplirse la condición
  
  //Funcion para que se mueva en x o en y en funcion del número que haya salido en el dado, esta se llamaría desde juego
  

}
