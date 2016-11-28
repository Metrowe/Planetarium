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

  void render()
  {
    stroke(c);
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
      motion = 0;
      view = 0;
      switchView();
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
    pos = new PVector(width*0.35,height*0.5);
    area = new PVector(width*0.1,height*0.1);
    c = color(0,0,255);
  }//end FreeModeButton
  
  void ifClicked()
  {
    if(mouseX > pos.x && mouseX < pos.x+area.x && mouseY > pos.y && mouseY < pos.y+area.y)
    {
      menuSelect = 1;
      motion = 1;
      view = 1;
      switchView();
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
  BackButton()
  {
    pos = new PVector(width*0.05,height*0.05);
    area = new PVector(width*0.05,height*0.05);
    c = color(255,0,0);
  }//end FreeModeButton
  
  void ifClicked()
  {
    if(mouseX > pos.x && mouseX < pos.x+area.x && mouseY > pos.y && mouseY < pos.y+area.y)
    {
      easter = false;
      menuSelect = 0;
      view = 1;
      switchView();
    }
  }//end ifClicked
  
  void extra()
  {
    //fill(t);
    
  }//end extra
}

class EasterButton extends Button 
{
  EasterButton()
  {
    pos = new PVector(width*0.97,height*0.95);
    area = new PVector(width*0.03,height*0.05);
    //c = color(252,142,172);
    c = color(20);
  }//end FreeModeButton
  
  void render()
  {
    ellipseMode(CORNER);
    hover();
    stroke(c);
    ellipse(pos.x,pos.y,  area.x,area.y);
  }//end render
  
  void ifClicked()
  {
    if(mouseX > pos.x && mouseX < pos.x+area.x && mouseY > pos.y && mouseY < pos.y+area.y)
    {
      easter = !easter;
    }
  }//end ifClicked
}