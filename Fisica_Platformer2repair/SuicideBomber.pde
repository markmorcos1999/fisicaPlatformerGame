class SuicideBomber extends FBox {
  int costumeNum, direction, speed;
  SuicideBomber() {
    super(worldsize, worldsize);

    setFillColor(cyanblue);
    setStrokeColor(purplestroke);
    setStrokeWeight(3);
    setName("suicidebomber");
    // set physical properties
    setDensity(10);
    setFriction(1);
    setRotatable(false);
    direction=1;
    speed=100;
  }
  void move() {
    setVelocity(speed * direction, getVelocityY());
    if (touching("wallbox")||touching("goomba")||touching("suicidebomber")) {
      direction*=-1;
      setPosition(getX()+1.2*direction, getY());
    }
  }
  boolean touching(String thing) {
    ArrayList<FContact> contacts = getContacts();
    int i =0;
    while (i<contacts.size()) {
      FContact c = contacts.get(i);
      if (c.contains("suicidebomber", thing)) {
        return true;
      }
      i++;
    }
    return false;
  }
  void explode () {
    if (dist(bluebox.getX(), bluebox.getY(), getX(), getY())<=150) {
      if (frameCount%3==0) {
        SuicideBomberBullets l = new SuicideBomberBullets();
        l.setPosition(getX(), getY()-3);
        world1.add(l);
        enemies.add(l);
      }
      if (frameCount%15==0) {
        world1.remove(this);
        enemies.remove(this);
      }
    }
  }
}
class SuicideBomberBullets extends FBox {

  SuicideBomberBullets() {
    super(worldsize/3, worldsize/3);
    setName("suicidebomberbullets");
    setFill(0, 0, 155);
    setStroke(0, 0, 155);
    setDensity(1);
    setFriction(10);
    setVelocity(random(-300, 300), -500);
    //if(getY()==wallbox.getY()){
    //world1.remove(this);
    //enemies.remove(this);
    //}
  }
  void move() {
  }
}