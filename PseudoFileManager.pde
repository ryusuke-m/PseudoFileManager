import java.awt.Robot;
Robot r;
boolean spacekey, pspacekey;
MyCursor myCursor;
Directory directories[];
File files[];
Border borders[];
void setup() {
  size(1600, 900);
  frameRate(60);
  //noCursor();
  try {
    r=new Robot();
  }
  catch(Exception e) {
    println(e);
  }
  spacekey=false;
  pspacekey=false;
  myCursor=new MyCursor();
  myCursor.showcursor=false;
  directories=new Directory[3];
  directories[0]=new Directory(100, 100, 500, 250, "Storage 1 at local PC");
  directories[1]=new Directory(100, 600, 500, 250, "Storage 2 at local PC");
  directories[2]=new Directory(900, 100, 500, 750, "Storage 3 at remote\nworkstation");
  files=new File[3];
  files[0]=new File(120,120,100,100,"Small\nFile\n1MB",1);
  files[1]=new File(240,120,120,120,"Medium\nFile\n2GB",2);
  files[2]=new File(380,120,150,150,"Large\nFile\n128GB",3);
  borders=new Border[2];
  borders[0]=new Border(0,350,600,250,0.8);
  borders[1]=new Border(600,0,300,900,0.5);
}
void draw() {
  background(255);
  fill(0);
  textAlign(LEFT);
  textSize(32);
  text("Press ESC to finish", 0, 0, 1000, 100);
  text("Press Space to show/hide cursor", 0, 40, 1000, 140);
  for(int i=0;i<2;i++){
    borders[i].render();
  }
  for(int i=0;i<3;i++){
    directories[i].render();
  }
  for(int i=0;i<3;i++){
    files[i].update(myCursor);
    files[i].render();
  }
  myCursor.update(borders,files);
  myCursor.render();
  if (spacekey&&!pspacekey) {
    myCursor.showcursor=!myCursor.showcursor;
  }
  if (myCursor.showcursor) {
  } else {
    int _x=getJFrame(getSurface()).getX();
    int _y=getJFrame(getSurface()).getY();
    int _w=getJFrame(getSurface()).getInsets().top;
    r.mouseMove(_x+500, _y+500+_w);
  }

  pspacekey=spacekey;
}
void keyPressed() {
  if (key==' ') {
    spacekey=true;
  }
}
void keyReleased() {
  if (key==' ') {
    spacekey=false;
  }
}

static final javax.swing.JFrame getJFrame(final PSurface surf) {
  return
    (javax.swing.JFrame)
    ((processing.awt.PSurfaceAWT.SmoothCanvas)
    surf.getNative()).getFrame();
}
