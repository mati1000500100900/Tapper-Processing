class Beer {
  int x;
  boolean full;
  int wait;

  Beer() {
    wait=0;
    x=340;
    full=true;
  }
  void draw() {
    fill(255, 255, 0);
    stroke(0);
    if (x*height/300>0 && wait==0) {
      if (full) image(beer, x*height/300, height/50, height/20, -height/20);
      else image(emptybeer, x*height/300, height/50, height/20, -height/20);
    }
  }

  void update() {
    if (wait>0) {
      wait--;
    } else {
      if (full) x-=4;
      else x+=2;
    }
  }
  boolean checkForLose(Player player, int pos) {
    if (this.x<0 && this.full) return true;
    if (this.x>=339 && !this.full && player.position!=pos) return true; 
    return false;
  }
}
