void loadWorld(){
    int x = 0;
    int y = 0;
    PImage map = loadImage("world.png");
    while(y<map.height){
      color c = map.get(x,y);
      if(c == black){
        createGround(x,y);
      }
      x++;
      if(x==map.width){
        y++;
        x=0;
      }
    }
}
