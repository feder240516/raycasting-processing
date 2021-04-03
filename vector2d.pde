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
  
  float getX1(){
    return this.vector.startx;
  }
  
  float getX2(){
    return this.vector.startx + this.vector.dx;
  }
  
  float getY1(){
    return this.vector.starty;
  }
  
  float getY2(){
    return this.vector.starty + this.vector.dy;
  }
  
  Color getColorForPosition(float x, float y){
    float leftX = min(getX1(),getX2());
    float rightX = max(getX1(),getX2());
    
    float topY = min(getY1(),getY2());
    float bottomY = max(getY1(),getY2());
    if (vector.getSlope() == 0){
      if (x <= leftX || x >= rightX){
        return new Color(255,255,255);
      }
      float distFromLeft = (x-leftX)/(rightX-leftX);
      float distFromCenter = max(distFromLeft, 1 - distFromLeft);
      int intensity = Math.round(255 * distFromCenter);
      return new Color(intensity,intensity,intensity);
    } else {
      if (y <= topY || y >= bottomY){
        return new Color(255,255,255);
      }
      //println(String.format("%f %f %f", y,topY,bottomY));
      float distFromTop = (y-topY)/(bottomY-topY);
      float distFromCenter = max(distFromTop, 1 - distFromTop);
      int intensity = Math.round(255 * distFromCenter);
      //println(String.format("%f %f %f %d", y,topY,bottomY, intensity));
      return new Color(intensity,intensity,intensity);
    }
  }
}
