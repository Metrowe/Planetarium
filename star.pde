class Star
{
  float x,y;
  color c;

  Star()
  {
    x = random(0, width);
    y = random(0,height);
    c = color(random(20,255),random(20,255),random(20,255));
  }//end Star
}//end class Star