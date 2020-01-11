void updateEnemies() {
  // control enemy movements, attacks, actions
  // animates enemies
  int i = 0;
  while (i<enemies.size()) {
    FBox b = enemies.get(i);
    if (b.getName().equals("goomba")) {
      b.setVelocity(200, 0);
    }
    if (b.getName().equals("goomba1")) {
      b.setVelocity(-200, 0);
      println("zzzzzzzz");

//      if(b.getName().equals("goomba1")){
//      b.setName("goomba");
//    }
      //    b.setName("goomba");
    }
    i++;
  }
}