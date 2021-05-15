class inicio {
  textBox txtBoxAzul;
  textBox txtBoxVerde;
  textBox txtBoxRojo;
  boton b;
  
  public inicio(){
    b = new boton("LISTO", 30, width/2, 500, 400, 50);
    txtBoxAzul = new textBox(width/2, 200, 200, 50);
    txtBoxVerde = new textBox(width/2, 270, 200, 50);
    txtBoxRojo = new textBox(width/2, 340, 200, 50);
  }
  
  public void mostrar(){
  background(255);
  textAlign(CENTER);
  fill(200);
  textSize(48);
  text("PARQUÉS", width/2, height/6); 
  b.display();
  fill(0);
  text("Ficha", 320, 195);
  text("Ficha", 320, 265);
  text("Ficha", 320, 335);
  fill(0, 0, 100);
  text("Azul", 400, 195);
  fill (0,100,0);
  text ("Verde", 410, 265);
  fill (100,0,0);
  text ("Rojo", 400, 335);
  txtBoxAzul.mostrar();
  txtBoxVerde.mostrar();
  txtBoxRojo.mostrar();
  acciones();
  }
  
  public void acciones(){
    if (mousePressed){
      if (b.isInside()){
        pantalla=1;
        j.FA.setNombre(txtBoxAzul.getText());
        j.FV.setNombre(txtBoxVerde.getText());
        j.FR.setNombre(txtBoxRojo.getText());
        }
    }
  }
  
  //Se verifica donde se presionó el botón (si está encima del textBox se selecciona y se permite escribir)
  public void pressed(){
    txtBoxAzul.pressed(mouseX, mouseY);
    txtBoxVerde.pressed(mouseX, mouseY);
    txtBoxRojo.pressed(mouseX, mouseY);
    
  }
  //Se verifica qué teclas fueron oprimidas para representarlas en pantalla
  public void kpressed(){
    txtBoxAzul.keyPresseD(key, keyCode);
    txtBoxVerde.keyPresseD(key, keyCode);
    txtBoxRojo.keyPresseD(key, keyCode);
    
  }


}
