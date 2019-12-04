//notes
//upto 5 laps winner
//orange lap count
//orange car


int lap = 0;
PImage raceTrack;
PImage car1;
PImage car2;
car a;
car b;
boolean forward, backward, left, right = false;
boolean forward1, backward1, left1, right1 = false;
float checkX = 400;
float checkY = 723;
float finishX = 340;
float finishY = 120;
float uncheckX = 500;
float uncheckY = 124;
boolean checkpoint = false;
boolean checkpoint1 = false;

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
  textSize(25);
  text("Lap count: " + lap, 75, 75);

  fill(0);
  ellipse(checkX, checkY, 50, 97);
  ellipse(finishX, finishY, 50, 78);
  ellipse(uncheckX, uncheckY, 50, 74);

  text(checkpoint + " " + checkpoint1, mouseX, mouseY);

  if (forward)
  {
    if (red(get((int)a.pos.x, (int)a.pos.y))==0)
    {
      a.Forward(3);
      //println("road");
    } else if (green(get((int)a.pos.x, (int)a.pos.y))>0)
    {
      a.Forward(1);
      //println("grass");
    }
  }

  if (forward1)
  {
    if (red(get((int)b.pos.x, (int)b.pos.y))==0)
    {
      b.Forward(3);
    } else if (green(get((int)b.pos.x, (int)b.pos.y))>0)
    {
      b.Forward(1);
    }
  }

  if (backward)
  {
    if (red(get((int)a.pos.x, (int)a.pos.y))==0)
    {
      a.Backward(2);
    } else if (green(get((int)a.pos.x, (int)a.pos.y))>0)
    {
      a.Backward(1);
    }
  }

  if (backward1)
  {
    if (red(get((int)b.pos.x, (int)b.pos.y))==0)
    {
      b.Backward(2);
    } else if (green(get((int)b.pos.x, (int)b.pos.y))>0)
    {
      b.Backward(1);
    }
  }

  if (right)
  {
    a.Right();
  }

  if (right1)
  {
    b.Right();
  }

  if (left)
  {
    a.Left();
  }

  if (left1)
  {
    b.Left();
  }

  a.Render();
  b.Render();

  float distance = dist(a.pos.x, a.pos.y, checkX, checkY);
  float distance1 = dist(a.pos.x, a.pos.y, finishX, finishY);
  float distance2 = dist(a.pos.x, a.pos.y, uncheckX, uncheckY);
  if (distance < 50)
  {
    checkpoint = true;
  }
  if (distance1 < 40)
  {
    checkpoint1 = true;
  }

  if (checkpoint == true && checkpoint1 == true)
  {
    lap = lap + 1;
    checkpoint = false;
    checkpoint1 = false;
  }

  if (distance2 < 40)
  {
    checkpoint = false;
    checkpoint1 = false;
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
    left1 = true;
  }
  if (key == 'j')
  {
    right1 = true;
  }
  if (key == 'i')
  {
    forward1 = true;
  }
  if (key == 'k')
  {
    backward1 = true;
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
  if (key == 'j')
  {
    //a.Right();
    right1 = false;
  }
  if (key == 'l')
  {
    //a.Left();
    left1 = false;
  }
  if (key == 'i')
  {
    //a.Forward();
    forward1 = false;
  }
  if (key == 'k')
  {
    //a.Backward();
    backward1 = false;
  }
}
