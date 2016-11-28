class Button
{
  PVector pos;
  PVector area;
  color c;
  void hover()
  {
    if(mouseX > pos.x && mouseX < pos.x+area.x && mouseY > pos.y && mouseY < pos.y+area.y)
    {
      fill(c);
      stroke(200,200,50);
    }
    else
    {
      //noFill();
      stroke(c);
    }//end else
  }//end hover
  /*
  void ifClicked()
  {
    if(mouseX > pos.x && mouseX < pos.x+area.x && mouseY > pos.y && mouseY < pos.y+area.y)
    {
      fill(c);
      stroke(200,200,50);
    }
  }//end ifClicked
  */
  void render()
  {
    hover();
    rect(pos.x,pos.y,  area.x,area.y);
  }//end render
}//end class Button

class FreeModeButton extends Button 
{
  
}

class InfoButton extends Button 
{
  
}

class BackButton extends Button 
{
  
}

class EasterButton extends Button 
{
  //ellipseMode(CORNER);
}