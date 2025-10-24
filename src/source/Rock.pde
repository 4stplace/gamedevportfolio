class Rock {
  // member variables
  int x,y,w,h,sp;
  PImage r1;
  //constructor
  Rock(){
    x = int(random(width));
    y = -100;
    w = int(random(10,100));
    sp= int(random(1,10));
    if(random(10)>7) {
      r1 = loadImage("rock01.png");
    } else if(random(10)>5) {
      r1 = loadImage("rock02.png");
    } else {
      r1 = loadImage("rock03.png");
    }
  }
  //member methods
  void display() {
    r1.resize(w,w);
   image(r1,x,y);
  }
  
  void move() {
    y = y+sp;
  }
  boolean reachedBottom() {
    if(y>height+w)  {
      return true;
    }else {
      return false;
    }
  }
}
