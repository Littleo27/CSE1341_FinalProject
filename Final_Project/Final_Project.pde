//Ophelie Herve
//CSE 1341 Final Project
//Brittni Watkins helped me with some parts of my code

int z;
Snake s;
Apple a;
boolean gameOver;
long timeToNextFrame = 200;
long timeSpentInFrame = 200;


void setup() {
  //Whenever the game begins, the snake constructor is called, and an apple is placed randomly on the screen. Gameover is false.
  size(500, 500);
  s = new Snake(250, 250);
  float xApple = random(20, width - 20);
  float yApple = random(20, height - 20);
  a = new Apple(xApple, yApple, 15, 15);
  gameOver = false;
}

void draw() {
  if (gameOver) {
    gameOver();
    //after game over has been called, reset game will be called. Therefore, once the spacebar has been pressed and game over is false, the game will proceed to reset
    resetGame();
  } else {
    background(0);
    snakeCollidesWithSelf();  //check if snake's head has collided with its body; check first because if it has, the game is over
    s.drawSnake(); //if game is not over, the snake can be drawn
    a.drawApple(); 
    //draw in frames
    if (millis() >= timeToNextFrame) {
      s.moveSnake();
      timeToNextFrame = timeToNextFrame + timeSpentInFrame;
    }
    eatApple();
  }
}

void keyPressed() {
  s.keyPressed();
  //By pressing a key, game over is made false, so game can be reset
  if (gameOver) {
    gameOver = false;
  }
}

void eatApple() {
  //when center of snake head overlaps any part of the apple, the apple is eaten
  
  if ((s.snakeXs.get(0) + (s.wSnake/2)) <= (a.x + a.w + (s.wSnake/2)) && (s.snakeXs.get(0) + (s.wSnake/2)) >= (a.x - (s.wSnake/2)) && (s.snakeYs.get(0)+(s.hSnake/2)) <= (a.y+a.h + (s.hSnake/2)) && (s.snakeYs.get(0)+(s.hSnake/2)) >= (a.y-(s.hSnake/2))) {
    //apple is then drawn to another location
    a.x = random(20, width-20);

    a.y = random(20, height-20);
    //make sure apple cannot be placed where snake is already located
    for (int i = 0; i< s.snakeXs.size(); i++) {
      if (a.x == s.snakeXs.get(i) && a.y == s.snakeYs.get(i)) {
        a.x = random(20, width-20);
        a.y = random(20, height-20);
      }
    }
    //snake will grow in increments of 2 (calling addElement function twice) as a result of eating the apple. 
    s.addElement();
    s.addElement();
  }
}


void snakeCollidesWithSelf() {
  //checking to see if the snake runs into its body
  for (int i = 1; i < s.snakeXs.size(); i++) {
    if (s.snakeXs.get(0) == s.snakeXs.get(i) && (s.snakeYs.get(0) == s.snakeYs.get(i))) {
      //game is over when snake runs into its body
      gameOver = true;
    }
  }
}

void gameOver() {
  //if the game is over, the text will appear with instruction of how to restart the game
  if (gameOver == true) {
    textSize(20);
    text("SCORE:" + (s.snakeXs.size()), 50, 50);
    text("Press the spacebar to try again", 100, 100);
  }
}


void resetGame() {
  //game is reset when space bar is pressed because game over is made false
  s = new Snake(250, 250);
  float xApple = random(20, width-20);
  float yApple = random(20, height - 20);
  a = new Apple(xApple, yApple, 15, 15);
}