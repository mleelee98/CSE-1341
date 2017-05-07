//Code by Monica Lee
//Code based off of lecture examples by Donya Quick

class RightPaddle{
  float w=20;
  float h=200;
  float x=20;
  float y=20;
  float speed=20;
  float ballr=250;
  float ballg=250;
  float ballb=250;
  
  RightPaddle(){
    
  }
  
  RightPaddle(float neww, float newh, float newx, float newy,float newspeed, float newballr, float newballg, float newballb){
   w=neww;
   h=newh;
   x=newx;
   y=newy;
   speed=newspeed;
   ballr=newballr;
   ballg=newballg;
   ballb=newballb;
  }
  
  void create(){
    fill(ballr,ballg,ballb);
    rect(x,y,w,h);
  }
  
  void movedown(char c){
    if(key==c){ 
      y=y+speed;
  }
  }
  
  void moveup(char c){
    if(key==c){ 
      y=y-speed;
  }
  }
  
  void speedupdate(float newspeed){
   speed=newspeed;
  }
  
float xposi(){
  return x;
}

float yposi(){
  return y;
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
  
}