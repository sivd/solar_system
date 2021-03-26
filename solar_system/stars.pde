void stars(int amount)
{
  float x, y;

  for (int i = 0; i < amount; i++)
  {
    x = random(0, 1500);
    y = random(0, 1000);
    fill(255);
    point(x,y);
  }
}
