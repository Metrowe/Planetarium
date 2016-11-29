class Planet
{
  String name;
  String description;
  float size;
  float mass;
  float space;
  color c;
  PVector locate;
  PShape shape;

  Planet()
  {
    name = "Add name";
    size = random(0.1,0.5);  c = color(random(255),random(255),random(255));
  }//end Planet
  
  Planet( String name,float size,color c,float mass,String description  )
  {
    this.name = name;
    this.size = size * proportion;
    this.mass = mass;
    this.c = c;
    this.description = description;
    locate = new PVector(0, 0);
  }//end Planet
  
  Planet(TableRow row)
  {
    name = row.getString(0);
    size = row.getFloat(1) * proportion;
    mass = row.getFloat(2);
    c = color(row.getFloat(3),row.getFloat(4),row.getFloat(5));
    description = row.getString(6);
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
    text(description,width*0.05,height*0.45);
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