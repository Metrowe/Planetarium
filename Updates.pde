void switchView()
{
  switch(view)
  {
    case 0:
    {
      scale = 1;
      X = width/2;
      Y = height/2;
      break;
    }//end case 0
    
    case 1:
    {
      scale = 3;
      X = (width/scale)*0.5;
      Y = -(height*0.3);
      break;
    }//end case 1
  }//end switch
}//switchView

void setGap()
{
  
  for(int i = 0;i < planets.size();i++)
  {
    Planet tempPlanet = planets.get(i);
    tempPlanet.create((gap*i));
    tempPlanet.space = -gap*i + PI;
  }//end for
}//end setGap

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
      thetaS += radians(spin);
      if(thetaS > TWO_PI)
      {
        thetaS = thetaS % TWO_PI;
      }//end if
      rotate(thetaS);
      break;
    }//end case 0
    
    case 1:
    {
      if(travel == 0)
      {
        ready = true;
        rotate(theta);
      }//end if
      else
      {
        rotate(theta);
        theta += transition;
        travel--;
      }//end else
      break;
    }//end case 1
    
    
  }//end switch
}//end rotation