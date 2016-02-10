// A fixed boundary class (now incorporates angle)

class Token {

  // A boundary is a simple rectangle with x,y,width,and height
  float x;
  float y;
  float w = 30;
  float h = 30;
  float a;
  color col;
  
  // But we also have to make a body for box2d to know about it
  Body body;

  Token(float x, float y, float w, float h, float a) 
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;

    //define the body
    makeBody(x, y, w, h, a);

    //set user data
    body.setUserData(this);
  }

  // This function removes the particle from the box2d world
  void killBody() 
  {
    box2d.destroyBody(body);
  }

  // Draw the boundary, it doesn't move so we don't have to ask the Body for location
  void display(color col) 
  {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    this.w = 30;
    this.h = 30;
    fill(col);
    stroke(0, 0, 100);
    strokeWeight(2);
    rectMode(CENTER);
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    rect(0, 0, w, h);
    popMatrix();
    
    
  }


  void makeBody(float x, float y, float w, float h, float a)
  {
    
    Vec2 center = new Vec2(x, y);
    // Define a polygon (this is what we use for a rectangle)
    PolygonShape sd = new PolygonShape();

    Vec2[] vertices = new Vec2[4];
    vertices[0] = box2d.vectorPixelsToWorld(new Vec2(-15, 25));
    vertices[1] = box2d.vectorPixelsToWorld(new Vec2(15, 25));      //THIS IS WHERE YOU DRAW THE SHAPE!!!!
    vertices[2] = box2d.vectorPixelsToWorld(new Vec2(15, -25));
    vertices[3] = box2d.vectorPixelsToWorld(new Vec2(-15, -25));
    

    sd.set(vertices, vertices.length);

    // Define the body and make it from the shape
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(center));
    body = box2d.createBody(bd);

    body.createFixture(sd, 1.0);


    // Give it some initial random velocity
    body.setLinearVelocity(new Vec2(random(-5, 5), random(2, 5)));
    body.setAngularVelocity(random(-5, 5));
  }
}//end Class

