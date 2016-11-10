class Star
{
  float dist;
  float angle;
  color c;
  //Parameterised Constructor
  Star()
  {
    dist = random(0.1,1.2);
    angle = random(0,TWO_PI);
    c = color(random(20,255),random(20,255),random(20,255));
  }//end Star
}//end class Star