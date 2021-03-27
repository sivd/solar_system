float sunR, sunM, 
  earthR, earthM, 
  moonR, moonM, 
  mercR, mercM, 
  G = 0.1, 
  time = 0, timeStep = 0.1;
PVector sunPos, sunV, 
  earthPos, earthV, 
  moonPos, moonV, 
  mercPos, mercV;
ArrayList<Bolletje> bolletjes;
Bolletje sun;

Light[]lights = new Light[1];
Circle[] circles = new Circle[12];

Lock lock = new Lock();

void setup()
{
  frameRate(60);
  size(300, 300);
  background(0);

  sun = new Bolletje("sun", 75.0, 2000.0, new PVector(width/2, width/2), null, color(250, 200, 50), null);
  bolletjes = new ArrayList<Bolletje>();
  //bolletjes.add(sun);
  lights[0] = (new Light(new PVector(width/2, width/2), new PVector(0.5,0.5,0), 10000.0));
  
  bolletjes.add(new Bolletje("mercury", 15.0, 100.0, new PVector(width/2 - 50, width/2 - 50), new PVector(-10, 10), color(100, 100, 100), sun));
  circles[0] = (new Circle(new PVector(width/2 - 50, width/2 - 50), new PVector(0.5,0.5,1), 7.5));
  
  bolletjes.add(new Bolletje("venus", 20.0, 200.0, new PVector(width/2 - 100, width/2 - 100), new PVector(-10, 10), color(230, 180, 100), sun));
  circles[1] = (new Circle(new PVector(width/2 - 100, width/2 - 100), new PVector(0.5,0.5,1), 10.0));
  
  Bolletje earth = new Bolletje("earth", 20.0, 700.0, new PVector(width/2 + 160, width/2 + 160), new PVector(10, -10), color(50, 150, 250), sun);
  bolletjes.add(earth);
  circles[2] = (new Circle(new PVector(width/2 + 160, width/2 + 160), new PVector(0.5,0.5,1), 10.0));
  
  bolletjes.add(new Bolletje("moon", 10.0, 10.0, new PVector(width/2 + 190, width/2 + 190), new PVector(6, -6), color(100), earth));
  circles[3] = (new Circle(new PVector(width/2 + 190, width/2 + 190), new PVector(0.5,0.5,1), 5.0));
  
  bolletjes.add(new Bolletje("mars", 20.0, 200.0, new PVector(width/2 - 200, width/2 - 200), new PVector(-10, 10), color(250, 100, 100), sun));
  circles[4] = (new Circle(new PVector(width/2 - 200, width/2 - 200), new PVector(0.5,0.5,1), 20.0));
  
  Bolletje jupiter = new Bolletje("jupiter", 60.0, 600.0, new PVector(width/2 + 250, width/2 + 250), new PVector(10, -10), color(250, 150, 100), sun);
  bolletjes.add(jupiter);
  circles[5] = (new Circle(new PVector(width/2 + 250, width/2 + 250), new PVector(0.5,0.5,1), 60.0));
  
  bolletjes.add(new Bolletje("europa", 10.0, 10.0, new PVector(width/2 + 280, width/2 + 280), new PVector(6, -6), color(150, 100, 100), jupiter));
  circles[6] = (new Circle(new PVector(width/2 + 280, width/2 + 280), new PVector(0.5,0.5,1), 10.0));
  
  bolletjes.add(new Bolletje("IO", 10.0, 10.0, new PVector(width/2 + 285, width/2 + 285), new PVector(-6, 6), color(250, 200, 100), jupiter));
  circles[7] = (new Circle(new PVector(width/2 + 285, width/2 + 285), new PVector(0.5,0.5,1), 10.0));
  
  bolletjes.add(new Bolletje("saturn", 40.0, 200.0, new PVector(width/2 - 300, width/2 - 300), new PVector(-10, 10), color(250, 200, 150), sun));
  circles[8] = (new Circle(new PVector(width/2 - 300, width/2 - 300), new PVector(0.5,0.5,1), 40.0));
  
  bolletjes.add(new Bolletje("uranus", 30.0, 200.0, new PVector(width/2 + 350, width/2 + 350), new PVector(10, -10), color(100, 150, 250), sun));
  circles[9] = (new Circle(new PVector(width/2 + 350, width/2 + 350), new PVector(0.5,0.5,1), 30.0));
  
  bolletjes.add(new Bolletje("neptune", 30.0, 200.0, new PVector(width/2 - 400, width/2 - 400), new PVector(-10, 10), color(100, 100, 250), sun));
  circles[10] = (new Circle(new PVector(width/2 - 400, width/2 - 400), new PVector(0.5,0.5,1), 30.0));
  
  bolletjes.add(new Bolletje("pluto", 10.0, 200.0, new PVector(width/2 + 450, width/2 + 450), new PVector(10, -10), color(250, 200, 100), sun));
  circles[11] = (new Circle(new PVector(width/2 + 450, width/2 + 450), new PVector(0.5,0.5,1), 10.0));
  
}


void draw()
{
  fill(0, 10);
  //rect(0, 0, width, height);
  //background(0);
  //strokeWeight(2);
  
  thread("rayTracer");
  //rayTracer();
  
  //sun.draw();

  for (int i = 0; i < bolletjes.size(); i++)
  {
    //bolletjes.get(i).draw();
    bolletjes.get(i).update();
    circles[i] = (new Circle(bolletjes.get(i).pos, new PVector(0.5,0.5,1), bolletjes.get(i).radius));
  }
  
  
  
  //if (time % 30 < 2) 
  //stars(50);

  time += timeStep;
}
