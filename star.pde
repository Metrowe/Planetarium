class Star
{
  float x,y;
  color c;

  Star()
  {
    //x = random(0, width);
    //y = random(0,height);
    x = random(-width*0.6, width*0.6);
    y = random(-height*0.6,height*0.6);
    c = color(random(20,255),random(20,255),random(20,255));
  }//end Star
}//end class Star