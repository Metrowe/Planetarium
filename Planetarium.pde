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
  println(proportion);
  p = 0;
  //newPlanet("Mars",0.04,color(255,0,0));
  newPlanet("Mars",0.04,color(255,0,0));
  newPlanet("Pluto",0.01,color(0,0,255));
  newPlanet("Venus",0.05,color(200,0,200));
  newPlanet("Neptune",0.03,color(0,255,0));
  
  spin = 1.5;
  travel = 0;
  
  motion = 0;
  view = 0;
  switchView();
  
  gap = TWO_PI / planets.length;
  setGap();
  /*
  for(int i = 0;i < planets.length;i++)
  {
    planets[i].locate = gap*i;
  }//end for
  */
  
  for(int i = 0;i < numstars;i++)
  {
    stars[i] = new Star();
  }//end for
  
  //asteroids[0] = new Asteroid();
  asteroid = new Asteroid();
  player = new Player(width / 2, height / 2, 0, 50);
}

Player player;
Asteroid asteroid;

int numstars = 600;
int numplanets = 4;
Planet[] planets = new Planet[numplanets];
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

void newPlanet(String name,float size,color c)
{
  planets[p] = new Planet(name,size,c);
  p++;
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
  for(int i = 0;i < planets.length;i++)
  {
    planets[i].render();
    planets[i].update();
    ///////////////////////////
    if(i == 0)
    {
      //println(planets[i].locate.x);
      //println(planets[i].locate.y);
    }//end if
    /////////////////////////
  }//end for
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
  background(0);
  scale(scale);
  
  light();
  ring();
  
  pushMatrix();
  translate(X, Y);
  rotation();
  rock();
  popMatrix();
  
  stroke(255);
  
  asteroid.update();
  asteroid.render();
  
  player.update();
  player.render();
  
  //println(scale);
  
}//end draw