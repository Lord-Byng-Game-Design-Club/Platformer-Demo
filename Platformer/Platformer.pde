import fisica.*;

int gridSize = 50;
int zoom;

PImage[] idle,runLeft,runRight,grab, attackR, attackL, jumpR, currentAction,previousAction;
PImage surfaces, grounds, corners, walls, groundCorners; 

int index = 0;
int frame = 0;
int changeRate = 6;
color black = #000000;
color orange = #FFA600;
color red = #FF0000;
color green = #24ff00;
color blue = #0073FF;

boolean upKey,downKey,leftKey,rightKey, spaceKey, attackKey;

ArrayList<FContact> playerC;
ArrayList<FBox> boxes;
PVector spawnPoint = new PVector(100,50);
FBomb bomb = null;
Player player;
FBox attackSensor;
FBox ground;
FWorld world1;


void setup(){
   size(1000,1000);
   Fisica.init(this);
   world1 = new FWorld(-10000,-10000,10000,100000);
   world1.setGravity(0,1200);
   
//Tile Assets Load===================================================================================

   surfaces = loadImage("surface.png");
   surfaces.resize(gridSize,gridSize);
   grounds = loadImage("ground.png");
   grounds.resize(gridSize,gridSize);
   corners = loadImage("corner.png");
   corners.resize(gridSize,gridSize);
   groundCorners = loadImage("groundCorner.png");
   groundCorners.resize(gridSize,gridSize);
   walls = loadImage("wall.png");
   walls.resize(gridSize,gridSize);
   
//Player Assets Load===================================================================================

   idle = new PImage[4];
   grab = new PImage[4];
   runLeft = new PImage[6];
   runRight = new PImage[6];
   attackR = new PImage[6];
   attackL = new PImage[6];
   jumpR = new PImage[1];
   
   for(int i = 0;i<6;i++){
     PImage img = loadImage("run0" + i + ".png");
     runRight[i] = img;
     img = loadImage("runL0" + i + ".png");
     runLeft[i] = img;
     img = loadImage("attack2-0" + i + ".png");
     attackR[i] = img;
     img = loadImage("attack2-0" + i + "L.png");
     attackL[i] = img;   
   }
   for(int i = 0;i<4;i++){
     PImage img = loadImage("idle0" + i + ".png");
     idle[i] = img;
     img = loadImage("grab0" + i + ".png");
     grab[i] = img;
   } 
   jumpR[0] = loadImage("jumpR-00.png");
   
   currentAction = idle;
   
//Load World===============================================================

   boxes = new ArrayList();
   loadWorld();
   
//Load Player Data=========================================================

   player = new Player(40,56);
   player.setPosition(spawnPoint.x,spawnPoint.y);
   player.setFillColor(black);
   player.setRotatable(false);
   
//Load Sensors=============================================================

   attackSensor = new FBox(80,player.getHeight());
   attackSensor.setFillColor(black);
   attackSensor.setStatic(true);
   attackSensor.setSensor(true);
   world1.add(player);
}


void draw(){
  background(255);
  
  pushMatrix();
  translate(-player.getX()+width/2,-player.getY()+height/2 + 50);
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
  if(key==' ')spaceKey=true;
  if(key=='j')attackKey=true;
}

void keyReleased(){
  if(key=='w')upKey=false;
  if(key=='a')leftKey=false;
  if(key=='s')downKey=false;
  if(key=='d')rightKey=false;
  if(key==' ')spaceKey=false;
  if(key=='j')attackKey=false;
}
