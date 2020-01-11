import fisica.*;

//map loading variables
int   worldx, worldy, timer, z=0, switchstate=1;
PImage map;
int levelnumber=1;
boolean GravityUp = false;
//colour pallette
int mode, w;
int switchmax   = 40;
int switchtimer = 100;
boolean checkpointvariable1=false;
boolean checkpointvariable2=false;
boolean checkpointsvariable1=false;
boolean checkpointsvariable2=false;
final int Intro     =1;
final int Playing   =2;
final int Pause     =3;
final int Gameover  =4;
final int Win       =5;
color black =        color(0, 0, 0);
color green =        color(34, 177, 76);          //teleporter1
color cyan  =        color(153, 217, 234);        //teleporter2
color lightbrown =   color(185, 122, 87);         //Signpost
color lightbrown2 = color(188, 122, 87);
color lightbrown3 = color(190, 122, 87);
color endgame = color(200, 200, 200);
color lightbrown4 = color(190, 122, 88);
color purple =       color(163, 73, 164);
color black2= color(1, 1, 1);
color black3= color(2, 2, 2);
color blue  =        color(63, 72, 204);
color watersurface = color(0, 162, 232);
color water =        color(5, 109, 177);
color yellow =       color(255, 242, 0);           //flyer
color red   =        color(237, 28, 36);           //switch
color gray =         color(127, 127, 127);         //slide
color brown =        color(64, 0, 0);              //spring
color brown2 =       color(109, 68, 46);           //spring top
color orange =       color(255, 127, 39);          //crate test
color pink  =        color(255, 174, 201);         //conveyerbelt
color purple2 =      color(100, 100, 200);
color redarrow =     color(255, 45, 50);
color navyblue =     color(0, 0, 125);             //wallbox
color darkred=       color(193, 0, 5);             //lava
color lightpurple =  color(200, 191, 231);         //goombabox
color oilygreen=     color(128, 128, 0);           //hammerthrower
color gray2 =        color(195, 195, 195);         //bullet thrower
color darkgreen=     color(50, 100, 1);            //thwomp
color cyanblue=      color(45, 205, 234);          //suicide bomber
color darkyellow=    color(228, 220, 50);          //koopa
color violet=        color(102, 0, 102);           //shell
color darkcyan=      color(14, 71, 78);
color purplestroke= color(155, 0, 155);              //for enemies
boolean ckey, bkey, rightkey, pkey, leftkey, upkey, downkey, signpostvariable, signvariable2, signvariable3, signvariable4, switchactive;
ArrayList <FBox> terrain;
ArrayList <FBox> enemies;
ArrayList <FCircle> enemiescircles;
float worldsize = 32;
FWorld world1;
FBox checkpoint1, checkpoint2, endgamebox, lightbrownbox2, lightbrownbox3, lightbrownbox4, bluebox, brown2box, violetbox, darkgreenbox, arrowbox, oilygreenbox, gray2box, bullet, hammer, purple2box, lavabox, spikebox, wallbox, goombabox, lightbrownbox, cyanbox, redbox, pinkbox, orangebox, blackbox, greenbox, purplebox, graybox, brownbox, yellowbox, watersurfacebox, waterbox;

PFont font;
//Animated Terrain
PImage[]waterpics=new PImage[4];
PImage[]lavapics=new PImage[6];
PImage[]goombapics=new PImage[3];
PImage[]spring= new PImage[4];
PImage[]spring2= new PImage[4];
int d = 0;

PImage[] idle = new PImage[2];
PImage[] jump = new PImage[1];
PImage[] run = new PImage[3];
PImage[] fall = new PImage[1];
PImage[] currentAction;
int costumeNumber =0;
//idle[0].resize(worldsize,worldsize);

int costumenum = 0;
int frame = 0;

int cnumber=0;
int cnumber2=0;
int initialx;
int initialy;
int t1x = 0;
int t1y = 0;
int t2x = 0;
int t2y = 0;

int springCostume = 0;
int springCostume2 = 0;
void setup() {
  size(852, 480);
 // fullScreen(FX2D);
  Fisica.init(this);
  font =createFont("LASER4.TTF", 50);
  //variables initializing
  ckey=bkey=rightkey=leftkey=upkey=downkey=pkey=signpostvariable=false;
  switchactive=true;
  lavapics[0] = loadImage("lava0.png");
  lavapics[1] = loadImage("lava1.png");
  lavapics[2] = loadImage("lava2.png");
  lavapics[3] = loadImage("lava3.png");
  lavapics[4] = loadImage("lava4.png");
  lavapics[5] = loadImage("lava5.png");

  idle[0] = loadImage("megaman0transparent.png");
  idle[1] = loadImage("megaman1transparent.png");

  jump[0] = loadImage("megaman6.png");

  fall[0] = loadImage("megaman7.png");


  run[0] = loadImage("megaman3transparent.png");
  run[1] = loadImage("megaman4transparent.png");
  run[2] = loadImage("megaman5transparent.png");

  currentAction=idle;
  mode = Intro;
  loadWorld("level1.png");
}

void draw() {
  background(100);

  if      (mode == Intro) {
    background(0);
    textFont(font);
    fill(200, 2, 255);
    textSize(35);
    text("The Dark Night", width/2, height/2.5);
    textSize(20);
    fill(200);
    text("To go to the next level, hit the lock", width/2, height/2+50);
    textSize(20);
    fill(200);
    textAlign(CENTER);
    text("Click to begin", width/2, height*2/3+20);
    if (mousePressed) {
      mode = Playing;
    }
  }
  if (mode == Playing) {
    switchtimer++;
    if (switchtimer > switchmax) {
      switchactive = true;
    }
    PImage startpic = loadImage("lightbackgroundfinal.jpg");
    // background(startpic);
    image(startpic, 0, 0);
    //15,247,0
    fill(200);
    textSize(20);
    text("Press P to Pause and C to Continue", width/2, height - 10);
    if (pkey) {
      mode = Pause;
    }
    updatePlayer();  //handle keyboard input, movement, animation
    updateTerrain(); //handle terrain actions and animations
    updateEnemies(); //controls the bad guys
    pushMatrix();    //begin some transformations
    translate(-bluebox.getX()+width/2, -bluebox.getY()+height/2);
    world1.step();
    world1.draw();
    popMatrix();     //end transformation

    if (signpostvariable == true) {
      fill(255);
      textSize(18);
      text("boxes with a purple lining are harmfull", 430, 350);
      text("", 430, 400);
    }
    if (signvariable2 == true) {
      fill(255);
      textSize(18);
      text("jump on moving enemies", 430, 350);
      text("to destroy them", 430, 400);
    }
    if (signvariable3 == true) {
      fill(255);
      textSize(18);
      text("try jumping on the yellow box", 430, 350);
      text("Green boxes can not be destroyed", 430, 400);
    }
    if (signvariable4 == true) {
      fill(255);
      textSize(18);
      text("bright Orange boxes are not affected", 430, 350);
      text("by lava", 430, 400);
    }
    if (checkpointsvariable1 == true) {
      fill(255);
      textSize(18);
      text("Checkpoint 1", 430, 350);
    }
    if (checkpointsvariable2 == true) {
      fill(255);
      textSize(18);
      text("Checkpoint 2", 430, 350);
    }
  }
  if (mode == Gameover) {
    background(0);
    textSize(55);
    fill(255);
    text("Gameover", width/2, height/2);
    textSize(30);
    text("Click to Respawn", width/2, height*2/3);
    if (mousePressed) {
      switchstate=1;
      GravityUp=false;
      mode = Playing;
      bluebox.setPosition(initialx, initialy);
      bluebox.setVelocity(0, 0);
      if (levelnumber==2) {
        loadWorld("level2.png");
      }
      if (levelnumber==1) {
        loadWorld("level1.png");
      }
    }
  }
  if (mode == Pause) {
    PImage startpic = loadImage("lightbackgroundfinal.jpg");
    image(startpic, 0, 0);
    pushMatrix();    //begin some transformations
    translate(-bluebox.getX()+width/2, -bluebox.getY()+height/2);
    world1.draw();
    popMatrix();     //end transformation
    fill(200, 2, 200);
    textSize(20);
    text("Press P to Pause and C to Continue", width/2, height - 10);
    if (ckey) {
      mode = Playing;
    }
  }
  if      (mode == Win) {
    background(0);
    fill(255);
    textSize(30);
    fill(200, 2, 255);
    text("congratulations", width/2, height/3);
    text("You won!", width/2, height/2);
    textSize(20);
    fill(200);
    text("CLICK TO PLAY AGAIN", width/2, height*2/3);
    if (mousePressed) {
      mode = Playing;
      loadWorld("level1.png");
      switchstate=1;
      GravityUp=false;
    }
  }
}
void keyPressed() {
  if (keyCode==UP)upkey       = true;
  if (keyCode==DOWN)downkey   = true;
  if (keyCode==LEFT)leftkey   = true;
  if (keyCode==RIGHT)rightkey = true;
  if (key=='p'||key=='P')pkey= true;
  if (key=='c'||key=='C')ckey= true;
  if (key=='b'||key=='B')bkey= true;
}
void keyReleased() {
  if (keyCode==UP)upkey       = false;
  if (keyCode==DOWN)downkey   = false;
  if (keyCode==LEFT)leftkey   = false;
  if (keyCode==RIGHT)rightkey = false;
  if (key=='p'||key=='P')pkey= false;
  if (key=='b'||key=='B')bkey= false;
  if (key=='c'||key=='C')ckey= false;
}
void contactStarted(FContact Contact) {
  FBody other = Contact.getBody1();


  if (other.getName().equals("player")) {
    other = Contact.getBody2();
  }
  if (other.getName().equals("fall2")) {
    other = Contact.getBody2();
  }
  if (other.getName().equals("flyer2")) {
    other = Contact.getBody2();
  }
  if (other.getName().equals("static")) {
    other = Contact.getBody2();
  }
  if (other.getName().equals("shell")) {
    other = Contact.getBody2();
  }
  if (other.getName().equals("wallbox")) {
    other = Contact.getBody2();
  }
  if (other.getName().equals("lava")) {
    other = Contact.getBody2();
  }

  if (Contact.contains("player", "bridge")) {
    other.setName("FALL!");//"FALL".equals(other.getName())
  }
  if (Contact.contains("player", "spring")) {
    bluebox.setVelocity(bluebox.getVelocityX(), -2000);
    //    brown2box.setName("springmoved2");
  }
  if (switchactive&&Contact.contains("player", "switch")) {
    switchstate*=-1;
    switchactive=false;
    switchtimer = 0;
  }
  if (Contact.contains("fall2", "static")) {
    other.setName("static2");
  }
  if (Contact.contains("player", "teleporter")) {
    other.setName("move");
  }
  //    if (Contact.contains("player", "teleporter")) {
  //    other.setName("move");
  //  }
  if (Contact.contains("lava", "FALL!")) {
    world1.remove(other);
  }
  //  if(Contact.contains("player","switch")){
  //  switchactive=true;
  //  }
  if (Contact.contains("player", "lava")) {
    mode=Gameover;
  }
  if (Contact.contains("player", "bomb")) {
    mode=Gameover;
  }
  if (Contact.contains("player", "hammerthrower")) {
    mode=Gameover;
  }
  if (Contact.contains("player", "bulletthrower")) {
    mode=Gameover;
  }
  if (Contact.contains("player", "spike")) {
    mode=Gameover;
  }
  if (Contact.contains("player", "thwomp")) {
    mode=Gameover;
  }
  if (Contact.contains("player", "suicidebomberbullets")) {
    mode=Gameover;
  }
  if (Contact.contains("player", "hammer")) {
    mode=Gameover;
  }
  if (Contact.contains("player", "bullet")) {
    world1.remove(other);
    mode=Gameover;
  }
  if (Contact.contains("shell", "goomba")) {
    world1.remove(other);
    enemies.remove(other);
  }
  if (Contact.contains("shell", "koopa")) {
    world1.remove(other);
    enemies.remove(other);
  }
  if (Contact.contains("static", "suicidebomberbullets")) {
    world1.remove(other);
    enemies.remove(other);
  }
  if (Contact.contains("shell", "thwomp")) {
    world1.remove(other);
    enemies.remove(other);
  }
  if (Contact.contains("shell", "suicidebomber")) {
    world1.remove(other);
    enemies.remove(other);
  }
  if (Contact.contains("static", "bullet")) {
    world1.remove(other);
  }
  if (Contact.contains("static", "hammer")) {
    world1.remove(other);
  }
  if (Contact.contains("wallbox", "bullet")) {
    world1.remove(other);
  }
  if (Contact.contains("wallbox", "hammer")) {
    world1.remove(other);
  }
  if (Contact.contains("wallbox", "suicidebomberbullets")) {
    world1.remove(other);
  }
  if (Contact.contains("player", "teleporter2")) {
    other.setName("move2");
  }
  if (Contact.contains("player", "signpost")) {
    signpostvariable=true;
  }
  if (Contact.contains("player", "signpost2")) {
    signvariable2=true;
  }
  if (Contact.contains("player", "signpost3")) {
    signvariable3=true;
  }
  if (Contact.contains("player", "signpost4")) {
    signvariable4=true;
  }
  if (Contact.contains("player", "flyer")) {
    other.setName("flyer2");
  }
  if (Contact.contains("flyer2", "static")) {
    other.setName("static2");
  }
  if (Contact.contains("player", "checkpoint1")) {
    checkpointvariable1=true;
    checkpointsvariable1=true;
  }
  if (Contact.contains("player", "checkpoint2")) {
    checkpointvariable2=true;
    checkpointsvariable2=true;
  }
  if (Contact.contains("player", "level2box")) {
    loadWorld("level2.png");
    levelnumber=2;
    switchstate=1;
    GravityUp=false;
  }
  if (Contact.contains("player", "endgamebox")) {
    mode=Win;
  }
}
void contactEnded(FContact Contact) {
  FBody other = Contact.getBody1();
  if (other.getName().equals("player")) {
    other = Contact.getBody2();
  }
  if (Contact.contains("player", "switch")) {
    //switchactive=true;
  }
  if (Contact.contains("player", "signpost")) {
    signpostvariable=false;
  }
  if (Contact.contains("player", "signpost2")) {
    signvariable2=false;
  }
  if (Contact.contains("player", "signpost3")) {
    signvariable3=false;
  }
  if (Contact.contains("player", "signpost4")) {
    signvariable4=false;
  }
  if (Contact.contains("player", "checkpoint1")) {
    checkpointsvariable1=false;
  }
  if (Contact.contains("player", "checkpoint2")) {
    checkpointsvariable2=false;
  }
}

//how to restart the whole game again?

// transparency of water
// transparency of spring
// jumping problem (Can we keep it with the contact.length)

//                   questions
// shell
// arrows