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
  //println(proportion);
  p = 0;
  //newPlanet("Mars",0.04,color(255,0,0));
  newPlanet("Mars",0.04,color(255,0,0),400,"Mars is the fourth closest planet to the Sun. Mars takes about \n686 Earth days to orbit the Sun. Mars is about half the size of \nthe Earth with a diameter of 6,792km. However its mass is only \na tenth of Earth’s with gravity on the surface being around 37% \nthat of Earth’s.");
  newPlanet("Pluto",0.01,color(0,0,255),100,"");
  newPlanet("Venus",0.05,color(200,0,200),500,"");
  newPlanet("Neptune",0.03,color(0,255,0),300,"");
  newPlanet("Saturn",0.035,color(200,200,0),350,"");
  
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
  
  easter = false;
  menuSelect = 0;
  
  FMB = new FreeModeButton();
  IB = new InfoButton();
  BB = new BackButton();
  EB = new EasterButton();
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
}//end loaDdata


void newPlanet(String name,float size,color c,float mass,String description)
{
  Planet local = new Planet(name,size,c,mass,description);
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
  pushMatrix();
  //translate(X+random(random(-3,3)),Y+random(-3,3));
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
  ellipseMode(RADIUS);
  noFill();
  stroke(255);
  strokeWeight(2);
  ellipse(X,Y,rad,rad);
}//end scale

void draw()
{
  stroke(0);
  fill(0);
  
  //switch(
  if(easter == false)
  {
    background(0);
  }//end if
  
  //scale(scale);
  
  switch(menuSelect)
  {
    case 0:
    {
      displayStart();
      FMB.render();
      IB.render();
      //FMB.render();
      
      break;
    }//end case 0
    case 1:
    {
      
      ///////////////////////////////////////////
     pushMatrix();////////
     scale(scale);
     
     light();
     ring();
     
     pushMatrix();
     translate(X, Y);   
     pushMatrix();
     rotation();
     rock();
     popMatrix();
     //smallRock();
     //frag();
     popMatrix();
     popMatrix();
     
     if(ready)
     {
       Planet tempPlanet = planets.get(select);
       tempPlanet.displayInfo();
     }//end if
     ///////////////
      /////////////////////////////////////////////
      /*
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
      */
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

       

      
      BB.render();
      EB.render();
      break;
    }//end case 2
  }//end switch

  /*
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
  
  //asteroid.update();
  //asteroid.render();
  
  
  //println(scale);
  ////////////////////////////////////
  //test function
  generate();
  if(frameCount % 30 == 0)
  {
    newAsteroid();
  }//end if
  */
}//end draw