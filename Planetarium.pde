/*
This is the real file
*/

void setup()
{
  size(700,700);
  
  theta = 0;
  thetaS = 0;
  proportion = ( (height+width)/2 );
  rad = proportion * 0.35;
  //println(proportion);
  p = 0;
  //newPlanet("Mars",0.04,color(255,0,0));
  newPlanet("Mars",0.04,color(255,0,0),400);
  newPlanet("Pluto",0.01,color(0,0,255),100);
  newPlanet("Venus",0.05,color(200,0,200),500);
  newPlanet("Neptune",0.03,color(0,255,0),300);
  newPlanet("Saturn",0.035,color(200,200,0),350);
  
  spin = 0.2;
  travel = 0;
  
  motion = 0;
  view = 0;
  switchView();
  
  gap = TWO_PI / planets.size();
  setGap();
  
  for(int i = 0;i < numstars;i++)
  {
    stars[i] = new Star();
  }//end for
  
  //asteroids[0] = new Asteroid();
  //asteroid = new Asteroid();
  
  
  
  
  
  
  
}


//Asteroid asteroid;

int numstars = 600;
int numplanets = 4;
//Planet[] planets = new Planet[numplanets];
ArrayList<Planet> planets = new ArrayList<Planet>();
ArrayList<Asteroid> asteroids = new ArrayList<Asteroid>();
ArrayList<Fragment> fragments = new ArrayList<Fragment>();
Star[] stars = new Star[numstars];
//Asteroid[] asteroids = new Asteroid[10];
int p;
float theta, thetaS;
float gap;
float X,Y;
float rad;
float proportion;
float scale;

int view;
int motion;
int travel;

float spin;
float transition;
boolean ready;

float timeDelta = 1.0f / 60.0f;



void newPlanet(String name,float size,color c,float mass)
{
  Planet local = new Planet(name,size,c,mass);
  planets.add(local);
}//end addPlanet

void newAsteroid()
{
  Asteroid local = new Asteroid();
  asteroids.add(local);
}//end addPlanet

void userAsteroid(float a, float b)
{
  Asteroid local = new Asteroid(a,b);
  asteroids.add(local);
}//end addPlanet

void newFrags(float a, float b)
{
  for(int i = 0;i < random(1,5);i++)
  {
    Fragment local = new Fragment(a, b);
    fragments.add(local);
  }
}//end addPlanet


void light()
{
  strokeWeight(2);
  for(int i = 0;i < stars.length;i++)
  {
    stroke(stars[i].c);
    point(stars[i].x,stars[i].y);
  }//end for
}//end light

void rock()
{
  for(int i = 0;i < planets.size();i++)
  {
    Planet tempPlanet = planets.get(i);
    
    tempPlanet.render();
    tempPlanet.update();
    ///////////////////////////
    if(i == 0)
    {
      println(tempPlanet.locate.x);
      println(tempPlanet.locate.y);
    }//end if
    /////////////////////////
  }//end for
}//end rock

void smallRock()
{
  for (int i = asteroids.size() - 1; i > -1; i--) 
  {
    Asteroid tempAsteroid = asteroids.get(i);
    if (tempAsteroid.done) 
    {
      newFrags(tempAsteroid.pos.x,tempAsteroid.pos.y);
      asteroids.remove(i);
    }
    else
    {
      tempAsteroid.update();
      tempAsteroid.render();
    }//end else
  }
}//end rock

void frag()
{
  for (int i = fragments.size() - 1; i > -1; i--) 
  {
    Fragment tempFrag = fragments.get(i);
    if (tempFrag.shade < 0) 
    {
      fragments.remove(i);
    }
    else
    {
      tempFrag.update();
      tempFrag.render();
    }//end else
  }
}//end rock


void ring()
{
  noFill();
  stroke(255);
  strokeWeight(2);
  ellipse(X,Y,rad,rad);
}//end scale

void draw()
{
  
  //switch(
  background(0);
  scale(scale);
  
  light();
  ring();
  
  pushMatrix();
  translate(X, Y);
  
  
  
  pushMatrix();
  rotation();
  rock();
  popMatrix();
  
  
  smallRock();
  frag();
  
  //asteroid.update();
  //asteroid.render();
  
  popMatrix();
  
  stroke(0);
  fill(0);
  
  //asteroid.update();
  //asteroid.render();
  
  
  //println(scale);
  ////////////////////////////////////
  //test function
  generate();
}//end draw