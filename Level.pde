class Level extends Scene {
  ArrayList<Counter> counters;
  String type;
  int number;
  Player player;
  float scales[]={0.94, 0.96, 0.98, 1};

  Level(boolean l1, int c1, boolean l2, int c2, boolean l3, int c3, boolean l4, int c4, String type, int number) {
    player=new Player();
    this.number=number;
    this.type=type;
    freezed=30;
    counters=new ArrayList<Counter>();
    counters.add(new Counter(l1, c1));
    counters.add(new Counter(l2, c2));
    counters.add(new Counter(l3, c3));
    counters.add(new Counter(l4, c4));

    buttons.add(new Button(width-150, height-150, height/10, height/10, ">", "nextLevel"));
  }
  void draw() {
    background(0);

    if (paused) {
      image(pause, (width-(height*4)/3)/2, 0, 4*height/3, height);
    } else {
      pushMatrix(); // 4:3 Start
      translate((width-(height*4)/3)/2, 0);

      image(backgrounds[number], 0, 0, 4*height/3, height);

      pushMatrix();
      translate(0, -height/18);
      for (int i=0; i<counters.size(); i++) {
        Counter c=counters.get(i);
        translate(0, height/4.1);
        c.draw(scales[i], number);
        if (i==player.position) {
          c.drawPlayer(player, scales[i]);
        }
        else{
          c.drawTap(player, scales[i]);
        }
      }
      popMatrix();
      image(doors[number], 0, 0, 4*height/3, height);

      fill(0);
      textSize(height/20);
      textAlign(LEFT, TOP);
      text("SCORE:"+game.score, 0, 0);

      textAlign(RIGHT, TOP);
      text(this.type, 4*height/3, 0);

      popMatrix(); // 4:3 Stop
      if (freezed==0) {
        frame++;
        for (Counter c : counters) {
          c.update();
        }
      }
    }
    if (!paused) {
      for (Button b : buttons) {
        b.draw();
      }
    }
    this.checkForLose();
    if (this.checkForWin()) {
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
        player.busy=20;
        counters.get(player.position).throwBeer(type); // delay it
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
        if (game.lives==0) {
          currentScene=new GameOver();
        } else this.restart();
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

  void pause() {
    paused=true;
    buttons.add(new Button(int(width/2-height/5.6), height/2+height/25, int(height/2.8), height/15, "X", "returnToMenu"));
    buttons.add(new Button(int(width/2-height/5.6), height/2-height/15, int(height/2.8), height/15, "II", "resumePause"));
  }
  void resumePause() {
    paused=false;
    buttons.remove(buttons.findByAction("returnToMenu"));
    buttons.remove(buttons.findByAction("resumePause"));
  }
}
