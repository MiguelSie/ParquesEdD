class inicio {
  textBox txtBoxAzul;
  textBox txtBoxVerde;
  textBox txtBoxRojo;
  boton b;
  
  public inicio(){
    b = new boton("LISTO", 30, width/2, 500, 400, 50);
    txtBoxAzul = new textBox(700, 200, 200, 50);
    txtBoxVerde = new textBox(700, 270, 200, 50);
    txtBoxRojo = new textBox(700, 340, 200, 50);
  }
  
  public void mostrar(){
  background(fondo);
  textAlign(CENTER);
  fill(0);
  textSize(64);
  text("PARQUÉS", width/2, height/6); 
  b.display();
  fill(0);
  strokeWeight(8);
  textSize(48);
  text("Ficha", 350, 195);
  text("Ficha", 350, 265);
  text("Ficha", 350, 335);
  fill(0, 0, 100);
  text("Azul", 480, 195);
  fill (0,100,0);
  text ("Verde", 490, 265);
  fill (100,0,0);
  text ("Rojo", 480, 335);
  strokeWeight(5);
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
