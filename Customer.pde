class Customer {
  int x, drinking, index;
  boolean isGoingBack;

  Customer(int index, int x) {
    this.x=x;
    this.index=index;
    drinking=0;
    isGoingBack=false;
  }
  void draw(int number) {
    stroke(0);
    fill(64);
    if (x*height/300>0) {
      
      pushMatrix();
      translate(x*height/300, 0);
      if (isGoingBack){
        translate(height/15, 0);
        scale(-1, 1);
      } 
      //rect(x*height/300, 0, height/15, -height/15);
      image(clients[number][index], 0, 0, height/15, -height/15);
      popMatrix();
    }
  }
  void update() {
    if (drinking>0) {
      drinking--;
      if (drinking==0) { // ended drinking        
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
