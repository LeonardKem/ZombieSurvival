class Menu
{
  void display () 
  {image(menuBackground, 0, 0); }// display the menu's image 
  
  void Start() // if you click start, the game start 
  {
    if (mouseX >525 && mouseX <725  && mouseY> 490 && mouseY < 540)// if you pass your mouse on start, display a rectangle
  {
     fill(255,255,255,40);
    noStroke();
    rect(525,490,200,50);
  }
   if (mousePressed == true && mouseX >525 && mouseX <725  && mouseY> 490 && mouseY < 540)// if you press your mouse on start, launch the game
  {
    menu = false; 
    game = true;
    rect(175,340,200,50);
  }
  }
public void music()
{
MenuMusic.play();// launch the music
}
}