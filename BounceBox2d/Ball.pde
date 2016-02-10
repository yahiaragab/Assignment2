// Showing how to use applyForce() with box2d

class Ball {

  // We need to keep track of a Body and a radius


  Body body;
  Vec2 posi;

  float r;
  //  color col = color(172, 89, 94);
  color col = color(220, 70, 60);

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
    if (pos.y < 0) {
      killBody();
      return true;
    }
    return false;
  }

  void update()
  {
    //this gets the coordinates of the ball
    Vec2 pos = box2d.getBodyPixelCoord(body);

    //setTransform funtion is acting on the origin, and is dealing
    //with the width (1000) as if it is 100, and height (700) as if it is 70.
    //I don't know the reason, to be honest, but this is how I fixed it 
    float y = map(pos.y, 0, height, -(height/20), (height/20) );
    float x = map(pos.x, 0, width, -(width/20), (width/20));

    //wrap screen code
    if (pos.x > width || pos.x < 0)
    {
      body.setTransform( new Vec2( -x, -y ), 0 );
    }

    if (pos.x < 0)
    {
      body.setTransform( new Vec2( -x, -y ), 0 );
    }

    if (pos.y < 0)
    {
      restart();
      points++;
      time += 20;
      
      newMap();
    }
  }

  void restart()
  {
    Vec2 posx = box2d.getBodyPixelCoord(body);
    float x = map( posx.x, 0, width, -(width/20), (width/20) );
    float y = -map( height - 35, 0, height, -(height/20), (height/20) );
    body.setTransform(new Vec2(x, y), 0);
    body.setLinearVelocity(new Vec2(0, 0));
  }

  void applyForce(Vec2 force) 
  {
    Vec2 pos = body.getWorldCenter();
    body.applyForce(force, pos);
  }


  void jump()
  {
    body.applyLinearImpulse( new Vec2(0, -jumpHeight), body.getPosition(), true );
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
    posi = new Vec2(x, y);
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

