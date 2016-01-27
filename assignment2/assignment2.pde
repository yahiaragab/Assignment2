

void setup()
{
  size(700, 650);
}


void draw()
{
  background(0);
  drawGrid();
}

void drawGrid()
{
  float numSquares = 10;
  float colDist = (float)width/numSquares;
  float rowDist = (float)height/numSquares;


  for (int i = 0; i < numSquares; i++)
  {
    stroke(255);
    line( (i+1) * colDist, 0, (i+1) * colDist, height);
  }
}