void keyPressed()
{
  if(keyCode == UP)
  {
    view = (view + 1) % 2;
    switchView();
  }//end if
  
  if(keyCode == DOWN)
  {
    motion = (motion + 1) % 2;
    switchView();
  }//end if
  
  if(keyCode == LEFT && motion == 0 && ready)
  {
    startRotate('l');
  }//end if
  
  if(keyCode == RIGHT && motion == 0 && ready)
  {
    startRotate('r');
  }//end if
}//end keyPressed

void mousePressed()
{
  asteroid.pos.x = mouseX-width*0.5;
  asteroid.pos.y = mouseY-height*0.5;
}//end mouseclicked