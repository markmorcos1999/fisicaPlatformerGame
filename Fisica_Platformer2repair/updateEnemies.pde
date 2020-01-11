void updateEnemies() {
  int i = 0;
  int z = 0;
  while (i<enemies.size()) {
    FBox b = enemies.get(i);
    if (b.getName().equals("goomba")) {    
      ((GoombaBox) b).move();
    }
    if (b.getName().equals("hammerthrower")) {
      if (frameCount%100==0) {
        Hammer lb = new Hammer();
        lb.setPosition(b.getX(), b.getY());
        world1.add(lb);   
        enemiescircles.add(lb);
      }
    }
    if (b.getName().equals("bulletthrower")) {
      if (frameCount%100==0) {
        Bullet lb = new Bullet();
        lb.setPosition(b.getX(), b.getY());
        world1.add(lb);
        enemiescircles.add(lb);
      }
    }
    if (b.getName().equals("koopa")) {
      ((Koopa) b).move();
    }
    if (b.getName().equals("shell")) {    
      ((Shell) b).move();
    }
    if (b.getName().equals("suicidebomber")) {    
      //      ((SuicideBomber) b).move();
      ((SuicideBomber) b).explode();
    }
    if (b.getName().equals("suicidebomberbullets")) {    
      ((SuicideBomberBullets) b).move();
    }
    if (b.getName().equals("thwomp")) {    
      ((Thwomp) b).drop();
    }
    i++;
  }
  while (z<enemiescircles.size()) {
    FCircle b = enemiescircles.get(z);
    if (b.getName().equals("bullet")) {
      ((Bullet) b).move();
    }
    z++;
  }
}