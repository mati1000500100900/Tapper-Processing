class Counter {
  boolean fromLeft;
  int customersCount;
  int randomOffset;
  int beerDelay;
  ArrayList<Customer> customers;
  ArrayList<Beer> beers;

  Counter(boolean l, int cc) {
    this.beerDelay=0;
    this.fromLeft=l;
    this.customersCount=cc;
    this.randomOffset=int(random(0, 10));
    this.restart();
  }
  void restart() {
    customers = new ArrayList<Customer>();
    beers = new ArrayList<Beer>();
    for (int i=0; i<customersCount; i++) {
      customers.add(new Customer(floor(random(10)), (-30*i)+randomOffset));
    }
  }
  void draw(float scaleX, int number) {
    fill(100);
    stroke(0);
    pushMatrix();
    if (!fromLeft) {
      translate(4*height/3, 0);
      scale(-1, 1);
    }
    scale(scaleX, 1);
    //rect(0, 0, ((height*4)/3)*0.9, height/12);
    image(counter, 0, 0, ((height*4)/3)*0.9, height/12);
    for (Customer c : customers) {
      c.draw(number);
    }
    for (Beer b : beers) {
      b.draw();
    }

    popMatrix();
  }
  void update(Player player, int number) {
    if (beerDelay>0) {
      if (beerDelay==1) beers.add(new Beer());
      beerDelay--;
    }

    for (Customer c : customers) {
      c.update();
    }
    for (Beer b : beers) {
      b.update();
    }
    for (Customer c : customers) {
      for (Beer b : beers) {
        if (c.x>=b.x) { // client colided with beer
          if (b.full && c.drinking==0 && !c.isGoingBack) {

            if (int(random(0, 8))==2) {
              c.drinking=30;
              b.full=false;
              b.wait=30;
            } else {
              beers.remove(b);
              c.isGoingBack=true;
            }
            break;
          }
        }
      }
    }
    for (Customer c : customers) { // garbage collection
      if (c.x<0 && c.isGoingBack) {
        game.score+=game.levels.get(game.currentLevel).customerPoints;
        customers.remove(c);
        break;
      }
    }
    for (Beer b : beers) {
      if (b.x>320 && player.position==number && !b.full || b.x>340) {
        game.score+=100;
        beers.remove(b); 
        break;
      }
    }
  }

  void drawPlayer(Player p, float scaleX) {
    pushMatrix();
    if (!fromLeft) {
      translate(4*height/3, 0);
      scale(-1, 1);
    }
    p.draw(scaleX);
    popMatrix();
  }

  void drawTap(Player p, float scaleX) {
    pushMatrix();
    if (!fromLeft) {
      translate(4*height/3, 0);
      scale(-1, 1);
    }
    p.drawTap(scaleX);
    popMatrix();
  }



  boolean checkForLose(Player player, int pos) {
    boolean r=false;
    for (Customer c : customers) {
      if (c.checkForLose()) {
        return true;
      }
    }
    for (Beer b : beers) {
      if (b.checkForLose(player, pos)) {
        return true;
      }
    }
    return r;
  }
  void throwBeer(String type, int delay, Player player) {
    if ((fromLeft && type.equals("LEFT")) || (!fromLeft && type.equals("RIGHT"))) {
      beerDelay=delay;
      player.busy=delay;
    }
  }
}
