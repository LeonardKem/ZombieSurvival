void messages()
{
  textSize(32);
  textAlign(LEFT);
  text("life:",20,100);
  text(time,20,300);
  text(tic,20,500);
  text(viePerso ,100,100);
  text("score : ", width/2-60,80);
  text(counter, width/2+60,80);
 if (viePerso == 0)
 {
  textSize(100);
  textAlign(CENTER);
  fill(250,0,0);
  text("Game Over",width/2,height/2);
  noLoop();
 }
}