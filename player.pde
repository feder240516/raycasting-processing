class Player{
  float x, y, theta;
  static final float VISION = 20;
  final float SPEED = 5;
  
  Player(){
    this.x = 0;
    this.y = 0;
    this.theta = 0;
  }
  
  void move(float dx, float dy){
    this.x += dx;
    this.y += dy;
  }
  
  void rotate(float dtheta){
    this.theta += dtheta;
    
  }
  
  
  
  Vector2d[] getRays(){
    Vector2d[] rays = new Vector2d[1];
    
    for (int  i = 0; i < 1; ++i){
      rays[i] = new Vector2d(this.x,this.y,
                    cos(radians(theta)),sin(radians(theta)));
      
    }
    
    return rays;
  }
}
