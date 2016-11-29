void keyPressed()
{
  if(keyCode == LEFT && motion == 1 && ready)
  {
    startRotate('l');
    select++;
    
    if(select == planets.size())
    {
      select = 0;
    }
  }//end if
  
  if(keyCode == RIGHT && motion == 1 && ready)
  {
    startRotate('r');
    select--;
    
    if(select == -1)
    {
      select = planets.size() - 1;
    }
  }//end if
}//end keyPressed

void mousePressed()
{
  held = true;
  
  switch(menuSelect)
  {
    case 0:
    {
      FMB.ifClicked();
      IB.ifClicked();
      break;
    }//end case 0
    case 1:
    {
      BB.ifClicked();
      break;
    }//end case 1
    case 2:
    {
      BB.ifClicked();
      EB.ifClicked();
      break;
    }//end case 2
  }//end switch
}//end mouseclicked

void mouseClicked()
{
  held = false;
}//end mouseclicked

void generate()
{
  if(held)
  {
    userAsteroid(mouseX-width*0.5, mouseY-height*0.5);
  }//end if
}//end 