
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
  
  PVector xy = new PVector(0, 0);
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
    this.size = proportion * 0.005;
    println(scale);
    this.c = color(255,100,50);
    //pos = new PVector(-width*0.5, 0);
    //pos = new PVector(-width*0.5, 200);
    pos = new PVector(-width*0.5,random(-350,0));
    //pos = new PVector(-width*0.5,-200);
    //velocity = new PVector(0,0);
    velocity = new PVector(80,0);
    force = new PVector(0, 0);
    accel = new PVector(0, 0);
    mass = 1;
    //mass = 500000;
    
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
    calcForce(planets[0]);
    
    
    accel = PVector.div(force, mass);
    velocity.add(PVector.mult(accel, timeDelta));
    pos.add(PVector.mult(velocity, timeDelta));
    force.x = force.y = 0;
    //velocity.mult(0.99f);
    wrap();

    
  }//end update
  
  void wrap()
  {
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
  }//end wrap
  
  void calcForce(Planet p)
  {
    float theta = atan2(pos.y - p.locate.y, pos.x - p.locate.x)-PI/2;
    float dist = pos.dist(p.locate);
    
    //float scalarForce = (  (6.674 * pow(10,-11) )*(asteroid.mass)*(p.mass))  /sq( dist );
    if(dist > p.size)
    {
      float scalarForce = (  (6.674 * pow(10,-3) )*(asteroid.mass)*(p.mass))  /sq( dist );
      
      //float scalarForce = 50;
      
      PVector direction = new PVector(sin(theta), -cos(theta));
      /*
      forward.x = sin(theta);
      forward.y  = -cos(theta);
  */
  
      force.add(PVector.mult(direction, scalarForce));
    }//end if
    //float angle = PVector.angleBetween(pos, xy);
    //PVector temp = new PVector(0, 0);
    
    //temp.x = p.locate.x - pos.x;
    //temp.x = p.locate.x - pos.x;
    
    
    
    //float scalarForce = (  (6.674 * pow(10,-11) )*(asteroid.mass)*(p.mass))  /sq( dist );
    
    //float scalarForce = (  (6.674  )*(asteroid.mass)*(p.mass))  /sq( dist*2000 );

    
    //println(scalarForce);
    //println(degrees(angle));
    //force.x = sin(angle)*scalarForce;
    //force.y = -cos(angle)*scalarForce;
    
    

    //velocity.add(PVector.mult(accel, timeDelta));
    /*
    tan(angle) = o/a;
    sin(angle) = o/h;
    cos(angle) = a/h;
    */

  }//end calcForce
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
        //rotate(theta);    
        shape(shape, 0, 0);
    popMatrix();
    /*
    pushMatrix();
      translate(X, Y);
      pushMatrix();
        translate(pos.x, pos.y);
        //rotate(theta);    
        shape(shape, 0, 0);
      popMatrix();
    popMatrix();
    */
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