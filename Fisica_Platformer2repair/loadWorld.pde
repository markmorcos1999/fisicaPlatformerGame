void loadWorld(String mapname) {
  world1 = new FWorld(0, 0, 100000, 100000);
  world1.setGravity(0, 1000);
  terrain = new ArrayList<FBox>();
  enemies = new ArrayList<FBox>();
  enemiescircles=new ArrayList<FCircle>();
  map = loadImage(mapname);
  int mapx = 0, mapy = 0;
  //load the map.png
  //loop through the pixels and generate FBoxes in the
  //corresponding space in the FWorld
  while (mapy<=map.height) {
    if (map.get(mapx, mapy)==blue) {
      //GIVING THE PLAYER CHARACTERISTICS
      initialx=mapx*int(worldsize);
      initialy=mapy*int(worldsize);
      bluebox=new FBox(worldsize, worldsize);
      //      bluebox.setFillColor(blue);
      //      bluebox.attachImage(img);
      if (checkpointvariable1==false) {
        bluebox.setPosition(mapx*worldsize, mapy*worldsize);
      }
      if (checkpointvariable1) {
        if (checkpointvariable2) {
          bluebox.setPosition(checkpoint2.getX(), checkpoint2.getY());
        }
        if (checkpointvariable2==false) {
          bluebox.setPosition(checkpoint1.getX(), checkpoint1.getY());
        }
      }
      bluebox.setStroke(0); // 1,3 parameters
      bluebox.setName("player");
      // set physical properties
      bluebox.setStatic(false);
      bluebox.setRotatable(false);
      bluebox.setDensity(10);
      world1.add(bluebox);
      //CONTROLLING THE PLAYER
    }
    if (map.get(mapx, mapy)== orange) {
      FBox orangebox = new FBox(worldsize, worldsize);
      orangebox.setPosition(mapx*worldsize, mapy*worldsize);
      orangebox.setFillColor(orange);
      orangebox.setStroke(orange);
      orangebox.setFriction(1);
      orangebox.setDensity(5);
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
      pinkbox.setStatic(true);
      pinkbox.setGrabbable(false);
      pinkbox.setName("conveyorbelt");
      world1.add(pinkbox);
      terrain.add(pinkbox);
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
    if (map.get(mapx, mapy)==lightbrown2) {
      lightbrownbox2 = new FBox(worldsize, worldsize);
      lightbrownbox2.setStroke(cyan);
      lightbrownbox2.setFillColor(lightbrown);
      lightbrownbox2.setPosition(mapx*worldsize, mapy*worldsize);
      lightbrownbox2.setStatic(true);
      lightbrownbox2.setGrabbable(false);
      lightbrownbox2.setRotatable(false);
      lightbrownbox2.setSensor(true);
      lightbrownbox2.setName("signpost2");
      world1.add(lightbrownbox2);
      terrain.add(lightbrownbox2);
    }
    if (map.get(mapx, mapy)==lightbrown3) {
      lightbrownbox3 = new FBox(worldsize, worldsize);
      lightbrownbox3.setStroke(cyan);
      lightbrownbox3.setFillColor(lightbrown);
      lightbrownbox3.setPosition(mapx*worldsize, mapy*worldsize);
      lightbrownbox3.setStatic(true);
      lightbrownbox3.setGrabbable(false);
      lightbrownbox3.setRotatable(false);
      lightbrownbox3.setSensor(true);
      lightbrownbox3.setName("signpost3");
      world1.add(lightbrownbox3);
      terrain.add(lightbrownbox3);
    }
    if (map.get(mapx, mapy)==lightbrown4) {
      lightbrownbox4 = new FBox(worldsize, worldsize);
      lightbrownbox4.setStroke(cyan);
      lightbrownbox4.setFillColor(lightbrown);
      lightbrownbox4.setPosition(mapx*worldsize, mapy*worldsize);
      lightbrownbox4.setStatic(true);
      lightbrownbox4.setGrabbable(false);
      lightbrownbox4.setRotatable(false);
      lightbrownbox4.setSensor(true);
      lightbrownbox4.setName("signpost4");
      world1.add(lightbrownbox4);
      terrain.add(lightbrownbox4);
    }
    if (map.get(mapx, mapy)== black) {
      FBox blackbox = new FBox(worldsize, worldsize);
      blackbox.setFill(0);
      blackbox.setStroke(0);
      blackbox.setFriction(0);
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
      graybox.setFriction(0);
      graybox.setDensity(1);
      graybox.setStatic(true);
      graybox.setGrabbable(false);
      graybox.setName("slide");
      graybox.setPosition(mapx*worldsize, mapy*worldsize);
      world1.add(graybox);
    }
    if (map.get(mapx, mapy)== purple2) {
      spikebox = new FBox(worldsize, worldsize);
      spikebox.setFill(0);
      spikebox.setStrokeColor(purplestroke);
      spikebox.setStrokeWeight(3);
      spikebox.setFriction(1);
      spikebox.setDensity(1);
      spikebox.setStatic(true);
      spikebox.setName("spike");
      spikebox.setPosition(mapx*worldsize, mapy*worldsize);
      world1.add(spikebox);
    }
    if (map.get(mapx, mapy)== brown) {
      PImage spring1 = loadImage("spring1.png");
      brownbox= new FBox(worldsize, worldsize);
      brownbox.attachImage(spring1);
      brownbox.setStroke(255);
      brownbox.setFriction(10);
      brownbox.setDensity(10);
      brownbox.setStatic(true);
      brownbox.setGrabbable(false);
      brownbox.setName("spring");
      brownbox.setPosition(mapx*worldsize, mapy*worldsize);
      world1.add(brownbox);
      terrain.add(brownbox);
    }
    if (map.get(mapx, mapy)== brown2) {
      PImage spring2 = loadImage("spring1(2).png");
      brown2box= new FBox(worldsize, worldsize);
      brown2box.attachImage(spring2);
      brown2box.setFillColor(brown2);
      brown2box.setStroke(255);
      brown2box.setFriction(10);
      brown2box.setDensity(10);
      brown2box.setSensor(true);
      brown2box.setStatic(true);
      brown2box.setGrabbable(false);
      brown2box.setName("spring2");
      brown2box.setPosition(mapx*worldsize, mapy*worldsize);
      world1.add(brown2box);
      terrain.add(brown2box);
    }
    if (map.get(mapx, mapy)== yellow) {
      yellowbox= new FBox(worldsize, worldsize);
      yellowbox.setFill(255, 242, 0);
      yellowbox.setStroke(255);
      yellowbox.setFriction(0);
      yellowbox.setStatic(true);
      yellowbox.setGrabbable(false);
      yellowbox.setName("flyer");
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
    if (map.get(mapx, mapy)==water) {
      PImage water = loadImage("water.png");
      waterbox = new FBox(worldsize, worldsize);
      waterbox.attachImage(water);
      waterbox.setPosition(mapx*worldsize, mapy*worldsize);
      waterbox.setName("water");
      waterbox.setStatic(true);
      waterbox.setGrabbable(false);
      waterbox.setRotatable(false);
      waterbox.setDensity(2);
      waterbox.setFriction(15);
      waterbox.setSensor(true);
      world1.add(waterbox);
    }
    if (map.get(mapx, mapy)==lightpurple) {
      GoombaBox lb = new GoombaBox();
      lb.setPosition(mapx*worldsize, mapy*worldsize);
      world1.add(lb);
      enemies.add(lb);
    }
    if (map.get(mapx, mapy)==oilygreen) {
      Hammerthrower lb = new Hammerthrower();
      lb.setPosition(mapx*worldsize, mapy*worldsize);
      world1.add(lb);
      enemies.add(lb);
    }
    if (map.get(mapx, mapy)==gray2) {
      Bulletthrower lb = new Bulletthrower();
      lb.setPosition(mapx*worldsize, mapy*worldsize);
      world1.add(lb);
      enemies.add(lb);
    }
    if (map.get(mapx, mapy)==darkgreen) {
      Thwomp lb = new Thwomp();
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
    if (map.get(mapx, mapy)==cyanblue) {
      SuicideBomber lb = new SuicideBomber();
      lb.setPosition(mapx*worldsize, mapy*worldsize);
      world1.add(lb);
      enemies.add(lb);
    }
    if (map.get(mapx, mapy)==darkyellow) {
      Koopa lb = new Koopa();
      lb.setPosition(mapx*worldsize, mapy*worldsize);
      world1.add(lb);
      enemies.add(lb);
    }
    if (map.get(mapx, mapy)==violet) {
      Shell lb = new Shell();
      lb.setPosition(mapx*worldsize, mapy*worldsize);
      world1.add(lb);
      enemies.add(lb);
    }
    if (map.get(mapx, mapy)==black2) {
      checkpoint1 = new FBox(worldsize, worldsize);
      checkpoint1.setStroke(cyan);
      checkpoint1.setFillColor(blue);
      checkpoint1.setPosition(mapx*worldsize, mapy*worldsize);
      checkpoint1.setStatic(true);
      checkpoint1.setGrabbable(false);
      checkpoint1.setRotatable(false);
      checkpoint1.setSensor(true);
      checkpoint1.setName("checkpoint1");
      world1.add(checkpoint1);
      terrain.add(checkpoint1);
    }
    if (map.get(mapx, mapy)==black3) {
      checkpoint2 = new FBox(worldsize, worldsize);
      checkpoint2.setStroke(cyan);
      checkpoint2.setFillColor(blue);
      checkpoint2.setPosition(mapx*worldsize, mapy*worldsize);
      checkpoint2.setStatic(true);
      checkpoint2.setGrabbable(false);
      checkpoint2.setRotatable(false);
      checkpoint2.setSensor(true);
      checkpoint2.setName("checkpoint2");
      world1.add(checkpoint2);
      terrain.add(checkpoint2);
    }
    if (map.get(mapx, mapy)==navyblue) {
      wallbox = new FBox(worldsize, worldsize);
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
    if (map.get(mapx, mapy)== darkcyan) {
      PImage lock = loadImage("Lock.png");
      FBox darkcyanbox = new FBox(worldsize, worldsize);
      darkcyanbox.setPosition(mapx*worldsize, mapy*worldsize);
      darkcyanbox.attachImage(lock);
      darkcyanbox.setFillColor(darkcyan);
      darkcyanbox.setStroke(orange);
      darkcyanbox.setFriction(1);
      darkcyanbox.setDensity(5);
      //      orangebox.setRestitution(0.3);
      darkcyanbox.setStatic(true);
      darkcyanbox.setGrabbable(false);
      darkcyanbox.setName("level2box");
      world1.add(darkcyanbox);
    }
    if (map.get(mapx, mapy)== endgame) {
      PImage lock = loadImage("Lock.png");
      FBox endgamebox = new FBox(worldsize, worldsize);
      endgamebox.setPosition(mapx*worldsize, mapy*worldsize);
      endgamebox.attachImage(lock);
      endgamebox.setFillColor(darkcyan);
      endgamebox.setStroke(orange);
      endgamebox.setFriction(1);
      endgamebox.setDensity(5);
      //      orangebox.setRestitution(0.3);
      endgamebox.setStatic(true);
      endgamebox.setGrabbable(false);
      endgamebox.setName("endgamebox");
      world1.add(endgamebox);
    }
    mapx++;
    if (mapx>=map.width) {
      mapx =0;
      mapy++;
    }
  }
}