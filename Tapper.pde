String lastInput="";

void setup() {
  orientation(LANDSCAPE);
  fullScreen(P2D);
  noStroke();
  fill(0);
}

void draw() {
  background(204);
  textSize(100);
  text("Super apka", 100, 100);
  text(lastInput, 100, 200);
  if (mousePressed) {
    circle(mouseX, mouseY, height/10);
  }
}
