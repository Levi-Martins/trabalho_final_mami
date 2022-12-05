class Parede {
  float x, y, l, h,cor;
  Parede(float pX, float pY, float pL, float pH,float c) {
    x=pX;
    y=pY;
    l=pL;
    h=pH;
    cor=c;
  }
  void desenha() {
    rectMode(CORNER);
    fill(cor);
    stroke(255);
    rect(x, y, l, h);
  }
}
