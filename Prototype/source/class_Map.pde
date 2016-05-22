class Map
{
  
 public  void time()// a stop watch
{
  
  if (game == true)
  {
  time = interval+int(millis()/50);// the stop watch
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