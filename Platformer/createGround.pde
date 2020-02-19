void createSurface(int x, int y){
  ground = new FBox(gridSize,gridSize);
  ground.setPosition(x*gridSize + gridSize/2,y*gridSize + gridSize/2);
  ground.setStatic(true);
  ground.setFillColor(black);
  ground.setFriction(1.5);
  ground.setName("surface");
  ground.attachImage(surfaces);
  world1.add(ground);
  boxes.add(ground);
}
void createGround(int x, int y){
  ground = new FBox(gridSize,gridSize);
  ground.setPosition(x*gridSize + gridSize/2,y*gridSize + gridSize/2);
  ground.setStatic(true);
  ground.setFillColor(black);
  ground.setFriction(1.5);
  ground.setName("ground");
  ground.attachImage(grounds);
  world1.add(ground);
  boxes.add(ground);
}

void createWall(int x, int y){
  ground = new FBox(gridSize,gridSize);
  ground.setPosition(x*gridSize + gridSize/2,y*gridSize + gridSize/2);
  ground.setStatic(true);
  ground.setFillColor(black);
  ground.setFriction(1.5);
  ground.setName("wall");
  ground.attachImage(walls);
  world1.add(ground);
  boxes.add(ground);
}

void createCorner(int x, int y,color c){
  ground = new FBox(gridSize,gridSize);
  ground.setPosition(x*gridSize + gridSize/2,y*gridSize + gridSize/2);
  ground.setStatic(true);
  ground.setFillColor(black);
  ground.setFriction(1.5);
  ground.setName("corner");
  if(c == green){
  ground.attachImage(corners);
  }else if(c == blue){
    ground.attachImage(groundCorners);
  }
  world1.add(ground);
  boxes.add(ground);
}
