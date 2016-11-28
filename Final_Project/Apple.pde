class Apple {
  float x;
  float y;
  float w = 15;
  float h = 15;
  
  Apple(float x, float y, float w, float h){
    this.x= x;
    this.y=y;
  }
  
  void drawApple() {
    fill(255,0,0);
    ellipse(x,y,w,h);
  }
}
    