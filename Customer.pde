class Customer {
  int x;
  int drinking;
  boolean isGoingBack;

  Customer(int x) {
    this.x=x;
    drinking=0;
    isGoingBack=false;
  }
  void draw() {
    stroke(0);
    fill(64);
    if (x*height/300>0) rect(x*height/300, 0, height/15, -height/15);
  }
  void update() {
    if (drinking>0) {
      drinking--;
      if(drinking==0){ // ended drinking        
        isGoingBack=true;
      }
    } else {
      if (isGoingBack) {
        this.x-=3;
      } else {
        if (drinking==0) {
          this.x++;
        }
      }
    }
  }
  
  boolean checkForLose() {
    return (this.x>296);
  }
}
