class Power implements Shape {
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
  
  Power() {
    x = width+100;
    y = random(0,height);
    aSize = random(5,80);
    xSpeed = random(-5,-3);

    img=loadImage("casette.png");
  }
  
  void setSplit(float x, float y, float newSize, float xSpeed, float ySpeed) {
    this.x = x;
    this.y = y;
    this.aSize = newSize;
    this.xSpeed = xSpeed;
    this.ySpeed = ySpeed;
  }
  
  void drawShape() {
    image(img, x, y);
  }
  
  void move() {
    x = x + xSpeed;
    y = y + ySpeed;
    if (x < -aSize) {
      alive = false;
    }
  }
}