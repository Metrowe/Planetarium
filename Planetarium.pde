/*
This is the real file
*/

void setup()
{
  size(700,700);
  
  p = 0;
  newPlanet("Mars",40,color(255,0,0));
  newPlanet("Pluto",10.1,color(0,0,255));
  newPlanet("Venus",50,color(200,0,200));
  newPlanet("Neptune",30,color(0,255,0));

  theta = 0;
  thetaS = 0;
  scale = 50;
  rad = 0.4;
  
  spin = 1.5;
  travel = 0;
  
  motion = 0;
  view = 0;
  switchView();
  
  gap = TWO_PI / planets.length;
  setGap();
  for(int i = 0;i < planets.length;i++)
  {
    planets[i].locate = gap*i;
  }//end for
  
  for(int i = 0;i < numstars;i++)
  {
    stars[i] = new Star();
  }//end for
  
  player = new Player(width / 2, height / 2, 0, 50);
}

Player player;

int numstars = 600;
int numplanets = 4;
Planet[] planets = new Planet[numplanets];
Star[] stars = new Star[numstars];
int p;
float theta, thetaS;
float gap;
float X,Y;
float rad;
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
    shape(planets[i].shape);
  }//end for
}//end rock


void ring()
{
  noFill();
  stroke(255);
  strokeWeight(2);
  ellipse(X,Y,width*rad,height*rad);
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
}//end draw