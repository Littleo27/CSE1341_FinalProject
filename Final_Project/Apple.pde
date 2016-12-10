class Apple {
  float x;
  float y;
  float w = 15;
  float h = 15;

  Apple(float x, float y, float w, float h) {
    this.x= x;
    this.y=y;
    this.w = w;
    this.h = h;
  }

  void drawApple() {
    fill(255, 0, 0);
    rect(x, y, w, h);
  }
}