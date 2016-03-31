Zombie[] Zombies = new Zombie[10];
Zombie myZombie1;
Zombie myZombie2; 
Personnage myPersonnage1;

int xPerso;
int yPerso;
int viePerso;
int xspeed, yspeed,avx,avy;
boolean menu;
boolean game;
PImage magma1Background;
PImage menuBackground;


void setup()
{

  magma1Background= loadImage("texture.jpg");
  menuBackground= loadImage("last-one.jpg");
  size(1300,698);
  viePerso = 3000;
  avx=5;
  avy=5;
  xPerso=450;
  menu = true;
  game = false; 

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
   Zombies[i] = new Zombie(100,x, y , 1, 1,xPerso, yPerso);
  }
  myPersonnage1 = new Personnage(color(400,0,0),800,100,5,5,xPerso, yPerso);
  
  
}




void draw() 
{
  if (menu == true)
  {
    menu();
    fill(255,0,0,0);
    noStroke();
    rect(175,340,200,50);
  }
  if (game == true)
  {
  background(250,250,250);      //map
  rect(330,190,50,30);
  image(magma1Background, 0, 0);
  image(magma1Background, 735, 0);
  rect(460,120,60,150);
  rect(130,120,200,100);
  for(int i=0; i < Zombies.length; i++) 
  {
   Zombies[i].move(xPerso,yPerso);
   Zombies[i].display();
   Zombies[i].collision();
   Zombies[i].fire(xPerso,yPerso);
 }
  myPersonnage1.move(xPerso, yPerso);
  myPersonnage1.display();
  myPersonnage1.collision();
  }
}