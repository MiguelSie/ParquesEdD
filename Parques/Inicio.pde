class inicio {
  public ArrayList<textBox> txtBoxes;
  boton b;
  
  public inicio(){
    txtBoxes= new ArrayList();
    b = new boton("LISTO", 30, width/2, 500, 400, 50);
    txtBoxes.add(new textBox(width/2, 200, 200, 50));
    txtBoxes.add(new textBox(width/2, 270, 200, 50));
    txtBoxes.add(new textBox(width/2, 340, 200, 50));
  }
  
  public void mostrar(){
  background(255);
  textAlign(CENTER);
  fill(200);
  textSize(48);
  stroke(1);
  text("PARQUÉS", width/2, height/6); 
  b.display();
  for (textBox t: txtBoxes){
    t.mostrar();
  }
  acciones();
  }
  
  public void acciones(){
    if (mousePressed){
      if (b.isInside()){
        pantalla=1;
        }
    }
  }
  
  //Se verifica donde se presionó el botón (si está encima del textBox se selecciona y se permite escribir)
  public void pressed(){
    for (textBox t: txtBoxes){
    t.pressed(mouseX, mouseY);
    }
  }
  //Se verifica qué teclas fueron oprimidas para representarlas en pantalla
  public void kpressed(){
    for (textBox t: txtBoxes){
    t.keyPresseD(key, keyCode);
    }
  }


}
