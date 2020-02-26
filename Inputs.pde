//static variables
float touchStartX, touchStartY;

void mousePressed() {
  touchStartX=mouseX;
  touchStartY=mouseY;
}

//swipe detection
void mouseReleased() {
  float swipeX=mouseX-touchStartX;
  float swipeY=mouseY-touchStartY;
  boolean touched=true;
  if (abs(swipeX)>abs(swipeY)) {
    if (abs(swipeX)>width/10) {
      touched=false;
      if (swipeX>0) {
        lastInput="swipe RIGHT";
      } else {
        lastInput="swipe LEFT";
      }
    }
  } else {
    if (abs(swipeY)>height/6) {
      touched=false;
      if (swipeY>0) {
        lastInput="swipe DOWN";
      } else {
        lastInput="swipe UP";
      }
    }
  }
  if (touched) {
    lastInput="touch";
  }
  println(lastInput);
}
