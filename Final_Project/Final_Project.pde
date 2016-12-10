//Ophelie Herve

int z;
Snake s;
Apple a;
boolean gameOver;
long timeToNextFrame = 200;
long timeSpentInFrame = 200;


void setup() {
  size(500, 500);
  s = new Snake(250, 250);
  float xapple = random(30, width - 30);
  float yapple = random(30, height - 30);
  a = new Apple(xapple, yapple, 10,10);
  gameOver = false;
}

void draw() {
  if (gameOver) {
    gameOver();
    resetGame();
  } else {
    background(0);
    snakeCollidesWithSelf();
    s.drawSnake();
    a.drawApple();
    if (millis() >= timeToNextFrame) {
      s.moveSnake();
      timeToNextFrame = timeToNextFrame + timeSpentInFrame;
    }
    eatApple();
  }
}

void keyPressed() {
  s.keyPressed();
  if (gameOver) {
    gameOver = false;
  }
}

void eatApple() {
  if (s.snakeXs.get(0) + (s.wSnake/2) <= (a.x + (s.wSnake/2)) && s.snakeXs.get(0) + (s.wSnake/2) >= (a.x - (s.wSnake/2)) && s.snakeYs.get(0) + (s.hSnake/2) <= (a.y + (s.hSnake)/2) && s.snakeYs.get(0) + (s.hSnake/2) >= (a.y - (s.hSnake/2))) {
    a.x = random(30, width-30);

    a.y = random(30, height-30);
    for (int i = 0; i< s.snakeXs.size(); i++) {
      if (a.x == s.snakeXs.get(i) && a.y == s.snakeYs.get(i)) {
        a.x = random(30, width-30);
        a.y = random(30, height-30);
      }
    }
    s.addElement();
  }
}


void snakeCollidesWithSelf() {
  for (int i = 1; i < s.snakeXs.size(); i++) {
    if (s.snakeXs.get(0) == s.snakeXs.get(i) && (s.snakeYs.get(0) == s.snakeYs.get(i))) {
      gameOver = true;
    }
  }
}

void gameOver() {
  if (gameOver == true) {
    textSize(20);
    text("SCORE: " + (s.snakeXs.size()), 50, 50);
    text("Press the spacebar to try again", 100,100);
  }
}


void resetGame() {
  s = new Snake(250, 250);
  float xapple = random(30, width-30);
  float yapple = random(30, height - 30);
  a = new Apple(xapple, yapple, 10, 10);
}