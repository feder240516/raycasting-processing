class World{
  ArrayList<Wall> walls;
  Player player;
  static final int SCREEN_WIDTH = 640;
  static final int SCREEN_HEIGHT = 360;
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
    DoubleOrInf m1 = vRay.getPendiente();
    DoubleOrInf m2 = vWall.getPendiente();
    float b1 = vRay.getCorte();
    float b2 = vRay.getCorte();
    if(m1.equalTo(m2)){
      return -1;
      /*if (abs(b1 - b2) < 1e-12){
        return min(abs(vWall.)
      }*/
    }else{
      // m1x + b1 = m2x + b2
      // x(m1 - m2) = b2-b1
      // x = (b2-b1)/(m1-m2)
      if(m1.isInf){
        // TODO
        return -1;
      }else if (m2.isInf){
        // TODO
        return -1;
      }else{
        float x = (b2-b1)/(m1.value-m2.value);
        float y = m1.value * x + b1;
        if (x >= min(vWall.startx,vWall.startx+vWall.dx)
            && x <= max(vWall.startx,vWall.startx+vWall.dx)){
              return sqrt(pow(x-vRay.startx,2)+pow(y-vRay.starty,2));
        } else {
          return -1;
        }
      }
    }
  }
  
  Pair<Wall,DoubleOrInf> checkRay(Vector2d vRay){
    Wall selectedWall = null;
    DoubleOrInf minDist = new DoubleOrInf(); 
    for(Wall wall: walls){
      float thisDist = distanceToWall(vRay,wall.vector);
      if (thisDist > 0) print("collision\n");
      if (thisDist > 0 && (minDist.isInf || thisDist < minDist.value)){
        
        selectedWall = wall;
        minDist = new DoubleOrInf(thisDist);
      }
    }
    return new Pair<Wall,DoubleOrInf>(selectedWall,minDist);
  }
  
  void drawScreen(){

    float widthDist = SCREEN_WIDTH;
    if (player == null){
      text("No player",0,0,0 );
    }else{
      
      Vector2d[] rays = player.getRays();
      
      for(int  i = 0; i < rays.length; ++i){
        Pair<Wall,DoubleOrInf> collision = checkRay(rays[i]);
        // print("hello\n");
        if (collision.first != null){
          // print("height: ");
          
          float objHeight = SCREEN_HEIGHT / collision.second.value;
          // print(objHeight);
          // print("\n");
          rect(0,(SCREEN_HEIGHT-objHeight)/2,SCREEN_WIDTH,objHeight);
        }
      }
      
    }
  }
  
  void drawMap(){
    
    circle(p1.x,p1.y,10);
    Vector2d[] rays = p1.getRays();
    for(Vector2d ray: rays){
      DoubleOrInf mWrap = ray.getPendiente();
      float b = ray.getCorte();
      if(mWrap.isInf){ 
        line(rays[0].startx,0,ray.startx,height);
      }else{
        line(0,b,width,mWrap.value*width+b);  
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
