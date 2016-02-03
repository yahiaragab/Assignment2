// The Nature of Code
// <http://www.shiffman.net/teaching/nature>
// Spring 2011
// Box2DProcessing example

// Showing how to use applyForce() with box2d

class Mover {

  // We need to keep track of a Body and a radius
  Body body;
  float r;
  color col = color(172, 89, 94);
  
  Mover(float r, float x, float y) {
    this.r = r;
    
    // Define a body
    makeBody(x, y, r);
    
    //set user data for collisions
    body.setUserData(this);
  }


  void update()
  {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    //left
    if (keys['A'])
    {
      //        pos.x = 10;
      body.setLinearVelocity(new Vec2(-10, grav));
    }
    //right
    if (keys['D'])
    {
      //        pos.x += 10;
      body.setLinearVelocity(new Vec2(10, grav));
    }
  }

  //  void applyForce(Vec2 v) {
  //    body.applyForce(v, body.getWorldCenter());
  //  }


  void jump()
  {
  }

  void glide()
  {
//    setLinearVelocity(new Vec2(40, 40));
col = color(255, 0, 0);
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
    line(0, 0, r, 0);
    popMatrix();
  }

  
  void makeBody(float x, float y, float r) {
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

