class inicio {
  public ArrayList<boton> botones;
  public ArrayList<textBox> txtBoxes;
  boton b;
  
  public inicio(){
    botones= new ArrayList();
    txtBoxes= new ArrayList();
    b = new boton("LISTO", 30, width/2, 500, 400, 50);
    botones.add(b); 
  }
  
  public void mostrar(){
  background(255);
  textAlign(CENTER);
  fill(200);
  textSize(48);
  stroke(1);
  text("PARQUÉS", width/2, height/6); 
  b.display();
  }
  


}
