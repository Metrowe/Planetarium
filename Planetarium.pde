/*
Author: Emmet Rowe
Date: 29/11/16
OS: Windows 7
Notes:
-I'm aware that Pluto is no longer classified as a planet but I took some 'artistic liberties' with this project.
-The Info Mode is based off the mission select hud in a game called warframe so that is why all planets are placed on the same axis.
-Major adjustments were made to planet values and certain formula to get desired interaction.
-I'm bad at naming variables..... sorry.

References: The material for the planet descriptions was sourced from http://www.theplanetstoday.com/the_planets.html 
*/

void setup()
{
  size(700,700);
  theta = 0;
  thetaS = 0;
  proportion = ( (height+width)/2 );
  rad = proportion * 0.35;

  loadData();
  spin = 0.2;
  travel = 0;
  
  view = 0;
  switchView();
  
  gap = TWO_PI / planets.size();
  setGap();
  
  for(int i = 0;i < numstars;i++)
  {
    stars[i] = new Star();
  }//end for
  
  easter = false;
  menuSelect = 0;
  held = false;
  
  FMB = new FreeModeButton();
  IB = new InfoButton();
  BB = new BackButton();
  EB = new EasterButton();
}//end setup

int numstars = 400;

ArrayList<Planet> planets = new ArrayList<Planet>();
ArrayList<Asteroid> asteroids = new ArrayList<Asteroid>();
ArrayList<Fragment> fragments = new ArrayList<Fragment>();

Star[] stars = new Star[numstars];

int p;
float theta, thetaS, thetaB;
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

boolean easter;
int menuSelect;
int select;
boolean held;

FreeModeButton FMB;
InfoButton IB;
BackButton BB;
EasterButton EB;

void loadData()
{
  Table t = loadTable("planetData.csv");
  
  for(int i = 0 ; i < t.getRowCount(); i ++)
  {
    TableRow row = t.getRow(i);
    Planet local = new Planet(row);
    planets.add(local);
  }//end for
}//end loadData

void newAsteroid()
{
  Asteroid local = new Asteroid();
  asteroids.add(local);
}//end newAsteroid

void userAsteroid(float a, float b)
{
  Asteroid local = new Asteroid(a,b);
  asteroids.add(local);
}//end userAsteroid

void newFrags(float a, float b)
{
  for(int i = 0;i < random(1,5);i++)
  {
    Fragment local = new Fragment(a, b);
    fragments.add(local);
  }
}//end newFrags

void light()
{
  strokeWeight(2);
  pushMatrix();
  translate(X,Y);
  rotate(thetaB -= 0.0005);
  for(int i = 0;i < stars.length;i++)
  {
    stroke(stars[i].c);
    point(stars[i].x,stars[i].y);
  }//end for
  
  popMatrix();
}//end light

void rock()
{
  for(int i = 0;i < planets.size();i++)
  {
    Planet tempPlanet = planets.get(i); 
    tempPlanet.render();
    tempPlanet.update();
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
    }//end if
    else
    {
      tempAsteroid.update();
      tempAsteroid.render();
    }//end else
  }//end for
}//end smallRock

void frag()
{
  for (int i = fragments.size() - 1; i > -1; i--) 
  {
    Fragment tempFrag = fragments.get(i);
    if (tempFrag.shade < 0) 
    {
      fragments.remove(i);
    }//end if
    else
    {
      tempFrag.update();
      tempFrag.render();
    }//end else
  }//end for
}//end frag

void ring()
{
  ellipseMode(RADIUS);
  noFill();
  stroke(255);
  strokeWeight(2);
  ellipse(X,Y,rad,rad);
}//end ring

void draw()
{
  stroke(0);
  fill(0);
  
  if(easter == false)
  {
    background(0);
  }//end if

  switch(menuSelect)
  {
    case 0:
    {
      displayStart();
      FMB.render();
      IB.render();
      
      break;
    }//end case 0
    case 1:
    {
      pushMatrix();
      scale(scale);
     
      light();
      ring();
     
      pushMatrix();
      translate(X, Y);   
      rotation();
      rock();
      popMatrix();
      popMatrix();
     
      if(ready)
      {
        Planet tempPlanet = planets.get(select);
        tempPlanet.displayInfo();
      }//end if
    
      textAlign(CENTER,CENTER);
      textSize(proportion * 0.015);
      fill(255);
      text("Use left and right arrow keys to select different planets",width*0.5,height*0.95);
      
      BB.render();
      break;
    }//end case 1
    case 2:
    {
      generate();
      if(frameCount % 30 == 0)
      {
        newAsteroid();
      }//end if  
      
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
      popMatrix();
      
      textAlign(CENTER,CENTER);
      textSize(proportion * 0.015);
      fill(255);
      text("Click and hold to create asteroids",width*0.5,height*0.95);
      
      BB.render();
      EB.render();
      break;
    }//end case 2
  }//end switch
}//end draw