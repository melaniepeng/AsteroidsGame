SpaceShip me = new SpaceShip();
Star[] alot;
ArrayList <Asteroids> rocks;
public void setup() 
{
  size(600,600);
  me.setDirectionX(0);
  me.setDirectionY(0);
  alot = new Star [30];
  for (int i = 0; i < alot.length; i++)
  {
    alot[i] = new Star();
  }
  rocks = new ArrayList <Asteroids>();
  for (int j = 0; j < 10; j++)
  {
    rocks.add(j,new Asteroids());
  }
}
public void draw() 
{
  background(0);
  for (int i = 0; i < alot.length; i++)
  {
    alot[i].show();
  }
  for(int j = 0; j < rocks.size(); j++)
  {
    rocks.get(j).show();
    rocks.get(j).move();
    if (dist(me.getX(), me.getY(), rocks.get(j).getX(), rocks.get(j).getY()) <= 20)
    {
      rocks.remove(j);
    }
  }
  me.show();
  me.move();
  /*for(int k = 0; k < 10; k++)
  {
    if (dist(me.getX(), me.getY(), rocks.get(k).getX(), rocks.get(k).getY()) < 20)
    {
      rocks.remove(k);
    }
  }*/
  
  //me.shot();
  //if (me.getColor() == )
}
public void keyPressed()
{
  if (key == 'h')
  {
    me.setDirectionX(0);
    me.setDirectionY(0);
    me.setX((int)(Math.random()*592)+8);
    me.setY((int)(Math.random()*590)+10);
    me.setPointDirection((int)(Math.random()*360));

  }
  if (key == CODED) 
  {
    if (keyCode == UP)
    {
      me.accelerate(.1);
    }
    if (keyCode == DOWN)
    {
      me.accelerate(-.1);
    }
    if(keyCode == LEFT)
    {
      me.rotate(-10);
    }
    if(keyCode == RIGHT)
    {
      me.rotate(10);
    }
  }
}
class SpaceShip extends Floater  
{   
  public SpaceShip()
  {
    myColor = 0;
    myCenterX = 300;
    myCenterY = 300;
    myColor = 255;
    myDirectionX = Math.cos(myPointDirection);
    myDirectionY = Math.sin(myPointDirection);
    myPointDirection = 0;
    corners = 4;
    int[] xS = {-8, 16, -8, -2};
    int[] yS = {-8, 0, 8, 0};
    xCorners = xS;
    yCorners = yS;
  }
  public void shot()
  {
      if (key == 's')
      {
        fill(0,255,127);
        noStroke();
        ellipse((float)myCenterX + 20,(float)myCenterY,7,7);
      }
  }
  public void setX(int x){myCenterX = x;}  
  public int getX(){return (int)myCenterX;}
  public void setY(int y){myCenterY = y;}
  public int getY(){return (int)myCenterY;}
  public void setDirectionX(double x){myDirectionX = x;}
  public double getDirectionX(){return myDirectionX;}
  public void setDirectionY(double y){myDirectionY = y;}
  public double getDirectionY(){return myDirectionY;}
  public void setPointDirection(int degrees){myPointDirection = degrees;}
  public double getPointDirection(){return myPointDirection;}
  public int getColor(){return myColor;}
}
class Asteroids extends Floater
{
  private int mySpeed;
  public Asteroids()
  {
    if(Math.random()>0.5)
    {
      mySpeed = 1; 
    }
    else
    {
      mySpeed = -1;
    }
    myCenterX = (Math.random()*600);
    myCenterY = (Math.random()*600);
    myColor = 100;
    myDirectionX = (int)(Math.random()*5)-2;
    myDirectionY = (int)(Math.random()*5)-2;
    myPointDirection = 0;
    corners = 6;
    xCorners = new int [corners];
    yCorners = new int [corners];
    xCorners[0] = 0;
    yCorners[0] = 0;
    xCorners[1] = 22;
    yCorners[1] = 10;
    xCorners[2] = 30;
    yCorners[2] = 40;
    xCorners[3] = 20;
    yCorners[3] = 50;
    xCorners[4] = -20;
    yCorners[4] = 40;
    xCorners[5] = -20;
    yCorners[5] = 20;
  }
  public void move()
  {
    rotate(mySpeed);
    super.move();
  }
  public void setX(int x){myCenterX = x;}  
  public int getX(){return (int)myCenterX;}
  public void setY(int y){myCenterY = y;}
  public int getY(){return (int)myCenterY;}
  public void setDirectionX(double x){myDirectionX = x;}
  public double getDirectionX(){return myDirectionX;}
  public void setDirectionY(double y){myDirectionY = y;}
  public double getDirectionY(){return myDirectionY;}
  public void setPointDirection(int degrees){myPointDirection = degrees;}
  public double getPointDirection(){return myPointDirection;}
}
class Star
{
  private int z,a;
  public Star()
  {
    z = (int)(Math.random()*600);
    a = (int)(Math.random()*590+10); 
    //z = 0;
    //a = 10;
  }
  public void show()
  {
    noStroke();
    fill(238, 221, 130);
    beginShape();
      vertex(z,a);
      vertex(z + 2.2, a - 6.2);
      vertex(z + 10, a - 6.2);
      vertex(z + 4, a - 10);
      vertex(z + 6, a - 16);
      vertex(z,a - 12.5);
      vertex(z - 6, a - 16);
      vertex(z - 4, a - 10);
      vertex(z - 10, a - 6.2);
      vertex(z - 2.2, a - 6.2);
      vertex(z,a);
    endShape();
  } 
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 
