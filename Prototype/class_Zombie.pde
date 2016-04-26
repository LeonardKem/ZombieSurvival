class Zombie { 
  color c;
  int xZombie;
  int yZombie;
  int xspeed;
  int yspeed;
  int xperso;
  int yperso;
  int zonex;
  int zoney;
  int vieZombie;
  boolean counterOn;


  // The Constructor is defined with arguments.
  Zombie(color tempC, int tempxZombie, int tempyZombie, int tempXspeed, int tempYspeed, int xPerso, int yPerso) { 
    c = tempC;
    xZombie = tempxZombie;
    yZombie = tempyZombie;
    xspeed = tempXspeed;
    yspeed= tempYspeed;
    xperso=xPerso;
    yperso=yPerso;
    vieZombie=50;
    counterOn=true;
 
  }

  void display() 
  {
    if (vieZombie > 0 ) 
    {
    fill(c);
    ellipse(xZombie,yZombie,20,20);
    }
  }

  void  move(int xperso, int yperso) {
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
     xZombie=1300;
     yZombie=0;
     
   }

}



void collision()
{
  if (vieZombie > 0 ) 
    {
  zonex=0;
  zoney=0;
  fill(0);

  if (
  xZombie > 550-20 && 
  xZombie< 550+200+20 && 
  yZombie > 249-20 && 
  yZombie < 249 ) //barre supérieure
  {
   zoney=1;
  }
  if (
  xZombie > 550-20 && 
  xZombie< 550-20+200+40 && 
  yZombie  > 249+200 && 
  yZombie < 249+200+20 ) // barre bas
  {
  zoney=1; 
  }
  if (xZombie > 550-20 && 
  xZombie< 550 && 
  yZombie > 249 && 
  yZombie < 249+200 ) //carré gauche
  {
  zonex=1;
  }
  if (xZombie > 550+200 && 
  xZombie< 550+200+20 && 
  yZombie > 249 && 
  yZombie < 249+200 ) //carré droite
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
    yspeed=1;
  }
   if (zonex==0)
  {
    xspeed=1;
  }
    if ( 
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


void fire(int xPerso,int yPerso) 
{
  if (vieZombie > 0 ) 
    {
  xperso=xPerso;
  yperso=yPerso;
  
  
  if (key == CODED) {
    if (keyCode == UP) 
    {
    if (xPerso > 550 && xPerso< 550+200 && yPerso > 449)
    {
    strokeWeight (5);
    stroke(237,7,7);
    line(xperso, yperso, xperso,449);
    strokeWeight (2);
    stroke(242,186,186);
    line(xperso, yperso, xperso,449);
    if (xperso+5 > xZombie && xperso-5 < xZombie && yperso > yZombie && yZombie > 449)
    {
      vieZombie = vieZombie - 1; 
    }
    }
    else {
    strokeWeight (5);
    stroke(237,7,7);
    line(xperso, yperso, xperso,0);
    strokeWeight (2);
    stroke(242,186,186);
    line(xperso, yperso, xperso,0);
    
    if (xperso+5 > xZombie && xperso-5 < xZombie && yperso > yZombie)
    {
      vieZombie = vieZombie - 1; 
    }
    }
    }
    
    
    if (keyCode == DOWN) 
    {
    if(xPerso > 550 && xPerso< 550+200 && yPerso < 249)
    {
    strokeWeight (5);
    stroke(237,7,7);
    line(xperso, yperso, xperso,249);
    strokeWeight (2);
    stroke(242,186,186);
    line(xperso, yperso, xperso,249);
    if (xperso+5 > xZombie && xperso-5 < xZombie && yperso < yZombie && yZombie <249)
    {
      vieZombie = vieZombie - 1; 
    }
    }
    else {
    strokeWeight (5);
    stroke(237,7,7);
    line(xperso, yperso, xperso,698);
    strokeWeight (2);
    stroke(242,186,186);
    line(xperso, yperso, xperso,900);
    if (xperso+5 > xZombie && xperso-5 < xZombie && yperso < yZombie)
    {
      vieZombie = vieZombie - 1; 
    }
    }
    }
    
    if (keyCode == RIGHT) 
    {
    if (yPerso>249 && yPerso<449 && xPerso<550 )
    {
    strokeWeight (5);
    stroke(237,7,7);
    line(xperso, yperso, 550,yperso);
    strokeWeight (2);
    stroke(242,186,186);
    line(xperso, yperso, 550,yperso);
    if (xperso < xZombie && yperso+5 > yZombie && yperso-5 < yZombie && xZombie<550  )
    {
      vieZombie = vieZombie - 1; 
    }
    }
    else {
    strokeWeight (5);
    stroke(237,7,7);
    line(xperso, yperso, 1300,yperso);
    strokeWeight (2);
    stroke(242,186,186);
    line(xperso, yperso, 1300,yperso);
    if (xperso < xZombie && yperso+5 > yZombie && yperso-5 < yZombie  )
    {
      vieZombie = vieZombie - 1; 
    }
    }
    }
    if (keyCode == LEFT) 
    {
    if (yPerso>249 && yPerso<449 && xPerso>750)
    {
    strokeWeight (5);
    stroke(237,7,7);
    line(xperso, yperso, 750,yperso);
    strokeWeight (2);
    stroke(242,186,186);
    line(xperso, yperso, 750,yperso);
    if (xperso > xZombie && yperso+5 > yZombie && yperso-5 < yZombie && xZombie>750)
    {
      vieZombie = vieZombie - 1; 
    }
    }
    else {
    strokeWeight (5);
    stroke(237,7,7);
    line(xperso, yperso, 0,yperso);
    strokeWeight (2);
    stroke(242,186,186);
    line(xperso, yperso, 0,yperso);
    if (xperso > xZombie && yperso+5 > yZombie && yperso-5 < yZombie)
    {
      vieZombie = vieZombie - 1; 
    }
    }
    }
}

}
}
}