/*
This is the real file
*/

void setup()
{
  size(500,500);
  
  p = 0;
  //newPlanet("Mars",0.2,color(255,0,0));
  newPlanet("Mars",40,color(255,0,0));
  newPlanet("Pluto",10.1,color(0,0,255));
  newPlanet("Venus",50,color(200,0,200));
  newPlanet("Neptune",30,color(0,255,0));

  view = 1;
  switchView();
  motion = 0;
  
  scale = 50;
  
  gap = TWO_PI / planets.length;

  setGap();
  
  spin = 1.5;
  theta = 0;
  desired = 0;
  
  motion = 0;
  travel = 0;
  
  for(int i = 0;i < planets.length;i++)
  {
    planets[i].locate = gap*i;
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
int view;
float scale;
int desired;
int motion;
float spin;
int travel;
float transition;
boolean ready;

void keyPressed()
{
  if(keyCode == UP)
  {
    view = (view + 1) % 2;
    switchView();
  }//end if
  
  if(keyCode == DOWN)
  {
    //toggle = !toggle;
  }//end if
  
  if(keyCode == LEFT && motion == 0 && ready)
  {
    startRotate('l');
  }//end if
  
  if(keyCode == RIGHT && motion == 0 && ready)
  {
    startRotate('r');
  }//end if
}//end keyPressed

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


void ring(float X,float Y,float scale)
{
  noFill();
  stroke(255);
  strokeWeight(5);
  //strokeWeight(scale/height);
  
  ellipse(X,Y,scale,scale);
}//end scale

void draw()
{
  
  background(0);
  
  light();
  
  pushMatrix();
  translate(X, Y);
  rotation();
     
  rock();
  
  popMatrix();
  ring(X,Y,scale);
}//end draw