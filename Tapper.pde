Scene currentScene;

void setup() {
  orientation(LANDSCAPE);
  fullScreen(P2D);
  currentScene = new Menu();
}

void draw() {
  currentScene.drawFrame();
}
