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
  PImage brick = loadImage("brick.png");
  int i =0;
  while (i<terrain.size()) {
    FBox b = terrain.get(i);
    if (b.getName().equals("FALL!")) {
      b.setStatic(false);
    }
    if (b.getName().equals("watersurface")&&frameCount %5==0) {
      b.attachImage(waterpics[cnumber]);
    }
    if (b.getName().equals("lava")) {    
      ((LavaBox) b).animate();
    }
    if (b.getName().equals("springmoved")) {

      b.attachImage(spring[springCostume]);
      if (frameCount % 10 == 0) {
        springCostume++;
        if (springCostume == 4) {
          springCostume = 0;
          b.setName("spring");
        }
      }
    }
    if (b.getName().equals("springmoved2")) {

      b.attachImage(spring2[springCostume2]);
      if (frameCount % 10 == 0) {
        springCostume2++;
        if (springCostume2 == 4) {
          springCostume2 = 0;
          b.setName("spring2");
        }
      }
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
    if (b.getName().equals("static2")) {
      b.setStatic(false);
    }
    if (b.getName().equals("flyer2")) {
      b.setStatic(false);
    }
    if (b.getName().equals("static")) {
      if (switchstate==-1) {
        bluebox.setRotation(3.2);
        world1.setGravity(0, -1000);
        GravityUp=true;
      } else {
        bluebox.setRotation(0);
        world1.setGravity(0, 1000);
        GravityUp=false;
      }
    }
    i++;
  }
}
// how to bring watersurface to front 
boolean touchingg (String name) {
  ArrayList <FContact> contacts = bluebox.getContacts();
  for (FContact c : contacts) {
    if (c.contains("player", name) ) return true;
  }
  return false;
}

//how to reimport the map again so the bridge does not fall

//how to make the bullets and hammers disappear after some time (I used contact is that fine?)
//melee fighter?
//how to make spring show animation once.


//how to make the bullets move from the void move from the Bullet class
//      if(blackbox.isTouchingBody(blackbox)&&){}
//if (mapx==1) {
//  //        if (mapx==map.width-1) {
//  //        blackbox.attachImage(egrass);
//  //        }
//  if (mapy!=90&&mapy!=91&&mapy!=92&&mapy!=99) {
//    blackbox.attachImage(egrass);
//  }
//  if (mapy==90||mapy==91||mapy==92||mapy==97||mapy==98) {
//    blackbox.attachImage(cgrass);
//  }
//  if (mapy==99) {
//    blackbox.attachImage(sgrass);
//  }
//} 
//if (mapx ==97) {
//  if (mapy>=97&&mapy<=99||mapy>=90&&mapy<=92) {
//    blackbox.attachImage(cgrass);
//  } else {
//    blackbox.attachImage(wgrass);
//  }
//  if (mapy==99) {
//    blackbox.attachImage(sgrass);
//  }
//}
//if (mapx ==98) {
//  if (mapy==99) {
//    blackbox.attachImage(sgrass);
//  } else {
//    blackbox.attachImage(cgrass);
//  }
//}
//if (mapx ==99) {
//  if (mapy==99) {
//    blackbox.attachImage(segrass);
//  } else {
//    blackbox.attachImage(egrass);
//  }
//}
//if (mapx==0) {
//  blackbox.attachImage(wgrass);
//  if (mapy==99) {
//    blackbox.attachImage(swgrass);
//  }
//}
//if (mapx>1&&mapx<97) {
//  if (mapy==90||mapy==97||mapy==85) {
//    blackbox.attachImage(ngrass);
//  }
//  if (mapy==91||mapy==98) {
//    blackbox.attachImage(cgrass);
//  }
//  if (mapy==92||mapy==99) {
//    blackbox.attachImage(sgrass);
//  }
//}