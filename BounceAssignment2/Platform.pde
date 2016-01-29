// The class name starts with uppercase
class Platform extends GameObject
{
  // Fields!
  float platformThickness = 20;
  float platformLength;
  
  color platformColor = color(255, 100, 24);
    
  // Constructor!!
  // HAS NO RETURN TYPE
  // Name is always the same as the class
  Platform(float startX, float startY, float l)
  {
    super(startX, startY, l);
    this.platformLength = l;
  }
  

  void update()
  {

  }
  
  void render()
  {
    pushMatrix(); // reset the translation and rotation
    translate(pos.x, pos.y);
    rotate(theta); // We want rotate to happen first, so you make the call AFTER translate    
    stroke(0);
    fill(platformColor);
    rect(0, 0, platformLength, platformThickness);
    popMatrix();
  }   
}
