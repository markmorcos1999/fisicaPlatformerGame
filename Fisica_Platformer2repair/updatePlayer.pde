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
  if (touchingwater) {
    if (rightkey) { 
      d=1;
      x =  50;
      //     currentAction=run;
      if (contacts.size()>0) {
        currentAction=run;
      } else {
        currentAction=jump;
      }
    }
    if (leftkey) { 
      d=0;
      x = -50;
      //     currentAction=run;
      if (contacts.size()>0) {
        currentAction=run;
      } else {
        currentAction=jump;
      }
    }
    if (upkey&&contacts.size()>0) {     
      bluebox.setVelocity(bluebox.getVelocityX()/2, -50);
    }
  } else {
    if (upkey&&contacts.size()>0) {
      bluebox.setVelocity(bluebox.getVelocityX()/2, -400);
      if (switchstate==-1) {
        bluebox.setVelocity(bluebox.getVelocityX()/2, 400);
      }
    }
    if (rightkey) { 
      d=1;
      x =  500;      
      if (switchstate==-1) {
        d=0;
      }
      if (contacts.size()>0) {
        currentAction=run;
      } else {
        currentAction=jump;
      }
    }
    if (leftkey) {  
      x = -500;
      d=0;
      if (switchstate==-1) {
        d=1;
      }
      if (contacts.size()>0) {
        currentAction=run;
      } else {
        currentAction=jump;
      }
    }
    if (!leftkey && !rightkey) {
      currentAction=idle;
    }
  }
  if (bluebox.getVelocityY()>100) {
    currentAction=fall;
  }
  if (bluebox.getVelocityY()<-100) {
    currentAction=jump;
  }
  //handle keyboard input
  int n = 0;
  if (currentAction.length==1) {
    n=1;
  }
  if (currentAction.length==2) {
    n=80;
  }
  if (currentAction.length==3) {
    n=4;
  }
  if (frameCount%n==0) {
    if (costumeNumber >= currentAction.length) {
      costumeNumber=0;
    }

    if (d == 1) {
      bluebox.attachImage(currentAction[costumeNumber]);
    } else {
      bluebox.attachImage(reverseImage(currentAction[costumeNumber]));
    }
    costumeNumber++;
  }
  bluebox.setVelocity(x, bluebox.getVelocityY());
  //handle animation

  if (touching("conveyorbelt")) {
    i=i+4000;
    bluebox.setVelocity(i, bluebox.getVelocityY());
  }
}
// how to bring watersurface to front 


boolean touching (String name) {
  ArrayList <FContact> contacts = bluebox.getContacts();
  for (FContact c : contacts) {
    if (c.contains("player", name) ) return true;
  }
  return false;
}