class Dado {
  
  private int [] resultados = {1,2,3,4,5,6};
  private int x, y, w, h;
  
  public Dado() {
    this.x= 120;
    this.y= 400;
    this.w = 80;
    this.h = 80;
  }
  
  public int getResultado(){
    int indice = int(random(6));
    int n = resultados[indice];
    return n;   
  }
  
  
  //Se dibuja el dado
  public void mostrar(int num){
    int n = num;
    rectMode(CENTER);
    fill(255);
    stroke(isInside()? color(200) : color(0));
    strokeWeight(8);
    rect(x, y, w, h, 20);
    switch(n){
      case 1:
          fill(0);
          circle(x, y, 5);
          noFill();
          break;
      case 2:
          fill(0);
          circle(x-20, y-20, 5);
          circle(x+20, y+20, 5);
          noFill();
          break;
      case 3:
          fill(0);
          circle(x-20, y-20, 5);
          circle(x, y, 5);
          circle(x+20, y+20, 5);
          noFill();
          break;
      case 4:
          fill(0);
          circle(x-20, y-20, 5);
          circle(x-20, y+20, 5);
          circle(x+20, y-20, 5);
          circle(x+20, y+20, 5);
          noFill();
          break;
      case 5:
          fill(0);
          circle(x-20, y-20, 5);
          circle(x-20, y+20, 5);
          circle(x, y, 5);
          circle(x+20, y-20, 5);
          circle(x+20, y+20, 5);
          noFill();
          break;
      case 6:
          fill(0);
          circle(x-20, y-20, 5);
          circle(x-20, y+20, 5);
          circle(x-20, y, 5);
          circle(x+20, y, 5);
          circle(x+20, y-20, 5);
          circle(x+20, y+20, 5);
          noFill();
          break;
    }
    stroke(0);
  }
  
  public boolean isInside() {
    return mouseX > (x-w/2) & mouseX < (x+w/2) & mouseY > (y-h/2) & mouseY < (y+h/2);
  }

}
