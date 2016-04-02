void time()
{
  fill(250,250,250); 
  time = interval+int(millis()/1000);
   text(time, width/2, height/2);
   text(y, width/2, height/2+20);
   text(timeExpected, width/2, height/2+40);
     if(time >timeExpected)
  {
   timeExpected= timeExpected+10;
   y=y+1;
  }
}