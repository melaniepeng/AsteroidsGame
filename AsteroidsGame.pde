SpaceShip me = new SpaceShip();
//int num = (int)Math.random()*600;
public void setup() 
{
  size(600,600);
  //noLoop();
}
public void draw() 
{
  background(0);
  me.move();
  me.show();
  
}
public void keyPressed()
{
  //redraw();
  if (key == 'h')
  {
    me.setX((int)(Math.random()*592)+8);
    me.setY((int)(Math.random()*590)+10);
    me.setPointDirection((int)(Math.random()*360));
  }
  if (key == 'w')
  {
    me.accelerate(.1);
  }
  if (key == 's')
  {
    me.accelerate(-.1);
  }
  if(key == 'a')
  {
    me.rotate(-10);
  }
  if(key == 'd')
  {
    me.rotate(10);
  }
}
class SpaceShip extends Floater  
{   
  public SpaceShip()
  {
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


/*if(me.getPointDirection() == 0)
    {
      me.setX(me.getX()+1);
    }
    else if (me.getPointDirection() == 90)
    {
      me.setY(me.getY()+1);
    }
    else if (me.getPointDirection() == 180)
    {
      me.setX(me.getX()-1);
    }
    else if(me.getPointDirection() == 270)
    {
      me.setY(me.getY()-1);
    }
    else if (me.getPointDirection() > 0 && me.getPointDirection() < 90)
    {
      me.setX(me.getX()+1);
      me.setY(me.getY()+1);
    }
    else if (me.getPointDirection() > 90 && me.getPointDirection() < 180)
    {
      me.setX(me.getX()-1);
      me.setY(me.getY()+1);
    }
    else if (me.getPointDirection() > 180 && me.getPointDirection() < 270)
    {
      me.setX(me.getX()-1);
      me.setY(me.getY()-1);
    }
    else//me.getPointDirection() > 270 && me.getPointDirection() >360
    {
      me.setX(me.getX()+1);
      me.setY(me.getY()-1);
    }*/