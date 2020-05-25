class GameOver extends Scene {
  GameOver() {
    freezed=150;
  }

  void draw() {
    background(0);
    pushMatrix(); // 4:3 Start
    translate((width-(height*4)/3)/2, 0);
    image(gameover, 0, 0, 4*height/3, height);
    popMatrix();
    if (freezed>0)freezed--;
    if (freezed==0) currentScene=new Menu();
  }
  void handleInputs(String type, int x, int y) {
    if (freezed<=0) {
      currentScene=new Menu();
    }
  }
}
