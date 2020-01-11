void loadWorld() {
  map = loadImage("Untitled.png");
  //load the map.png
  //loop through the pixels and generate FBoxes in the
  //corresponding space in the FWorld
  while (mapy<=map.height) {
    if (map.get(mapx, mapy)==blue) {
      //GIVING THE PLAYER CHARACTERISTICS
      bluebox=new FCircle(worldsize*3);
      bluebox.setFillColor(blue);
      //      bluebox.attachImage(img);
      bluebox.setStrokeColor(blue); // 1,3 parameters
      bluebox.setPosition(mapx*worldsize, mapy*worldsize);
      bluebox.setName("player");
      // set physical properties
      bluebox.setStatic(false);
      bluebox.setRotatable(false);
      bluebox.setDensity(100);
      bluebox.setFriction(1);
      bluebox.setRestitution(0.2);
      world1.add(bluebox);
      //CONTROLLING THE PLAYER
    }
    if (map.get(mapx, mapy)== orange) {
      FBox orangebox = new FBox(worldsize, worldsize);
      orangebox.setPosition(mapx*worldsize, mapy*worldsize);
      orangebox.setFillColor(orange);
      orangebox.setStroke(orange);
      orangebox.setFriction(1);
      orangebox.setDensity(10);
      orangebox.setStatic(false);
      orangebox.setGrabbable(false);
      orangebox.setName("cratetest");
      world1.add(orangebox);
    }
    if (map.get(mapx, mapy)== pink) {
      FBox pinkbox = new FBox(worldsize, worldsize);
      pinkbox.setPosition(mapx*worldsize, mapy*worldsize);
      pinkbox.setFillColor(pink);
      pinkbox.setStrokeColor(pink);
      pinkbox.setFriction(1);
      pinkbox.setDensity(10);
      //      orangebox.setRestitution(0.3);
      pinkbox.setStatic(true);
      pinkbox.setGrabbable(false);
      pinkbox.setName("conveyorbelt");
      world1.add(pinkbox);
    }
    if (map.get(mapx, mapy)==green) {
      greenbox = new FBox(worldsize, worldsize);
      greenbox.setStroke(green);
      greenbox.setFillColor(green);
      greenbox.setPosition(mapx*worldsize, mapy*worldsize);
      greenbox.setStatic(true);
      greenbox.setGrabbable(false);
      greenbox.setRotatable(false);
      greenbox.setName("teleporter");
      world1.add(greenbox);
      terrain.add(greenbox);
      t1x = (int)greenbox.getX()+80;
      t1y = (int)greenbox.getY();
    }
    if (map.get(mapx, mapy)==cyan) {
      cyanbox = new FBox(worldsize, worldsize);
      cyanbox.setStroke(cyan);
      cyanbox.setFillColor(cyan);
      cyanbox.setPosition(mapx*worldsize, mapy*worldsize);
      cyanbox.setStatic(true);
      cyanbox.setGrabbable(false);
      cyanbox.setRotatable(false);
      cyanbox.setName("teleporter2");
      world1.add(cyanbox);
      terrain.add(cyanbox);
      t2x = (int)cyanbox.getX()+80;
      t2y = (int)cyanbox.getY();
    }
    if (map.get(mapx, mapy)==lightbrown) {
      lightbrownbox = new FBox(worldsize, worldsize);
      lightbrownbox.setStroke(cyan);
      lightbrownbox.setFillColor(lightbrown);
      lightbrownbox.setPosition(mapx*worldsize, mapy*worldsize);
      lightbrownbox.setStatic(true);
      lightbrownbox.setGrabbable(false);
      lightbrownbox.setRotatable(false);
      lightbrownbox.setSensor(true);
      lightbrownbox.setName("signpost");
      world1.add(lightbrownbox);
      terrain.add(lightbrownbox);
    }
    if (map.get(mapx, mapy)== black) {
      PImage sgrass = loadImage("dirt_s.png");
      PImage wgrass   = loadImage("dirt_w.png");
      PImage egrass   = loadImage("dirt_e.png");
      PImage swgrass   = loadImage("dirt_sw.png");
      PImage cgrass   = loadImage("dirt_center.png");
      PImage ngrass   = loadImage("dirt_n.png");
      PImage segrass  = loadImage("dirt_se.png");
      //      PImage swgrass  = loadImage("");
      FBox blackbox = new FBox(worldsize, worldsize);
      //      if(blackbox.isTouchingBody(blackbox)&&){}
      if (mapx==1) {
        //        if (mapx==map.width-1) {
        //        blackbox.attachImage(egrass);
        //        }
        if (mapy!=90&&mapy!=91&&mapy!=92&&mapy!=99) {
          blackbox.attachImage(egrass);
        }
        if (mapy==90||mapy==91||mapy==92||mapy==97||mapy==98) {
          blackbox.attachImage(cgrass);
        }
        if (mapy==99) {
          blackbox.attachImage(sgrass);
        }
      } 
      if (mapx ==97) {
        if (mapy>=97&&mapy<=99||mapy>=90&&mapy<=92) {
          blackbox.attachImage(cgrass);
        } else {
          blackbox.attachImage(wgrass);
        }
        if (mapy==99) {
          blackbox.attachImage(sgrass);
        }
      }
      if (mapx ==98) {
        if (mapy==99) {
          blackbox.attachImage(sgrass);
        } else {
          blackbox.attachImage(cgrass);
        }
      }
      if (mapx ==99) {
        if (mapy==99) {
          blackbox.attachImage(segrass);
        } else {
          blackbox.attachImage(egrass);
        }
      }
      if (mapx==0) {
        blackbox.attachImage(wgrass);
        if (mapy==99) {
          blackbox.attachImage(swgrass);
        }
      }
      if (mapx>1&&mapx<97) {
        if (mapy==90||mapy==97||mapy==85||mapy==14) {
          blackbox.attachImage(ngrass);
        }
        if (mapy==91||mapy==98||mapy==15) {
          blackbox.attachImage(cgrass);
        }
        if (mapy==92||mapy==99||mapy==16) {
          blackbox.attachImage(sgrass);
        }
      }
      blackbox.setFill(0);
      blackbox.setStroke(0);
      blackbox.setFriction(1);
      blackbox.setDensity(10);
      blackbox.setRestitution(0.3);
      blackbox.setStatic(true);
      blackbox.setGrabbable(false);
      blackbox.setName("static");
      blackbox.setPosition(mapx*worldsize, mapy*worldsize);
      world1.add(blackbox);
      terrain.add(blackbox);
    }
    if (map.get(mapx, mapy)== red) {
      redbox= new FBox(worldsize, worldsize);
      redbox.setFillColor(red);
      redbox.setStroke(0);
      redbox.setFriction(0);
      redbox.setDensity(0.1);
      //too fast??
      redbox.setStatic(true);
      redbox.setGrabbable(false);
      redbox.setName("switch");
      redbox.setSensor(true);
      redbox.setPosition(mapx*worldsize, mapy*worldsize);
      world1.add(redbox);
      terrain.add(redbox);
    }
    if (map.get(mapx, mapy)== gray) {
      graybox= new FBox(worldsize, worldsize);
      graybox.setFill(127, 127, 127);
      graybox.setStroke(0);
      graybox.setFriction(0.0001);
      graybox.setDensity(1);
      graybox.setStatic(true);
      graybox.setGrabbable(false);
      graybox.setName("slide");
      graybox.setPosition(mapx*worldsize, mapy*worldsize);
      world1.add(graybox);
    }
    if (map.get(mapx, mapy)== brown) {
      PImage brick = loadImage("brick.png");
      brownbox= new FBox(worldsize, worldsize);
      brownbox.attachImage(brick);
      brownbox.setFill(64, 0, 0);
      brownbox.setStroke(255);
      brownbox.setFriction(0);
      brownbox.setStatic(true);
      brownbox.setGrabbable(false);
      brownbox.setName("spring");
      brownbox.setPosition(mapx*worldsize, mapy*worldsize);
      world1.add(brownbox);
    }
    if (map.get(mapx, mapy)== yellow) {
      yellowbox= new FBox(worldsize, worldsize);
      yellowbox.setFillColor(yellow);
      yellowbox.setStrokeColor(yellow);
      yellowbox.setFriction(0.0001);
      yellowbox.setDensity(10);
      yellowbox.setStatic(true);
      yellowbox.setGrabbable(true);
      yellowbox.setName("flyer");
      yellowbox.setSensor(false);
      yellowbox.setPosition(mapx*worldsize, mapy*worldsize);
      world1.add(yellowbox);
      terrain.add(yellowbox);
    }
    if (map.get(mapx, mapy)== purple) {
      purplebox= new FBox(worldsize, worldsize);
      purplebox.setFill(163, 73, 164);
      purplebox.setStroke(255);
      purplebox.setFriction(0.01);
      purplebox.setDensity(1);
      purplebox.setStatic(true);
      purplebox.setGrabbable(false);
      purplebox.setName("bridge");
      purplebox.setPosition(mapx*worldsize, mapy*worldsize);
      terrain.add(purplebox);
      world1.add(purplebox);
    }

    if (map.get(mapx, mapy)==watersurface) {
      watersurfacebox = new FBox(worldsize, worldsize);
      //      bluebox.attachImage(img);
      watersurfacebox.setPosition(mapx*worldsize, mapy*worldsize);
      watersurfacebox.setName("watersurface");
      // set physical properties
      watersurfacebox.setStatic(true);
      watersurfacebox.setGrabbable(false);
      watersurfacebox.setRotatable(false);
      watersurfacebox.setDensity(2);
      watersurfacebox.setSensor(true);
      watersurfacebox.setFriction(15);
      world1.add(watersurfacebox);
      terrain.add(watersurfacebox);
    }
    if (map.get(mapx, mapy)==lightpurple) {
      GoombaBox lb = new GoombaBox();
      lb.setPosition(mapx*worldsize, mapy*worldsize);
      world1.add(lb);
      enemies.add(lb);
   }
    if (map.get(mapx, mapy)==darkred) {
      LavaBox lb = new LavaBox();
      lb.setPosition(mapx*worldsize, mapy*worldsize);
      world1.add(lb);
      terrain.add(lb);
    }
    if (map.get(mapx, mapy)==water) {
      PImage water = loadImage("water.png");
      waterbox = new FBox(worldsize, worldsize);
      //      waterbox.setFillColor(water);
      waterbox.attachImage(water);
      //      bluebox.attachImage(img);
      waterbox.setPosition(mapx*worldsize, mapy*worldsize);
      //      waterbox.setStrokeColor(water); // 1,3 parameters
      waterbox.setName("water");
      // set physical properties
      waterbox.setStatic(true);
      waterbox.setGrabbable(false);
      waterbox.setRotatable(false);
      waterbox.setDensity(2);
      waterbox.setFriction(15);
      waterbox.setSensor(true);
      world1.add(waterbox);
    }
    if (map.get(mapx, mapy)==navyblue) {
      wallbox = new FBox(worldsize, worldsize);
      PImage wgrass   = loadImage("dirt_w.png");
      PImage egrass   = loadImage("dirt_e.png");
     if (mapx>width/2) {
       wallbox.attachImage(egrass);
      }
    if (mapx<width/2) {
       wallbox.attachImage(wgrass);
     }     
      wallbox.setFill(0);
      wallbox.setStroke(0);
      wallbox.setFriction(1);
      wallbox.setDensity(10);
      wallbox.setRestitution(0.3);
      wallbox.setStatic(true);
      wallbox.setGrabbable(false);
      wallbox.setName("wallbox");
      wallbox.setPosition(mapx*worldsize, mapy*worldsize);
      world1.add(wallbox);
    }
    mapx++;
    if (mapx>=map.width) {
      mapx =0;
      mapy++;
    }
  }
}