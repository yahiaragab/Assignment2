// The class name starts with uppercase
class Ball extends GameObject
{
  // Fields!
  char up;
  char left;
  char right;
  char fire;
  
  float gravity = 6;
  float bounce = 30;
  color ballColor = color(172, 89, 94);
  
  // Constructor!!
  // HAS NO RETURN TYPE
  // Name is always the same as the class
  Ball()
  {
    // Constructor chaining. Call a constructor in the super class
    super(width * 0.5f, height  * 0.5f, 50);     
    
  }
  
  Ball(char up, char left, char right, char fire, float startX, float startY, color c)
  {
    super(startX, startY, 50);
    this.up = up;
    this.left = left;
    this.right = right;
    this.fire = fire;
    this.c = c;
  }

  int elapsed = 12;
  
  void update()
  {
//    //up
//    if (keys[up])
//    {
//      pos.y -= speed;
//    }      
//    //left
//    if (keys[left])
//    {
//      pos.x -= speed;
//    }
//    //right
//    if (keys[right])
//    {
//      pos.x += speed;
//    }      
//    //down
//    if (keys[fire])
//    {
//      pos.y += speed;
//    }
    
    pos.y += gravity;
    
    jump();
    
    //wrap around screen
    if (pos.x < 0)
    {
      pos.x = width;
    }
    
    if (pos.x > width)
    {
      pos.x = 0;
    }
    
    if (pos.y < 0)
    {
      pos.y = height;
    }
    
    if (pos.y > height)
    {
      pos.y = 0;
    }
    elapsed ++;
  }
  
  void jump()
  {
    
    if (pos.y > height - 50)
    {
      pos.y += bounce;
    }
    else
    {
    }
  }
  
  void render()
  {
    pushMatrix(); // reset the translation and rotation
    translate(pos.x, pos.y);
    rotate(theta); // We want rotate to happen first, so you make the call AFTER translate    
    stroke(ballColor);
    fill(ballColor);
    ellipse(0,0, w,w);    
    popMatrix();
  }   
}
