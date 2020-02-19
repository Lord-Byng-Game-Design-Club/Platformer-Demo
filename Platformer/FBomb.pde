class FBomb extends FBox{
  int timer;
  FBomb(){
    super(gridSize,gridSize);
    this.setPosition(player.getX() + gridSize,player.getY() - gridSize);
    this.setFillColor(orange);
    world1.add(this);
    timer = 60;
  }
  
  void tick(){
    timer--;
    if(timer == 0){
      explode();  
      bomb = null;
      world1.remove(this);
    }
  }
  
  void explode(){
    for(int i = 0;i<boxes.size();i++){
      FBox b = boxes.get(i);
      if(dist(b.getX(),b.getY(),bomb.getX(),bomb.getY()) < 200){
        b.setStatic(false);
        float vx = b.getX() - bomb.getX();
        float vy = b.getY() - bomb.getY();
        b.setVelocity(vx * 5,vy * 5);
      }
    }
  }
}  
