class Snake { 
  int xSnakeHead;
  int xSpeed;
  int ySnakeHead;
  int ySpeed;
  float wSnake;
  float hSnake;
  IntList snakeXs;
  IntList snakeYs;

  Snake(int x, int y) {
    //initializing snake
    //Brittini helped with creating a properly working intlist
    this.xSnakeHead = x;
    this.ySnakeHead = y;
    snakeXs = new IntList();
    snakeYs = new IntList();
    snakeXs.append(xSnakeHead);
    snakeYs.append(ySnakeHead);
    xSpeed = 0;
    ySpeed = 0;
    wSnake = 15;
    hSnake = 15;
  }

  void drawSnake() {
    fill(120, 240, 100);
    for (int i = 0; i < snakeXs.size(); i++) {
      rect(snakeXs.get(i), snakeYs.get(i), wSnake, hSnake);
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
    //checking to see if the snake has come into contact with the boundary I created of 20 pixels along the border
    boolean hasHit = false;
    if (snakeXs.get(0) + (wSnake) >= width - 20 && xSpeed >= 0) {
      hasHit = true;
    } else {
      hasHit = false;
    }  
    return hasHit;
  }
  boolean bottomCollision() {
    boolean hasHit = false;
    if (snakeYs.get(0) + (hSnake) >= height - 20 && ySpeed >= 0) {
      hasHit = true;
    } else {
      hasHit = false;
    }  
    return hasHit;
  }
  boolean topCollision() {
    boolean hasHit = false;
    if (snakeYs.get(0) <= 20 && ySpeed <= 0) {
      hasHit = true;
    } else {
      hasHit = false;
    }  
    return hasHit;
  }
  boolean leftCollision() {
    boolean hasHit = false;
    if (snakeXs.get(0) <= 20 && xSpeed <= 0) {
      hasHit = true;
    } else {
      hasHit = false;
    }  
    return hasHit;
  }

  void shiftDown() {
    //This ensures that the snake does not leave a trail. Stays a consistent length unless added to. 
    for (int i = snakeXs.size() - 1; i > 0; i--) {
      snakeXs.set(i, snakeXs.get(i-1));
      snakeYs.set(i, snakeYs.get(i-1));
    }
  }

  void addElement() {
    //Add element to the end of the snake
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
    //when arrows are pressed the snake changes direction
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