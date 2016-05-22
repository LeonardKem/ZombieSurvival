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
  && yPerso>yZombie) //barre supérieure
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
  && xPerso>xZombie) //carré gauche
  {
  zonex=1;
  }
  if (xZombie > 120+350 && 
  xZombie< 120+350+50 && 
  yZombie > 115 && 
  yZombie < 115+11 
  && xPerso<xZombie) //carré droite
  {
  zonex=1;
  }
 
  
  
  
  //rect(473,115,11,94);
    if (
  xZombie > 473-50 && 
  xZombie< 473+11+50 && 
  yZombie > 115-50 && 
  yZombie < 115 
  && yPerso>yZombie) //barre supérieure
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
  && xPerso>xZombie) //carré gauche
  {
  zonex=1;
  }
  if (xZombie > 473+11 && 
  xZombie< 473+11+50 && 
  yZombie > 115 && 
  yZombie < 115+94 
  && xPerso<xZombie) //carré droite
  {
  zonex=1;
  }
  
  
  
  // rect(473,277,11,120); 
  if (
  xZombie > 473-50 && 
  xZombie< 473+11+50 && 
  yZombie > 277-50 && 
  yZombie < 277 
  && yPerso>yZombie) //barre supérieure
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
  && xPerso>xZombie) //carré gauche
  {
  zonex=1;
  }
  if (xZombie > 473+11 && 
  xZombie< 473+11+50 && 
  yZombie > 277 && 
  yZombie < 277+120 
  && xPerso<xZombie) //carré droite
  {
  zonex=1;
  }
  
  
  // rect(473,500,11,110);
  if (
  xZombie > 473-50 && 
  xZombie< 473+11+50 && 
  yZombie > 500-50 && 
  yZombie < 500 
  && yPerso>yZombie) //barre supérieure
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
  && xPerso<xZombie) //carré gauche
  {
  zonex=1;
  }
  if (xZombie > 473+11 && 
  xZombie< 473+11+50 && 
  yZombie > 500 && 
  yZombie < 500+110 
  && xPerso<xZombie) //carré droite
  {
  zonex=1;
  }
 
  
    //rect(15,590,130,11);
  if (
  xZombie > 15-50 && 
  xZombie< 15+130+50 && 
  yZombie > 590-50 && 
  yZombie < 590 
  && yPerso<yZombie) //barre supérieure
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
  && xPerso>xZombie) //carré gauche
  {
  zonex=1;
  }
  if (xZombie > 15+130 && 
  xZombie< 15+130+50 && 
  yZombie > 590 && 
  yZombie < 590+11 
  && xPerso<xZombie) //carré droite
  {
  zonex=1;
  }
 
 
 
  //rect(290,590,210,11);
  if (
  xZombie > 290-50 && 
  xZombie< 290+210+50 && 
  yZombie > 590-50 && 
  yZombie < 590 
  && yPerso>yZombie) //barre supérieure
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
  && xPerso>xZombie) //carré gauche
  {
  zonex=1;
  }
  if (xZombie > 290+210 && 
  xZombie< 290+210+50 && 
  yZombie > 590 && 
  yZombie < 590+11 
  && xPerso<xZombie) //carré droite
  {
  zonex=1;
  }
 
  
  //rect(15,115,11,480);
  if (
  xZombie > 15-50 && 
  xZombie< 15+11+50 && 
  yZombie > 115-50 && 
  yZombie < 115 
  && yPerso>yZombie) //barre supérieure
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
  && xPerso>xZombie) //carré gauche
  {
  zonex=1;
  }
  else if (xZombie > 15+11 && 
  xZombie< 15+11+50 && 
  yZombie > 115 && 
  yZombie < 115+480
  && xPerso<xZombie) //carré droite
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








public void fire(int xPerso,int yPerso) // if the flèche and the zombie is in the trajectory of the shot, he loses life 
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