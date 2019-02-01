class Enemy
{
  float enemySpeed;
  int enemyLength;
  int enemyBreadth;
  int enemyx,enemyy;
  float enemyAcclerate;
  int rowNumber;
  int rowSize;
  int breakPower;
  
  Enemy()
  {
    enemySpeed = -1;
    enemyLength = 25;
    enemyBreadth = 15;
    rowNumber = 6;
    breakPower = 2;
    enemyAcclerate = 1.03;
    rowSize = height/rowNumber;
    respawn();
  }
  
//  void pickLocation()
//  {
//    int row = 
//  }
  
  void respawn()
  {
    enemyx = width + int(random(0,width/rowSize))*rowSize;
    enemyy = int(random(1,rowNumber+1))*rowSize - enemyBreadth;
  }
  
  void display()
  {
    fill(255,150,0);
    rect(enemyx,enemyy,enemyLength,enemyBreadth);
  }

  void move()
  {
    enemyx += enemySpeed;
    if(rightPressed)
    {
      enemySpeed *= enemyAcclerate;
    }
    if(leftPressed)
    {
      enemySpeed = enemySpeed/breakPower;
      if(enemySpeed > -1)
      enemySpeed = -1;
    }
  }
  
  void collide()
  {
    if(abs(xposition-enemyx) < 50 && abs(yposition-enemyy) < 30)
    alive = false;
    
  }
  
  void teleport()
  {
    if(enemyx < -enemyLength)
    respawn();
  }
  
  void run()
  {
    move();
    teleport();
    display();
    collide();
  }
  void keyPressed()
  {
    if(keyCode == RIGHT)
      rightPressed = true;
    if(keyCode == LEFT)
      leftPressed = true;
    if(keyCode == UP)
      upPressed = true;
    if(keyCode == DOWN)
      downPressed = true;
  }

void keyReleased()
  {
    if(keyCode == RIGHT)
      rightPressed = false;
    if(keyCode == LEFT)
      leftPressed = false;
    if(keyCode == UP)
      upPressed = false;
    if(keyCode == DOWN)
      downPressed = false;
  }
}
