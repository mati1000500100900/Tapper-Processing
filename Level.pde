class Level extends Scene {
  ArrayList<Counter> counters;
  String type;
  Player player;

  Level(boolean l1, int c1, boolean l2, int c2, boolean l3, int c3, boolean l4, int c4, String type) {
    player=new Player();
    this.type=type;
    freezed=30;
    counters=new ArrayList<Counter>();
    counters.add(new Counter(l1, c1));
    counters.add(new Counter(l2, c2));
    counters.add(new Counter(l3, c3));
    counters.add(new Counter(l4, c4));
    buttons.add(new Button(width-150, 50, height/10, height/10, "X", "returnToMenu"));
    buttons.add(new Button(width-150, 50+height/10, height/10, height/10, "II", "pause"));
    buttons.add(new Button(width-150, height-150, height/10, height/10, ">", "nextLevel"));
  }
  void draw() {
    background(204);
    fill(0);
    if (paused) {
      textSize(height/10);
      textAlign(CENTER, CENTER);
      text("PAUSE", width/2, height/2);
    } else {
      pushMatrix(); // 4:3 Start
      translate((width-(height*4)/3)/2, 0);

      textSize(height/10);
      textAlign(LEFT, TOP);
      text("SCORE:"+game.score, 0, 0);

      textAlign(RIGHT, TOP);
      text(this.type, 4*height/3, 0);

      pushMatrix();
      translate(0, height/6);
      for (int i=0; i<counters.size(); i++) {
        Counter c=counters.get(i);
        translate(0, height/6);
        c.draw();
        if (i==player.position) {
          c.drawPlayer(player);
        }
      }
      popMatrix();
      popMatrix(); // 4:3 Stop
      if (freezed==0) {
        frame++;
        for (Counter c : counters) {
          c.update();
        }
      }
    }
    for (Button b : buttons) {
      b.draw();
    }
    this.checkForLose();
    if(this.checkForWin()){
      //wygrane
      game.score+=1000;
      game.nextLevel();
    }
    if (freezed>0)freezed--;
  }


  void handleInputs(String type, int x, int y) {
    if (player.busy==0) {
      if (type.equals("UP")) {
        player.decreasePosition();
      } else if (type.equals("DOWN")) {
        player.increasePosition();
      } else {
        counters.get(player.position).throwBeer(type);
        player.busy=5;
      }
    }
  }

  void restart() {
    frame=0;
    freezed=50;
    for (Counter c : counters) {
      c.restart();
    }
  }
  void checkForLose() {
    for (int i = 0; i<4; i++) {
      Counter c= counters.get(i);
      if (c.checkForLose(player, i)) {
        game.lives--;
        if(game.lives==0){
          currentScene=new GameOver();
        }
        else this.restart();
      }
    }
  }
  boolean checkForWin() {
    boolean r=true;
    for (Counter c : counters) {
      if (c.customers.size()!=0 || c.beers.size()!=0) return false;
    }
    return r;
  }
}
