
class Asteroid
{
  float size;
  color c;
  float mass;
  boolean done;
  PShape shape, base;
  PVector pos;
  PVector velocity;
  PVector force;
  PVector accel;
  int current;
    
  
  PVector[] trailPos = new PVector[10];
  /*
  trailPos[0] = new PVector();
  trailPos[0].x = 7;
  */
  
  
  /*
  PVector[] vectors = new PVector[];

// Create a vector for array position 0
vectors[0] = new PVector();

// Modify the PVector at position 0
vectors[0].x = 9;
vectors[0].y = 8;
vectors[0].z = 7; 
*/
  
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
    this.c = color(0,255,255);
    int side = int(random(1,4));
    int speed = 300;
    
    switch(side)
    {
      case 1:
      {
        pos = new PVector(-width*0.5,random(-height*0.5,height*0.5));
        velocity = new PVector(random(0,speed),0);
        break;
      }//end case 1
      case 2:
      {
        pos = new PVector(random(-width*0.5,width*0.5),-height*0.5);
        velocity = new PVector(0,random(0,speed));
        break;
      }//end case 2
      case 3:
      {
        pos = new PVector(width*0.5,random(-height*0.5,height*0.5));
        velocity = new PVector(random(0,-speed),0);
        break;
      }//end case 3
      case 4:
      {
        pos = new PVector(random(-width*0.5,width*0.5),height*0.5);
        velocity = new PVector(0,random(0,-speed));
        break;
      }//end case 4
      default:
      {
        println("DEFAULT");
      }
    }//end switch
    
    for(int i = 0;i < trailPos.length;i++)
    {
      trailPos[i] = new PVector(pos.x,pos.y);
    }//end for
    
    current = 0;
    force = new PVector(0, 0);
    accel = new PVector(0, 0);
    mass = 1;
    done = false;
    //mass = 500000;
    
    create();
  }//end Planet
  
  Asteroid(float a, float b)
  {
    int temp = 200;
    this.size = proportion * 0.005;
    this.c = color(0,200,200);
    //pos = new PVector(-width*0.5, 0);
    //pos = new PVector(-width*0.5, 200);
    pos = new PVector(a,b);
    //pos = new PVector(-width*0.5,-200);
    //velocity = new PVector(0,0);
    velocity = new PVector(random(-temp,temp),random(-temp,temp));
    force = new PVector(0, 0);
    accel = new PVector(0, 0);
    mass = 1;
    done = false;
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
  
  void trail()
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
    //calcForce(planets[0]);
    for(int i = 0;i < planets.size();i++)
    //for(int i = 0;i < 3;i++)
    {
      Planet tempPlanet = planets.get(i);
      calcForce(tempPlanet);
    }//end for
    
    
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
    if(dist > p.size + size)
    {
      //float scalarForce = (  (6.674 * pow(10,-3) )*(asteroid.mass)*(p.mass))  /sq( dist );
      /*
      float scalarForce = 
      (  (6.674 * pow(10,-11) )*((asteroid.mass)*(p.mass)) * pow(10,18))  
      /sq( dist * pow(10,2) );
      */
      
      float scalarForce = 
      (  ((this.mass)*(p.mass)) * pow(10,12))  
      /sq( dist * pow(10,4));
      
      //float scalarForce = 50;
      //5.972 × 10^24 kg
      //6,371km
      //6.38 × 10^6 m
      PVector direction = new PVector(sin(theta), -cos(theta));
      /*
      forward.x = sin(theta);
      forward.y  = -cos(theta);
  */
  
      force.add(PVector.mult(direction, scalarForce));
    }//end if
    else
    {
      done = true;
    }//end else
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

/*
code for future reference
for (int i = particles.size() - 1; i >= 0; i--) 
{
  Particle part = particles.get(i);
  if (part.finished()) {
    particles.remove(i);
  }
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*
F = GMm/R2
force = (6.674*10−11)(asteroid.mass)(planets[i].mass)/sq(dist(asteroid.pos,planets[i].locate));
*/
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////