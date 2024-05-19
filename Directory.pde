class Directory extends Rectangle{
  private String name;
  private ArrayList<File> files;
  public Directory(int _x,int _y,int _w,int _h,String _name){
    super(_x,_y,_w,_h);
    name=_name;
  }
  public void render(){
    stroke(#08B8C6);
    fill(#C7F8FC);
    rect(x,y,w,h);
    fill(#49AAC4);
    rect(x,y,w,50);
    fill(#111111);
    textSize(48);
    text(name,x,y,x+w,y+h);
  }
}
