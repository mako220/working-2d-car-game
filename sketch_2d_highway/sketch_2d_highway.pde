int carLength = 25;
int carBreadth = 15;

float xposition,yposition;
float xspeed=1,yspeed=2;

boolean alive = false;
boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;
int carnum = 10;

Enemy[] cars;

void setup()
{
  size(800,300);
  
  xposition = width*0.2;
  yposition = height/2;
  cars = new Enemy[carnum];
  rectMode(CENTER);
  noStroke();
  for(int i = 0; i< cars.length; i++)
  cars[i] = new Enemy();
}

void draw()
{
  background(0);
  if(alive)
  {
    walls();
    move();
    display();
    for(int i = 0; i< cars.length; i++)
    cars[i].run();
  }
  else
  {
    text("PLAY AGAIN",width/2,height/2);
  }
  if(frameCount % 60 == 0)
  println(frameRate);
}

void walls()
{
  if(yposition <= 10)
  yposition = 10;
  if(yposition >= height-10)
  yposition = height-10;
}

void move()
{
  if(keyPressed)
  {
    if(upPressed)
    {
       yposition -= yspeed;
    }
    if(downPressed)
    {
      yposition += yspeed;
    }
  }
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

void display()
{
  fill(255);
  rect(xposition,yposition,carLength,carBreadth);
}

void mouseReleased()
{
  if(!alive)
  {
    alive = true;
    for(int i = 0; i< cars.length; i++)
    cars[i].respawn();
    xspeed = 1;
    yspeed = 2;
    xposition = width*0.2;
    yposition = height/2;
  }
}
