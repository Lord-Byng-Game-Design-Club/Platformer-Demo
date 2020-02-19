void loadWorld(){
    int x = 0;
    int y = 0;
    PImage map = loadImage("world.png");
    while(y<map.height){
      color c = map.get(x,y);
      if(c == black){
        createSurface(x,y);
      }
      if(c == red){
        createGround(x,y);
      }
      if(c == orange){
        createWall(x,y);
      }
      if(c == green || c == blue){
        createCorner(x,y,c);
      }
      x++;
      if(x==map.width){
        y++;
        x=0;
      }
    }
    
}
