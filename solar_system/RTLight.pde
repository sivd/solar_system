class Light
{
  PVector origin;
  PVector colour;
  float strength;
  
  Light(PVector og, PVector c, float s)
  {
    origin = og;
    colour = c;
    strength = s;
  }
}
