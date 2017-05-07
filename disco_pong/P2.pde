//Code by Monica Lee
//Code based off of lecture examples by Donya Quick

class P2 implements Shape {
  float x=-100;
  float y=-100;
  float aSize = 80;
  float xSpeed = random(5,7);
  float ySpeed = random(5,7);
  boolean alive = true;
  PImage img;
  
  void setLocation(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void display(){
    image(img,x,y);
  }
  
  void update(){
    y = y + ySpeed;
    if (y < 0 || y > height) {
      ySpeed = -ySpeed;
    }
    x = x + xSpeed;
    if (x < 0 || x > width) {
      xSpeed = -xSpeed;
    }
  }
  
  P2() {
    x = width+100;
    y = random(0,height);
    aSize = random(5,80);
    xSpeed = random(-5,-3);

    img=loadImage("vinyl.png");
  }
  
}