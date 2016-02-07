//Power up that decreases time remaining

class LessTime extends Token
{

  // A boundary is a simple rectangle with x,y,width,and height
  
  LessTime(float x, float y, float w, float h, float a) 
  {
    super(x, y, w, h, a);
    body.setUserData(this);
  }


  // Draw the boundary, it doesn't move so we don't have to ask the Body for location
  void display() 
  {
    col = color(219,112,147);
    super.display(col);
    
  }


  void makeBody(float x, float y, float w, float h, float a)
  {
    super.makeBody(x, y, w, h, a);
    
  }
  
}//end Class

