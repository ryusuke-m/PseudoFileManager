class Border extends Rectangle {
  float weight;
  public Border(int x, int y, int w, int h, float _weight) {
    super(x, y, w, h);
    weight=_weight;
  }
  public void render(){
    noStroke();
    fill(weight*255);
    rect(x,y,w,h);
  }
}
