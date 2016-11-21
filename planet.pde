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
  
  void render()
  {
    pushMatrix(); // Stores the current transform
    translate(pos.x, pos.y);
    rotate(theta);    
    void rock(float X,float Y,float scale,float theta,Planet planets)
  {
    fill(planets.c);
    noStroke();
    
    float radius = scale/2;
    float diam = scale * planets.size;
    
    float x = sin(theta) * radius;
    float y = cos(theta) * radius;
    
    //float x = cos(theta) * radius;
    //float y = sin(theta) * radius;
    //float x = cos(theta) * radius;
    //float y = tan(theta) * radius;
   
    ellipse(X+x,Y+y,diam,diam);
}
    
  }//end render
}//end class Planet