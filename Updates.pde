void switchView()
{
  switch(view)
  {
    case 0:
    {
      X = width/2;
      Y = -(height/2);
      scale = height*2;
      break;
    }//end case 0
    case 1:
    {
      X = width/2;
      Y = height/2;
      scale = height*0.8;
      break;
    }//end case 1
  }//end switch
  
}//switchView

void scaleChange()
{
  for(int i = 0;i < planets.length;i++)
  {
    planets[i].create(X, Y, theta+(gap*i),scale);
  }//end for
}//end scaleChange

void rotation()
{
    if(toggle)
    {
      theta += radians(3);
      if(theta > TWO_PI)
      {
        theta = theta % TWO_PI;
      }//end if
    }//end if
    else
    {
      if(planets[desired].locate != theta)
      {
        if(travel == 0)
        {
          travel = 80;
          transition = -(diff(theta,planets[desired].locate) / travel);
        }//end if
        else if(travel == 1)
        {
          theta = planets[desired].locate;
          travel = 0;
        }//end else if
        else
        {
          theta -= transition;
          travel--;
        }//end else
      }//end if
      else
      {
        //control = true;
      }//end else
    }//end else
}//end