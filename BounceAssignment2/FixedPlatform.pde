class FixedPlatform extends Platform
{
  
  FixedPlatform()
  {
    super();
  }
  
  FixedPlatform(float startX, float startY, float l)
  {
    super(startX, startY, l);
    this.platformLength = l;
    
    //fixed platforms are red
    this.platformColor = color(255, 0, 0);
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
