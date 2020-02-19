/*void updatePlayer(){
  vx = 0;
  canJump = false;
  player.setRotation(0);

  playerC = player.getContacts();
  previousAction = currentAction;
  for(FContact a:playerC){
    if(a.contains("surface")){
      canJump = true;
    }
  }
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
  if(currentAction != attackL && currentAction != attackR){
    world1.remove(attackSensor);
  }
  if(attackFrameCount != 0){
    if(direction == 0){
      attackSensor.setPosition(player.getX() - player.getWidth(),player.getY());
    }else{
      attackSensor.setPosition(player.getX() + player.getWidth(),player.getY());
    }
  }
  
  
  if(leftKey && !inAction){
    vx=-300;
    currentAction = runLeft;
    direction = 0;
  }
  if(rightKey && !inAction){
    vx=300;
    currentAction = runRight;
    direction = 1;
  }
  if(!leftKey && !inAction && !rightKey){
    currentAction = idle;
  }
  if(upKey && canJump && !inAction){
    player.setVelocity(0,-400);
  }
  player.setVelocity(vx,player.getVelocityY());
  if(spaceKey && bomb == null){
    bomb = new FBomb();
  }
  if(bomb !=null){
    bomb.tick();
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
*/
void updatePlayer(){
  player.playerMove();
  player.playerAttack();
  player.playerCostume();
}
