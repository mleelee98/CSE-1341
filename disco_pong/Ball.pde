//Code by Monica Lee
//Code based off of lecture examples by Donya Quick

class Ball{
  float x=400;
  float y=300;
  float radius=20;
  float addx=5;
  float addy=3;
  boolean top=false;
  boolean hit=false;
  boolean leftCollision=false;
  boolean rightCollision=false;
  float ballr=250;
  float ballg=250;
  float ballb=250;
  boolean hh=false;
  
  Ball(){
    
  }
  
  Ball(float newx, float newy, float newradius, float newaddx, float newaddy, float newballr, float newballg, float newballb){
    x=newx;
    y=newy;
    radius=newradius;
    addx= newaddx;
    addy= newaddy;
    ballr=newballr;
    ballg=newballg;
    ballb=newballb;
  }
  
  void create(){
    fill(ballr, ballg, ballb);
    ellipse(x,y,radius,radius);
  }
  
  void drawcreate(){
   fill(ballr, ballg, ballb);
   ellipse(x,y,radius,radius);
  }
  
boolean topCollision(float ycoor) {
  if (ycoor>0) {
    top=true;
  } else {
    top=false;
  }
  return top;
}

boolean bottomCollision(float ycoor) {
  if (ycoor<height-radius/2) {
    top=true;
  } else {
    top=false;
  }
  return top;
}

  void move(){
      y= y+addy;
  if (!topCollision(y)) {
    addy= -addy;
  } 
  if (!bottomCollision(y)) {
    addy= -addy;
  }

  x= x+addx;
  if (!leftCollision) {
    addx= -addx;
  }
  if (!rightCollision) {
    addx= -addx;
  }
}

float xposi(){
  return x;
}

float yposi(){
  return y;
}

void setxposi(float newx){
  x=newx;
}

void setyposi(float newy){
  y=newy;
}

void changexspeed(float newspeed){
  addx=newspeed;
}

void changexspeed(float newspeed, float newyspeed){
  addx=newspeed;
  addy=newyspeed;
}

void changer(float newr){
 ballr=newr; 
}

void changeg(float newg){
 ballg=newg; 
}

void changeb(float newb){
 ballb=newb; 
}

boolean hasHit(float xx, float yy){
  if(x-10>=xx && y-10>=yy && x+10<=x+70 && y+10<x+47){
    hh=true;
  }
  return hh;
}


  }
  