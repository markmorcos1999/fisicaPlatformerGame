class Bulletthrower extends FBox {

  Bulletthrower() {
    super(worldsize,worldsize);

    setName("bulletthrower");
    setFill(0);
    setStrokeColor(purplestroke);
    setStrokeWeight(5);
    setStatic(true);
    setFriction(0.01);
    setDensity(1);
  }
}
class Bullet extends FCircle {
  Bullet() {
    super(worldsize/3);

    setName("bullet");
    setFill(0, 0, 155);
    setStroke(0, 0, 155);
    setDensity(1);
    setFriction(10);
  }

  void move() {
    int i =0;
    //while (i<=map.height) {
    setVelocity(-500, -17);
    //if (i==map.height) {
    //  i=0;
    // }
    // i++;
  }
}