float sunR,sunM = 200,
      earthR,earthM=100,
      moonR,moonM=50,
      G = 1,
      time = 0, timeStep = 0.1;
PVector sunPos,earthPos,earthV,moonPos,moonV;

void setup()
{
  int size = 800;
  size(800,800);
  background(0);
  
  sunPos = new PVector(size/2, size/2);
  sunR = 75;
  earthPos = new PVector(size/2 + 250, size/2 + 250);
  earthR = 30;
  earthV = new PVector(10,-10);
  moonPos = new PVector(size/2 + 280, size/2 + 280);
  moonR = 10;
  moonV = new PVector(17,-17);
}


void draw()
{
  background(0);
  strokeWeight(2);
  
  // ----------------------------SUN------------------------------------
  
  // DRAW SUN
  fill(250,200,50);
  stroke(250,230,50);
  ellipse(sunPos.x,sunPos.y,sunR,sunR);
  
  // ---------------------------EARTH-----------------------------------
  
  // DRAW EARTH
  fill(50,150,250);
  stroke(50,250,150);
  ellipse(earthPos.x,earthPos.y,earthR,earthR);
  
  // UPDATE EARTH VELOCITY
  float dist = PVector.dist(sunPos,earthPos);
  PVector pullDir = PVector.sub(sunPos,earthPos);
  PVector pull = PVector.mult(pullDir,gravPower(earthM,sunM,dist));
  PVector acc = PVector.div(pull,earthM);
  earthV.add(acc.mult(timeStep));
  
  // UPDATE EARTH POSITION
  earthPos.add(PVector.mult(earthV,timeStep));
  
  // ---------------------------MOON------------------------------------
  
  // DRAW MOON
  fill(100);
  stroke(30);
  ellipse(moonPos.x,moonPos.y,moonR,moonR);
  
  // UPDATE MOON VELOCITY WITH SUN
  dist = PVector.dist(sunPos,moonPos);
  pullDir = PVector.sub(sunPos,moonPos);
  pull = PVector.mult(pullDir,gravPower(moonM,sunM,dist));
  acc = PVector.div(pull,moonM);
  moonV.add(acc.mult(timeStep));
  
  // UPDATE MOON VELOCITY WITH EARTH
  dist = PVector.dist(earthPos,moonPos);
  pullDir = PVector.sub(earthPos,moonPos);
  pull = PVector.mult(pullDir,gravPower(moonM,earthM,dist));
  acc = PVector.div(pull,moonM);
  moonV.add(acc.mult(timeStep));
  
  // UPDATE MOON POSITION
  moonPos.add(PVector.mult(moonV,timeStep));
  
  time += timeStep;
}


float gravPower(float m, float M, float r)
{
  return (G * m * M / (r*r));
}
