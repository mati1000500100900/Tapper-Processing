Scene currentScene;
Game game;
PImage idle[], pause, menu, backgrounds[], doors[], counter;

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
  backgrounds = new PImage[5];
  doors = new PImage[5];
  for (int i=0; i<5; i++) {
    backgrounds[i]=loadImage("Level"+i+"/Background.png");
    doors[i]=loadImage("Level"+i+"/Doors.png");
  }
}
