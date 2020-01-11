class GoombaBox extends FBox {
  int costumeNum, direction, speed;
  GoombaBox() {
    super(worldsize, worldsize);

    setFillColor(lightpurple);
    setStrokeColor(lightpurple);
    setName("goomba");
    // set physical properties
    setDensity(10);
    setFriction(0);
    setStrokeColor(purplestroke);
    setStrokeWeight(3);
    setRotatable(false);
    direction=1;
    speed=200;
  }
  void move() {
    setVelocity(speed * direction, getVelocityY());
    if (touching("wallbox")||touching("goomba")||touching("suicidebomber")||touching("shell")||touching("koopa")) {
      direction*=-1;
      setPosition(getX()+1.2*direction, getY());
    }
    if (touching("player")&&GravityUp==false) {
      if (this.getY() -bluebox.getY() <=worldsize*1.5&&this.getY() -bluebox.getY() >=worldsize-10) {
        setName("dead");
        world1.remove(this);
        enemies.remove(this);
      } else {
        mode=Gameover;
      }
    }
    if (touching("player")&&GravityUp) {
      if (bluebox.getY() -this.getY()  <=worldsize*1.5&&bluebox.getY()-this.getY()  >=worldsize-10) {
        setName("dead");
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
      if (c.contains("goomba", thing)) {
        return true;
      }
      i++;
    }
    return false;
  }
}