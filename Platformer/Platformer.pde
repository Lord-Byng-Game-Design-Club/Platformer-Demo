import fisica.*;

int gridSize = 32;
int zoom;
int vx,vy;

PImage[] idle,runLeft,runRight,currentAction;
int index = 0;
int frame = 0;

float jumpCD;

color black = #000000;

boolean upKey,downKey,leftKey,rightKey, canJump, canMove;

ArrayList<FContact> playerC;

PVector spawnPoint = new PVector(100,50);

FBox player;
FBox ground;
FWorld world1;


void setup(){
   size(1000,1000);
   Fisica.init(this);
   world1 = new FWorld();
   world1.setGravity(0,500);
   idle = new PImage[4];
   runLeft = new PImage[6];
   runRight = new PImage[6];
   for(int i = 0;i<6;i++){
     PImage img = loadImage("run0" + i + ".png");
     img.resize(40,56);
     runRight[i] = img;
     PImage img2 = loadImage("runL0" + i + ".png");
     img2.resize(40,56);
     runLeft[i] = img2;
   }
   for(int i = 0;i<3;i++){
     PImage img = loadImage("idle0" + i + ".png");
     img.resize(45,56);
     idle[i] = img;
   } 
   currentAction = idle;
   
   loadWorld();
   player = new FBox(40,56);
   player.setPosition(spawnPoint.x,spawnPoint.y);
   player.setFillColor(black);
   world1.add(player);
}


void draw(){
  background(255);
  
  pushMatrix();
  translate(-player.getX()+width/2,-player.getY()+height/2);
  world1.step();
  world1.draw();
  popMatrix();
  
  updatePlayer();
  updateTerrain();
  updateEnemy();
}

void keyPressed(){
  if(key=='w')upKey=true;
  if(key=='a')leftKey=true;
  if(key=='s')downKey=true;
  if(key=='d')rightKey=true;
}

void keyReleased(){
  if(key=='w')upKey=false;
  if(key=='a')leftKey=false;
  if(key=='s')downKey=false;
  if(key=='d')rightKey=false;
}
