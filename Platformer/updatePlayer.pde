void updatePlayer(){
  vx = 0;
  canJump = false;
  player.setRotation(0);
  playerC = player.getContacts();
  if(playerC.size() > 0){
    canJump = true;
  }
  if(leftKey){
    vx=-300;
    currentAction = runLeft;
  }
  if(rightKey){
    vx=300;
    currentAction = runRight;
  }
  if(!rightKey && !leftKey){
    currentAction = idle;
    index = 0;
  }
  player.setVelocity(vx,player.getVelocityY());
  if(upKey && canJump){
    player.addImpulse(0,-2000);
  }
  
  player.attachImage(currentAction[index]);
  if(frameCount%10==0){
    index++;
    if(index >= currentAction.length){
      index=0;
    }
  }
}
