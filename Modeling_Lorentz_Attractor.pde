import peasy.*;

PeasyCam cam;

float x = 0.1;
float y = 0;
float z = 0;

float sigma =10;
float rho =28;
float beta = 8.0/3.0;

ArrayList <PVector> points = new ArrayList<PVector>();

void setup() {
 size(1368,720,P3D);
 colorMode(HSB);
 cam = new PeasyCam(this,500);
}

void draw() {
 background(255);
 translate(0,0,-80);
  
  // Lorenz Formula for dx/dt , dy/dt and dz/dt.
 float dt = 0.01;
 float dx = (sigma * (y - x)) * dt;
 float dy = (x * (rho - z) - y) * dt;
 float dz =(x * y - beta * z) * dt;
 
 x = x + dx;
 y = y + dy;
 z = z + dz; 
 
 // Add points x, y, z to the array.
 points.add(new PVector (x, y, z) );
 
 scale(5);
 noFill();
 
 float hu = 0;
 beginShape();
   for(PVector v: points) {
      stroke(hu,255,255);
      vertex(v.x, v.y, v.z);
      hu += 0.1;
      if(hu > 255){
          hu = 0;
      }
   }
 endShape();

}