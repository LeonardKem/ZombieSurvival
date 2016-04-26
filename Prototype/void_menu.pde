void menu()
{
  image(menuBackground, 0, 0);
  if (mouseX >175 && mouseX <375  && mouseY> 340 && mouseY < 390)
  {
     fill(255,255,255,40);
    noStroke();
    rect(175,340,200,50);
    rect(175,340,200,50);
  }
   if (mousePressed == true && mouseX >175 && mouseX <375  && mouseY> 340 && mouseY < 390)
  {
    menu = false; 
    game = true;
    rect(175,340,200,50);
  }
}