abstract class Scene {
  ArrayList<Button> buttons;
  boolean paused;
  Scene() {
    buttons=new ArrayList<Button>();
  }
  void pasue() {
    paused=true;
  }
  void resumePause() {
    paused=false;
  }

  abstract void drawFrame();
  abstract void handleInputs(String type, int x, int y);
}
