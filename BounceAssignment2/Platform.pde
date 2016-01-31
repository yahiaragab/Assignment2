// The class name starts with uppercase
abstract class Platform extends GameObject
{
  // Fields!
  float platformThickness = 20;
  float platformLength;
  
  color platformColor;
    
  // Constructor!!
  // HAS NO RETURN TYPE
  // Name is always the same as the class
  Platform()
  {
    super();
  }
  
  
  Platform(float startX, float startY, float l)
  {
    super(startX, startY, l);
  }
  

  abstract void update();
  
  abstract void render();


}
