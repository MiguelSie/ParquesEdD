class textBox{
   public int x, y, h, w;
   public int txtSize = 24;
   public color background = color(240, 240, 240);
   public color foreground = color(0, 0, 0);
   public color backgroundSelected = color(200, 200, 200);
   public color border = color(30, 30, 30);
   
   public boolean borderEnable = true;
   public int borderWeight = 1;
   
   public String text = "";
   public int textLength = 0;

   private boolean selected = false;
   
   textBox() {
      // txtBox por defecto
      x = width/2;
      y = height/2;
      w = 100;
      h = 50;
   }
   
   textBox(int x, int y, int w, int h) {
      this.x = x; 
      this.y = y; 
      this.w = w; 
      this.h = h;
   }
   
   void mostrar() {
      // dibuja el txtBox
      if (selected) {
         fill(backgroundSelected);
      } else {
         fill(background);
      }
      
      if (borderEnable) {
         strokeWeight(borderWeight);
         stroke(border);
      } else {
         noStroke();
      }
      
      stroke(isInside()? color(120) : color(0));
      strokeWeight(8);
      rect(x,y,w,h, 10);
      
      rect(x, y, w, h, 10);
      fill(foreground);
      textSize(txtSize);
      text(text, x + (textWidth("a") / 2), y);
   }
   
   public String getText(){
     return text;
   }
   
   //Verifica la tecla presionada y realiza una acción acorde a la misma
   public void keyPresseD(char Key, int KeyCode) {
      if (selected) {
         if (KeyCode == (int)BACKSPACE) {
            backspace();
         } else {
            boolean isKeyCapitalLetter = (Key >= 'A' && Key <= 'Z');
            boolean isKeySmallLetter = (Key >= 'a' && Key <= 'z');
            boolean isKeyNumber = (Key >= '0' && Key <= '9');
            if (isKeyCapitalLetter || isKeySmallLetter || isKeyNumber) {
               addText(Key);
            }
         }
      }
   }
   //Añade texto a la cadena
   private void addText(char text) {
      if (this.text.length() < 14) {
         this.text += text;
         textLength++;
      }
   }
   
   private void backspace() {
      if (textLength - 1 >= 0) {
         text = text.substring(0, textLength - 1);
         textLength--;
      }
   }
   
   //Revisa si el mouse está sobre el txtBox
   public boolean isInside() {
    return mouseX > (x-w/2) & mouseX < (x+w/2) & mouseY > (y-h/2) & mouseY < (y+h/2);
  }
   
   //Verifica si, estando el cursor sobre el txtBox, este fue oprimido
   public void pressed(int x, int y) {
      if (isInside()) {
         selected = true;
      } else {
         selected = false;
      }
   }
}
