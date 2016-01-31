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
  }
  
}
