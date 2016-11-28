class Button
{
  PVector pos;
  PVector area;
  
  void hover()
  {
    if(mouseX > pos.x && mouseX < pos.x+area.x && mouseY > pos.y && mouseY < pos.y+area.y)
    {
      
    }
  }
}//end class Button

class SpinSpots extends Button 
{
  
}