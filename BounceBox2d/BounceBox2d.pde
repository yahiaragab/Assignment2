/*
-Make a main GameObject abstract class?
 
 -Boundry should be changed to Platform, with a main abstract platform class, falling, mooving, and fixed subclasses
 -Ball should become Ball
 
 -Moving left and right has to work with a wind-like force, and not a change in velocity
 
 -Make it look good at the end
 
 
 */

//importing all box2d files needed
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;

//importing controlP5 library for buttons
import controlP5.*;
ControlP5 controlP5;

//declaring global variables
ArrayList<controlP5.Button> buttons = new ArrayList<controlP5.Button>();
DropdownList ddl;
PFont btnfont = createFont("Arial", 20, false); // use true/false for smooth/no-smooth
ControlFont btnFont = new ControlFont(btnfont, 241);
PFont headfont = createFont("Times", 15, false); // use true/false for smooth/no-smooth
ControlFont headFont = new ControlFont(headfont, 241);


boolean[] keys = new boolean[512];


Ball ball;
Floor floor;

// A list we'll use to track fixed objects
ArrayList<Boundary> boundaries;
ArrayList<ExtraTime> extratime;
ArrayList<LessTime> lesstime;

float grav;
int numOfPlatforms;

void setup()
{
  size(1000, 700);
  smooth();

  numOfPlatforms = 7;
  grav = -20;
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  // No global gravity force
  box2d.setGravity(0, grav);
  box2d.listenForCollisions();

  ball = new Ball(20, width/2, height - 20);
  floor = new Floor(width/2, height - 5, width, 10, 0);

  boundaries = new ArrayList<Boundary>();
  extratime = new ArrayList<ExtraTime>();
  lesstime = new ArrayList<LessTime>();

  //  ball = new Ball(50, width/2, height/2);r  //x, y, w, h, angle
  //X is Object's width/2 not 0 because object is dealt with from its CENTER
  //Y - h/2
  //  boundaries.add(new Boundary(width/2, height - 5, width, 10, 0));   //floor

  generateMap();
}
float speed = 1000;

float left = speed * -1;

float right = speed;

void generateMap()
{
  for (int i = 0; i < numOfPlatforms; i++)
  {
    float x, y, w, h, a;
    a = random(-0.2, 0.2);
    h = 10;
    w = random(50, 300);
    y =  (i * (height/ (numOfPlatforms+1) ) + (height/ ( numOfPlatforms + 1 ) ) ) ;
    x = random(w/2, 900);
    boundaries.add(new Boundary(x, y, w, h, a)); //X is width/2 not 0 because object is dealt with from its CENTER

    int collectable = (int) random(0, 5);
    float tokenFloat = h + 15;
    float tokenW = 30;
    float tokenH = 30;
    //      ExtraToken extra = null;
    //      LessToken less = null;

    switch (collectable)
    {
    case 0:
      extratime.add(new ExtraTime(x, y - tokenFloat, tokenW, tokenH, a));
      break;
    case 1:
      lesstime.add(new LessTime(x, y - tokenFloat, tokenW, tokenH, a));
      break;
    default:
      break;
    }//end switch
  }//end for
}//end generateMap()

void clearMap()
{

  for (int i = 0; i < boundaries.size(); i++)
  {
      
      boundaries.get(i).killBody();
      boundaries.remove(i);
//    box2d.destroyBody(b.body);
  }

  for (int i = 0; i < extratime.size(); i++)
  {
      
      extratime.get(i).killBody();
      extratime.remove(i);
//    box2d.destroyBody(b.body);
  }

  for (int i = 0; i < lesstime.size(); i++)
  {
      
      lesstime.get(i).killBody();
      lesstime.remove(i);
//    box2d.destroyBody(b.body);
  }

}//end clearMap()


void draw()
{
  background(255);
  box2d.step();

  //  ball.display();

  //  Vec2 force = ball.attract(ball);
  //  ball.applyForce(force);
  //  Vec2 force = attract(m);
  //
  //  m.applyForce(force);

  for (Boundary wall : boundaries) 
  {
    wall.display();
  }

  for (ExtraTime extra : extratime) 
  {
    extra.display();
  }

  for (LessTime less : lesstime) 
  {
    less.display();
  }

  ball.display();
  ball.update();
  floor.display();

  if (keys['A'])
  {
    Vec2 wind = new Vec2(left, -50);
    //this removes half gravity 
    //      body.setLinearVelocity(new Vec2(-10, -5));
    //      body.setLinearVelocity(new Vec2(-15, -10));

    ball.applyForce(wind);
//    m.body.setLinearVelocity(new Vec2(0, grav));
  }
  if (keys['D'])
  {

    Vec2 wind = new Vec2(right, -50);
    ball.applyForce(wind);
  }
}


float jumpHeight = 20;
float movVel = jumpHeight;
boolean jumpCompleted = false;

//cp tells which fixtures collided
//a fixture is the entity that attaches the SHAPE to the BODY. 
//SHAPE is the thing that has geometry. TWO SHAPES come in contact with each other 
//fixtures are used in this method.
void beginContact(Contact cp)
{
  //which fixtures have collided?
  Fixture f1 = cp.getFixtureA();
  Fixture f2 = cp.getFixtureB();

  //which body are you attached to?
  Body b1 = f1.getBody();
  Body b2 = f2.getBody();

  //which "Particle" is associated with that body? //ASSIGN USER DATA. setUserData(), getUserData() 
  Object o1 = b1.getUserData();
  Object o2 = b2.getUserData();




  //  //Vectors for jumping 
  //  //have to be inside if
  //  Vec2 jumpStart = box2d.getBodyPixelCoord(m1.body);
  //  Vec2 jumpFinish = new Vec2(jumpStart.x, jumpStart.y - jumpHeight); 

  //  Vec2 jump = new Vec2(0, -40000);

  //User data doesn't determine TYPE of body
  //If object 1 is a boundary, and object 2 is a Ball, then
  if (o1.getClass() == Boundary.class && o2.getClass() == Ball.class
    ||
    o1.getClass() == Ball.class && o2.getClass() == Boundary.class)
  {
    Ball m1 = (Ball) o2;
    Boundary m2 = (Boundary) o1;

    //if Vec2 JumpFinish = box2d.getBodyPixelCoord(m1); , pos.y is < than Vec2 on JumpStart, dont change velocity
//    Vec2 ballCurrentPos = box2d.getBodyPixelCoord(m1.body);
    //          Vec2 jump = new Vec2(0, 10000);
    //m.applyForce(jump);

    m1.jump();


//    clearMap();
//    box2d.destroyBody(m2.body);
//    m2.killBody();
    //    generateMap();
  }//end if ball and platform collision 


  if (o1.getClass() == Floor.class && o2.getClass() == Ball.class
    ||
    o1.getClass() == Ball.class && o2.getClass() == Floor.class)
  {
    Ball m1 = (Ball) o2;

    m1.jump();
  }


  if (o1.getClass() == ExtraTime.class && o2.getClass() == Ball.class
    ||
    o1.getClass() == Ball.class && o2.getClass() == ExtraTime.class)
  {
    Ball m1 = (Ball) o2;

    m1.jump();
  }

  if (o1.getClass() == LessTime.class && o2.getClass() == Ball.class
    ||
    o1.getClass() == Ball.class && o2.getClass() == LessTime.class)
  {
    Ball m1 = (Ball) o2;

    m1.jump();
  }
}//end beginContact()

void endContact()
{
}


void keyPressed()
{
  keys[keyCode] = true;
}

void keyReleased()
{
  keys[keyCode] = false;
}

