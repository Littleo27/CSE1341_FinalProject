//Ophelie Herve

float x;
float xSpeed;
float y;
float ySpeed;
float w;
float h;
int snakeSize = 5;

void setup() {
  size(500, 500);
  x = 250;
  xSpeed = random(-5, 5);
  y = 250;
  ySpeed = random(-5, 5);
  w= 50;
  h = 50;
}

void draw() {
  drawCircle();
  moveCircle();
}

void drawCircle() {
  fill(120, 240, 100);
  ellipse(x, y, w, h);
  x = x+xSpeed;
  y = y+ySpeed;
}

void moveCircle() {
  if (rightCollision()) {
    xSpeed = -xSpeed;
  }
  if (bottomCollision()) {
    ySpeed = -ySpeed;
  }
  if (topCollision()) {
    ySpeed = -ySpeed;
  }
  if (leftCollision()) {
    xSpeed = -xSpeed;
  }
}

boolean rightCollision() {
  boolean hasHit = false;
  if (x + (w/2) >= 500) {
    hasHit = true;
  } else {
    hasHit = false;
  }  
  return hasHit;
}
boolean bottomCollision() {
  boolean hasHit = false;
  if (y + (h/2) >= 500) {
    hasHit = true;
  } else {
    hasHit = false;
  }  
  return hasHit;
}
boolean topCollision() {
  boolean hasHit = false;
  if (y - (h/2) <= 0) {
    hasHit = true;
  } else {
    hasHit = false;
  }  
  return hasHit;
}
boolean leftCollision() {
  boolean hasHit = false;
  if (x - (w/2) <= 0) {
    hasHit = true;
  } else {
    hasHit = false;
  }  
  return hasHit;
}

void keyPressed() {
  for(int i = snakeSize; i>0; i--) {
   x[i] = x[i-1];
   y[i] = y[i-1];
  }
  
}