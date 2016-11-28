void displayStart()
{
  
}//end displayStart

class Button
{
  PVector pos;
  PVector area;
  color c;
  color t;
  void hover()
  {
    if(mouseX > pos.x && mouseX < pos.x+area.x && mouseY > pos.y && mouseY < pos.y+area.y)
    {
      fill(c);
      t = color(0);
    }
    else
    {
      noFill();
      t = (c);
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
    stroke(200,200,50);
    hover();
    rect(pos.x,pos.y,  area.x,area.y);
    extra();
  }//end render
  
  void extra()
  {

  }//end extra
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
  
  void extra()
  {
    fill(t);
    textAlign(CENTER,CENTER);
    text(label,pos.x+area.x*0.5,pos.y+area.y*0.5);
  }//end extra
}//end class FreeModeButton

class InfoButton extends Button 
{
  String label;
  InfoButton()
  {
    label = "Info Mode";
    pos = new PVector(width*0.5,height*0.5);
    area = new PVector(width*0.1,height*0.1);
    c = color(0,255,0);
  }//end FreeModeButton
  
  void ifClicked()
  {
    if(mouseX > pos.x && mouseX < pos.x+area.x && mouseY > pos.y && mouseY < pos.y+area.y)
    {
      menuSelect = 1;
    }
  }//end ifClicked
  
  void extra()
  {
    fill(t);
    textAlign(CENTER,CENTER);
    text(label,pos.x+area.x*0.5,pos.y+area.y*0.5);
  }//end extra
}//end class InfoButton

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