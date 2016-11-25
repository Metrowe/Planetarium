class Planet
{
  String name;
  float size;
  color c;
  PVector locate;
  PShape shape, base;

  Planet()
  {
    name = "Add name";
    size = random(0.1,0.5);  c = color(random(255),random(255),random(255));
  }//end Planet
  
  Planet( String name,float size,color c  )
  {
    this.name = name;
    this.size = size * scale;
    this.c = c;
    locate = new PVector(0, 0);
  }//end Planet
  
  void create(float ang)
  {
    shape = createShape(GROUP);
    ellipseMode(RADIUS);
    base = createShape(ELLIPSE,  sin(ang) * rad,cos(ang) * rad,  size,size);
    base.setStrokeWeight(0);
    base.setFill(c);
    shape.addChild(base);
  }//end create
 
  void render()
  {
    shape(shape);
  }//end render
  
  void update()
  {
    locate.x = sin(theta) * rad;
    locate.y = cos(theta) * rad;
  }//end render
}//end class Planet