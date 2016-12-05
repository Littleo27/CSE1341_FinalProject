class Snake { 
  float xSnakeHead;
  float xSpeed;
  float ySnakeHead;
  float ySpeed;
  float wSnake;
  float hSnake;
  int snakeSize = 5;
  IntList snakeXs;
  IntList snakeYs;

  Snake(float x, float y, float xSpeed, float ySpeed, float w, float h) {
    this.xSnakeHead = x;
    this.ySnakeHead = y;
    this.xSpeed = xSpeed;
    this.ySpeed = ySpeed;
    this.wSnake = w;
    this.hSnake = h;
  }

  void drawSnake() {
    fill(120, 240, 100);

    snakeXs[0] = xSnakeHead;
    snakeYs[0] = ySnakeHead;
    for (i = 0; i<= snakeSize; i++) {
      ellipse(xSnakeHead, ySnakeHead, wSnake, hSnake);
      xSnakeHead = xSnakeHead + xSpeed; //+random(-2,2);
      ySnakeHead = ySnakeHead + ySpeed; //+ random(-2,2);
    }
  }

  void moveSnake() {
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
    if (xSnakeHead + (wSnake/2) >= 500) {
      hasHit = true;
    } else {
      hasHit = false;
    }  
    return hasHit;
  }
  boolean bottomCollision() {
    boolean hasHit = false;
    if (ySnakeHead + (hSnake/2) >= 500) {
      hasHit = true;
    } else {
      hasHit = false;
    }  
    return hasHit;
  }
  boolean topCollision() {
    boolean hasHit = false;
    if (ySnakeHead - (hSnake/2) <= 0) {
      hasHit = true;
    } else {
      hasHit = false;
    }  
    return hasHit;
  }
  boolean leftCollision() {
    boolean hasHit = false;
    if (xSnakeHead - (wSnake/2) <= 0) {
      hasHit = true;
    } else {
      hasHit = false;
    }  
    return hasHit;
  }

  void keyPressed() {
    if (keyCode == UP) {
      xSpeed = 0;
      ySpeed = -2;
    }
    if (keyCode == DOWN) {
      xSpeed = 0;
      ySpeed = 2;
    }
    if (keyCode == LEFT) {
      xSpeed = -2;
      ySpeed = 0;
    }
    if (keyCode == RIGHT) {
      xSpeed = 2;
      ySpeed = 0;
    }
  }
}