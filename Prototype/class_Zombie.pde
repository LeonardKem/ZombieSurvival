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


  // The Constructor is defined with arguments.
  Zombie(color tempC, int tempxZombie, int tempyZombie, int tempXspeed, int tempYspeed, int xPerso, int yPerso) { 
    c = tempC;
    xZombie = tempxZombie;
    yZombie = tempyZombie;
    xspeed = tempXspeed;
    yspeed= tempYspeed;
    xperso=xPerso;
    yperso=yPerso;
    vieZombie=10;
 
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
 void collision ()
{
  zonex=0;
  zoney=0;
  fill(0);
   if (
  xZombie > 330-20 && 
  xZombie< 330+50+20 && 
  yZombie > 190-20 && 
  yZombie < 190 ) //barre supérieure
  {
   zoney=1;
  }
  if (
  xZombie > 330-20 && 
  xZombie< 330-20+50+40 && 
  yZombie > 190+30 && 
  yZombie < 190+30+20 ) // barre bas
  {
  zoney=1; 
  }
  if (xZombie > 330-20 && 
  xZombie< 330 && 
  yZombie > 190 && 
  yZombie < 190+30 ) //carré gauche
  {
  zonex=1;
  }
  if (xZombie > 330+50 && 
  xZombie< 330+50+20 && 
  yZombie > 190 && 
  yZombie < 190+30 ) //carré droite
  {
  zonex=1;
  }
  
 
 //batiment 2
  if (
  xZombie > 460-20 && 
  xZombie< 460+60+20 && 
  yZombie > 120-20 && 
  yZombie < 120 ) //barre supérieure
  {
   zoney=1;
  }
  if (
  xZombie > 460-20 && 
  xZombie< 460-20+60+40 && 
  yZombie > 120+150 && 
  yZombie < 120+150+20 ) // barre bas
  {
  zoney=1; 
  }
  if (xZombie > 460-20 && 
  xZombie< 460 && 
  yZombie > 120 && 
  yZombie < 120+150 ) //carré gauche
  {
  zonex=1;
  }
  if (xZombie > 460+60 && 
  xZombie< 460+60+20 && 
  yZombie > 120 && 
  yZombie < 120+150 ) //carré droite
  {
  zonex=1;
  }
 
 
 
 //batiment 3
 

  if (
  xZombie > 130-20 && 
  xZombie< 130+200+20 && 
  yZombie > 120-20 && 
  yZombie < 120 ) //barre supérieure
  {
   zoney=1;
  }
  if (
  xZombie > 130-20 && 
  xZombie< 130-20+200+40 && 
  yZombie > 120+100 && 
  yZombie < 120+100+20 ) // barre bas
  {
  zoney=1; 
  }
  if (xZombie > 130-20 && 
  xZombie< 130 && 
  yZombie > 120 && 
  yZombie < 120+100 ) //carré gauche
  {
  zonex=1;
  }
  if (xZombie > 130+200 && 
  xZombie< 130+200+20 && 
  yZombie > 120 && 
  yZombie < 120+100 ) //carré droite
  {
  zonex=1;
  }
 
  if (zonex > 0)
  {
    xspeed=0;
  }
   if (zoney > 0)
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
  
  
}


void fire(int xPerso,int yPerso) 
{
  xperso=xPerso;
  yperso=yPerso;
  
  
  if (key == CODED) {
    if (keyCode == UP) 
    {
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
    if (keyCode == DOWN) 
    {
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
    if (keyCode == RIGHT) 
    {
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
    if (keyCode == LEFT) 
    {
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