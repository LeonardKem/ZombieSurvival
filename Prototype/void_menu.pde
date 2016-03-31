void menu()
{
  image(menuBackground, 0, 0);
   if (mousePressed == true && mouseX >175 && mouseX <375  && mouseY> 340 && mouseY < 390)
  {
    menu = false; 
    game = true;
    rect(175,340,200,50);
  }
}