//Code by Monica Lee
//Code based off of lecture examples by Donya Quick
//Music by Kevin MacLeod
//Sound effects from Youtube sound effects library

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim m;
AudioPlayer bround;
AudioPlayer hithit;
float speed=20;
float y=20;
float addy=-3;
float addx=5;
int scor1=0;
int scor2=0;
PFont disco;
boolean startState=true;
color scor = color(250, 250, 250);
float ballr=250;
float ballg=250;
float ballb=250;
float pr=250;
float pg=250;
float pb=250;
float br=250;
float bg=250;
float bb=250;
float sr=250;
float sg=250;
float sb=250;
float backr=0;
float backg=0;
float backb=0;
float a1=(int)random(0, 255);
float a2=(int)random(0, 255);
float a3=(int)random(0, 255);
float b1=(int)random(0, 255);
float b2=(int)random(0, 255);
float b3=(int)random(0, 255);
float c1=(int)random(0, 255);
float c2=(int)random(0, 255);
float c3=(int)random(0, 255);
float d1=(int)random(0, 255);
float d2=(int)random(0, 255);
float d3=(int)random(0, 255);
boolean hit=false;
boolean playagain=false;
LeftPaddle paddle1=new LeftPaddle();
RightPaddle paddle2=new RightPaddle(20, 200, 760, y, speed, pr, pg, pb);
Ball ball1=new Ball(400, 300, 20, addx, addy, ballr, ballg, ballb);
PImage myImg;

Shape [] shapes= new Shape[20];
Shape [] shapes1= new Shape[20];

void setup() {
  size(800, 600);

  smooth();
  m = new Minim(this);
  bround = m.loadFile("Electro Cabello.mp3");
  bround.play();

  for (int i = 0; i< shapes.length; i++) {
    shapes[i] = new Power();
    shapes[i].setLocation(random(0, width), height/2);
    shapes1[i] = new P2();
    shapes1[i].setLocation(random(0, width), height/2);
  }

  myImg = loadImage("discoball.png");
}

void draw() {
  background(backr, backg, backb);
  disco= loadFont("Phosphate-Inline-48.vlw");
  textFont(disco);
  fill(255);

  if (startState) {
    fill(255);
    textSize(50);
    text("Welcome to Disco Pong!", 100, 200);
    textSize(30);
    text("Press any key to start", 230, 300);
  }
  if (!startState) {

    if (scor1>=3 || scor2>=3) {
      fill(a1, a2, a3);
      rect(0, 0, 400, 300);
      fill(b1, b2, b3);
      rect(400, 0, 400, 300);
      fill(c1, c2, c3);
      rect(0, 300, 400, 300);
      fill(d1, d2, d3);
      rect(400, 300, 400, 300);
      if (ball1.yposi()-10>paddle1.yposi() && ball1.yposi()-10<paddle1.yposi()+200 || ball1.yposi()+10>paddle2.yposi() && ball1.yposi()+10<paddle2.yposi()+200) {
        if (ball1.xposi()-10<40 || ball1.xposi()+10>760) {
          a1=(int)random(0, 255);
          a2=(int)random(0, 255);
          a3=(int)random(0, 255);
          b1=(int)random(0, 255);
          b2=(int)random(0, 255);
          b3=(int)random(0, 255);
          c1=(int)random(0, 255);
          c2=(int)random(0, 255);
          c3=(int)random(0, 255);
          d1=(int)random(0, 255);
          d2=(int)random(0, 255);
          d3=(int)random(0, 255);
        }
      }
    }

    if (scor1>=4 || scor2>=4) {
      fill(a1, b2, d3);
      rect(0, 0, 200, 150);
      fill(b1, a2, c3);
      rect(200, 0, 200, 150);
      fill(c1, b2, a3);
      rect(400, 0, 200, 150);
      fill(a1, c2, d3);
      rect(600, 0, 200, 150);
      fill(b1, c2, a3);
      rect(0, 150, 200, 150);
      fill(c1, a2, d3);
      rect(200, 150, 200, 150);
      fill(a1, d2, b3);
      rect(400, 150, 200, 150);
      fill(b1, d2, c3);
      rect(600, 150, 200, 150);
      fill(a1, a2, a3);
      rect(0, 300, 200, 150);
      fill(b1, b2, b3);
      rect(200, 300, 200, 150);
      fill(c1, c2, c3);
      rect(400, 300, 200, 150);
      fill(d1, d2, d3);
      rect(600, 300, 200, 150);
      fill(c1, d2, b3);
      rect(0, 450, 200, 150);
      fill(d1, a2, c3);
      rect(200, 450, 200, 150);
      fill(b1, d2, a3);
      rect(400, 450, 200, 150);
      fill(a1, d2, a3);
      rect(600, 450, 200, 150);
    }

    fill(br, bg, bb);
    text("Disco Pong", 255, 320);

    if (scor1>=5 || scor2>=5) {
      for (int i = 0; i< shapes.length; i++) {
        shapes[i].display();
        shapes[i].update();
      }
    }

    if (scor1>=6 || scor2>=6) {
      for (int i = 0; i< shapes.length; i++) {
        shapes1[i].display();
        shapes1[i].update();
      }
    }

    paddle1.create();
    paddle2.create();
    ball1.create();
    ball1.move();

    if (ball1.yposi()-10>paddle1.yposi() && ball1.yposi()-10<paddle1.yposi()+200) {
      if (ball1.xposi()-10<40) {
        ball1.changexspeed(addx);
        hithit = m.loadFile("Metallic_Clank.mp3");
        hithit.play();
      }
    }

    if (ball1.yposi()+10>paddle2.yposi() && ball1.yposi()+10<paddle2.yposi()+200) {
      if (ball1.xposi()+10>760) {
        ball1.changexspeed(-addx);
        hithit = m.loadFile("Metallic_Clank.mp3");
        hithit.play();
      }
    }

    if (ball1.xposi()<0) {
      scor2++;
    }
    if (ball1.xposi()>800) {
      scor1++;
    }

    if (ball1.xposi()<0 || ball1.xposi()>800) {
      ball1.setxposi(random(340, 300));
    }

    image(myImg, 340, 5);

    noStroke();
    fill(backr, backg, backb);
    textSize(30);
    fill(sr, sg, sb);
    text(scor1 + "   " + scor2, 360, 65);

    if (scor1>=1 || scor2>=1) {
      if (ball1.yposi()-10>paddle1.yposi() && ball1.yposi()-10<paddle1.yposi()+200 || ball1.yposi()-10>paddle2.yposi() && ball1.yposi()-10<paddle2.yposi()+200) {
        if (ball1.xposi()-10<40 || ball1.xposi()+10>760) {
          ball1.changer((int)random(0, 255));
          ball1.changeg((int)random(0, 255));
          ball1.changeb((int)random(0, 255));
          paddle1.changer((int)random(0, 255));
          paddle1.changeg((int)random(0, 255));
          paddle1.changeb((int)random(0, 255));
          paddle2.changer((int)random(0, 255));
          paddle2.changeg((int)random(0, 255));
          paddle2.changeb((int)random(0, 255));
          br=(int)random(0, 255);
          bg=(int)random(0, 255);
          bb=(int)random(0, 255);
          sr=(int)random(0, 255);
          sg=(int)random(0, 255);
          sb=(int)random(0, 255);
        }
      }
    }

    if (scor1==2 || scor2==2) {
      if (ball1.yposi()+10>paddle2.yposi() && ball1.yposi()+10<paddle2.yposi()+200 || ball1.yposi()+10>paddle1.yposi() && ball1.yposi()+10<paddle1.yposi()+200) {
        if (ball1.xposi()+10>760 || ball1.xposi()-10<40) {
          backr=(int)random(0, 255);
          backg=(int)random(0, 255);
          backb=(int)random(0, 255);
        }
      }
    }

    if (scor1>=7) {
      background(0);
      speed=0;
      fill(255);
      textSize(50);
      text("Player 1 won!", 230, 200);
      textSize(40);
      text("Press any key to play again", 130, 260);
    }

    if (scor2>=7) {
      background(0);
      speed=0;
      fill(255);
      textSize(50);
      text("Player 2 won!", 230, 200);
      textSize(40);
      text("Press any key to play again", 130, 260);
    }

    if (scor1>=7 || scor2>=7) {
      playagain=true;
    }

    if (playagain==true && keyPressed==true) {
      scor1=0;
      scor2=0;
      playagain=false;
      background(255);
      ball1.changer(255);
      ball1.changeg(255);
      ball1.changeb(255);
      paddle1.changer(255);
      paddle1.changeg(255);
      paddle1.changeb(255);
      paddle2.changer(255);
      paddle2.changeg(255);
      paddle2.changeb(255);
      br=255;
      bg=255;
      bb=255;
      sr=255;
      sg=255;
      sb=255;
    }
  }
}

void keyPressed() {
  if (keyPressed==true) {
    paddle1.movedown('z');
    paddle1.moveup('a');
    paddle2.movedown(',');
    paddle2.moveup('l');
    startState=false;
  }
}