//Ophelie Herve

int z;
Snake s;
Apple a;


void setup() {
  size(500, 500);

  float xSnakeHead = 250;
  float xSpeed = random(-2, 2);
  float ySnakeHead = 250;
  float ySpeed = random(-2, 2);
  float wSnake= 15;
  float hSnake = 15;
  s = new Snake(xSnakeHead, ySnakeHead, xSpeed, ySpeed, wSnake, hSnake);
  float xapple = random(0, 500);
  float yapple = random(0, 500);
  a = new Apple(xapple, yapple, 50, 50);
}

void draw() {
  background(200);
  s.drawSnake();
  a.drawApple();
  s.moveSnake();
  eatApple();
  growSnake();
}

void keyPressed() {
  s.keyPressed();
}

void eatApple() {
  if (s.xSnakeHead <= (a.x + (a.w /2)) && s.xSnakeHead >= (a.x - (a.w/2)) && s.ySnakeHead <= (a.y + (a.h / 2)) && s.ySnakeHead >= (a.y - (a.h/2))) {
    a.x = random(0, width);
    a.y = random(0, height);
  }
}

void growSnake() {
  if (s.xSnakeHead <= (a.x + (a.w /2)) && s.xSnakeHead >= (a.x - (a.w/2)) && s.ySnakeHead <= (a.y + (a.h / 2)) && s.ySnakeHead >= (a.y - (a.h/2))) {
    for (int i = 0; i < s.snakeSize; i++) {
      s.xSnakeHead = s.snakeXs[i];
      s.xSnakeHead = s.snakeYs[i];
    }
  }
}

void endGame() {
  
}