class Rectangle{
  int x,y,w,h;
  Rectangle(int _x,int _y,int _w, int _h){
    x=_x;
    y=_y;
    w=_w;
    h=_h;
  }
  boolean cursorIn(MyCursor c){
    if(x<=c.x && c.x<=x+w && y<=c.y && c.y<=y+h){
      return true;
    }
    return false;
  }
}
