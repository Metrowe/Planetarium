class Planet
{
  String name;
  float size;
  color c;
  float locate;
  PShape shape, base;

  Planet()
  {
    name = "Add name";
    size = random(0.1,0.5);  c = color(random(255),random(255),random(255));
  }//end Planet
  
  Planet( String name,float size,color c  )
  {
    this.name = name;
    this.size = size;
    this.c = c;
  }//end Planet
  
  void create(float ang)
  {
    shape = createShape(GROUP);
    ellipseMode(RADIUS);
    base = createShape(ELLIPSE,  sin(ang) * (width*rad),cos(ang) * (height*rad),  size,size);
    base.setStrokeWeight(0);
    base.setFill(c);
    shape.addChild(base);
  }//end create
 
  void render()
  {
    pushMatrix(); // Stores the current transform
    translate(X, Y);
    rotate(theta);    
    popMatrix();
  }//end render
}//end class Planet