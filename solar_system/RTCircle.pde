class Circle
{
  float radius;
  PVector position;
  PVector colour;

  Circle(PVector pos, PVector c, float r)
  {
    position = pos;
    colour = c;
    radius = r;
  }

  //void draw()
  //{
  //  fill(colour);
  //  ellipse(position.x, position.y, radius, radius);
  //}

  boolean intersect(Ray ray)
  {
    PVector diff = PVector.sub(position, ray.origin);
    float dot = PVector.dot(diff, ray.direction);
    PVector q = PVector.sub(diff, PVector.mult(ray.direction, dot));
    float qSqrd = PVector.dot(q, q);
    float rSqrd = radius * radius;
    if (qSqrd > rSqrd) return false;
    dot -= sqrt(rSqrd - qSqrd);
    if (dot < ray.dist && dot > 0) return true;
    return false;
  }
}
