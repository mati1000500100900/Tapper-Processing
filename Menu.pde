class Menu extends Scene {
  Menu() {
    buttons = new ArrayList<Button>();
    buttons.add(new Button(width/2-110, height/2-100, 220, 100, "PLAY", "startGame"));
    buttons.add(new Button(width/2-110, height/2+100, 220, 100, "TEST", "startInputTest"));
    buttons.add(new Button(width-150, 50, height/10, height/10, "X", "exitApp"));
  }
  void drawFrame() {
    background(204);
    fill(0);
    textSize(height/10);
    textAlign(CENTER, CENTER);
    text("MENU", width/2, height*0.2);
    for (Button b : buttons) {
      b.draw();
    }
  }
  void handleInputs(String type, int x, int y) {
    
  }
}
