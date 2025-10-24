class Spaceship {
  // member variables
  int x, y, w, he;
  PImage ship;
  //constructor
  Spaceship() {
    x = width/2;
    y = height/2;
    he = 1000;
    w = 100;
    ship = loadImage("spaceship.png");
  }
  //member methods
  void display() {
    imageMode(CENTER);
    image(ship, x, y);
  }

  void move(int x, int y) {
    this.x = x;
    this.y = y;
  }

  void fire() {
  }

  boolean intersect(Rock r) {
    float d=dist(x, y, r.x, r.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
  
  boolean shipDamage() {
    if (he<1) {
      return true;
    } else {
      return false;
    }
  }
  
}
