class Vector2d{
  float startx, starty, dx, dy;
  Vector2d(float startx, float starty, float dx, float dy){
    this.startx = startx;
    this.starty = starty;
    this.dx = dx;
    this.dy = dy;
  }
  
  DoubleOrInf getPendiente(){
    if(dx == 0 || abs(dy / dx) > 1e4) return new DoubleOrInf();
    else return new DoubleOrInf(dy/dx);
  }
  
  float getCorte(){
    DoubleOrInf pendiente = getPendiente();
    if (pendiente.isInf){
      return 0;
    }else{
      return starty - pendiente.value * startx; 
    }
  }
  
  String toString(){
    return String.format("v = (%f, %f) + t(%f, %f)",startx,starty,dx,dy) + "\n"
        +  String.format("y = %fx + %f", getPendiente().value, getCorte());
  }
  
}

class Wall{
  
  public Vector2d vector;
  
  Wall(float startx, float starty, float endx, float endy){
    this.vector = new Vector2d(startx, starty, endx-startx, endy-starty);
  }
}
