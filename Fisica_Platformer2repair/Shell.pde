class Shell extends FBox {
  int costumeNum, direction, speed;
  Shell() {
    super(worldsize, worldsize);

    setFillColor(violet);
    setStrokeColor(purplestroke);
    setStrokeWeight(3);
    setName("shell");
    // set physical properties
    setDensity(10);
    setFriction(0);
    setRotatable(false);
    direction=1;
    speed=200;
  }
  void move() {
    if (touching("wallbox")) {
      direction*=-1;
      setPosition(getX()+1.2*direction, getY());
    }
    if (touching("player")) {
      if (this.getY() -bluebox.getY() <=worldsize*1.5&&this.getY() -bluebox.getY() >=worldsize-10) {
        setName("dead");
        world1.remove(this);
      } else {
        mode=Gameover;
      }
    }
    setVelocity(speed * direction*2, getVelocityY());
  }
  boolean touching(String thing) {
    ArrayList<FContact> contacts = getContacts();
    int i =0;
    while (i<contacts.size()) {
      FContact c = contacts.get(i);
      if (c.contains("shell", thing)) {
        return true;
      }
      i++;
    }
    return false;
  }
}