float transformX(float x)
{
  return (width / 2 * x + width / 2);
}

float transformY(float y)
{
  return (height / 2 * y + height / 2);
}


void rayTracer()
{
  for (int y = 0; y < width; y++)
  {
    for (int x = 0; x < height; x++)
    {
      Ray ray = new Ray();
      PVector bgC = new PVector(1, 1, 1);
      PVector pixelC = new PVector(0, 0, 0);

      ray.origin.x = x;
      ray.origin.y = y;

      for (int i = 0; i < circles.length; i++)
      {
        //if (!lock.locked)
        //{
          lock.lock();
          if (PVector.dist(ray.origin, circles[i].position) < circles[i].radius)
            bgC = circles[i].colour;
          lock.unlock();
        //}
      }
      for (int j = 0; j < lights.length; j++)
      {
        Light l = lights[j];

        ray.direction.x = l.origin.x - ray.origin.x;
        ray.direction.y = l.origin.y - ray.origin.y;
        ray.direction.normalize();
        ray.dist = PVector.dist(ray.origin, l.origin);
        boolean occluded = false;
        for (int k = 0; k < circles.length; k++)
          if (circles[k].intersect(ray)) occluded = true;
        if (!occluded)
        {
          pixelC.x += (l.colour.x / ray.dist * l.strength) * bgC.x;
          pixelC.y += (l.colour.y / ray.dist * l.strength) * bgC.y;
          pixelC.z += (l.colour.z / ray.dist * l.strength) * bgC.z;
        }
      }
      lock.lock();
      set(x, y, color(pixelC.x, pixelC.y, pixelC.z));
      lock.unlock();
    }
  }
}
