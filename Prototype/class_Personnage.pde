class Personnage 
{ 

  int xspeed;
  int yspeed;
  int xperso;
  int yperso;
  int zonex;// this attribute set your speed at 0 if you are going to near to a wall 
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

public  void display() { // allows to display the player before anything happens (a move or fire)
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
  yPerso < 115 ) //barre supérieure
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
  yPerso < 115+11 ) //carré gauche
  {
  zonex=1;
  }
   if (xPerso > 120+350 && 
  xPerso< 120+350+50 && 
  yPerso > 115 && 
  yPerso < 115+11 ) //carré droite
  {
  zonex=1;
  }
 
  
  
  
  //rect(473,115,11,94); coordinate to the second wall
    if (
  xPerso > 473-50 && 
  xPerso< 473+11+50 && 
  yPerso > 115-50 && 
  yPerso < 115 ) //barre supérieure
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
  yPerso < 115+94 ) //carré gauche
  {
  zonex=1;
  }
   if (xPerso > 473+11 && 
  xPerso< 473+11+50 && 
  yPerso > 115 && 
  yPerso < 115+94 ) //carré droite
  {
  zonex=1;
  }
  
  
  
  // rect(473,277,11,120); 
  if (
  xPerso > 473-50 && 
  xPerso< 473+11+50 && 
  yPerso > 277-50 && 
  yPerso < 277 ) //barre supérieure
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
  yPerso < 277+120 ) //carré gauche
  {
  zonex=1;
  }
  if (xPerso > 473+11 && 
  xPerso< 473+11+50 && 
  yPerso > 277 && 
  yPerso < 277+120 ) //carré droite
  {
  zonex=1;
  }
  
  
  // rect(473,500,11,110);
  if (
  xPerso > 473-50 && 
  xPerso< 473+11+50 && 
  yPerso > 500-50 && 
  yPerso < 500 ) //barre supérieure
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
  yPerso < 500+110 ) //carré gauche
  {
  zonex=1;
  }
  if (xPerso > 473+11 && 
  xPerso< 473+11+50 && 
  yPerso > 500 && 
  yPerso < 500+110 ) //carré droite
  {
  zonex=1;
  }
 
  
    //rect(15,590,130,11);
  if (
  xPerso > 15-50 && 
  xPerso< 15+130+50 && 
  yPerso > 590-50 && 
  yPerso < 590 ) //barre supérieure
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
  yPerso < 590+11 ) //carré gauche
  {
  zonex=1;
  }
  if (xPerso > 15+130 && 
  xPerso< 15+130+50 && 
  yPerso > 590 && 
  yPerso < 590+11 ) //carré droite
  {
  zonex=1;
  }
 
  //rect(290,590,210,11);
  if (
  xPerso > 290-50 && 
  xPerso< 290+210+50 && 
  yPerso > 590-50 && 
  yPerso < 590 ) //barre supérieure
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
  yPerso < 590+11 ) //carré gauche
  {
  zonex=1;
  }
  if (xPerso > 290+210 && 
  xPerso< 290+210+50 && 
  yPerso > 590 && 
  yPerso < 590+11 ) //carré droite
  {
  zonex=1;
  }
 
  
  //rect(15,115,11,480);
  if (
  xPerso > 15-50 && 
  xPerso< 15+11+50 && 
  yPerso > 115-50 && 
  yPerso < 115 ) //barre supérieure
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
  yPerso < 115+480 ) //carré gauche
  {
  zonex=1;
  }
  if (xPerso > 15+11 && 
  xPerso< 15+11+50 && 
  yPerso > 115 && 
  yPerso < 115+480 ) //carré droite
  {
  zonex=1;
  }
 
 
  if (zonex > 0) //  if you are going to near to a wall set your speed at 0
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
        if (keyPressed == true) // if you are stuck on a wall, it's allowing you to move
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