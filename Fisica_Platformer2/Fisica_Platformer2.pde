import fisica.*;

//map loading variables
int   mapx = 0, mapy = 0, worldx, worldy, timer, z=0, switchstate=1, switchflyer=1;
PImage map;

//colour pallette
color black = color(0, 0, 0);
color green = color(34, 177, 76);      //teleporter1
color cyan  = color(153, 217, 234);      //teleporter2
color lightbrown = color(185, 122, 87);  //Signpost
color purple = color(163, 73, 164);
color blue  = color(63, 72, 204);
color watersurface = color(0, 162, 232);
color water = color(5, 109, 177);
color yellow = color(255, 242, 0);       //flyer
color red   = color(237, 28, 36);        //switch
color darkred=color(193, 0, 5);            //lava
color gray = color(127, 127, 127);       //slide
color brown = color(64, 0, 0);           //spring
color orange = color(255, 127, 39);      //crate test
color pink  = color(255, 174, 201);      //conveyerbelt
color lightpurple = color(200,191,231);  //gumbabox
color navyblue = color(0,0,125);         //wallbox
boolean rightkey, leftkey, upkey, downkey, signpostvariable, switchactive, switchflyerboolean;
ArrayList <FBox> terrain;
ArrayList <FBox> enemies;
float worldsize = 32;
FWorld world1;
FBox lavabox, wallbox, goombabox, lightbrownbox, cyanbox, redbox, pinkbox, orangebox, blackbox, greenbox, purplebox, graybox, brownbox, yellowbox, watersurfacebox, waterbox;
FCircle bluebox;
//Animated Terrain
PImage[]waterpics=new PImage[4];
PImage[]lavapics=new PImage[6];
PImage[]goombapics=new PImage[3];
int cnumber=0;
int t1x = 0;
int t1y = 0;
int t2x = 0;
int t2y = 0;

void setup() {
  size(700, 700);

  Fisica.init(this);
  terrain = new ArrayList<FBox>();
  enemies = new ArrayList<FBox>();
  world1 = new FWorld(0, 0, 100000, 100000);
  world1.setGravity(0, 1000);
  //variables initializing
  rightkey=leftkey=upkey=downkey=signpostvariable=false;
  switchactive=switchflyerboolean=true;
  waterpics[0] =loadImage("water1.png");
  waterpics[1] =loadImage("water2.png");
  waterpics[2] =loadImage("water3.png");
  waterpics[3] =loadImage("water4.png");

  lavapics[0] =loadImage("lava0.png");
  lavapics[1] =loadImage("lava1.png");
  lavapics[2] =loadImage("lava2.png");
  lavapics[3] =loadImage("lava3.png");
  lavapics[4] =loadImage("lava4.png");
  lavapics[5] =loadImage("lava5.png");
  
  goombapics[0]=loadImage("");
  goombapics[1]=loadImage("");
  goombapics[2]=loadImage("");

  loadWorld();
}

void draw() {
  background(255);


  updatePlayer();  //handle keyboard input, movement, animation
  updateTerrain(); //handle terrain actions and animations
  updateEnemies(); //controls the bad guys
  pushMatrix();    //begin some transformations
  translate(-bluebox.getX()+width/2, -bluebox.getY()+height/2);
  world1.step();
  world1.draw();
  popMatrix();     //end transformation

  if (signpostvariable == true) {
    fill(0);
    textSize(50);
    text("This is SPARTA", 100, 400);
  }
}
void keyPressed() {
  if (keyCode==UP)upkey       = true;
  if (keyCode==DOWN)downkey   = true;
  if (keyCode==LEFT)leftkey   = true;
  if (keyCode==RIGHT)rightkey = true;
}
void keyReleased() {
  if (keyCode==UP)upkey       = false;
  if (keyCode==DOWN)downkey   = false;
  if (keyCode==LEFT)leftkey   = false;
  if (keyCode==RIGHT)rightkey = false;
}
void contactStarted(FContact Contact) {
  FBody other = Contact.getBody1();


  if (other.getName().equals("player")||other.getName().equals("wallbox")) {
    other = Contact.getBody2();
  }
  if (other.getName().equals("flyer2")) {
    other = Contact.getBody2();
  }
  if (Contact.contains("player", "bridge")) {
    other.setName("FALL!");//"FALL".equals(other.getName())
  }
  if (Contact.contains("player", "spring")) {
    bluebox.setVelocity(bluebox.getVelocityX(), -500);
  }
  if (Contact.contains("player", "conveyorbelt")) {
    if (bluebox.getVelocityX()>0) {
      bluebox.adjustVelocity(bluebox.getAngularVelocity()+500, bluebox.getVelocityY());
    } else {
      bluebox.adjustVelocity(bluebox.getAngularVelocity()*-1+500, bluebox.getVelocityY());
    }
  }
  if(Contact.contains("wallbox", "goomba")){
   other.setName("goomba1");
  }
  if (switchactive&&Contact.contains("player", "switch")) {
    switchstate*=-1;
    switchactive=false;
    //if (switchstate==-1) {
    //  other.setFill(0);
    //} else {
    //  other.setFillColor(red);
    //}
  }
  if (Contact.contains("player", "flyer")) {
      other.setName("flyer2");
  }
  if(Contact.contains("flyer2","static")){
    other.setName("static2");
  }
  if (Contact.contains("fall2", "static")) {
    other.setName("static2");
  }
  if (Contact.contains("player", "teleporter")) {
    other.setName("move");
  }
  if (Contact.contains("player", "teleporter2")) {
    other.setName("move2");
  }
  if (Contact.contains("player", "signpost")) {
    signpostvariable=true;
  }
}
void contactEnded(FContact Contact) {
  FBody other = Contact.getBody1();
  if (other.getName().equals("player")||other.getName().equals("flyer")) {
    other = Contact.getBody2();
  }
  if (Contact.contains("player", "switch")) {
    switchactive=true;
  }
  //if (Contact.contains("player", "flyer")) {
  //  switchflyerboolean=true;
  //}
  if (Contact.contains("player", "signpost")) {
    signpostvariable=false;
  }
  //if (Contact.contains("flyer")) {
  //  if () {
  //  } else {
  //    other.setStatic(false);
  //  }
  //}
}
//notes
//updateterrain is after updatePlayer but it is invisible
//signpost does not work after half of the circle is throug( you said it was fine)

// transparency of water
// jumping problem
//                   questions