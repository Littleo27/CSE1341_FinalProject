//Ophelie Herve

int z;
Snake s;
Apple a;

void setup() {
  size(500, 500);
  
  float x = 250;
  float xSpeed = random(-2,2);
  float y = 250;
  float ySpeed = random(-2,2);
  float w= 50;
  float h = 50;
  s = new Snake(x, y, xSpeed, ySpeed, w, h);
  float xapple = random(0,500);
  float yapple = random(0,500);
  a = new Apple(xapple,yapple,15,15); 
}

void draw() {
  background(200);
  s.drawSnake();
  a.drawApple();
  s.moveSnake();
}

void keyPressed(){
  s.keyPressed();
}

/*void eatApple() {
  if (x == xapple){
    snakesize*/