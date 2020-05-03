class Menu extends Scene {
  Menu() {
    super();
    buttons = new ArrayList<Button>();
    buttons.add(new Button(width/2-110, height/2-100, 220, 100, "PLAY"));
    buttons.add(new Button(width/2-110, height/2+100, 220, 100, "TEST"));
    buttons.add(new Button(width-150, 50, height/10, height/10, "X"));
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
    if (type.equals("TOUCH")) {
      for (Button b : buttons) {
        if (x>=b.x && x<=b.x+b.w && y>=b.y && y<= b.y+b.h) {
          if (b.text.equals("X")) {
            exit();
          } else if (b.text.equals("TEST")) {
            currentScene=new InputTest();
          }
        }
      }
    }
  }
}
