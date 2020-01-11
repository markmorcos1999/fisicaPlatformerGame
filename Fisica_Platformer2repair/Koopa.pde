class Koopa extends FBox {
  int costumeNum, direction, speed;
  Koopa() {
    super(worldsize, worldsize);

    setFillColor(darkyellow);
    setStrokeColor(purplestroke);
    setStrokeWeight(3);
    setName("koopa");
    // set physical properties
    setDensity(10);
    setFriction(0);
    setRotatable(false);
    direction=1;
    speed=200;
  }
  void move() {
    setVelocity(speed * direction, getVelocityY());
    if (touching("wallbox")||touching("goomba")||touching("suicidebomber")||touching("koopa")||touching("thwomp")) {
      direction*=-1;
      setPosition(getX()+1.2*direction, getY());
    }
    if (touching("player")) {
      if (this.getY() -bluebox.getY() <=worldsize*1.5&&this.getY() -bluebox.getY() >=worldsize-10) {
        setName("dead");
        Shell lb = new Shell();
        lb.setPosition(this.getX()+70, this.getY()-2);
        world1.add(lb);
        enemies.add(lb);
        world1.remove(this);
        enemies.remove(this);
      } else {
        mode=Gameover;
      }
    }
  }
  boolean touching(String thing) {
    ArrayList<FContact> contacts = getContacts();
    int i =0;
    while (i<contacts.size()) {
      FContact c = contacts.get(i);
      if (c.contains("koopa", thing)) {
        return true;
      }
      i++;
    }
    return false;
  }
}
//before making player an Fbox
//this.getY() -bluebox.getY() <=worldsize*1.5&&this.getY() -bluebox.getY() >=worldsize