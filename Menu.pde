class Menu extends Scene {
  Menu() {
    buttons = new ButtonsList();
    buttons.add(new Button(int(width/2-height/5.6), height/2-height/15, int(height/2.8), height/15, "PLAY", "startGame"));
    buttons.add(new Button(int(width/2-height/5.6), height/2+height/25, int(height/2.8), height/15, "TEST", "startInputTest"));
    buttons.add(new Button(int(width/2-height/5.6), int(height/2+height/6.8), int(height/2.8), height/15, "X", "exitApp"));
  }
  void draw() {
    background(0);
    pushMatrix(); // 4:3 Start
    translate((width-(height*4)/3)/2, 0);
    image(menu,0,0, 4*height/3,height);
    popMatrix();
  }
  void handleInputs(String type, int x, int y) {
    
  }
  @Override
  void pause(){
    exit();
  }
}
