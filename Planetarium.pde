/*
This is the real file
*/

void setup()
{
  size(500,500);
  
  p = 0;
  newPlanet("Mars",0.2,color(255,0,0));
  newPlanet("Pluto",0.1,color(0,0,255));
  newPlanet("Venus",0.3,color(200,0,200));
  newPlanet("Neptune",0.15,color(0,255,0));

  
  
  gap = TWO_PI / planets.length;
  theta = 0;
  desired = 0;
  mode = 1;
  toggle = false;
  travel = 0;
  
  for(int i = 0;i < planets.length;i++)
  {
    planets[i].locate = gap*i;
    print("gap * i = ");println(gap*i);
  }//end for
  
  for(int i = 0;i < numstars;i++)
  {
    stars[i] = new Star();
  }//end for
}

int numstars = 600;
int numplanets = 4;
Planet[] planets = new Planet[numplanets];
Star[] stars = new Star[numstars];
int p;
float theta;
float gap;
float X,Y;
int mode;
float scale;
int desired;
boolean toggle;
int travel;
float transition;

void keyPressed()
{
  if(keyCode == UP)
  {
    mode = (mode + 1) % 2;
  }//end if
  
  if(keyCode == DOWN)
  {
    toggle = !toggle;
  }//end if
  
  if(keyCode == LEFT && !toggle)
  {
    desired = (desired-1) % planets.length;
    if(desired < 0) desired += planets.length;
    //desired = (theta-gap)% TWO_PI;
  }//end if
  
  if(keyCode == RIGHT && !toggle)
  {
    desired = (desired+1) % planets.length;
    //desired = (theta+gap)% TWO_PI;
  }//end if
}//end keyPressed

void newPlanet(String name,float size,color c)
{
  planets[p] = new Planet(name,size,c);
  
  p++;
}//end addPlanet


void light()
{
  noFill();
  
  strokeWeight(3);
  
  float x;
  float y;
  
  for(int i = 0;i < numstars;i++)
  {
    stroke(stars[i].c);
    x = sin(stars[i].angle+theta) * stars[i].dist * scale;
    y = cos(stars[i].angle+theta) * stars[i].dist * scale;
    point(x+X,y+Y);
  }//end for
}//end light

void ring(float X,float Y,float scale)
{
  noFill();
  stroke(255);
  strokeWeight(5);
  //strokeWeight(scale/height);
  
  ellipse(X,Y,scale,scale);
}//end scale

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

void rotation()
{
    if(toggle)
    {
      theta += radians(3);
      if(theta > TWO_PI)
      {
        theta = theta % TWO_PI;
      }//end if
    }//end if
    else
    {
      if(planets[desired].locate != theta)
      {
        if(travel == 0)
        {
          travel = 80;
          transition = -(diff(theta,planets[desired].locate) / travel);
        }//end if
        else if(travel == 1)
        {
          theta = planets[desired].locate;
          travel = 0;
        }//end else if
        else
        {
          theta -= transition;
          travel--;
        }//end else
      }//end if
      else
      {
        //control = true;
      }//end else
    }//end else
}//end

float diff(float a,float b)
{
  if(a > b)
  {
    return a-b;
  }//end if
  else
  {
    return b-a;
  }//end else
}//end diff

void draw()
{
  background(0);
  print("desired = ");println(desired);
  print("planets[desired].locate = ");println(planets[desired].locate);
  print("theta = ");println(theta);
  
  rotation();
  
  switch(mode)
  {
    case 0:
    {
      X = width/2;
      Y = -(height/2);
      scale = height*2;
      break;
    }//end case 0
    case 1:
    {
      X = width/2;
      Y = height/2;
      scale = height*0.8;
      break;
    }//end case 1
  }//end switch
  
  light();
  
  ring(X,Y,scale);
  
  //ellipse(width/2,-250,1000,1000);
  
  for(int i = 0;i < planets.length;i++)
  {
    rock(X,Y,scale,theta + (gap*i),planets[i]);
    
  }//end for
}//end draw