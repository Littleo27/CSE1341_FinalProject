//Ophelie Herve

int z;
Snake s;
Apple a;
boolean gameOver;
long timeToNextFrame = 1000;
long timeSpentInFrame = 1000;


void setup() {
  size(500, 500);
  s = new Snake(250, 250);
  float xapple = random(0, 500);
  float yapple = random(0, 500);
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
  /*if (s.snakeXs.get(0) <= (a.x + (a.w /2)) && s.snakeXs.get(0) >= (a.x - (a.w/2)) && s.snakeYs.get(0) <= (a.y + (a.h / 2)) && s.snakeYs.get(0) >= (a.y - (a.h/2))) {
    a.x = random(0, width);

    a.y = random(0, height);
    for (int i = 0; i< s.snakeXs.size(); i++) {
      if (a.x == s.snakeXs.get(i) && a.y == s.snakeYs.get(i)) {
        a.x = random(0, width);
        a.y = random(0, height);
      }
    }
    s.addElement();
  }*/
  //I tried to adjust my code in the following to address the issue of the apple not disappearing
  if (s.snakeXs.get(0) <= (a.x + (s.wSnake /2)) && s.snakeXs.get(0) >= (a.x - (s.wSnake/2)) && s.snakeYs.get(0) <= (a.y + (s.hSnake / 2)) && s.snakeYs.get(0) >= (a.y - (s.hSnake/2))) {
    a.x = random(0, width);

    a.y = random(0, height);
    for (int i = 0; i< s.snakeXs.size(); i++) {
      if (a.x == s.snakeXs.get(i) && a.y == s.snakeYs.get(i)) {
        a.x = random(0, width);
        a.y = random(0, height);
      }
    }
    s.addElement();
  }
}


void snakeCollidesWithSelf() {
  for (int i = 1; i < s.snakeXs.size(); i++) {
    if (s.snakeXs.get(0) == s.snakeXs.get(i) && s.snakeYs.get(0) == s.snakeYs.get(i)) {
      gameOver = true;
    }
  }
}

void gameOver() {
  if (gameOver == true) {
    textSize(20);
    text("SCORE:" + (s.snakeXs.size()) + " " + "Press Spacebar to try again", 50, 50);
  }
}


void resetGame() {
  s = new Snake(250, 250);
  float xapple = random(0, 500);
  float yapple = random(0, 500);
  a = new Apple(xapple, yapple, 10, 10);
}