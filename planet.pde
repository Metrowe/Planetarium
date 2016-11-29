class Planet
{
  String name;
  String description1;
  String description2;
  String description3;
  String description4;
  String description5;
  float size;
  float mass;
  float space;
  color c;
  PVector locate;
  PShape shape;
  
  Planet(TableRow row)
  {
    name = row.getString(0);
    size = row.getFloat(1) * proportion;
    mass = row.getFloat(2);
    c = color(row.getFloat(3),row.getFloat(4),row.getFloat(5));
    description1 = row.getString(6);
    description2 = row.getString(7);
    description3 = row.getString(8);
    description4 = row.getString(9);
    description5 = row.getString(10);
    locate = new PVector(0, 0);
  }//end Planet
  
  void create(float ang)
  {
    shape = createShape(GROUP);
    ellipseMode(RADIUS);
    shape = createShape(ELLIPSE,  sin(ang) * rad,cos(ang) * rad,  size,size);
    shape.setStrokeWeight(0);
    shape.setFill(c);
  }//end create
 
  void render()
  {
    //ellipseMode(RADIUS);
    shape(shape);
  }//end render
  
  void displayInfo()
  {
    textAlign(CENTER,TOP);
    textSize(proportion * 0.1);
    fill(c);
    text(name,width*0.5,height*0.3);
    
    textAlign(LEFT,TOP);
    textSize(proportion * 0.03);
    fill(255);
    text(description1+"\n"
    +description2+"\n"
    +description3+"\n"
    +description4+"\n"
    +description5+"\n"
    ,width*0.05,height*0.45);
  }//end displayInfo
  
  void update()
  {
    float ang;
    if(motion == 0)
    {
      ang = thetaS;
    }//end if
    else
    {
      ang = theta;
    }//end else
    
    locate.x = sin(ang+space) * rad;
    locate.y = -cos(ang+space) * rad;
  }//end update
}//end class Planet