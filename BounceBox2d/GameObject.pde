abstract class GameObject
{
  float x;
  float y;
  color col;
  Body body;
  
  abstract void display();
  
//  abstract void makeBall(float x, float y, float r);
  abstract void makeBody(float x, float y, float w, float h, float a);
  
//    // This function removes the particle from the box2d world
//  abstract void killBody();
//  {
//    box2d.destroyBody(body);
//  }
//
//  // Is the particle ready for deletion?
//  abstract boolean done(); 
//  {
//    // Let's find the screen position of the particle
//    Vec2 pos = box2d.getBodyPixelCoord(body);
//    // Is it off the bottom of the screen?
//    if (pos.y > height) {
//      killBody();
//      return true;
//    }
//    return false;
//  }

  
}
