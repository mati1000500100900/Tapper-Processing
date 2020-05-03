class Button{
  int x,y,w,h;
  String text;
  Button(int x, int y, int w, int h, String text){
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
    this.text=text;
  }
  void draw(){
    stroke(0);
    fill(200);
    rect(x,y,w,h);
    fill(0);
    textAlign(CENTER,CENTER);
    textSize(h*0.75);
    text(text,x+w/2,y+h/2);
  }
}
