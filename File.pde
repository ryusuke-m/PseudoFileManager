class File extends Rectangle{
  private String name;
  private int dataSize;
  boolean isdragged;
  int offsetX,offsetY;
  public File(int x,int y,int w,int h,String name, int size){
    super(x,y,w,h);
    this.name=name;
    this.dataSize=size;
    isdragged=false;
  }
  public void update(MyCursor c){
    if(isdragged==true){
      x=c.x+offsetX;
      y=c.y+offsetY;
    }
  }
  public void render(){
    stroke(#E7ED48);
    fill(#F6FA95);
    rect(x,y,w,h);
    textSize(32);
    fill(#767928);
    text(name,x,y,x+w,y+h);
  }
}
