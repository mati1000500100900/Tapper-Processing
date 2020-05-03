class InputTest extends Scene {
  String lastInput="";

  InputTest() {
    super();
    buttons.add(new Button(width-150, 50, height/10, height/10, "X"));
  }

  void drawFrame() {
    background(204);
    textSize(100);
    fill(0);
    textSize(height/10);
    textAlign(BASELINE);
    text("Test dotyku", width/10, height/10);
    text(lastInput, width/10, (height/10)*2);
    
    for(Button b : buttons){
        b.draw();
      }
  }
  void handleInputs(String type, int x, int y) {
    lastInput=type;
    if (type.equals("TOUCH")) {
      for (Button b : buttons) {
        if (x>=b.x && x<=b.x+b.w && y>=b.y && y<= b.y+b.h) {
          if (b.text.equals("X")) {
            currentScene=new Menu();
          }
        }
      }
    }
  }
}
