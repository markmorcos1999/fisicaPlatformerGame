void updatePlayer() {
  int x = 0;
  int i = 0;
  boolean touchingwater = false;
  ArrayList <FContact> contacts = bluebox.getContacts();
  while (i< contacts.size()) {
    FContact c = contacts.get(i);

    if (c.contains("player", "water")||c.contains("player", "watersurface")) {
      touchingwater=true;
    }
    i++;
  }
  if(touchingwater){
  if (rightkey) x =  5;
  if (leftkey)  x = -5;
  }
  else{
  if (rightkey) x =  50;
  if (leftkey)  x = -50;
  }
  //handle keyboard input
  bluebox.setAngularVelocity(x);
  //handle animation
}
// how to bring watersurface to front 