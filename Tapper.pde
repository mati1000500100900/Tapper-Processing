Scene currentScene;
Game game;
PImage idle[], pause, menu, backgrounds[], doors[], counter, clients[][], filling[], beer, emptybeer, tap;

void setup() {
  orientation(LANDSCAPE);
  fullScreen(P2D);
  frameRate(30);
  currentScene = new Menu();
  game = new Game();
  loadAssets();
}

void draw() {
  currentScene.draw();
}

void loadAssets() {
  idle = new PImage[2];

  idle[0]=loadImage("Idle0.png");
  idle[1]=loadImage("Idle1.png");
  pause=loadImage("Pause.png");
  menu=loadImage("Menu.png");
  counter=loadImage("Table.png");
  beer=loadImage("Life.png");
  emptybeer=loadImage("EmptyLife.png");
  tap=loadImage("Lever.png");

  backgrounds = new PImage[13];
  doors = new PImage[13];
  clients = new PImage[13][10];
  for (int i=0; i<9; i++) {
    backgrounds[i]=loadImage("Level"+i+"/Background.png");
    doors[i]=loadImage("Level"+i+"/Doors.png");
    for (int j=0; j<10; j++) {
      clients[i][j]=loadImage("Level"+i+"/Client"+j+".png");
    }
  }
  filling = new PImage[10];
  for (int i=0; i<10; i++) {
    filling[i]=loadImage("Filling"+i+".png");
  }
}
