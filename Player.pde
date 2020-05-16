class Player {
  int position;
  int busy;
  Player() {
    busy=0;
    position=3;
  }
  void draw(float scaleX) {
    fill(255, 0, 0);
    stroke(0);
    //rect(4*height/3-height/20, 0, -height/15, height/15);
    if (busy<=0) image(idle[(frameCount/8)%2], ((4*height/3)-height/6)*scaleX, -height/6, height/8, height/4);
    else { 
      busy--;
      image(filling[9-((busy)%10)], ((4*height/3)-height/6)*scaleX, -height/6, height/8, height/4);
    }
  }

  void drawTap(float scaleX) {
    fill(255, 0, 0);
    stroke(0);
    //rect(4*height/3-height/20, 0, -height/15, height/15);
    image(tap, ((4*height/3)-height/6)*scaleX, -height/6, height/8, height/4);
  }

  void decreasePosition() {
    position=(position+3)%4;
  }

  void increasePosition() {
    position=(position+1)%4;
  }
}
