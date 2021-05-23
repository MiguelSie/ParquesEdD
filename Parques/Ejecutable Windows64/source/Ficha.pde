//Clase ficha para cada una

class Ficha {
  private String nombre;
  private color Color;
  private float x, y;
  private int spawnX, spawnY;
  private boolean ganador = false;
  
  public Ficha (color Color, int x, int y){
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
