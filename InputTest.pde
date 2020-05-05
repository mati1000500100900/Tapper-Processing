class InputTest extends Scene {
  String lastInput="";

  InputTest() {
    buttons.add(new Button(width-150, 50, height/10, height/10, "X", "returnToMenu"));
  }

  void draw() {
    background(204);
    textSize(100);
    fill(0);
    textSize(height/10);
    textAlign(BASELINE);
    text("Test dotyku", width/10, height/10);
    text(lastInput, width/10, (height/10)*2);
    if(mousePressed){
      circle(mouseX,mouseY,height/20);
    }
    for (Button b : buttons) {
      b.draw();
    }
  }
  void handleInputs(String type, int x, int y) {
    this.lastInput=type;
  };
}
