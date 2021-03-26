
public class Bolletje
{
  String name;
  float radius, mass;
  PVector pos, vel, dpos;
  color col;
  Bolletje parent;


  Bolletje(String n, float r, float m, PVector p, PVector v, color c, Bolletje par)
  {
    name = n;
    radius = r;
    mass = m;
    pos = p;
    vel = v;
    col = c;
    parent = par;
    dpos = new PVector(0, 0);
  }

  void draw()
  {
    fill(col);
    stroke(col);
    ellipse(pos.x, pos.y, radius, radius);
  }

  void update()
  {
    if (parent != null) 
    {
      float dist = PVector.dist(parent.pos, pos);
      PVector pullDir = PVector.sub(parent.pos, pos);
      PVector pull = PVector.mult(pullDir, gravPower(mass, parent.mass, dist));
      PVector acc = PVector.div(pull, mass);
      vel.add(acc.mult(timeStep));
      dpos = PVector.mult(vel, timeStep);
      dpos.add(parent.dpos);
      pos.add(dpos);
    }
  }
}
