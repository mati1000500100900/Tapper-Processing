class Level extends Scene {
  ArrayList<Counter> counters;
  int number, customerPoints;
  Player player;
  float scales[]={0.927, 0.95, 0.975, 1};

  Level(boolean l1, int c1, boolean l2, int c2, boolean l3, int c3, boolean l4, int c4, int customerPoints, int number) {
    player=new Player();
    this.number=number;
    this.customerPoints=customerPoints;
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
      translate(0, -height/27);
      for (int i=0; i<counters.size(); i++) {
        Counter c=counters.get(i);
        translate(0, height/4.2);
        c.draw(scales[i], number);
        if (i==player.position) {
          c.drawPlayer(player, scales[i]);
        } else {
          c.drawTap(player, scales[i]);
        }
      }
      popMatrix();
      image(doors[number], 0, 0, 4*height/3, height);

      image(scoreboard, 0, 0, 4*height/3, height);
      for (int i=0; i<5; i++) {
        if (game.lives-i>0) image(beer, 2*height/3+height/75+(i*height/20), height/80, height/20, height/20);
        else image(emptybeer, 2*height/3+height/75+(i*height/20), height/80, height/20, height/20);
      }
      int scoreCache=game.score;
      for (int i=0; i<6; i++) {
        image(numbers[scoreCache%10],2*height/3-height/75-(i*height/24), height/70, -height/22, height/22);
        scoreCache/=10;
      }

      popMatrix(); // 4:3 Stop
      if (freezed<=0) {
        frame++;
        for (int i=0; i<counters.size(); i++) {
          Counter c=counters.get(i);
          c.update(player, i);
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
    if (player.busy==0 && freezed==0) {
      if (type.equals("UP")) {
        player.decreasePosition();
      } else if (type.equals("DOWN")) {
        player.increasePosition();
      } else {
        counters.get(player.position).throwBeer(type, 10, player);
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
