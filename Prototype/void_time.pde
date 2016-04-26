void time()
{
  
  if (game == true)
  {
  fill(250,250,250); 
  time = interval+int(millis()/50);
     if(time >timeExpected)
  {
   timeExpected= timeExpected+100;
   tic=tic+1;
  }
    if(time >timeExpectedForTic)
  {
   timeExpectedForTic= timeExpectedForTic+1;
   tic=tic+1;
  }
  if (tic%5==0)
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