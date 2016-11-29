class Fragment
{
  float size;
  float ang;
  float torque;
  float shade;
  PShape shape;
  PVector pos;
  PVector velocity;
  
  Fragment(float a, float b)
  {
    size = proportion * 0.003;
    ang = random(0,TWO_PI);
    torque = random(0,PI/2);
    shade = 255;
    pos = new PVector(a,b);
    velocity = new PVector(random(-50,50),random(-50,50));
    
    create();
  }//end Fragment
 
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(ang); 
    shape(shape);
    popMatrix();
  }//end render
  
  void update()
  {
      pos.add(PVector.mult(velocity, timeDelta));
      ang += torque;
      shape.setFill(color(0,shade,shade));
      shade -= 5;
  }//end update

  void create()
  {
    shape = createShape();
    shape.beginShape();
    shape.noStroke();
    shape.fill(0,shade,shade);
    shape.vertex(-size, size);
    shape.vertex(0, -size);
    shape.vertex(size, size);
    shape.endShape(CLOSE);
  }//end create
}//end class Fragment