Scene currentScene;
Game game;
PImage idle[];

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

void loadAssets(){
  idle = new PImage[2];
  idle[0]=loadImage("Idle0.png");
  idle[1]=loadImage("Idle1.png");
}
