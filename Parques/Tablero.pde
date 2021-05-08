class Tablero {

public Tablero(){


}

public void mostrar(){
  background(255);
pushMatrix();
  translate(width*0.5, height*0.5);
  polygon(0, 0, 300, 6);
  popMatrix();




}

void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}















}
