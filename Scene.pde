abstract class Scene {
  ArrayList<Button> buttons;
  boolean paused;
  int freezed;
  int frame;
  
  Scene() {
    freezed=0;
    frame=0;
    paused=false;
    buttons=new ArrayList<Button>();
  }
  void pause() {
    paused=true;
  }
  void resumePause() {
    paused=false;
  }
  void togglePause() {
    paused=!paused;
  }

  void handleButtonClicks(int x, int y) {
    for (Button b : buttons) {
      if (b.gotClicked(x, y)) {
        if (b.action.equals("exitApp")) {
          exit();
        } else if (b.action.equals("startInputTest")) {
          currentScene=new InputTest();
        } else if (b.action.equals("returnToMenu")) {
          currentScene=new Menu();
        } else if (b.action.equals("startGame")) {
          currentScene=game.levels.get(0);
        } else if (b.action.equals("pause")) {
          currentScene.togglePause();
        } else if (b.action.equals("nextLevel")) {
          game.nextLevel();
        }
      }
    }
  }
  abstract void draw();
  abstract void handleInputs(String type, int x, int y);
}
