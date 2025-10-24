//Forrest Jefferson | 9/23/25 | spacegame
Spaceship s1;
Rock r1;

ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<Taser> tasers = new ArrayList<Taser>();
ArrayList<Star> stars = new ArrayList<Star>();
ArrayList<PowerUp> powerUps = new ArrayList<PowerUp>();
Timer rockTimer, pTimer;
boolean startsc,gameOver, win;
int sc,l, t;


void setup() {
  startsc = false;
  gameOver = false;
  win = false;
  size(1000, 800);
  background(25);
  sc=0;
  l=10000;
  t=0;

  s1 = new Spaceship();
  r1 = new Rock();

  rockTimer = new Timer(500-int(sc/100));
  rockTimer.start();
  
  pTimer = new Timer(2000);
  pTimer.start();
}

void draw() {
  if(!startsc) {
    startscreen();
  } else if(gameOver == true){
    gameOver();
  } else {
  background(15);

  stars.add(new Star());


  if (rockTimer.isFinished()) {
    rocks.add(new Rock());
    rockTimer.start();
  }
  
   if (pTimer.isFinished()) {
    powerUps.add(new PowerUp());
    pTimer.start();
  }

  for (int i = 0; i < stars.size(); i++) {
    Star star = stars.get(i);
    star.display();
    star.move();
    if (star.reachedBottom()==true) {
      stars.remove(star);
    }
  }

  for (int i = 0; i < rocks.size(); i++) {
    Rock rock = rocks.get(i);
    rock.display();
    rock.move();
    if (s1.intersect(rock)) {
      s1.he-=rock.w;
      sc+=rock.w;
      rocks.remove(rock);
      i--;
    }
    if (rock.reachedBottom()==true) {
      l-=rock.w;
      rocks.remove(rock);
      i--;
    }
  }

for (int i = 0; i < powerUps.size(); i++) {
    PowerUp powerUp = powerUps.get(i);
    powerUp.display();
    powerUp.move();
    //Deep AI wrote this code
    if (powerUp.intersect(s1)) {
  if (powerUp.t == 'H') {
    s1.he += 100; // Increase health by 100
    // Optional: Cap health at a maximum value, e.g., 1000
    s1.he = min(s1.he, 1000);
  } else if(powerUp.t == 'T'){
    t += 5;
    t = min(t, 10);
  }
  // Handle other power-up types if needed
  powerUps.remove(powerUp);
  i--;
}

  }
// I copied the laser for loop and used it for tasers (they're the same thing)
   for (int i = tasers.size() - 1; i >= 0; i--) {
  Taser taser = tasers.get(i);
  for (int j = 0; j < rocks.size(); j++) {
    Rock rock = rocks.get(j);
    if (taser.intersect(rock)) {
      sc += 20;
      rock.w -= 20;
      if (rock.w < 20) {
        rocks.remove(j);
        j--;
        sc += 40;
      }
      tasers.remove(i);
      break; // Exit inner loop after removing laser
    }
  }
  // Only move laser if it still exists
  if (tasers.size() > i) {
    tasers.get(i).display();
    tasers.get(i).move();
    if (tasers.get(i).reachedTop()) {
      tasers.remove(i);
    }
  }
}
 
//Deep AI edited this code for me
  for (int i = lasers.size() - 1; i >= 0; i--) {
  Laser laser = lasers.get(i);
  for (int j = 0; j < rocks.size(); j++) {
    Rock rock = rocks.get(j);
    if (laser.intersect(rock)) {
      sc += 10;
      rock.w -= 10;
      if (rock.w < 10) {
        rocks.remove(j);
        j--;
        sc += 20;
      }
      lasers.remove(i);
      break; // Exit inner loop after removing laser
    }
  }
  // Only move laser if it still exists
  if (lasers.size() > i) {
    lasers.get(i).display();
    lasers.get(i).move();
    if (lasers.get(i).reachedTop()) {
      lasers.remove(i);
    }
  }
}
  println(rocks.size());
  r1.reachedBottom();
  s1.display();
  s1.move(mouseX, mouseY);
  r1.display();
  r1.move();
  infoPanel();
  
  if(s1.shipDamage()){
    gameOver = true;
  }
  if(l<1){
    gameOver = true;
  }
  if(sc>40000){
    win = true;
  }
}
}

void mousePressed() {
  if(!startsc) {
    startsc=true;
  } else if(gameOver == true){
    s1.he = 1000;
    l=10000;
    sc = 0;
    gameOver = false;
   } else if(gameOver == true){
    s1.he = 1000;
    l=10000;
    sc = 0;
    gameOver = false;
 } else if(win == true){
    s1.he = 1000;
    l=10000;
    sc = 0;
    win = false;

  } else if(t>0) {
    tasers.add(new Taser(s1.x, s1.y));
    t-=1;
  } else {
    lasers.add(new Laser(s1.x, s1.y));
  }
}

void infoPanel() {
  rectMode(CENTER);
  fill(127, 127);
  rect(width/2, 25, width, 50);
  fill(255);
  textSize(25);
  text("score" + sc, 20, 40);
  text("earth health" + l, width-240,40);
  text("rocket health" + s1.he, width/2,40);
}

void startscreen() {
  //image(startsc,0,0);
  background(0);
  fill(225);
  textSize(50);
  textMode(CENTER);
  text("Strange Looking Asteroids",300,400);
  textSize(40);
  text("(simon on spagetti, frosen potato chips, and 8-bit volcano)",0,500);
  textSize(30);
  text("click to start!",300,700);
}

void win(){
   background(0);
  textSize(50);
  textMode(CENTER);
  text("congradulations!!!!!!!!!!!.",300,400);
  text("score: " + sc,500,500);
  textSize(30);
  text("click to play again!", 400,600);
}


void gameOver() {
  background(0);
  textSize(50);
  textMode(CENTER);
  text("you failed to save earth...",300,400);
  text("score: " + sc,500,500);
  textSize(30);
  text("click to play again!", 400,600);
}
