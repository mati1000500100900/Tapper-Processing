class Counter{
  boolean fromLeft;
  int customersCount;
  
  Counter(boolean l, int cc){
    this.fromLeft=l;
    this.customersCount=cc;
  }
  
  void draw(){
    fill(100);
    stroke(0);
    pushMatrix();
    if(!fromLeft){
       translate(4*height/3,0);
       scale(-1,1);
    }
    rect(height/20,0,((height*4)/3)*0.75, height/15);
    popMatrix();
  }
  
}
