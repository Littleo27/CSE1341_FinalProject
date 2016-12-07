class Snake { 
  int xSnakeHead;
  int xSpeed;
  int ySnakeHead;
  int ySpeed;
  float wSnake;
  float hSnake;
  //int snakeSize = 5;
  IntList snakeXs;
  IntList snakeYs;

  Snake(int x, int y) {
    this.xSnakeHead = x;
    this.ySnakeHead = y;
    snakeXs = new IntList();
    snakeYs = new IntList();
    snakeXs.append(xSnakeHead);
    snakeYs.append(ySnakeHead);
    xSpeed = 1;
    ySpeed = 1;
    wSnake = 15;
    hSnake = 15;
  }

  void drawSnake() {
    fill(120, 240, 100);
    for (int i = 0; i < snakeXs.size(); i++) {
      rect(snakeXs.get(i), snakeYs.get(i), wSnake, hSnake);
      //xSnakeHead = xSnakeHead + xSpeed; //+random(-2,2);
      //ySnakeHead = ySnakeHead + ySpeed; //+ random(-2,2);
    }
  }

  void moveSnake() {
    int currentX = snakeXs.get(0);
    int currentY = snakeYs.get(0);
    shiftDown();
    snakeXs.set(0, currentX + xSpeed);
    snakeYs.set(0, currentY + ySpeed);


    if (rightCollision()) {
      xSpeed = 0;
      ySpeed = -15; //to turn towards top of page
    }
    if (bottomCollision()) {
      ySpeed = 0 ; 
      xSpeed = 15; //turn right
    }
    if (topCollision()) {
      ySpeed = 0;
      xSpeed = -15; //turn left
    }
    if (leftCollision()) {
      xSpeed = 0;
      ySpeed = 15; //turn towards bottom of page
    }
  }

  boolean rightCollision() {
    boolean hasHit = false;
    if (snakeXs.get(0) + (wSnake/2) >= 500) {
      hasHit = true;
    } else {
      hasHit = false;
    }  
    return hasHit;
  }
  boolean bottomCollision() {
    boolean hasHit = false;
    if (snakeYs.get(0) + (hSnake/2) >= 500) {
      hasHit = true;
    } else {
      hasHit = false;
    }  
    return hasHit;
  }
  boolean topCollision() {
    boolean hasHit = false;
    if (snakeYs.get(0) - (hSnake/2) <= 0) {
      hasHit = true;
    } else {
      hasHit = false;
    }  
    return hasHit;
  }
  boolean leftCollision() {
    boolean hasHit = false;
    if (snakeXs.get(0) - (wSnake/2) <= 0) {
      hasHit = true;
    } else {
      hasHit = false;
    }  
    return hasHit;
  }

  void shiftDown() {
    for (int i = snakeXs.size() - 1; i > 0; i--) {
      snakeXs.set(i, snakeXs.get(i-1));
      snakeYs.set(i, snakeYs.get(i-1));
    }
  }

  void addElement() {
    int lastX = snakeXs.get(snakeXs.size() - 1);
    int lastY = snakeYs.get(snakeYs.size() - 1);
    if (xSpeed > 0) {      
      snakeXs.append(lastX - 15);
    } else if (xSpeed <0) {
      snakeXs.append(lastX + 15);
    } else {
      snakeXs.append(lastX);
    }
    if (ySpeed<0) {      
      snakeYs.append(lastY + 15);
    } else if (ySpeed>0) {
      snakeYs.append(lastY - 15);
    } else {
      snakeYs.append(lastY);
    }
  }




  void keyPressed() {
    if (keyCode == UP) {
      xSpeed = 0;
      ySpeed = -15;
    }
    if (keyCode == DOWN) {
      xSpeed = 0;
      ySpeed = 15;
    }
    if (keyCode == LEFT) {
      xSpeed = -15;
      ySpeed = 0;
    }
    if (keyCode == RIGHT) {
      xSpeed = 15;
      ySpeed = 0;
    }
  }
}