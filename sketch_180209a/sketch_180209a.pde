//Compiled code created in Processing 3.3.6
//Marked at 2.9.2018 3:47PM EST | sketch_180209a
//  rect(526, 672, 120, 15);

// Our game with **objects**
class Brick {
  int x, y;
  int breakpoints;
  
  Brick(int sx, int sy) {
    x = sx;
    y = sy;
  }
  
  void display(){
    fill(200, 12, 36);
    rect(x, y, 50, 50);
  }
}

class Player {
  int x, y;
  Player(int sx, int sy) {
    x = sx;
    y = sy;
  }
  void moveRight() {
    x = x + 10;
    if (didIhitsomething()) {
      x = x - 12;
    }
  }
  
  void moveLeft() {
    x = x - 10;
    if (didIhitsomething()){
      x = x + 12;
    }
  }
  
  void moveDown() {
    y = y+10;
    if(didIhitsomething()){
      y = y+10;
    }
  }
  
  void moveUp() {
    y = y-10;
    if (didIhitsomething()){
      y = y-10;
    }
  }
    
  boolean didIhitsomething() {    
    for (Brick b : brickz) {
      int bx=b.x;
      int by=b.y;
      if (this.x > b.x && this.x < bx+50){
        if (this.y > b.y && this.y+10 < by+50){
          return true;
        }
      }
    }
    return false;
  }
  
  void display() {
    fill(255);
    stroke(0);
    ellipse(x, y, 25, 25);
  }  
}

class Ball {
  int x, y;
  Ball(int sx, int sy){
  x = sx;
  y = sy;
  }
  
  void display() {
    ellipse(0, 0, 25, 25);
  }

}

Player character;
Ball ellipse;
Brick b1, b2, b3, b4, b5;
ArrayList <Brick> brickz;
PImage img;

void setup() {
  size(1366, 768);
  background(0, 0, 0);
  img = loadImage("milky-way-2695569_1920.jpg");
  brickz = new ArrayList <Brick> ();
  character = new Player(0, 0);
  ellipse = new Ball(0, 0);
  
  for (int i = 0; i< width; i+=75){
    brickz.add(new Brick(i, height-100));
  }
  //b1 = new Brick(100, 100);
  //b2 = new Brick(200, 100);
  //brickz.add(b2);
  //b3 = new Brick(300,100);
  //brickz.add(b3);
  println("hello world");
}

void draw() {
  image(img, 0, 0);  
  character.display();
  ellipse.display();

  
  for (Brick b : brickz) {
    b.display();
  }
  
  if (keyPressed) {
    if (key == 'd' || key == 'D' || keyCode == RIGHT) {
      character.moveRight();
    } else if (key == 'a' || key == 'A' || keyCode == LEFT) {
      character.moveLeft();
    } else if (key == 's' || key == 'S' || keyCode == DOWN) {
      character.moveDown();
    } else if (key == 'w' || key == 'W' || keyCode == UP) {
      character.moveUp();
    }
  }
}

//Missing right curly bracket "}"