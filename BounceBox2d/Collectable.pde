//want it to be a square object that moves around
class Collectable extends GameObject
{
  float w = 30;
  float h = 30;
  float a;
  
  void display()
  {
    fill(0);
    stroke(0);
    strokeWeight(1);
    rectMode(CENTER);
    float a = body.getAngle();
    pushMatrix();
    translate(x,y);
    rotate(-a);
    rect(0,0,w,h);
    popMatrix();
  }
  
  void makeBody(float x, float y, float w, float h, float a)
  {
    
  }
  
  
}
