class LavaBox extends FBox {
  //1.Instance Variables (fields)
  int cnumberlava; //represents which image to attach
  int delay;       //How much longer before we animate
  //2.Constructor - initialize instance variables
  LavaBox() {
    super(worldsize, worldsize);
    cnumberlava=0;
    delay = (int)random(0, 500);
    setStaticBody(true);
    setSensor(true);
    attachImage(lavapics[0]);
    setName("lava");
  }
  //3.Behaviour Functions
  void animate(){
    if(frameCount%5==0){
  delay--;
  if(delay<0){
  attachImage(lavapics[cnumberlava]);
  cnumberlava++;
  if (cnumberlava==6){
  cnumberlava =0;
  attachImage(lavapics[0]);
  delay = 500;
  }
  }
    }
  }
}