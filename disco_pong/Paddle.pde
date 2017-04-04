class Paddle{
  float w=20;
  float h=100;
  float x=20;
  float y=20;
  float speed=2;
  boolean down;
  
  Paddle(){
    
  }
  
  Paddle(float neww, float newh, float newx, float newy, float newSpeed){
   w=neww;
   h=newh;
   x=newx;
   y=newy;
   speed=newSpeed;
  }
  
  void create(){
    rect(x,y,w,h);
  }
  
  void movedown(boolean down){
    if(down){ 
      y=y+speed;
  }
  }

  void moveup(boolean up){
    if(up){ 
      y=y-speed;
  }
  }
}