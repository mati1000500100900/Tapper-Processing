Scene currentScene;
Game game;

void setup() {
  orientation(LANDSCAPE);
  fullScreen(P2D);
  currentScene = new Menu();
  game = new Game();
}

void draw() {
  currentScene.drawFrame();
}
