float sunR, sunM, 
  earthR, earthM, 
  moonR, moonM, 
  mercR, mercM, 
  G = 0.1, 
  time = 0, timeStep = 0.3;
PVector sunPos, sunV, 
  earthPos, earthV, 
  moonPos, moonV, 
  mercPos, mercV;
ArrayList<Bolletje> bolletjes;
Bolletje sun;

void setup()
{
  int size = 1200;
  size(1500, 1000);
  background(0);

  sun = new Bolletje("sun", 75.0, 2000.0, new PVector(size/2, size/2), null, color(250, 200, 50), null);
  bolletjes = new ArrayList<Bolletje>();
  bolletjes.add(sun);
  bolletjes.add(new Bolletje("mercury", 15.0, 100.0, new PVector(size/2 - 50, size/2 - 50), new PVector(-10, 10), color(100, 100, 100), sun));
  bolletjes.add(new Bolletje("venus", 20.0, 200.0, new PVector(size/2 - 100, size/2 - 100), new PVector(-10, 10), color(230, 180, 100), sun));
  Bolletje earth = new Bolletje("earth", 20.0, 600.0, new PVector(size/2 + 160, size/2 + 160), new PVector(10, -10), color(50, 150, 250), sun);
  bolletjes.add(earth);
  bolletjes.add(new Bolletje("moon", 10.0, 10.0, new PVector(size/2 + 190, size/2 + 190), new PVector(6, -6), color(100), earth));
  bolletjes.add(new Bolletje("mars", 20.0, 200.0, new PVector(size/2 - 210, size/2 - 210), new PVector(-10, 10), color(250, 100, 100), sun));
  Bolletje jupiter = new Bolletje("jupiter", 60.0, 600.0, new PVector(size/2 + 250, size/2 + 250), new PVector(10, -10), color(250, 150, 100), sun);
  bolletjes.add(jupiter);
  bolletjes.add(new Bolletje("europa", 10.0, 10.0, new PVector(size/2 + 280, size/2 + 280), new PVector(6, -6), color(150, 100, 100), jupiter));
  bolletjes.add(new Bolletje("IO", 10.0, 10.0, new PVector(size/2 + 285, size/2 + 285), new PVector(-6, 6), color(250, 200, 100), jupiter));
  bolletjes.add(new Bolletje("saturn", 40.0, 200.0, new PVector(size/2 - 300, size/2 - 300), new PVector(-10, 10), color(250, 200, 150), sun));
  bolletjes.add(new Bolletje("uranus", 30.0, 200.0, new PVector(size/2 + 350, size/2 + 350), new PVector(10, -10), color(100, 150, 250), sun));
  bolletjes.add(new Bolletje("neptune", 30.0, 200.0, new PVector(size/2 - 400, size/2 - 400), new PVector(-10, 10), color(100, 100, 250), sun));
  bolletjes.add(new Bolletje("pluto", 10.0, 200.0, new PVector(size/2 + 450, size/2 + 450), new PVector(10, -10), color(250, 200, 100), sun));
  
}


void draw()
{
  fill(0, 30);
  //rect(0, 0, width, height);
  background(0);
  strokeWeight(2);

  for (int i = 0; i < bolletjes.size(); i++)
  {
    bolletjes.get(i).draw();
    bolletjes.get(i).update();
  }
  
  if (time % 30 < 2) 
  stars(50);

  time += timeStep;
}
