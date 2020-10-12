float INF_THRESHOLD = 1e4;
float ZERO_THRESHOLD = 1e-4;

class World{
  
  static final float FULL_DISTANCE = 20f;
  
  ArrayList<Wall> walls;
  Player player;
  World(){
    this(null);
  }
  
  World(Player player){
    walls = new ArrayList<Wall>();
    this.player = player;
  }
  
  void addWall(Wall w){
    walls.add(w);
  }
  
  float distanceToWall(Vector2d vRay, Vector2d vWall){
    println(vRay);
    println(vWall);
    float m1 = vRay.getSlope();
    float m2 = vWall.getSlope();
    float minv1 = vRay.getSlopeInv();
    float minv2 = vWall.getSlopeInv();
    float b1 = vRay.getCutY();
    float b2 = vWall.getCutY();
    float d1 = vRay.getCutX();
    float d2 = vWall.getCutX(); 
    
    // pendientes paralelas
    if((m1 > INF_THRESHOLD && m2 > INF_THRESHOLD) || abs(m2-m1) < ZERO_THRESHOLD){
      return -1;
    }else{
      /**
       * m1x + b1 = m2x + b2
       * x(m1 - m2) = b2-b1
       * x = (b2-b1)/(m1-m2)
       */
      if(m1 > INF_THRESHOLD || m2 > INF_THRESHOLD){
        float y = (d2-d1)/(minv1-minv2);
        float x = minv1 * y + d1;
        // TODO
        if (y >= min(vWall.starty, vWall.starty+vWall.dy)
            && y <= max(vWall.starty, vWall.starty+vWall.dy)
            && ((y>vRay.starty) == (vRay.dy > 0))){
          return sqrt(pow(x-vRay.startx,2)+pow(y-vRay.starty,2));
        }
        return -1;
      }else{
        float x = (b2-b1)/(m1-m2);
        float y = m1 * x + b1;
        println(x,y);
        if (x >= min(vWall.startx,vWall.startx+vWall.dx)
            && x <= max(vWall.startx,vWall.startx+vWall.dx)
            && ((x>vRay.startx) == (vRay.dx > 0))){
              return sqrt(pow(x-vRay.startx,2)+pow(y-vRay.starty,2));
        } else {
          return -1;
        }
      }
    }
  }
  
  Pair<Wall,Float> checkRay(Vector2d vRay){
    Wall selectedWall = null;
    float minDist = Float.POSITIVE_INFINITY; 
    for(Wall wall: walls){
      float thisDist = distanceToWall(vRay,wall.vector);
      if (thisDist > 0) println("collision: " + thisDist);
      if (thisDist > 0 && thisDist < minDist){
        
        selectedWall = wall;
        minDist = thisDist;
      }
    }
    return new Pair<Wall,Float>(selectedWall,minDist);
  }
  
  void drawScreen(){

    //float widthDist = SCREEN_WIDTH;
    if (player == null){
      text("No player",0,0,0 );
    }else{
      
      Vector2d[] rays = player.getRays();
      int numRays = rays.length;
      
      for(int  i = 0; i < numRays; ++i){
        Pair<Wall,Float> collision = checkRay(rays[i]);
        // print("hello\n");
        if (collision.first != null){
          // print("height: ");
          
          float objHeight = FULL_DISTANCE * height / collision.second;
          if (objHeight > height) objHeight = height;
          stroke(255);
          rect(i * width / numRays,(height-objHeight)/2,width / numRays,objHeight);
        }
      }
      
    }
  }
  
  void drawMap(){
    stroke(128,128,128,40);
    circle(p1.x,p1.y,50);
    Vector2d[] rays = p1.getRays();
    
    for(Vector2d ray: rays){
      float m = ray.getSlope();
      float b = ray.getCutY();
      if(m == Float.POSITIVE_INFINITY || m > INF_THRESHOLD){ 
        line(rays[0].startx,0,ray.startx,height);
      }else{
        line(0,b,width,m*width+b);  
      }
    }
    
    for(Wall w: walls){
      line( w.vector.startx,
            w.vector.starty,
            w.vector.startx+w.vector.dx,
            w.vector.starty+w.vector.dy);
    }
    
  }
  
}
