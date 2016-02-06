// The Nature of Code
// <http://www.shiffman.net/teaching/nature>
// Spring 2011
// Box2DProcessing example

// Showing how to use applyForce() with box2d

class Ball {

  // We need to keep track of a Body and a radius
      

  Body body;
  
  float r;
  color col = color(172, 89, 94);

  Ball(float r, float x, float y) {
    this.r = r;

    // Define a body
    makeBody(x, y, r);

    //set user data for collisions
    body.setUserData(this);
  }

  // This function removes the particle from the box2d world
  void killBody() 
  {
    box2d.destroyBody(body);
  }

  // Is the particle ready for deletion?
  boolean done() 
  {
    // Let's find the screen position of the particle
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Is it off the bottom of the screen?
    if (pos.y > height) {
      killBody();
      return true;
    }
    return false;
  }

  void update()
  {
    //this gets the COORDINATES!!!
    Vec2 pos = box2d.getBodyPixelCoord(body);

    float speed = 20;
    float left = speed * -1;
    float right = speed;

    //left
    if (keys['A'])
    {
      //this removes half gravity 
      //      body.setLinearVelocity(new Vec2(-10, -5));
      //      Vec2 wind = new Vec2(left, 0);
      body.setLinearVelocity(new Vec2(-30, 0));

      //      body.applyForce(wind);
    }
    //right
    if (keys['D'])
    {
      //      body.applyForce(wind);    
      body.setLinearVelocity(new Vec2(30, 0));
    }

//trying to wrap screen
//    if (bd.position.x > width)
//    {
//    bd.position = box2d.coordPixelsToWorld(0, bd.position.y);
//    println("KHOSH GOWA ALAAA");
//    }

  }



  void applyForce(Vec2 force) 
  {
    Vec2 pos = body.getWorldCenter();
    body.applyForce(force, pos);
    println("YOOOO");
  }


  void jump()
  {
  }


  void display() {
    // We look at each body and get its screen position
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Get its angle of rotation
    float a = body.getAngle();

    pushMatrix();
    translate(pos.x, pos.y);
    rotate(a);
    fill(col);
    stroke(0);
    strokeWeight(1);
    ellipse(0, 0, r*2, r*2);
    // Let's add a line so we can see the rotation
    line( -r, 0, r, 0);
    line( 0, -r, 0, r);
    popMatrix();
    

  }


  void makeBody(float x, float y, float r) 
  {
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;

    // Set its position
    bd.position = box2d.coordPixelsToWorld(x, y);
    body = box2d.world.createBody(bd);

    //set user data for collision listening


    // Make the body's shape a circle
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);

    // Define a fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    // Parameters that affect physics
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;

    body.createFixture(fd);

    //      body.setLinearVelocity(new Vec2(0, 0));
    body.setAngularVelocity(random(-1, 1));
  }
}//end Class

