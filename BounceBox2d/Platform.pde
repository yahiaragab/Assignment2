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

  void update()
  {
    //      Vec2 ballPos = box2d.getBodyPixelCoord(ball.body);
    //      Vec2 platPos;
    //      
    //      if (ballPos.y < 0)
    //      {
    //        for (Platform plat : platforms) 
    //        {
    //          platPos = box2d.getBodyPixelCoord(plat.body);
    //    
    //          plat.body.setTransform(new Vec2(random(-50, 50), map(platPos.y, 0, height, -(height/20), (height/20) )), random(-.2, .2) );
    //          plat.display();
    //  //        plat.killBody();
    //  //        platforms.remove(plat.body);
    //        }
    //        
    //      }
    //    
    //      generateMap();
  }

  // Draw the boundary, it doesn't move so we don't have to ask the Body for location
  void display() 
  {
    super.display(0);
  }
}

