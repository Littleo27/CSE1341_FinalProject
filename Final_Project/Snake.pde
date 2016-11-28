class Snake { 
  float x;
  float xSpeed;
  float y;
  float ySpeed;
  float w;
  float h;
  int snakeSize = 5;
  float [] xs = new float[snakeSize];
  float [] ys = new float[snakeSize];

  Snake(float x, float y, float xSpeed, float ySpeed, float w, float h) {
    this.x = x;
    this.y = y;
    this.xSpeed = xSpeed;
    this.ySpeed = ySpeed;
    this.w = w;
    this.h = h;
  }

  void drawSnake() {
    fill(120, 240, 100);
    ellipse(x, y, w, h);
    x = x + xSpeed; //+random(-2,2);
    y = y + ySpeed; //+ random(-2,2);
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