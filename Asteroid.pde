
class Asteroid
{
  float size;
  color c;
  float mass;
  PShape shape, base;
  PVector pos;
  PVector velocity;
  PVector force;
  PVector accel;
  /*
  Asteroid( String name,float size,color c  )
  {
    this.name = name;
    this.size = size;
    this.c = c;
  }//end Planet
  */
  
  Asteroid()
  {
    this.size = proportion * 0.02;
    //this.size = proportion * 2;
    println(scale);
    this.c = color(255,100,50);
    pos = new PVector(0, 0);
    //velocity = new PVector(0,0);
    velocity = new PVector(1,1);
    force = new PVector(0, 0);
    accel = new PVector(0, 0);
    
    create();
  }//end Planet
  
  void create()
  {
    ellipseMode(RADIUS);
    shape = createShape(ELLIPSE,  0,0,  size,size);
    shape.setStrokeWeight(0);
    shape.setFill(c);
  }//end create
 
  void render()
  {
    pushMatrix(); // Stores the current transform
    translate(pos.x, pos.y);
    //translate(0, 0);
    //rotate(theta); 
    //shape(shape,pos.x,pos.y);
    shape(shape);
    popMatrix();
  }//end render
  
  void update()
  {
    //accel = PVector.div(force, mass);
    //velocity.add(PVector.mult(accel, timeDelta));
    pos.add(PVector.mult(velocity, timeDelta));
    if( pos.x < -(width*0.5) )
    {
      pos.x = width*0.5;
    }//end if
    else if( pos.x > width*0.5 )
    {
      pos.x = -(width*0.5);
    }//end if
    
    if( pos.y < -(height*0.5) )
    {
      pos.y = height*0.5;
    }//end if
    else if( pos.y > height*0.5 )
    {
      pos.y = -(height*0.5);
    }//end if
  }//end update
}//end class Planet
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*
F = GMm/R2
force = (6.674*10−11)(asteroid.mass)(planets[i].mass)/sq(dist(asteroid.pos,planets[i].locate));
*/
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class Player
{
  PVector pos;
  PVector forward;
  PVector velocity;
  PVector accel;
  float theta;
  float size;
  float radius;
  float mass = 1;
  PShape shape;
  
  Player(float x, float y, float theta, float size)
  {
    pos = new PVector(x, y);
    forward = new PVector(0, -1);
    accel = new PVector(0,0);
    velocity = new PVector(0,0);
    force = new PVector(0, 0);
    this.theta = theta;
    this.size = size;
    radius = size / 2;
    
    create();
    
  }
  
  void create()
  {
    shape = createShape();
    shape.beginShape();
    shape.stroke(255);
    shape.noFill();
    shape.strokeWeight(2);
    shape.vertex(-radius, radius);
    shape.vertex(0, - radius);
    shape.vertex(radius, radius);
    shape.vertex(0, 0);
    shape.endShape(CLOSE);
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);    
    shape(shape, 0, 0);
    popMatrix();
  }
  
  PVector force;
  float power = 100;
  
  
  void update()
  {
      
    forward.x = sin(theta);
    forward.y  = -cos(theta);
    if (keyCode == 'w')
    {
      force.add(PVector.mult(forward, power));      
    }
    if (keyCode == 's')
    {
      force.add(PVector.mult(forward, -power));      
    }
    if (keyCode == 'a')
    {
      theta -= 0.1f;
    }
    if (keyCode == 'd')
    {
      theta += 0.1f;
    }
    
    accel = PVector.div(force, mass);
    velocity.add(PVector.mult(accel, timeDelta));
    pos.add(PVector.mult(velocity, timeDelta));
    force.x = force.y = 0;
    velocity.mult(0.99f);
  }
  
}