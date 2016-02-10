class Platform extends Boundary
{
  Platform(float x, float y, float w, float h, float a) 
  {
    super(x, y, w, h, a);
  }

  // This function removes the particle from the box2d world
  void killBody() 
  {
    super.killBody();
  }

  // Draw the boundary, it doesn't move so we don't have to ask the Body for location
  void display() 
  {
    super.display(0);
  }
}

