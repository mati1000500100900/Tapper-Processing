class GameOver extends Scene {
  GameOver(){
    freezed=150;
  }
  
  void draw() {
    background(204);
    fill(0);
    textSize(height/10);
    textAlign(CENTER, CENTER);
    text("GAME OVER", width/2, height/2);
    if (freezed>0)freezed--;
    if(freezed==0) currentScene=new Menu();
  }
  void handleInputs(String type, int x, int y) {
    currentScene=new Menu();
  }
}
