class Star{
  float myX, myY;
  float xSpeed, ySpeed;
  int r, g, b, mySize;
  float x,y;
  Star(){
    myX = x = myY = y = 250;
    xSpeed = (float)(Math.random()*4)-2;
    ySpeed = (float)(Math.random()*4)-2;
    r = (int)(Math.random()*255);
    g = 0;
    b = 0;
    mySize = 2;
  }
  void show(){
    noStroke();
    fill(r,g,b);
    ellipse(myX, myY, 5, 5);
  }
  void drift(){
    myX = myX + xSpeed;
    myY = myY + ySpeed;
  }
  void reset(){
    myX = x = mouseX;
    myY = y = mouseY;
    xSpeed = (float)(Math.random()*4)-2;
    ySpeed = (float)(Math.random()*4)-2;
    r = (int)(Math.random()*255);
    g = (int)(Math.random()*255);
    b = (int)(Math.random()*255);
    mySize = 2;
  }
  void showRing(){
    noFill();
    stroke(255,216,60);
    ellipse(x,y,mySize,mySize);
  }
  void bigger(){
    mySize+=((int)(Math.random()*2)+1);
  }
}

class cir extends Star{
  cir(){
    myX = myY = x = y = 250;
    xSpeed = (float)(Math.random()*4)-2;
    ySpeed = (float)(Math.random()*4)-2;
    r = (int)(Math.random()*255);
    g = 0;
    b = 0;
    mySize = 2;
  }
}

Star [] bob;
void setup(){
  size(500,500);
  bob = new Star[100];
  for(int i = 0; i < 1; i++){
    bob[i] = new cir();
  }
  for(int i = 1; i < bob.length; i++){
    bob[i] = new Star();
  }
}

void draw(){
  background(135,206,235);
  bob[1].showRing();
  bob[1].bigger();
  
  for(int i = 1; i < bob.length; i++){
    bob[i].show();
    bob[i].drift();
  }
}

void mousePressed(){
  for(int i = 0; i < bob.length; i++){
    bob[i].reset();
  }
}
