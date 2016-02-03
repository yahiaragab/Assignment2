import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;

boolean[] keys = new boolean[512];


Ball ball;
Mover m;

// A list we'll use to track fixed objects
ArrayList<Boundary> boundaries;


void setup()
{
  size(500, 500);
  smooth();
  
    boundaries = new ArrayList<Boundary>();


  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  // No global gravity force
  box2d.setGravity(0, -10);


//  ball = new Ball(50, width/2, height/2);

  m = new Mover(10, width/2, height/2);
  
  //x, y, w, h, angle
  //X is Object's width/2 not 0 because object is dealt with from its CENTER
  //Y - h/2
  boundaries.add(new Boundary(width/2, height - 5, width, 10, 0)); 
//  boundaries.add(new Boundary(3*width/4,height-50,width/2-50,10,0));      //THIS IS WHERE BOUNDRY POSITIONS ARE DECLARED
//  boundaries.add(new Boundary(width-5,height/2,10,height,0));
//  boundaries.add(new Boundary(5,height/2,10,height,0));

  for (int i = 0; i < 5; i++)
  {
    float x, y, w, h, a;
    a = 0;
    h = 10;
    w = random(50, 150);
    y = ( (i * 80) + 80 ) - (h/2);
    x = random(w/2, 300);
    boundaries.add(new Boundary(x, y, w, h, a)); //X is width/2 not 0 because object is dealt with from its CENTER
    
  }

}


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

  for (Boundary wall: boundaries) {
    wall.display();
  }

  m.display();
  m.update();
}




void keyPressed()
{
  keys[keyCode] = true;
}

void keyReleased()
{
  keys[keyCode] = false;
}





