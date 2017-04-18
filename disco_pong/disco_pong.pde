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
LeftPaddle paddle1=new LeftPaddle();
RightPaddle paddle2=new RightPaddle(20, 200, 760, y, speed, pr, pg, pb);
Ball ball1=new Ball(400, 300, 20, addx, addy, ballr, ballg, ballb);

void setup() {
  size(800, 600);

  smooth();
}

void draw() {

  background(backr, backg, backb);
  disco= loadFont("Phosphate-Inline-48.vlw");
  textFont(disco);
  fill(255);

  if (startState) {
    background(0);
    fill(255);
    textSize(50);
    text("Welcome to Disco Pong!", 100, 200);
    textSize(30);
    text("Press any key to start", 230, 300);
  }
  if (!startState) {

    background(backr, backg, backb);

    if (scor1>=3 || scor2>=3) {
      fill(a1, a2, a3);
      rect(0, 0, 400, 300);
      if (ball1.yposi()-10>paddle1.yposi()+20 && ball1.yposi()-10<paddle1.yposi()+200 || ball1.yposi()+10>paddle2.yposi() && ball1.yposi()+10<paddle2.yposi()+200) {
        if (ball1.xposi()-10<40 || ball1.xposi()+10>760) {
          a1=(int)random(0, 255);
          a2=(int)random(0, 255);
          a3=(int)random(0, 255);
        }
      }
    }

    if (scor1>=3 || scor2>=3) {
      fill(b1, b2, b3);
      rect(400, 0, 400, 300);
      if (ball1.yposi()-10>paddle1.yposi()+20 && ball1.yposi()-10<paddle1.yposi()+200 || ball1.yposi()+10>paddle2.yposi() && ball1.yposi()+10<paddle2.yposi()+200) {
        if (ball1.xposi()-10<40 || ball1.xposi()+10>760) {
          b1=(int)random(0, 255);
          b2=(int)random(0, 255);
          b3=(int)random(0, 255);
        }
      }
    }

    if (scor1>=3 || scor2>=3) {
      fill(c1, c2, c3);
      rect(0, 300, 400, 300);
      if (ball1.yposi()-10>paddle1.yposi()+20 && ball1.yposi()-10<paddle1.yposi()+200 || ball1.yposi()+10>paddle2.yposi() && ball1.yposi()+10<paddle2.yposi()+200) {
        if (ball1.xposi()-10<40 || ball1.xposi()+10>760) {
          c1=(int)random(0, 255);
          c2=(int)random(0, 255);
          c3=(int)random(0, 255);
        }
      }
    }

    if (scor1>=3 || scor2>=3) {
      fill(d1, d2, d3);
      rect(400, 300, 400, 300);
      if (ball1.yposi()-10>paddle1.yposi()+20 && ball1.yposi()-10<paddle1.yposi()+200 || ball1.yposi()+10>paddle2.yposi() && ball1.yposi()+10<paddle2.yposi()+200) {
        if (ball1.xposi()-10<40 || ball1.xposi()+10>760) {
          d1=(int)random(0, 255);
          d2=(int)random(0, 255);
          d3=(int)random(0, 255);
        }
      }
    }

    fill(br, bg, bb);
    text("Disco Pong", 255, 320);

    paddle1.create();
    paddle2.create();
    ball1.create();
    ball1.move();

    //bounce left paddle
    if (ball1.yposi()-10>paddle1.yposi() && ball1.yposi()-10<paddle1.yposi()+200) {
      if (ball1.xposi()-10<40) {
        ball1.changexspeed(addx);
      }
    }

    //bounce right paddle
    if (ball1.yposi()+10>paddle2.yposi() && ball1.yposi()+10<paddle2.yposi()+200) {
      if (ball1.xposi()+10>760) {
        ball1.changexspeed(-addx);
      }
    }

    //set score
    if (ball1.xposi()<0) {
      scor2++;
    }
    if (ball1.xposi()>800) {
      scor1++;
    }

    //reset game
    if (ball1.xposi()<0 || ball1.xposi()>800) {
      ball1.setxposi(random(340, 300));
    }

    PImage myImg = loadImage("discoball.png");
    myImg.loadPixels();
    image(myImg, 340, 5);

    //score board
    noStroke();
    fill(backr, backg, backb);
    //rect(350, 40, 60, 20);
    textSize(30);
    fill(sr, sg, sb);
    text(scor1 + "   " + scor2, 360, 65);


    //point 1
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

    if (scor1>=2 || scor2>=2) {
      if (ball1.yposi()+10>paddle2.yposi() && ball1.yposi()+10<paddle2.yposi()+200 || ball1.yposi()+10>paddle1.yposi() && ball1.yposi()+10<paddle1.yposi()+200) {
        if (ball1.xposi()+10>760 || ball1.xposi()-10<40) {
          backr=(int)random(0, 255);
          backg=(int)random(0, 255);
          backb=(int)random(0, 255);
        }
      }
    }

    if (scor1>=7) {
      speed=0;
      background(0);
      fill(255);
      textSize(50);
      text("Player 1 won!", 230, 200);
    }

    if (scor2>=7) {
      speed=0;
      background(0);
      fill(255);
      textSize(50);
      text("Player 2 won!", 230, 200);
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
  background(0);
}