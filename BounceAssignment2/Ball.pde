// The class name starts with uppercase
class Ball extends GameObject
{
  // Fields!
  char up;
  char left;
  char right;
  char fire;
  
  float gravity = .98;
  float velocityY = 0;
  float velocityX = 0;
  float bounce = -1;
  
  float ballWidth = 50;
  color ballColor = color(172, 89, 94);
  
  
  float start;
  float finish;
  float jumpHeight = 250;
  
  boolean game = false;
  
  
  // Constructor!!
  // HAS NO RETURN TYPE
  // Name is always the same as the class
  Ball()
  {
    // Constructor chaining. Call a constructor in the super class
    super(width * 0.5f, height  * 0.5f, 50);     
    
  }
  
  Ball(char up, char left, char right, char fire, float startX, float startY, float ballWidth, color c)
  {
    super(startX, startY, ballWidth);
    this.up = up;
    this.left = left;
    this.right = right;
    this.fire = fire;
    this.c = c;
    this.start = startY;
  }

  
  
  void update()
  {
    
    
    //left
    if (keys[left])
    {
      pos.x -= speed;
    }
    //right
    if (keys[right])
    {
      pos.x += speed;
    }      
    
    
    //down
    if (keys[fire])
    {
      game = true;
      start = pos.y - 100;
    }


    //gravitational force pulling ball down
    if (game)
    {
      velocityY += gravity;
      pos.y += velocityY;
      
    }
    
//        if (pos.y > start - jumpHeight)
//    {
//      velocity *= bounce;
//    }
//    else
//    {
//      
//    }
//    jump(start);

    
    if (pos.y > height - ballWidth)
    {
      jump();
      pos.y -= 100;
    }
    
    
    
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
    
    if (pos.y > height - ballWidth)
    {
      pos.y = height - ballWidth;
    }
    
    finish = start - jumpHeight;
    println(finish + " " + start);
    println("POSITION: " + pos.y);
//          line( 0, finish, width, finish);

    if (pos.y == finish)
    {
      jump();
      line( 0, finish, width, finish);
//      ballColor= color(0);
      println("FINISH");
    }
    if (pos.y == start)
    {
      jump();
//      ballColor = color(0, 0, 255);
      println("START");
    }


  }
  
  void jump()
  {
    println("JUUUUUMP");
    velocityY *= bounce;
   
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


