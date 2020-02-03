void createGround(int x, int y){
  ground = new FBox(gridSize,gridSize);
  ground.setPosition(x*gridSize + gridSize/2,y*gridSize + gridSize/2);
  ground.setStatic(true);
  ground.setFillColor(black);
  ground.setFriction(1.5);
  world1.add(ground);
}
