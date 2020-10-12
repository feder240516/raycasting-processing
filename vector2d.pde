class Vector2d{
  float startx, starty, dx, dy;
  Vector2d(float startx, float starty, float dx, float dy){
    this.startx = startx;
    this.starty = starty;
    this.dx = dx;
    this.dy = dy;
  }
  
  float getSlope(){
    if(dx == 0 || abs(dy / dx) > INF_THRESHOLD) return Float.POSITIVE_INFINITY;
    else return dy/dx;
  }
  
  float getSlopeInv(){
    if(dy == 0 || abs(dx / dy) > INF_THRESHOLD) return Float.POSITIVE_INFINITY;
    else return dx/dy;
  }
  
  float getCutY(){
    float slope = getSlope();
    if (slope == Float.POSITIVE_INFINITY){
      return Float.NaN;
    }else{
      return starty - slope * startx; 
    }
  }
  
  float getCutX(){
    float slopeInv = getSlopeInv();
    if (slopeInv == Float.POSITIVE_INFINITY){
      return Float.NaN;
    }else{
      return startx - slopeInv * starty; 
    }
  }
  
  String toString(){
    return String.format("v = (%f, %f) + t(%f, %f)",startx,starty,dx,dy) + "\n"
        +  String.format("y = %fx + %f", getSlope(), getCutY());
  }
  
}

class Wall{
  
  public Vector2d vector;
  
  Wall(float startx, float starty, float endx, float endy){
    this.vector = new Vector2d(startx, starty, endx-startx, endy-starty);
  }
}
