class Hammerthrower extends FBox {

  Hammerthrower() {
    super(worldsize, worldsize);

    setName("hammerthrower");
    setFillColor(oilygreen);
    setStrokeColor(purplestroke);
    setStrokeWeight(3);
    //    setVelocity(500, 500);
    setStatic(true);
    setFriction(0.01);
    setDensity(1);
  }
}
class Hammer extends FCircle {
  Hammer() {
    super(worldsize/3);

    setName("hammer");
    setFill(255, 0, 0);
    setStroke(0);
    setDensity(1);
    setFriction(10);
    setVelocity(-500, 0);
    if(switchstate==-1){
    setVelocity(-500,600);
    }
  }
}