class Counter {
  boolean fromLeft;
  int customersCount;
  int randomOffset;
  ArrayList<Customer> customers;
  ArrayList<Beer> beers;

  Counter(boolean l, int cc) {
    this.fromLeft=l;
    this.customersCount=cc;
    this.randomOffset=int(random(0, 10));
    this.restart();
  }
  void restart() {
    customers = new ArrayList<Customer>();
    beers = new ArrayList<Beer>();
    for (int i=0; i<customersCount; i++) {
      customers.add(new Customer((-30*i)+randomOffset));
    }
  }
  void draw() {
    fill(100);
    stroke(0);
    pushMatrix();
    if (!fromLeft) {
      translate(4*height/3, 0);
      scale(-1, 1);
    }
    rect(height/20, 0, ((height*4)/3)*0.75, height/15);
    for (Customer c : customers) {
      c.draw();
    }
    for (Beer b : beers) {
      b.draw();
    }

    popMatrix();
  }
  void update() {

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
            
            if(int(random(0,8))==2){
              c.drinking=30;
              b.full=false;
              b.wait=30;
            }
            else {
              beers.remove(b);
              c.isGoingBack=true;
            }
            break;
          }
        }
      }
    }
    for (Customer c : customers) { // garbage collection
      if (c.x<0) customers.remove(c);
      break;
    }
    for (Beer b : beers) {
      if(b.x>301) beers.remove(b);
      break;
    }
  }

  void drawPlayer(Player p) {
    pushMatrix();
    if (!fromLeft) {
      translate(4*height/3, 0);
      scale(-1, 1);
    }
    p.draw();
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
  void throwBeer(String type) {
    if ((fromLeft && type.equals("LEFT")) || (!fromLeft && type.equals("RIGHT")))
      beers.add(new Beer());
  }
}
