//2048

//drawing variables
float border;
float widthRange;
float heightRange;

int numBoxes;
float boxSize;

void setup() 
{
  size(600, 700);
  background(255);

  border = 20;

  widthRange = (float)width - (border*2);
  heightRange = (float)height - (border*2);


  //title
  fill(0);
  text("Bounce", border, border);

//  load all data from files
//  loadData();
  
  //display main menu
  mainMenu();

}

void loadData()
{
}

void mainMenu()
{
}


void draw()
{

}

