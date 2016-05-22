import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import ddf.minim.*; 
import ddf.minim.analysis.*; 
import ddf.minim.effects.*; 
import ddf.minim.signals.*; 
import ddf.minim.spi.*; 
import ddf.minim.ugens.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Project_1 extends PApplet {

 // import the processing music library







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




public void setup()// A fonction to setup all the variables
{
  
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
   
   int y = PApplet.parseInt(random(1,4));
   int x = PApplet.parseInt(random(1,4));
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




public void draw() // here is a fonction to display all the things happening on our program 
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
class Map
{
  
 public  void time()// a stop watch
{
  
  if (game == true)
  {
  time = interval+PApplet.parseInt(millis()/50);// the stop watch
     if(time >timeExpected)// a function allowing to create a new unit based on time
  {
   timeExpected= timeExpected+100;
   tic=tic+1;
  }
    if(time >timeExpectedForTic)// a function allowing to create a new unit based on time
  {
   timeExpectedForTic= timeExpectedForTic+1;
   tic=tic+1;
  }
  if (tic % 5 == 0) // Every 5 ticks, toggle left or right foot in front animation in player and zombies.
  {
    a=true;
  }
  if (tic%10==0)
  {
    a=false;
  }
  if(a==true)
  {
    right=true;
    left=false;
  }
  else 
  {
    left=true; 
    right=false;
  }
  }
}


public void messages()
{
  fill(255,255,255);
  textSize(32);
  textAlign(LEFT);
  text("life:",20,100); 
  stroke(106,240,97);
  strokeWeight(10);
  line(100,90,viePerso+100,90);// display the remaining life of the character

  text("score : ", width/2-60,80);
  text(counter, width/2+60,80); // diplay the score
  
  

 if (viePerso == 0)
 {
  textSize(100);
  textAlign(CENTER);
  fill(250,0,0);
  text("Game Over",width/2,height/2); // if the character dies, display Game Over
  noLoop();
 }
}



public void map ()
{
    image(background,0,-550); // display the picture of the map 
    

}


public void music()
{
  GameMusic.play(); // play the music
}



}
class Menu
{
  public void display () 
  {image(menuBackground, 0, 0); }// display the menu's image 
  
  public void Start() // if you click start, the game start 
  {
    if (mouseX >525 && mouseX <725  && mouseY> 490 && mouseY < 540)// if you pass your mouse on start, display a rectangle
  {
     fill(255,255,255,40);
    noStroke();
    rect(525,490,200,50);
  }
   if (mousePressed == true && mouseX >525 && mouseX <725  && mouseY> 490 && mouseY < 540)
  {
    menu = false; 
    game = true;
    rect(175,340,200,50);
  }
  }
}
class Personnage 
{ 

  int xspeed;
  int yspeed;
  int xperso;
  int yperso;
  int zonex;// this attribut set your speed at 0 if you are going to near to a wall 
  int zoney;

  // The Constructor is defined with arguments.
  Personnage( int tempxPerso, int tempyPersonnage, int tempXspeed, int tempYspeed, int xPerso, int yPerso) { 
    xperso = tempxPerso;
    yperso = tempyPersonnage; 
    xspeed = tempXspeed;
    yspeed= tempYspeed;
    xperso=xPerso;
    yperso=yPerso;
  }

public  void display() { // allows to display the character before anything happens (a move or fire)
  if (ImageBeforeMove == true ) image(personnageMoveLeft_haut, xPerso-40,yPerso-50);

  }

public  void  move() {// allows to move
 if (keyPressed == true)
  {
    ImageBeforeMove = false; 
    if (key == 'z' && yPerso>0  ) { // go up
            yPerso = yPerso-yspeed ; 
            if (right==true)
            {
      image(personnageMoveLeft_haut, xPerso-40,yPerso-50);
            }
      if (left == true)
      {
      image(personnageMoveRight_haut, xPerso-40,yPerso-50);
      haut=true;
      bas=false ; 
      gauche=false;
      droite=false;
      }
    
  }
    
    
    
    if (key == 's' && yPerso<698) {// go down
           if (right==true)
            {
      image(personnageMoveLeft_bas, xPerso-40,yPerso-50);
            }
      if (left == true)
      {
      image(personnageMoveRight_bas, xPerso-40,yPerso-50);
      }
      yPerso = yPerso+yspeed ;
      haut=false;
      bas=true ; 
      gauche=false;
      droite=false;  
  }
    
    
    
    if (key == 'q' && xPerso>0) { // go right
            if (right==true)
            {
      image(personnageMoveLeft_gauche, xPerso-50,yPerso-40);
            }
      if (left == true)
      {
      image(personnageMoveRight_gauche, xPerso-50,yPerso-40);
      }
      xPerso = xPerso-xspeed ;
      haut=false;
      bas=false ; 
      gauche=true;
      droite=false;
    }
    
    
    if (key == 'd' && xPerso<1300) {// go left
           if (right==true)
            {
      image(personnageMoveLeft_droite, xPerso-50,yPerso-40);
            }
      if (left == true)
      {
      image(personnageMoveRight_droite, xPerso-50,yPerso-40);
      }
      xPerso = xPerso+xspeed ;
      haut=false;
      bas=false ; 
      gauche=false;
      droite=true;
    }
  }
    else 
    {
      if (haut==true)
      {
      image(personnageMoveRight_haut, xPerso-40,yPerso-50);
      }
      
      if (bas==true)
      {
      image(personnageMoveRight_bas, xPerso-40,yPerso-50);
      }
      if (droite==true)
      {
      
      image(personnageMoveRight_droite, xPerso-50,yPerso-40);
      }
       if (gauche==true)
      {
      image(personnageMoveRight_gauche, xPerso-50,yPerso-40);
      }
  }
}

public void collision()// this method set your speed at 0 if you are going to near to a wall 
{
  zonex=0;
  zoney=0;
  fill(0);
  
  
  
  
  //rect(120,115,350,11); coordinate to the first wall
  if (
  xPerso > 120-50 && 
  xPerso< 120+350+50 && 
  yPerso > 115-50 && 
  yPerso < 115 ) //barre sup\u00e9rieure
  {
   zoney=1;
  }
  if (
  xPerso > 120-50 && 
  xPerso< 120-50+350+90 && 
  yPerso > 115+11 && 
  yPerso < 115+11+50 ) // barre bas
  {
  zoney=1; 
  }
   if (xPerso > 120-50 && 
  xPerso< 120 && 
  yPerso > 115 && 
  yPerso < 115+11 ) //carr\u00e9 gauche
  {
  zonex=1;
  }
   if (xPerso > 120+350 && 
  xPerso< 120+350+50 && 
  yPerso > 115 && 
  yPerso < 115+11 ) //carr\u00e9 droite
  {
  zonex=1;
  }
 
  
  
  
  //rect(473,115,11,94); coordinate to the second wall
    if (
  xPerso > 473-50 && 
  xPerso< 473+11+50 && 
  yPerso > 115-50 && 
  yPerso < 115 ) //barre sup\u00e9rieure
  {
   zoney=1;
  }
  if (
  xPerso > 473-50 && 
  xPerso< 473-50+11+90 && 
  yPerso > 115+94 && 
  yPerso < 115+94+50 ) // barre bas
  {
  zoney=1; 
  }
  if (xPerso > 473-50 && 
  xPerso< 473 && 
  yPerso > 115 && 
  yPerso < 115+94 ) //carr\u00e9 gauche
  {
  zonex=1;
  }
   if (xPerso > 473+11 && 
  xPerso< 473+11+50 && 
  yPerso > 115 && 
  yPerso < 115+94 ) //carr\u00e9 droite
  {
  zonex=1;
  }
  
  
  
  // rect(473,277,11,120); 
  if (
  xPerso > 473-50 && 
  xPerso< 473+11+50 && 
  yPerso > 277-50 && 
  yPerso < 277 ) //barre sup\u00e9rieure
  {
   zoney=1;
  }
   if (
  xPerso > 473-50 && 
  xPerso< 473-50+11+90 && 
  yPerso > 277+120 && 
  yPerso < 277+120+50 ) // barre bas
  {
  zoney=1; 
  }
  if (xPerso > 473-50 && 
  xPerso< 473 && 
  yPerso > 277 && 
  yPerso < 277+120 ) //carr\u00e9 gauche
  {
  zonex=1;
  }
  if (xPerso > 473+11 && 
  xPerso< 473+11+50 && 
  yPerso > 277 && 
  yPerso < 277+120 ) //carr\u00e9 droite
  {
  zonex=1;
  }
  
  
  // rect(473,500,11,110);
  if (
  xPerso > 473-50 && 
  xPerso< 473+11+50 && 
  yPerso > 500-50 && 
  yPerso < 500 ) //barre sup\u00e9rieure
  {
   zoney=1;
  }
  if (
  xPerso > 473-50 && 
  xPerso< 473-50+11+90 && 
  yPerso > 500+110 && 
  yPerso < 500+110+50 ) // barre bas
  {
  zoney=1; 
  }
  if (xPerso > 473-50 && 
  xPerso< 473 && 
  yPerso > 500 && 
  yPerso < 500+110 ) //carr\u00e9 gauche
  {
  zonex=1;
  }
  if (xPerso > 473+11 && 
  xPerso< 473+11+50 && 
  yPerso > 500 && 
  yPerso < 500+110 ) //carr\u00e9 droite
  {
  zonex=1;
  }
 
  
    //rect(15,590,130,11);
  if (
  xPerso > 15-50 && 
  xPerso< 15+130+50 && 
  yPerso > 590-50 && 
  yPerso < 590 ) //barre sup\u00e9rieure
  {
   zoney=1;
  }
  if (
  xPerso > 15-50 && 
  xPerso< 15-50+130+90 && 
  yPerso > 590+11 && 
  yPerso < 590+11+50 ) // barre bas
  {
  zoney=1; 
  }
  if (xPerso > 15-50 && 
  xPerso< 15 && 
  yPerso > 590 && 
  yPerso < 590+11 ) //carr\u00e9 gauche
  {
  zonex=1;
  }
  if (xPerso > 15+130 && 
  xPerso< 15+130+50 && 
  yPerso > 590 && 
  yPerso < 590+11 ) //carr\u00e9 droite
  {
  zonex=1;
  }
 
  //rect(290,590,210,11);
  if (
  xPerso > 290-50 && 
  xPerso< 290+210+50 && 
  yPerso > 590-50 && 
  yPerso < 590 ) //barre sup\u00e9rieure
  {
   zoney=1;
  }
  if (
  xPerso > 290-50 && 
  xPerso< 290-50+210+90 && 
  yPerso > 590+11 && 
  yPerso < 590+11+50 ) // barre bas
  {
  zoney=1; 
  }
  if (xPerso > 290-50 && 
  xPerso< 290 && 
  yPerso > 590 && 
  yPerso < 590+11 ) //carr\u00e9 gauche
  {
  zonex=1;
  }
  if (xPerso > 290+210 && 
  xPerso< 290+210+50 && 
  yPerso > 590 && 
  yPerso < 590+11 ) //carr\u00e9 droite
  {
  zonex=1;
  }
 
  
  //rect(15,115,11,480);
  if (
  xPerso > 15-50 && 
  xPerso< 15+11+50 && 
  yPerso > 115-50 && 
  yPerso < 115 ) //barre sup\u00e9rieure
  {
   zoney=1;
  }
  if (
  xPerso > 15-50 && 
  xPerso< 15-50+11+90 && 
  yPerso > 115+480 && 
  yPerso < 115+480+50 ) // barre bas
  {
  zoney=1; 
  }
  if (xPerso > 15-50 && 
  xPerso< 15 && 
  yPerso > 115 && 
  yPerso < 115+480 ) //carr\u00e9 gauche
  {
  zonex=1;
  }
  if (xPerso > 15+11 && 
  xPerso< 15+11+50 && 
  yPerso > 115 && 
  yPerso < 115+480 ) //carr\u00e9 droite
  {
  zonex=1;
  }
 
 
  if (zonex > 0) // si le personnage est dans une zone proche d'un mur, sa vitesse est \u00e9gale \u00e0 0 
  {
    xspeed=0;
  }
   if (zoney >0)
  {
    yspeed=0;
  }
  if (zoney >0 && zonex>0) xspeed=5;
   if (zoney==0)
  {
    yspeed=5;
  }
   if (zonex==0)
  {
    xspeed=5;
  }
  if (zonex==0 || zoney==0)
  {
  if(xPerso > 15 && xPerso< 469 && yPerso > 115 && yPerso<600 )
  {
     if (keyPressed == true)
  {
    if (key == 'z' && yPerso>300  ) { // go up
            yspeed=5; 
  }
   if (key == 's' && yPerso<300  ) { // go down
            yspeed=5; 
  }
   if (key == 'd' && xPerso<300  ) { // go right
            xspeed=5; 
  }
   if (key == 'q' && xPerso>300  ) { // go left
            xspeed=5; 
  }
}


  }
  else 
  {
        if (keyPressed == true)
  {
    if (key == 'z' && yPerso<300  ) { // go up
            yspeed=5; 
  }
   if (key == 's' && yPerso>300  ) { // go down
            yspeed=5; 
  }
   if (key == 'd' && xPerso>300  ) { // go right
            xspeed=5; 
  }
}
    
  }
  }
}
}
class Zombie { 
  int xZombie;
  int yZombie;
  int xspeed;
  int yspeed;
  int xperso;
  int yperso;
  int zonex;
  int zoney;
  int vieZombie;
  float angle; // angle between the direction of view of the zombie and the character
  boolean counterOn;// if the the zombie dies, the score is updated 


  Zombie(int tempxZombie, int tempyZombie, int tempXspeed, int tempYspeed, int xPerso, int yPerso) { 
    xZombie = tempxZombie;
    yZombie = tempyZombie;
    xspeed = tempXspeed;
    yspeed= tempYspeed;
    xperso=xPerso;
    yperso=yPerso;
    vieZombie=50;
    angle = PI/2;
    counterOn=true;
 
  }

  public void display() // display the zombie
  {
    if (vieZombie > 0 ) 
    {
    if(right==true) // display the zombie with the right foot in front
    {
      rotateZombieD();
    }
    if (left==true) // display the zombie with the left foot in front
    {
      rotateZombieG();
    }
    }
  }
  
  


private void rotateZombieD() // rotate the image with the right foot in front
{
  pushMatrix();
  translate(xZombie,yZombie );
  angle = atan2(xPerso-xZombie,-(yPerso-yZombie));
  rotate(angle);
  image(zombieD,-36,-35); 
  popMatrix();
}

private void rotateZombieG() // rotate the image with the left foot in front
{
  pushMatrix();
  translate(xZombie,yZombie );
  angle = atan2(xPerso-xZombie,-(yPerso-yZombie));
  rotate(angle);
  image(zombieG,-36,-35); 
  popMatrix();
}



  public void  move(int xperso, int yperso) { // follow the character 
    if (vieZombie > 0)
   {
   if (xZombie > xperso )
  {
    xZombie = xZombie -xspeed;
  }
  if (xZombie < xperso )
  {
    xZombie = xZombie +xspeed;
  } 
    if (yZombie > yperso )
  {
    yZombie = yZombie -yspeed;
  }
  if (yZombie < yperso )
  {
    yZombie = yZombie +yspeed;
  }
   }
   else 
   {
     if (counterOn == true)
     {
       counter = counter+1;
       counterOn= false;
     }
     xZombie=2500;
     yZombie=0;
     
   }

}



public void collision()// same thing that the collisions with the character 
{
  if (vieZombie > 0 ) 
    {
  zonex=0;
  zoney=0;
  fill(0);


  
  //rect(120,115,350,11);
  if (
  xZombie > 120-50 && 
  xZombie< 120+350+50 && 
  yZombie > 115-50 && 
  yZombie < 115
  && yPerso>yZombie) //barre sup\u00e9rieure
  {
   zoney=1;
  }
  if (
  xZombie > 120-50 && 
  xZombie< 120-50+350+90 && 
  yZombie > 115+11 && 
  yZombie < 115+11+50 
  && yPerso<yZombie) // barre bas
  {
  zoney=1; 
  }
  if (xZombie > 120-50 && 
  xZombie< 120 && 
  yZombie > 115 && 
  yZombie < 115+11 
  && xPerso>xZombie) //carr\u00e9 gauche
  {
  zonex=1;
  }
  if (xZombie > 120+350 && 
  xZombie< 120+350+50 && 
  yZombie > 115 && 
  yZombie < 115+11 
  && xPerso<xZombie) //carr\u00e9 droite
  {
  zonex=1;
  }
 
  
  
  
  //rect(473,115,11,94);
    if (
  xZombie > 473-50 && 
  xZombie< 473+11+50 && 
  yZombie > 115-50 && 
  yZombie < 115 
  && yPerso>yZombie) //barre sup\u00e9rieure
  {
   zoney=1;
  }
 if (
  xZombie > 473-50 && 
  xZombie< 473-50+11+90 && 
  yZombie > 115+94 && 
  yZombie < 115+94+50
  && yPerso<yZombie) // barre bas
  {
  zoney=1; 
  }
 if (xZombie > 473-50 && 
  xZombie< 473 && 
  yZombie > 115 && 
  yZombie < 115+94 
  && xPerso>xZombie) //carr\u00e9 gauche
  {
  zonex=1;
  }
  if (xZombie > 473+11 && 
  xZombie< 473+11+50 && 
  yZombie > 115 && 
  yZombie < 115+94 
  && xPerso<xZombie) //carr\u00e9 droite
  {
  zonex=1;
  }
  
  
  
  // rect(473,277,11,120); 
  if (
  xZombie > 473-50 && 
  xZombie< 473+11+50 && 
  yZombie > 277-50 && 
  yZombie < 277 
  && yPerso>yZombie) //barre sup\u00e9rieure
  {
   zoney=1;
  }
  if (
  xZombie > 473-50 && 
  xZombie< 473-50+11+90 && 
  yZombie > 277+120 && 
  yZombie < 277+120+50 
  && yPerso<yZombie) // barre bas
  {
  zoney=1; 
  }
   if (xZombie > 473-50 && 
  xZombie< 473 && 
  yZombie > 277 && 
  yZombie < 277+120 
  && xPerso>xZombie) //carr\u00e9 gauche
  {
  zonex=1;
  }
  if (xZombie > 473+11 && 
  xZombie< 473+11+50 && 
  yZombie > 277 && 
  yZombie < 277+120 
  && xPerso<xZombie) //carr\u00e9 droite
  {
  zonex=1;
  }
  
  
  // rect(473,500,11,110);
  if (
  xZombie > 473-50 && 
  xZombie< 473+11+50 && 
  yZombie > 500-50 && 
  yZombie < 500 
  && yPerso>yZombie) //barre sup\u00e9rieure
  {
   zoney=1;
  }
  if (
  xZombie > 473-50 && 
  xZombie< 473-50+11+90 && 
  yZombie > 500+110 && 
  yZombie < 500+110+50 
  && yPerso<yZombie) // barre bas
  {
  zoney=1; 
  }
  if (xZombie > 473-50 && 
  xZombie< 473 && 
  yZombie > 500 && 
  yZombie < 500+110 
  && xPerso<xZombie) //carr\u00e9 gauche
  {
  zonex=1;
  }
  if (xZombie > 473+11 && 
  xZombie< 473+11+50 && 
  yZombie > 500 && 
  yZombie < 500+110 
  && xPerso<xZombie) //carr\u00e9 droite
  {
  zonex=1;
  }
 
  
    //rect(15,590,130,11);
  if (
  xZombie > 15-50 && 
  xZombie< 15+130+50 && 
  yZombie > 590-50 && 
  yZombie < 590 
  && yPerso<yZombie) //barre sup\u00e9rieure
  {
   zoney=1;
  }
  if (
  xZombie > 15-50 && 
  xZombie< 15-50+130+90 && 
  yZombie > 590+11 && 
  yZombie < 590+11+50 
  && yPerso<yZombie) // barre bas
  {
  zoney=1; 
  }
   if (xZombie > 15-50 && 
  xZombie< 15 && 
  yZombie > 590 && 
  yZombie < 590+11 
  && xPerso>xZombie) //carr\u00e9 gauche
  {
  zonex=1;
  }
  if (xZombie > 15+130 && 
  xZombie< 15+130+50 && 
  yZombie > 590 && 
  yZombie < 590+11 
  && xPerso<xZombie) //carr\u00e9 droite
  {
  zonex=1;
  }
 
 
 
  //rect(290,590,210,11);
  if (
  xZombie > 290-50 && 
  xZombie< 290+210+50 && 
  yZombie > 590-50 && 
  yZombie < 590 
  && yPerso>yZombie) //barre sup\u00e9rieure
  {
   zoney=1;
  }
 if (
  xZombie > 290-50 && 
  xZombie< 290-50+210+90 && 
  yZombie > 590+11 && 
  yZombie < 590+11+50 
  && yPerso<yZombie) // barre bas
  {
  zoney=1; 
  }
  if (xZombie > 290-50 && 
  xZombie< 290 && 
  yZombie > 590 && 
  yZombie < 590+11
  && xPerso>xZombie) //carr\u00e9 gauche
  {
  zonex=1;
  }
  if (xZombie > 290+210 && 
  xZombie< 290+210+50 && 
  yZombie > 590 && 
  yZombie < 590+11 
  && xPerso<xZombie) //carr\u00e9 droite
  {
  zonex=1;
  }
 
  
  //rect(15,115,11,480);
  if (
  xZombie > 15-50 && 
  xZombie< 15+11+50 && 
  yZombie > 115-50 && 
  yZombie < 115 
  && yPerso>yZombie) //barre sup\u00e9rieure
  {
   zoney=1;
  }
   if (
  xZombie > 15-50 && 
  xZombie< 15-50+11+90 && 
  yZombie > 115+480 && 
  yZombie < 115+480+50 
  && yPerso<yZombie) // barre bas
  {
  zoney=1; 
  }
   if (xZombie > 15-50 && 
  xZombie< 15 && 
  yZombie > 115 && 
  yZombie < 115+480
  && xPerso>xZombie) //carr\u00e9 gauche
  {
  zonex=1;
  }
  else if (xZombie > 15+11 && 
  xZombie< 15+11+50 && 
  yZombie > 115 && 
  yZombie < 115+480
  && xPerso<xZombie) //carr\u00e9 droite
  {
  zonex=1;
  }
  
  if (zonex > 0) // si le personnage est dans une zone proche d'un mur, sa vitesse est \u00e9gale \u00e0 0 
  {
    xspeed=0;
  }
   if (zoney >0)
  {
    yspeed=0;
  }
  if (zoney >0 && zonex>0) xspeed=2;
   if (zoney==0)
  {
    yspeed=2;
  }
   if (zonex==0)
  {
    xspeed=2;
  }
    
    
    if ( // if the zombie attacks the character, the character loses  life
  xPerso > xZombie-20 && 
  xPerso < xZombie+20 && 
  yPerso > yZombie-20 && 
  yPerso < yZombie+20 )
  {
    if(viePerso>0)
    {
    viePerso = viePerso - 1;
    }
  }
    }
}








public void fire(int xPerso,int yPerso) // if the fl\u00e8che and the zombie is in the trajectory of the shot, he loses life 
{
  if (vieZombie > 0 ) 
    {
  xperso=xPerso;
  yperso=yPerso;
  
  
  if (key == CODED) {
    ImageBeforeMove = false;// don't show anymore the starter image of the zombie
    
    if (keyCode == UP)  // fire up (but not through walls
    {
      haut=false;
      bas=false ; 
      gauche=false;
      droite=false; 
      
    
    if (xPerso > 15 && xPerso< 469 && yPerso > 115 && yPerso<600 )
    {
    strokeWeight (5);
    stroke(237,7,7);
    line(xperso+6, yperso, xperso+6,115);
    strokeWeight (2);
    stroke(242,186,186);
    line(xperso+6, yperso, xperso+6,115);
    if (xperso+5 > xZombie && xperso-5 < xZombie && yperso > yZombie && yZombie > 115)
    {
      vieZombie = vieZombie - 1; 
    }
    }
     else if (xPerso > 15 && xPerso< 469 && yPerso > 600)
    {
    strokeWeight (5);
    stroke(237,7,7);
    line(xperso+6, yperso, xperso+6,600);
    strokeWeight (2);
    stroke(242,186,186);
    line(xperso+6, yperso, xperso+6,600);
    if (xperso+5 > xZombie && xperso-5 < xZombie && yperso > yZombie && yZombie > 600)
    {
      vieZombie = vieZombie - 1; 
    }
    }
    else {
    strokeWeight (5);
    stroke(237,7,7);
    line(xperso+6, yperso, xperso+6,0);
    strokeWeight (2);
    stroke(242,186,186);
    line(xperso+6, yperso, xperso+6,0);
    
    if (xperso+5 > xZombie && xperso-5 < xZombie && yperso > yZombie)
    {
      vieZombie = vieZombie - 1; 
    }
    }
    
      image(personnageMoveLeft_haut, xPerso-40,yPerso-50);
    }
    
    
    if (keyCode == DOWN) // fir down
    {
      haut=false;
      bas=false ; 
      gauche=false;
      droite=false;           
     
    if(xPerso > 15 && xPerso< 469 && yPerso > 115 && yPerso<600 )
    {
    strokeWeight (5);
    stroke(237,7,7);
    line(xperso-7, yperso, xperso-7,600);
    strokeWeight (2);
    stroke(242,186,186);
    line(xperso-7, yperso, xperso-7,600);
    if (xperso+5 > xZombie && xperso-5 < xZombie && yperso < yZombie && yZombie <600)
    {
      vieZombie = vieZombie - 1; 
    }
    }
     else if (xPerso > 15 && xPerso< 469 && yPerso < 115)
    {
    strokeWeight (5);
    stroke(237,7,7);
    line(xperso+6, yperso, xperso+6,115);
    strokeWeight (2);
    stroke(242,186,186);
    line(xperso+6, yperso, xperso+6,115);
    if (xperso+5 > xZombie && xperso-5 < xZombie && yperso > yZombie && yZombie > 115)
    {
      vieZombie = vieZombie - 1; 
    }
    }
    else {
    strokeWeight (5);
    stroke(237,7,7);
    line(xperso-7, yperso, xperso-7,698);
    strokeWeight (2);
    stroke(242,186,186);
    line(xperso-7, yperso, xperso-7,698);
    if (xperso+5 > xZombie && xperso-5 < xZombie && yperso < yZombie)
    {
      vieZombie = vieZombie - 1; 
    }
    }
     personnageMoveLeft_bas.resize(79,101);
      image(personnageMoveLeft_bas, xPerso-40,yPerso-50);
    }
    
    if (keyCode == RIGHT) 
    {
      haut=false;
      bas=false ; 
      gauche=false;
      droite=false; 
      
    if (xPerso > 15 && xPerso< 469 && yPerso > 115 && yPerso<600 )
    {
    strokeWeight (5);
    stroke(237,7,7);
    line(xperso, yperso+7, 469,yperso+7);
    strokeWeight (2);
    stroke(242,186,186);
    line(xperso, yperso+7, 469,yperso+7);
    if (xperso < xZombie && yperso+5 > yZombie && yperso-5 < yZombie && xZombie<469  )
    {
      vieZombie = vieZombie - 1; 
    }
    }
    else {
    strokeWeight (5);
    stroke(237,7,7);
    line(xperso, yperso+7, 1300,yperso+7);
    strokeWeight (2);
    stroke(242,186,186);
    line(xperso, yperso+7, 1300,yperso+7);
    if (xperso < xZombie && yperso+5 > yZombie && yperso-5 < yZombie  )
    {
      vieZombie = vieZombie - 1; 
    }
    }
            personnageMoveLeft_droite.resize(101,79);
      image(personnageMoveLeft_droite, xPerso-50,yPerso-40);
    }
    
    
    
    
    if (keyCode == LEFT) 
    {
          haut=false;
      bas=false ; 
      gauche=false;
      droite=false; 
    if (xPerso > 15 && xPerso< 469 && yPerso > 115 && yPerso<600 )
    {
    strokeWeight (5);
    stroke(237,7,7);
    line(xperso, yperso-7, 15,yperso-7);
    strokeWeight (2);
    stroke(242,186,186);
    line(xperso, yperso-7, 15,yperso-7);
    if (xperso > xZombie && yperso+5 > yZombie && yperso-5 < yZombie && xZombie>15)
    {
      vieZombie = vieZombie - 1; 
    }
    }
     else if (xPerso> 469 && yPerso > 115 && yPerso<600 )
    {
    strokeWeight (5);
    stroke(237,7,7);
    line(xperso, yperso-7, 469,yperso-7);
    strokeWeight (2);
    stroke(242,186,186);
    line(xperso, yperso-7, 469,yperso-7);
    if (xperso+5 > xZombie && xperso-5 < xZombie && yperso > yZombie && xZombie > 469)
    {
      vieZombie = vieZombie - 1; 
    }
    }
    else {
    strokeWeight (5);
    stroke(237,7,7);
    line(xperso, yperso-7, 0,yperso-7);
    strokeWeight (2);
    stroke(242,186,186);
    line(xperso, yperso-7, 0,yperso-7);
    if (xperso > xZombie && yperso+5 > yZombie && yperso-5 < yZombie)
    {
      vieZombie = vieZombie - 1; 
    }
    }
      image(personnageMoveLeft_gauche, xPerso-50,yPerso-40);
    }
}

}
}
}
  public void settings() {  size(1300,698); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Project_1" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
