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

void startRotate(char dir)
{
  ready = false;
  travel = 80;
  if(dir == 'l')
  {
    transition = gap / travel;
  }//end if
  else
  {
    transition = -gap / travel;
  }//end else
}//end startRotate

void rotation()
{
  switch(motion)
  {
    case 0:
    {
      if(travel == 0)
      {
        ready = true;
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
      ///////////////////////////////////////////////////////////////
      /*
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
      
      */
      //////////////////////////////////////////////
    }//end case 0
    
    case 1:
    {
      theta += radians(spin);
      if(theta > TWO_PI)
      {
        theta = theta % TWO_PI;
      }//end if
      rotate(radians(spin));
    }//end case 0
  
  }//end switch
}//end rotation