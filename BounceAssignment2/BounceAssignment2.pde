import shiffman.box2d.*;

//2048

//drawing variables
float border;
float widthRange;
float heightRange;

int numBoxes;
float boxSize;
boolean[] keys = new boolean[512];
// The class name always starts with uppercase!!
ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();




void setup() 
{
  size(600, 700);
  background(255);

  //add S to make it go back and space to fire at monsters
  Ball ball = new Ball('W', 'A', 'D', 'S', width * 0.5f, height * 0.9f, color(0, 255, 255));
  gameObjects.add(ball);

  border = 20;

  widthRange = (float)width - (border*2);
  heightRange = (float)height - (border*2);

  for (int i = 0; i < 5; i ++)
  {
    FixedPlatform platform = new FixedPlatform( 
                                      random(-50, width-border), (i * 100) + 100, random(100, 500)                                     
      );
    gameObjects.add(platform);
  }
  
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
  background(255);
  for (int i = gameObjects.size () - 1; i >= 0; i --)
  {
    GameObject go = gameObjects.get(i);
    go.update();
    go.render();
  }
  
}

void keyPressed()
{
  keys[keyCode] = true;
}

void keyReleased()
{
  keys[keyCode] = false;
}

