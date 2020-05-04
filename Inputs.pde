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
  String inputType="TOUCH";
  if (abs(swipeX)>abs(swipeY)) {
    if (abs(swipeX)>width/10) {
      if (swipeX>0) {
        inputType="RIGHT";
      } else {
        inputType="LEFT";
      }
    }
  } else {
    if (abs(swipeY)>height/6) {
      if (swipeY>0) {
        inputType="DOWN";
      } else {
        inputType="UP";
      }
    }
  }
  currentScene.handleInputs(inputType,mouseX,mouseY);
  if(inputType.equals("TOUCH")) currentScene.handleButtonClicks(mouseX,mouseY);
  //println(lastInput);
}
