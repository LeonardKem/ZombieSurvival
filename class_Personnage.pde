class Personnage 
{ 
  color c;
  int xspeed;
  int yspeed;
  int xperso;
  int yperso;
  int zonex;
  int zoney;

  // The Constructor is defined with arguments.
  Personnage(color tempC, int tempxPerso, int tempyPersonnage, int tempXspeed, int tempYspeed, int xPerso, int yPerso) { 
    c = tempC;
    xperso = tempxPerso;
    yperso = tempyPersonnage; 
    xspeed = tempXspeed;
    yspeed= tempYspeed;
    xperso=xPerso;
    yperso=yPerso;
  }

  void display() {
    stroke(0);
    fill(c);
    ellipse(xPerso,yPerso,20,20);
 
  }


  void  move(int xperso, int yperso) {
 if (keyPressed == true)
  {
    if (key == 'z' && yPerso>0) {
      yPerso = yPerso-yspeed ;
    }
    else if (key == 's'&& yPerso<698) {
      yPerso = yPerso+yspeed ;
    }
    else if (key == 'd' && xPerso<1300) {
      xPerso = xPerso+xspeed ;
    }
    else if (key == 'q' && xPerso>0) {
      xPerso = xPerso-xspeed ;
    }
  }
}
void collision()
{
  zonex=0;
  zoney=0;
  fill(0);
   if (
  xPerso > 330-20 && 
  xPerso< 330+50+20 && 
  yPerso > 190-20 && 
  yPerso < 190 ) //barre supérieure, je vérifie que le personnage est dans une zone
  {
   zoney=1;
   
  }
  if (
  xPerso > 330-20 && 
  xPerso< 330-20+50+40 && 
  yPerso > 190+30 && 
  yPerso < 190+30+20 ) // barre bas
  {
  zoney=1; 
  }
  if (xPerso > 330-20 && 
  xPerso< 330 && 
  yPerso > 190 && 
  yPerso < 190+30 ) //barre gauche
  {
  zonex=1;

  }
  if (xPerso > 330+50 && 
  xPerso< 330+50+20 && 
  yPerso > 190 && 
  yPerso < 190+30 ) //barre droite
  {
  zonex=1;
  }
  
 
 
 
  if (zonex > 0) // si le personnage est dans une zone proche d'un mur, sa vitesse est égale à 0 
  {
    xspeed=0;
  }
   if (zoney >0)
  {
    yspeed=0;
  }
   if (zoney==0)
  {
    yspeed=5;
  }
   if (zonex==0)
  {
    xspeed=5;
  }
  
  
}
}