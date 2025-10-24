class Star{
  // member variables
  int x,y,w,sp;
  
  Star(){
    x=int(random(width));
    y=-10;
    w=int(random(1,4));
    sp=int(random(2,8));
  }
  
  void display(){
    fill(random(100,255));
    rect(x,y,w,w);
  }
  
  void move() {
    y=y+sp;
  }
  
  boolean reachedBottom() {
    if(y>height+10) {
      return true;
    } else {
      return false;
    }  
  }
}
