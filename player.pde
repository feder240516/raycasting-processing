class Player{
  float x, y, theta;
  static final float VISION = 60;
  static final int NUM_RAYS = 640;
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
    
    Vector2d[] rays = new Vector2d[NUM_RAYS];
    
    float dtheta = VISION / (NUM_RAYS + 1);
    
    for (int  i = 0; i < NUM_RAYS; ++i){
      float thisTheta = theta - VISION / 2 + dtheta * (i+1);
      rays[i] = new Vector2d(this.x,this.y,
                    cos(radians(thisTheta)),sin(radians(thisTheta)));
      
    }
    
    return rays;
  }
}
