class Player{
  int position;
  int busy;
  Player(){
    busy=0;
    position=3;
  }
  void draw(){
    fill(255,0,0);
    stroke(0);
    //rect(4*height/3-height/20, 0, -height/15, height/15);
    image(idle[(frameCount/8)%2],4*height/3-height/6, -height/20, height/15, height/7.5);
    if(busy>0) busy--;
  }
  
  void decreasePosition(){
    position=(position+3)%4;
  }
  
  void increasePosition(){
    position=(position+1)%4;
  }
}
