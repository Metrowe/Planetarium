class Planet
{
  String name;
  float size;
  color c;
  float locate;

  Planet()
  {
    name = "Add name";
    size = random(0.1,0.5);  c = color(random(255),random(255),random(255));
    //size = 0.1;  c = color(255,100,0);
  }//end Planet
  
  Planet( String name,float size,color c)
  {
    this.name = name;
    this.size = size;
    this.c = c;
  }//end Planet
}//end class Planet