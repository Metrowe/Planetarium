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
  String label;
  
  FreeModeButton()
  {
    label = "Free Mode";
    pos = new PVector(width*0.5,height*0.5);
    area = new PVector(width*0.1,height*0.1);
    c = color(0,255,0);
  }//end FreeModeButton
  
  void ifClicked()
  {
    if(mouseX > pos.x && mouseX < pos.x+area.x && mouseY > pos.y && mouseY < pos.y+area.y)
    {
      menuSelect = 2;
    }
  }//end ifClicked
}//end class FreeModeButton

class InfoButton extends Button 
{
  
}

class BackButton extends Button 
{
  
}

class EasterButton extends Button 
{
  void render()
  {
    ellipseMode(CORNER);
    hover();
    ellipse(pos.x,pos.y,  area.x,area.y);
  }//end render
  
  
}