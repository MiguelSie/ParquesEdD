//Clase ficha para cada una

class Ficha {
  public String nombre;
  public color Color;
  public int x, y;
  
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
  

}
