class PowerUp {
  // member variables
  int x,y,w,sp,c1,t;
  //constructor
  PowerUp(){
    x = int(random(width));
    y = -100;
    w = 50;
    sp= 2;
    if(random(10)>5) {
      //r1 = loadImage("rock01.png");
      t = 'H';
      c1 = color(225,33,22);
    } else {
      //r1 = loadImage("rock02.png");
      t = 'T';
      c1 = color(34,32,225);
    }
  }
  //member methods
  void display() {
   fill(c1);
   ellipse(x,y,w,w);
  }
  
  void move() {
    y = y+sp;
  }
  
  boolean intersect(Spaceship s) {
    float d=dist(x, y, s.x, s.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
  
  boolean reachedBottom() {
    if(y>height+w)  {
      return true;
    }else {
      return false;
    }
  }
}
