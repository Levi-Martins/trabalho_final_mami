Player p1,p2;
boolean key_left, key_right, key_up, key_down;
boolean key_a, key_d, key_w, key_s;
class Player {
  float x, y, l, h;
  Player(float px, float py, float pLarg, float pAlt) {
    x = px;
    y = py;
    l = pLarg;
    h = pAlt;
  }

  void mostra() {
    fill(255);
    rect(x, y, l, h);
   }
   void movimentacaoEsquerda(){
      // movimento
    if (key_a == true)
      x -= 15;
    else if (key_d == true)
      x += 15;
    else if (key_w == true)
      y -= 15;
    else if (key_s == true)
      y += 15;

    //delimitação
    if (x <= 30)
      x = 30;
    if (x >= 452)
      x = 452;
    if (y <= 30)
      y = 30;
    if (y >= 570 - h)
      y = 570 - h ;
   }
   
   
   void movimentacaoDireita(){
      // movimento
    if (key_left == true)
      x -= 15;
    else if (key_right == true)
      x += 15;
    else if (key_up == true)
      y -= 15;
    else if (key_down == true)
      y += 15;

    //delimitação
    if (x <= 500)
      x = 500;
    if (x >= 925)
      x = 925;
    if (y <= 30)
      y = 30;
    if (y >= 570 - h)
      y = 570 - h ;
   }
   
   
}
