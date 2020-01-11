void updateTerrain() {

  // animate terrain
  // control terrain actions
  //boxes ==> terrain
  if (frameCount%5==0) {
    cnumber++;
    if (cnumber>=waterpics.length) {
      cnumber=0;
    }
  }
//  PImage brick = loadImage("brick.png");
  int i =0;
  while (i<terrain.size()) {
    FBox b = terrain.get(i);
    if (b.getName().equals("FALL!")) {
      b.setStatic(false);
    }
    if (b.getName().equals("flyer2")) {
      b.setStatic(false);
    }
    if (b.getName().equals("static2")) {
      b.setStatic(false);
    }
    if (b.getName().equals("watersurface")&&frameCount %5==0) {
      b.attachImage(waterpics[cnumber]);
    }
    if (b.getName().equals("lava")&&frameCount %5==0) {
      ((LavaBox)b).animate();//downcasting
    }
    if (b.getName().equals("fall2")) {
      //      if(dist(b.getX(),b.getY(),blackbox.getX(),blackbox.getY())==100){
      b.setStatic(false);
    }
    if (b.getName().equals("move")) {
      bluebox.setPosition(t2x, t2y);
      b.setName("teleporter");
    }
    if (b.getName().equals("move2")) {
      bluebox.setPosition(t1x, t1y);
      b.setName("teleporter2");
    }
    if (b.getName().equals("static")) {
      if (switchstate==-1) {
        b.setRotation(1);
        world1.setGravity(0, -1000);
      } else {
        b.setRotation(0);
        world1.setGravity(0, 1000);
      }
      i++;
    }
  }
  }
  //frameCount variable of frame
  //% (modjulus) is divide but gets remainder only