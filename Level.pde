class Level extends Scene {
  Level() {
    buttons.add(new Button(width-150, 50, height/10, height/10, "X", "returnToMenu"));
    buttons.add(new Button(width-150, 50+height/10, height/10, height/10, "II", "pause"));
  }
  void drawFrame() {
    background(204);
    fill(0);
    textSize(height/10);
    textAlign(CENTER, CENTER);
    if (paused) {
      text("PAUSE", width/2, height*0.2);
    } else {
      text("GAME "+frame, width/2, height*0.2);
      frame++;
    }
    for (Button b : buttons) {
      b.draw();
    }
  }
  void handleInputs(String type, int x, int y) {
  };
}
