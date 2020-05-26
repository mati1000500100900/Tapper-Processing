Scene currentScene;
Game game;
PImage idle[], pause, menu, gameover, backgrounds[], doors[], counter[], clients[][], filling[], numbers[], beer, emptybeer, tap, scoreboard, tiles;

void setup() {
  orientation(LANDSCAPE);
  fullScreen(P2D);
  frameRate(30);
  currentScene = new Menu();
  game = new Game();
  loadAssets();
}

void draw() {
  image(tiles, 0, 0, width, height);
  currentScene.draw();
}

void loadAssets() {
  idle = new PImage[2];
  idle[0]=loadImage("Idle0.png");
  idle[1]=loadImage("Idle1.png");
  pause=loadImage("Pause.png");
  menu=loadImage("Menu.png");
  beer=loadImage("Life.png");
  tiles=loadImage("Blackbars-highres.png");
  gameover=loadImage("Gameover.png");
  emptybeer=loadImage("EmptyLife.png");
  tap=loadImage("Lever.png");
  scoreboard=loadImage("Score.png");

  counter = new PImage[13];
  backgrounds = new PImage[13];
  doors = new PImage[13];
  clients = new PImage[13][10];
  for (int i=0; i<13; i++) {
    backgrounds[i]=loadImage("Level"+i+"/Background.png");
    doors[i]=loadImage("Level"+i+"/Doors.png");
    counter[i]=loadImage("Level"+i+"/Table.png");
    for (int j=0; j<10; j++) {
      clients[i][j]=loadImage("Level"+i+"/Client"+j+".png");
    }
  }
  numbers = new PImage[10];
  filling = new PImage[10];
  for (int i=0; i<10; i++) {
    filling[i]=loadImage("Filling"+i+".png");
    numbers[i]=loadImage(i+".png");
  }
  
}
