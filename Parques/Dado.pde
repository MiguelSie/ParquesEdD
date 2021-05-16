class Dado {
  
  private int resultados[];
  private int x, y, w, h;
  
  public Dado() {
    resultados = new int[6];
    this.x= 80;
    this.y= 400;
    this.w = 80;
    this.h = 80;
  }
  
  public int getResultado (){
    return resultados[int(random(1, 6))];
  }
  
  
  //Se dibuja el dado
  public void mostrar(){
    rectMode(CENTER);
    fill(255);
    stroke(isInside()? color(200) : color(0));
    strokeWeight(8);
    rect(x, y, w, h, 20);
  }
  
  public boolean isInside() {
    return mouseX > (x-w/2) & mouseX < (x+w/2) & mouseY > (y-h/2) & mouseY < (y+h/2);
  }
  
}
