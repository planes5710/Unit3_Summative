class car
{
  float x;
  float y;
  PImage img;
  PVector pos;
  float angle = 0;
  PVector forward = new PVector(10, 0);

  car()
  {
    x = 400;
    y = 100;
  }
  void Render()
  {

    pushMatrix();
    translate(pos.x, pos.y);
    rotate(angle);
    image(img, 0, 0);

    popMatrix();
  }

  car(float _x, float _y, PImage _img)
  {
    x = _x;
    y = _y;
    img = _img;
    pos = new PVector(_x, _y);
  }

  void Forward(int s)
  {
    PVector dir = new PVector(cos(angle), sin(angle));
    dir.setMag(dir,s);
    pos.add(dir);
  }

  void Backward(int s)
  {
    PVector dir = new PVector(-cos(angle), -sin(angle));
    dir.mult(s);
    pos.add(dir);
  }

  void Left()
  {
    angle += PI/80;
  }

  void Right()
  {
    angle -= PI/80;
  }
}
