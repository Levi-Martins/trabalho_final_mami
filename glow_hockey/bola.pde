int placar01, placar02;
boolean ponto = false;
boolean gol = false;

int tempo;

class Bola {
  float x, y, l, h, xSpeed, ySpeed;
  Bola(float pX, float pY, float pL, float pH, float pXspeed, float pYspeed) {
    x=pX;
    y=pY;
    l=pL;
    h=pH;
    xSpeed=pXspeed;
    ySpeed=pYspeed;
  }
  void show() {
    fill(255);
    stroke(255);
    rect(x, y, l, h);
  }
  void update() {
    x+=xSpeed;
    y+=ySpeed;
  }
  
  
  void colisao(Parede p) {
    if (x+l>=p.x && x<=p.x && y+h>=p.y && y<=p.y+p.h) {
      xSpeed=-abs(xSpeed);
      p.cor=220;
    }
    if (x<=p.x+p.l && x+l>=p.x+p.l && y+h>=p.y && y<=p.y+p.h) {
      xSpeed=abs(xSpeed);
       p.cor=220;
    }
    if (y<=p.y+p.h && y+h>=p.y+p.h && x+l>=p.x && x<=p.x+p.l) {
      ySpeed=abs(ySpeed);
      p.cor=220;
    }
    if (y+h>=p.y && y<=p.y && x+l>=p.x && x<=p.x+p.l) {
      ySpeed=-abs(ySpeed);
       p.cor=220;
    }
    if(p.cor==220){
      tempo++;
      if(tempo>=15){
        p.cor=130;
        tempo=0;
      }
    }
    
    
  }
  
  
  
   void colisaoPlayer(Player p) {
    if (x+l>=p.x && x<=p.x && y+h>=p.y && y<=p.y+p.h) {
      xSpeed=-abs(xSpeed);
    }
    if (x<=p.x+p.l && x+l>=p.x+p.l && y+h>=p.y && y<=p.y+p.h) {
      xSpeed=abs(xSpeed);
    }
    if (y<=p.y+p.h && y+h>=p.y+p.h && x+l>=p.x && x<=p.x+p.l) {
      ySpeed=abs(ySpeed);
    }
    if (y+h>=p.y && y<=p.y && x+l>=p.x && x<=p.x+p.l) {
      ySpeed=-abs(ySpeed);
    }
  }
  
  void placar() {
    if (x+l < 0 && ponto == false) {
      placar02+=1;
      x = 500;
      ponto = true;
      gol = true;
    } else if (x > 1000 && ponto == false) {
      placar01+=1;
      x= 500;
      ponto = true;
      gol = true;
    }
    if (gol == true) {
      ponto = false;
      gol = false;
    }
  }
  
}
