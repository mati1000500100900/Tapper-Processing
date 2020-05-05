Scene currentScene;
Game game;

void setup() {
  orientation(LANDSCAPE);
  fullScreen(P2D);
  frameRate(30);
  currentScene = new Menu();
  game = new Game();
}

void draw() {
  currentScene.draw();
}
