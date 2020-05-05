class Counter {
  boolean fromLeft;
  int customersCount;
  int randomOffset;
  ArrayList<Customer> customers;

  Counter(boolean l, int cc) {
    this.fromLeft=l;
    this.customersCount=cc;
    this.randomOffset=int(random(0, 10));
    this.restart();
  }
  void restart() {
    customers = new ArrayList<Customer>();
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
    
    popMatrix();
  }
  void update(){
    for (Customer c : customers) {
      c.update();
    }
  }
  
  void drawPlayer(Player p){
    pushMatrix();
    if (!fromLeft) {
      translate(4*height/3, 0);
      scale(-1, 1);
    }
    p.draw();
    popMatrix();
  }

  boolean checkForLose() {
    boolean r=false;
    for (Customer c : customers) {
      if (c.checkForLose()){
        r=true;
      }
    }
    return r;
  }
}
