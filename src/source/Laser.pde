class Laser {
  // member variables
  int x,y,w,h,sp;

  //constructor
  Laser(int x, int y){
    this.x = x;
    this.y = y;
    w = 4;
    h = 40;
    sp = 32;
  }
  //member methods
  void display() {
   fill(225,0,0);
   rectMode(CENTER);
   rect(x,y,w,h);
  }
  
  void move() {
    y = y-sp;
  }
  
  void fire() {
    
  }
  
  boolean reachedTop() {
    if(y<-20) {
      return true;
    } else {
      return false;
    }
  }
   boolean intersect(Rock r) {
    float d=dist(x, y, r.x, r.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
