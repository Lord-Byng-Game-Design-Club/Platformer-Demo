class Player extends FBox{
  private int vx,vy;
  private int attackFrameCount;
  private int direction;//0=left,1=right
  private boolean canJump, preAction, inAction;
  Player(int x,int y){
   super(x,y);
   this.attackFrameCount = 0;
   this.inAction = false;
  }
//==========================================================================================================  
  void playerMove(){
    previousAction = currentAction;
  this.vx = 0;
  canJump = false;
  player.setRotation(0);
  playerC = player.getContacts();
  //if(currentAction != attackL && currentAction != attackR){
  //  world1.remove(attackSensor);
  //}
  for(FContact a:playerC){
    if(a.contains("surface")){
      canJump = true;
    }
  }
  if(leftKey && !inAction){
    this.vx=-500;
    currentAction = runLeft;
    direction = 0;
  }
  if(rightKey && !inAction){
    this.vx=500;
    currentAction = runRight;
    direction = 1;
  }
  if(!leftKey && !inAction && !rightKey){
    currentAction = idle;
  }
  if(upKey && canJump && !inAction){
    player.setVelocity(0,-500);
  }
  if(!canJump){
    currentAction = jumpR;
  }
   player.setVelocity(vx,player.getVelocityY());
  }
//==========================================================================================================  
  void playerAttack(){
  if(attackKey){
    inAction = true;
    if(direction == 1){
    currentAction = attackR;
    }
    if(direction == 0){
    currentAction = attackL; 
    }
    world1.add(attackSensor);
  }
  if(inAction){
    if(attackFrameCount < 36){
      attackFrameCount++;
    }else{
      attackFrameCount = 0;
      inAction = false;
    }
  }
  if(attackFrameCount != 0){
    if(direction == 0){
      attackSensor.setPosition(player.getX() - player.getWidth(),player.getY());
    }else{
      attackSensor.setPosition(player.getX() + player.getWidth(),player.getY());
    }
  }
    if(attackFrameCount < 6 || attackFrameCount > 30){
    world1.remove(attackSensor);
    }
  }
  
//==========================================================================================================  
  void playerCostume(){
    if(currentAction != previousAction){
      index = 0;
    }
    if(currentAction == jumpR){
      changeRate = 1000;
    }else{
      changeRate = 6;
    }
    if(frameCount%changeRate==0){
    index++;
    if(index > currentAction.length -1){
      index=0;
    }
  }
  if(previousAction != currentAction){
    index = 0;
  }
  player.attachImage(currentAction[index]);
  }
  
}
