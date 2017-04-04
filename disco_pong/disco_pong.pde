float w=20;
float h=100;
float x=20;
float y=20;
float speed=2;
boolean up=false;
boolean down=false;
Paddle paddle1=new Paddle(w,h,x,y,speed);
Paddle paddle2=new Paddle(20,100,760,20,2);

void setup(){
  size(800,600);
  background(0);
  smooth();
}

void draw(){
  paddle1.create();
  Paddle paddle2=new Paddle(20,100,760,20,2);
  paddle2.create();
}

void keyPressed(){
  if(key=='a'){
    up=true;
    paddle1.moveup(up);
  }
    if(key=='z'){
   down=true;
   paddle1.movedown(down);
  }
    if(key=='l'){
    up=true;
   paddle2.moveup(up);
  }
    if(key==','){
    down=true;
    paddle2.movedown(down);
  }
  background(0);
}

   