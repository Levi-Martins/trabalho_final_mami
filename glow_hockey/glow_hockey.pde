Parede [] parede=new Parede[8];
Bola bola;
int cor=130;
PFont font;
PImage inicio, inicioHover, creditos, creditosHover, homeHover;

void setup() {
  size(1000, 600);
  noStroke();

  font = createFont("font.ttf", 32);
  textFont(font);
  textAlign(CENTER, CENTER);

  inicio=loadImage("inicio.png");
  inicioHover=loadImage("inicioHover.png");
  creditos=loadImage("creditos.png");
  creditosHover=loadImage("creditosHover.png");
  homeHover=loadImage("homeHover.png");


  //cimaDireita
  parede[0]=new Parede(30, 10, 470, 20, cor);
  //cimaEsquerda
  parede[1]=new Parede(500, 10, 470, 20, cor);
  //baixoEsquerda
  parede[2]=new Parede(30, 570, 470, 20, cor);
  //baixoDireita
  parede[3]=new Parede(500, 570, 470, 20, cor);
  //direitaCima
  parede[4]=new Parede(970, 30, 20, 170, cor);
  //direitaBaixo
  parede[5]=new Parede(970, 400, 20, 170, cor);
  //esquerdaCima
  parede[6]=new Parede(10, 30, 20, 170, cor);
  //esquerdaBaixo
  parede[7]=new Parede(10, 400, 20, 170, cor);

  bola=new Bola(300, 350, 20, 20, 8, 5);
  p1 = new Player(300, 350, 45, 55);
  p2 = new Player(600, 350, 45, 55);
}

boolean jogar, cred, home, iniciar=true;
void iniciar() {
  if (iniciar) {
    image(inicio, 0, 0, width, height);
    if (mouseX>=327 && mouseX<=673 && mouseY>=265 && mouseY<=334) {
      image(inicioHover, 0, 0, width, height);
      if (mousePressed) {
        jogar=true;
      }
    }
    if (mouseX>=327 && mouseX<=673 && mouseY>=380 && mouseY<=450) {
      image(creditosHover,0,0,width,height);
      if (mousePressed) {
        cred=true;
        iniciar=false;
        
      }
    }
    
  }
}
void creditos() {
  image(creditos, 0, 0, width, height);
  if (mouseX>=397 && mouseX<= 602 && mouseY>=466 && mouseY<=531) {
    image(homeHover,0,0,width,height);
    if (mousePressed) {
      iniciar=true;
      cred=false;
    }
  }
}



void draw() {
  if (!jogar) {
    iniciar();
    if (cred) {
      creditos();
    }
  } else {
    cenario();
    scoreboard();

    for (int i=0; i<parede.length; i++) {

      parede[i].desenha();
      bola.colisao( parede[i]);
    }
    bola.show();
    bola.update();
    bola.placar();

    bola.colisaoPlayer(p1);
    bola.colisaoPlayer(p2);


    p1.mostra();
    p1.movimentacaoEsquerda();
    p2.mostra();
    p2.movimentacaoDireita();
  }
}

void cenario() {
  fill(0);
  stroke(0);
  rect(0, 0, width, height);
  fill(0);
  stroke(200);
  rectMode(CENTER);
  rect(0, height/2, 200, 200);
  rect(1000, height/2, 200, 200);
  rect(width/2, height/2, 100, 100);

  strokeWeight(3);
  line(width/2, 30, width/2, 570);
}

void scoreboard() {
  textSize(64);
  fill(255);
  text(placar01, 400, 100);
  text(placar02, 600, 100);
}


void keyPressed() {
  if (key == 'a') {
    key_a = true;
  } else if (key == 'd') {
    key_d = true;
  } else if (key == 'w') {
    key_w = true;
  } else if (key == 's') {
    key_s = true;
  } else if (keyCode == LEFT) {
    key_left = true;
    println("LEFT");
  } else if (keyCode == RIGHT) {
    key_right = true;
    println("RIGHT");
  } else if (keyCode == UP) {
    key_up = true;
    println("UP");
  } else if (keyCode == DOWN) {
    key_down = true;
    println("DOWN");
  }
}

void keyReleased() {
  if (key == 'a') {
    key_a = false;
  } else if (key == 'd') {
    key_d = false;
  } else if (key == 'w') {
    key_w = false;
  } else if (key == 's') {
    key_s = false;
  } else if (keyCode == LEFT) {
    key_left = false;
    println("solta");
  } else if (keyCode == RIGHT) {
    key_right = false;
  } else if (keyCode == UP) {
    key_up = false;
  } else if (keyCode == DOWN) {
    key_down = false;
  }
}
