class Line {
  private int yoffset, y, ex, ey;
  private float x;

  Line() {
    yoffset = 2;
  }

  void drawLine() {
    line(x, this.y + this.yoffset, this.ex, this.ey);
    line(x, this.y, (this.ex * - 1), this.ey);
  }
  
  void setPosition(float x, int y, int ex, int ey){
    this.x = x;
    this.y = y;
    this.ex = ex;
    this.ey = ey; 
  }

  float getAngle () {
    return(this.x);
  }
}
