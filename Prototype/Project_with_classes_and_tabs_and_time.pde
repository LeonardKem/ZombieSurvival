Zombie[] Zombies = new Zombie[10000];
Personnage myPersonnage1;
HLine h1 = new HLine(20, 2.0); 
HLine h2 = new HLine(50, 2.5); 

int xPerso;
int yPerso;
int viePerso;
int xspeed, yspeed,avx,avy;
boolean menu;
boolean game;
PImage magma1Background;
PImage menuBackground;
PImage personnageMoveRight_haut;
PImage personnageMoveLeft_haut;
PImage personnageMoveRight_droite;
PImage personnageMoveLeft_droite;
PImage personnageMoveRight_bas;
PImage personnageMoveLeft_bas;
PImage personnageMoveRight_gauche;
PImage personnageMoveLeft_gauche;
PImage zombieD;
PImage zombieG;
int time;
int interval = 0;
boolean haut, bas, gauche, droite; 
float tic=0;
int timeExpected;
int timeExpectedForTic =0;
int counter;
boolean right=true;
boolean left = false;
boolean a;
void setup()
{

  magma1Background= loadImage("texture.jpg");
  menuBackground= loadImage("last-one.jpg");
  personnageMoveRight_haut= loadImage("herod_haut.png");
  personnageMoveLeft_haut= loadImage("herog_haut.png");
  personnageMoveRight_droite= loadImage("herod_droite.png");
  personnageMoveLeft_droite= loadImage("herog_droite.png");
  personnageMoveRight_bas= loadImage("herod_bas.png");
  personnageMoveLeft_bas= loadImage("herog_bas.png");
  personnageMoveRight_gauche= loadImage("herod_gauche.png");
  personnageMoveLeft_gauche= loadImage("herog_gauche.png");
  zombieD= loadImage("zombie1.png");
  zombieD.resize(72,69);
  zombieG= loadImage("zombie2.png");
  zombieG.resize(72,69);
  size(1300,698);
  viePerso = 20000;
  avx=5;
  avy=5;
  xPerso=450;
  counter=0;
  menu = true;
  game = false; 
  timeExpected =2;

   for(int i=0; i <Zombies.length; i++) 
  {
   
   int x = int(random(1,4));
   int y = int(random(1,4));
   if(x==1)
   {
     x=0;
   }
   if(y==1)
   {
     y=0;
   }
   if(x==2)
   {
     x=1300;
   }
   if(y==2)
   {
     y=698;
   }
   Zombies[i] = new Zombie(color(82,250,28),x, y , 1, 1,xPerso, yPerso);
  }
  myPersonnage1 = new Personnage(color(250,250,250),800,100,5,5,xPerso, yPerso);
  
  
}




void draw() 
{
 
  if (menu == true)
  {
    size(1300,698);
    menu();
  }
  if (game == true)
  {
  background(0);//map
  for(int i=0; i < tic/40 ; i++) 
  {
   Zombies[i].move(xPerso,yPerso);
   Zombies[i].display();
   Zombies[i].collision();
   Zombies[i].fire(xPerso,yPerso);
 }
 fill(240,231,220);
  rect(550,249,200,200);
  myPersonnage1.move();
  myPersonnage1.display();
  myPersonnage1.collision();
  myPersonnage1.earnLife(xPerso,yPerso);
  time();
  messages();

  }
}