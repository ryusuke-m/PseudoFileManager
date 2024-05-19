class MyCursor{
  int x,y;
  boolean isDragging;
  float weight;
  int filesize;
  boolean showcursor;
  boolean isInBorder;
  float speed=1.0;
  File draggingFile;
  MyCursor(){
    x=100;
    y=100;
    weight=1.0;
    filesize=1;
    isInBorder=false;
  }
  void update(Border borders[],File files[]){
    for(int i=0;i<3;i++){
      if(mousePressed && !isDragging){
        if(files[i].cursorIn(this)){
          files[i].isdragged=true;
          files[i].offsetX=files[i].x-x;
          files[i].offsetY=files[i].y-y;
          isDragging=true;
          filesize=files[i].dataSize;
        }
      }else if(!mousePressed){
        files[i].isdragged=false;
        isDragging=false;
      }
    }
    isInBorder=false;
    for(int i=0;i<2;i++){
      if(borders[i].cursorIn(this)){
        weight=borders[i].weight;
        isInBorder=true;
      }
    }
    int dx=0,dy=0;
    if(showcursor){
      dx=mouseX-pmouseX;
      dy=mouseY-pmouseY;
    }else{
      dx=mouseX-500;
      dy=mouseY-500;
    }
    
    if(isInBorder && isDragging){
      speed=weight*(1.0/filesize);
    }else{
      speed=1.0;
    }
    x+=dx*speed;
    y+=dy*speed;
    if(x<0){
      x=0;
    }else if(width<=x){
      x=width-1;
    }
    if(y<0){
      y=0;
    }else if(height<=y){
      y=height-1;
    }
  }
  void render(){
    if(showcursor){
      cursor();
    }else{
      noCursor();
    }
    if(mousePressed && isDragging){
      fill(0);
      stroke(#0000FF);
    }else if(mousePressed){
      fill(0);
      stroke(#FF0000);
    }else{
      fill(0);
      stroke(#000000);
    }
    strokeWeight(3);
    line(x,y,x+20,y);
    line(x,y,x,y+20);
    line(x,y,x+30,y+30);
    ellipse(x,y,5,5);
    textSize(48);
    text("Speed:"+str(speed),900,0,1000,100);
  }
}
