class Beer{
  int x;
  boolean full;
  
  Beer(){
    x=300;
    full=true;
  }
  void draw(){
    fill(255,255,0);
    stroke(0);
    if(x*height/300>0) rect(x*height/300, 0, height/30, -height/30);
  }
  void update(){
    if(full) x-=2;
    else x+=2;
  }
  boolean checkForLose(){
    if(x<0) return true;
    return false;
  }
}
