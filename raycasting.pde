Player p1;
World world;
final float ANGLE_STEP = 15; 

void setup(){
  size(640,360);
  smooth(8);
  p1 = new Player();
  world = new World(p1);
  world.addWall(new Wall(0,0,0,100));
  world.addWall(new Wall(0,0,50,0));
  world.addWall(new Wall(50,0,50,50));
  //world.addWall(new Wall(0,50,0,100));
  world.addWall(new Wall(0,100,50,100));
  world.addWall(new Wall(50,100,50,150));
  world.addWall(new Wall(100,0,100,50));
  world.addWall(new Wall(100,50,150,100));
  world.addWall(new Wall(100,100,150,100));
  world.addWall(new Wall(100,100,100,150));
  //world.addWall(new Wall(100,20,120,0));
  //world.addWall(new Wall(50,20,0,20));
  //world.addWall(new Wall(10,4,0,100));
  //world.addWall(new Wall(100,20,120,200));
  //world.addWall(new Wall(100,20,120,200));
  //world.addWall(new Wall(100,20,120,200));
  //world.addWall(new Wall(100,20,120,200));
}

void draw(){
  clear();
  background(0);
  fill(255);
  world.drawScreen();
  fill(0);
  text(round(frameRate),100,100);
  world.drawMap();
  /*print("x: " + p1.x);
  print(" y: " + p1.y);
  print(" theta: " + p1.theta);
  print("\n");*/
}

void keyPressed(){
  if(key == CODED){
    float dx,dy;
    float radTheta = radians(p1.theta);
    switch(keyCode){
      
      case UP:
        dx = p1.SPEED * cos(radTheta);
        dy = p1.SPEED * sin(radTheta);
        p1.move(dx,dy);
        break;
      case DOWN:
        dx = -p1.SPEED * cos(radTheta);
        dy = -p1.SPEED * sin(radTheta);
        p1.move(dx,dy);
        break;
      case LEFT:
        p1.rotate(-ANGLE_STEP);
        break;
      case RIGHT:
        p1.rotate(ANGLE_STEP);
        break;
    }
  }
}
