class Asteroid
{
  float size;
  color c;
  float mass;
  boolean done;
  PShape shape;
  PVector pos;
  PVector velocity;
  PVector force;
  PVector accel;
  int current;

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
      }//end default
    }//end switch
    
    force = new PVector(0, 0);
    accel = new PVector(0, 0);
    mass = 1;
    done = false;

    create();
  }//end Asteroid
  
  Asteroid(float a, float b)
  {
    int temp = 200;
    this.size = proportion * 0.005;
    this.c = color(0,200,200);
    pos = new PVector(a,b);
    velocity = new PVector(random(-temp,temp),random(-temp,temp));
    force = new PVector(0, 0);
    accel = new PVector(0, 0);
    mass = 1;
    done = false;
    
    create();
  }//end Asteroid
  
  void create()
  {
    ellipseMode(RADIUS);
    shape = createShape(ELLIPSE,  0,0,  size,size);
    shape.setStrokeWeight(0);
    shape.setFill(c);
  }//end create
 
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    shape(shape);
    popMatrix();
    
    fill(0,255,255);
    stroke(0);
  }//end render
  
  void update()
  {
    for(int i = 0;i < planets.size();i++)
    {
      Planet tempPlanet = planets.get(i);
      calcForce(tempPlanet);
    }//end for
    
    accel = PVector.div(force, mass);
    velocity.add(PVector.mult(accel, timeDelta));
    pos.add(PVector.mult(velocity, timeDelta));
    force.x = force.y = 0;
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
    
    if(dist > p.size + size)
    {
      //float scalarForce = (  (6.674 * pow(10,-3) )*(asteroid.mass)*(p.mass))  /sq( dist );     
      float scalarForce = (  ((this.mass)*(p.mass)) * pow(10,12))  /sq( dist * pow(10,4));
      PVector direction = new PVector(sin(theta), -cos(theta));
      force.add(PVector.mult(direction, scalarForce));
    }//end if
    else
    {
      done = true;
    }//end else
  }//end calcForce
}//end class Asteroid