abstract class GameObject
{
  float x;
  float y;
  color col;
  Body body;
  
  abstract void display();
  
//  abstract void makeBall(float x, float y, float r);
  abstract void makeBody(float x, float y, float w, float h, float a);
  
}
