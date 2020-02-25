void setup() {
  fullScreen();
  noStroke();
  fill(0);
}

void draw() {
  background(204);
  if (mousePressed) {
    circle(mouseX,mouseY,height/10);
  }
}
