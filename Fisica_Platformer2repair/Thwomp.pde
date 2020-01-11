class Thwomp extends FBox {
  Thwomp() {
    super(worldsize, worldsize);

    setFillColor(darkgreen);
    setStrokeColor(purplestroke);
    setStrokeWeight(3);
    setName("thwomp");
    // set physical properties
    setDensity(10);
    setFriction(1);
    setStatic(true);
  }
  void drop () {
    if (dist(bluebox.getX(), bluebox.getY(), getX(), getY())<=180) {
      setStatic(false);
    }
  }
}