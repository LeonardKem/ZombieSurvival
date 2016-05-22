import ddf.minim.*; // import the processing music library
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


AudioSnippet GameMusic; // creating a new variable for a sound
Minim minim;

Zombie[] Zombies = new Zombie[10000]; // creating 10000 zombies on a list
Personnage myPersonnage1;
Map Map;
Menu Menu;


int mapx=0; // in case of a map bigger then the screen, we could get the segment of the map containing the personnage 
int mapy=0;
int xPerso=650;// variable of the personnage position 
int yPerso=349;
float viePerso; //Life of the personnage 
int xspeed, yspeed;// Speed of the personnage 
boolean menu; // boolean variable to know if we are on the menu 
boolean game;// boolean variable to know if we are on the game
PImage menuBackground;// creating a variable to store the menu image
PImage personnageMoveRight_haut; // the following variable store the different sprite of the personnage
PImage personnageMoveLeft_haut;
PImage personnageMoveRight_droite;
PImage personnageMoveLeft_droite;
PImage personnageMoveRight_bas;
PImage personnageMoveLeft_bas;
PImage personnageMoveRight_gauche;
PImage personnageMoveLeft_gauche;
PImage zombieD; // the variable store the zombie with the right and the left feet
PImage zombieG;
PImage grass; // a texture of grass for the map 
PImage background; // the variable to store the background of the game (the map)
int time; // the variable storing a stopwatch
int interval = 0;
boolean haut, bas, gauche, droite; // position of the character
boolean right=true;// the right foot of the character/Zombies is in front
boolean left = false;// the left foot of the character/Zombies is in front
float tic=0; // a variable depending on the time (easier to manipulate)
int timeExpected; //time expected before something happens
int timeExpectedForTic=0;
int counter; // a counter to know how many zombies you have already killed
boolean ImageBeforeMove = true; // this variable allows to display the character before anything happens (move or fire)
boolean a; //serves to switch the status of right and left




void setup()// A fonction to setup all the variables
{
  size(1300,698);
  minim = new Minim (this);
  GameMusic = minim.loadSnippet("50 Cent - In Da Club.mp3");
  
  grass= loadImage("891_ground-top.jpg");
  menuBackground= loadImage("menu.png");
  personnageMoveRight_haut= loadImage("herod_haut.png");
  personnageMoveLeft_haut= loadImage("herog_haut.png");
  personnageMoveRight_haut.resize(79,101);
  personnageMoveLeft_haut.resize(79,101);
  personnageMoveRight_droite= loadImage("herod_droite.png");
  personnageMoveLeft_droite= loadImage("herog_droite.png");
  personnageMoveRight_droite.resize(101,79);
  personnageMoveLeft_droite.resize(101,79);
  personnageMoveRight_bas= loadImage("herod_bas.png");
  personnageMoveLeft_bas= loadImage("herog_bas.png");
  personnageMoveRight_bas.resize(79,101);
  personnageMoveLeft_bas.resize(79,101);
  personnageMoveRight_gauche= loadImage("herod_gauche.png");
  personnageMoveLeft_gauche= loadImage("herog_gauche.png");
  personnageMoveRight_gauche.resize(101,79);
  personnageMoveLeft_gauche.resize(101,79);
  zombieD= loadImage("zombie1.png");
  zombieD.resize(72,69);
  zombieG= loadImage("zombie2.png");
  zombieG.resize(72,69);
  background = loadImage("map-raccourci-final.png");
  background.resize(2200,2200);
  viePerso = 300;
  xPerso=450;
  counter=0;
  menu = true;
  game = false; 
  timeExpected =2;
  
  Map= new Map();
  Menu = new Menu();

   for(int i=0; i <Zombies.length; i++) 
  {
   
   int y = int(random(1,4));
   int x = int(random(1,4));
    if (x ==1){ 
    x=1300 ;
    if(y==1)y=349; 
      if(y==2)y=0;
    if(y==3)y=698;
  }
    if (x ==2) {
    x=650;
      if(y==2)y=0;
    if(y==3)y=698;
    }
    if (x ==3) {
    x=300;
     y=698;
    }
  
   Zombies[i] = new Zombie(x, y , 1, 1,xPerso, yPerso);
  }
  myPersonnage1 = new Personnage(800,100,5,5,xPerso, yPerso);
  
  
}




void draw() // here is a fonction to display all the things happening on our program 
{
   clear(); // clear before drawing again
  if (menu == true)
  {
    
   Menu.display(); // display the menu
   Menu.Start(); // if you click start, the game start 
   
  }
  if (game == true)
  {
 
 clear();
 
 Map.map();// diplay the map
 Map.time();// a stop watch in order to spawn the zombies
 Map.messages(); // a method to display messages on the screen (life, score...)
 Map.music();// Start the music 
 
  for(int i=0; i < tic/20 ; i++) 
  {
   Zombies[i].move(xPerso,yPerso);// a method allowing zombies to move
   Zombies[i].display();// a method displaying the zombies
   Zombies[i].collision(); // a method avoiding zombies to pass trough walls
   Zombies[i].fire(xPerso,yPerso); // a method allow the character to fire on zombies
  
 }

  
  myPersonnage1.move();// a method allowing the character to move
  myPersonnage1.display();// a method displaying the character
  myPersonnage1.collision();// a method avoiding the character to pass trough walls
  
 
 

  }
}