PImage raceTrack;
PImage car1;
PImage car2;
car a;
car b;
boolean forward, backward, left, right = false;

void setup()
{
  size(1000, 800);
  raceTrack = loadImage("racetrack.png");
  car1 = loadImage("carblue.png");
  car1.resize(40, 20);
  car2 = loadImage("carorange.png");
  car2.resize(40, 20);
  imageMode(CENTER);

  a = new car(400, 100, car1);
  b = new car(400, 130, car2);
}

void draw()
{
  background(raceTrack);
  a.Render();
  b.Render();

  if (forward)
  {
    if (red(get((int)a.pos.x, (int)a.pos.y))==0)
    {
      a.Forward(105);
    }
    
    if (green(get((int)a.pos.x, (int)a.pos.y))>0)
    {
      a.Forward(2);
    }
  }

  if (backward)
  {
    if (green(get((int)a.pos.x, (int)a.pos.y))==0)
    {
      a.Backward(15);
    }
    
    if (green(get((int)a.pos.x, (int)a.pos.y))>0)
    {
      a.Backward(1);
    }
  }

  if (right)
  {
    a.Right();
  }

  if (left)
  {
    a.Left();
  }
}
void keyPressed()
{


  if (key == 'a')
  {
    //a.Right();
    right = true;
  }
  if (key == 'd')
  {
    //a.Left();
    left = true;
  }
  if (key == 'w')
  {
    //a.Forward();
    forward = true;
  }
  if (key == 's')
  {
    //a.Backward();
    backward = true;
  }
  if (key == 'l')
  {
    b.x = b.x + 5;
  }
  if (key == 'j')
  {
    b.x = b.x - 5;
  }
  if (key == 'i')
  {
    b.y = b.y - 5;
  }
  if (key == 'k')
  {
    b.y = b.y + 5;
  }

  if (green(get((int)a.x, (int)a.y))>0)
  {
    if (key == 'd')
    {
      a.x = a.x + 3;
    }
    if (key == 'a')
    {
      a.x = a.x - 3;
    }
    if (key == 'w')
    {
      a.y = a.y - 3;
    }
    if (key == 's')
    {
      a.y = a.y + 3;
    }
    if (key == 'l')
    {
      b.x = b.x + 3;
    }
    if (key == 'j')
    {
      b.x = b.x - 3;
    }
    if (key == 'i')
    {
      b.y = b.y - 3;
    }
    if (key == 'k')
    {
      b.y = b.y + 3;
    }
  }
}

void keyReleased()
{
  if (key == 'a')
  {
    //a.Right();
    right = false;
  }
  if (key == 'd')
  {
    //a.Left();
    left = false;
  }
  if (key == 'w')
  {
    //a.Forward();
    forward = false;
  }
  if (key == 's')
  {
    //a.Backward();
    backward = false;
  }
}
