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
  }


  void  move() {
 if (keyPressed == true)
  {
    if (key == 'z' && yPerso>0) {
            if (
            xPerso > 550-20 && 
            xPerso< 550+200+20 && 
            yPerso > 249-20 && 
            yPerso < 249 )
            {
               yspeed=1;
            }
            yPerso = yPerso-yspeed ; 
            if (right==true)
            {
              personnageMoveLeft_haut.resize(79,101);
      image(personnageMoveLeft_haut, xPerso-40,yPerso-50);
            }
      if (left == true)
      {
      personnageMoveRight_haut.resize(79,101);
      image(personnageMoveRight_haut, xPerso-40,yPerso-50);
      haut=true;
      bas=false ; 
      gauche=false;
      droite=false;
      }
    
  }
    
    
    
    if (key == 's'&& yPerso<698) {
       if (
          xPerso > 550-20 && 
          xPerso< 550-20+200+40 && 
          yPerso  > 249+200 && 
          yPerso < 249+200+20 )
          {
          yspeed=1; 
          }
           if (right==true)
            {
              personnageMoveLeft_bas.resize(79,101);
      image(personnageMoveLeft_bas, xPerso-40,yPerso-50);
            }
      if (left == true)
      {
      personnageMoveRight_bas.resize(79,101);
      image(personnageMoveRight_bas, xPerso-40,yPerso-50);
      }
      yPerso = yPerso+yspeed ;
      haut=false;
      bas=true ; 
      gauche=false;
      droite=false;  
  }
    
    
    
    if (key == 'q' && xPerso>0) {
         if (
           xPerso > 550-20 && 
           xPerso< 550 && 
           yPerso > 249 && 
           yPerso < 249+200 ) 
           {
              xspeed=1;
           }
            if (right==true)
            {
              personnageMoveLeft_gauche.resize(101,79);
      image(personnageMoveLeft_gauche, xPerso-50,yPerso-40);
            }
      if (left == true)
      {
      personnageMoveRight_gauche.resize(101,79);
      image(personnageMoveRight_gauche, xPerso-50,yPerso-40);
      }
      xPerso = xPerso-xspeed ;
      haut=false;
      bas=false ; 
      gauche=true;
      droite=false;
    }
    
    
    if (key == 'd' && xPerso<1300) {
      if (
          xPerso > 550+200 && 
          xPerso< 550+200+20 && 
          yPerso > 249 && 
          yPerso < 249+200 )
          {
            xspeed=1;
          }
           if (right==true)
            {
              personnageMoveLeft_droite.resize(101,79);
      image(personnageMoveLeft_droite, xPerso-50,yPerso-40);
            }
      if (left == true)
      {
      personnageMoveRight_droite.resize(101,79);
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
      personnageMoveRight_haut.resize(79,101);
      image(personnageMoveRight_haut, xPerso-40,yPerso-50);
      }
      
      if (bas==true)
      {
        personnageMoveRight_bas.resize(79,101);
      image(personnageMoveRight_bas, xPerso-40,yPerso-50);
      }
      if (droite==true)
      {
      personnageMoveRight_droite.resize(101,79);
      image(personnageMoveRight_droite, xPerso-50,yPerso-40);
      }
       if (gauche==true)
      {
      personnageMoveRight_gauche.resize(101,79);
      image(personnageMoveRight_gauche, xPerso-50,yPerso-40);
      }
  }
}

void collision()
{
  zonex=0;
  zoney=0;
  fill(0);

  if (
  xPerso > 550-20 && 
  xPerso< 550+200+20 && 
  yPerso > 249-20 && 
  yPerso < 249 ) //barre supérieure
  {
   zoney=1;
  }
  if (
  xPerso > 550-20 && 
  xPerso< 550-20+200+40 && 
  yPerso  > 249+200 && 
  yPerso < 249+200+20 ) // barre bas
  {
  zoney=1; 
  }
  if (xPerso > 550-20 && 
  xPerso< 550 && 
  yPerso > 249 && 
  yPerso < 249+200 ) //carré gauche
  {
  zonex=1;
  }
  if (xPerso > 550+200 && 
  xPerso< 550+200+20 && 
  yPerso > 249 && 
  yPerso < 249+200 ) //carré droite
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

void earnLife(int xPerso,int yPerso)
{
    if (time%1000==0)
    {
    fill(250,0,0);
    rect(550,249,200,200);
    if(xPerso >520 && xPerso <770 && yPerso >219 && yPerso < 469 )
    {
      viePerso= viePerso+1; 
    }
  }



}
}