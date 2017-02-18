import java.util.Vector;

ArrayList<Particle> particles = new ArrayList<Particle>();
PGraphics particleGraphics;
Stellar_Mass Sun;
final static float G = 6.67E-8;
final int numObj = 10;

void setup() {
  size(1200,1200);
    background(0);
  particleGraphics = createGraphics(width, height);
  for(int i = 0; i < numObj; i++)
  {
    particles.add(new Particle());
  }
  Sun = new Stellar_Mass();
  Sun.location.x = 600;
  Sun.location.y = 600;
  Sun.mass = 6E9;
  
  particles.add(Sun);
}

void draw() {
  simulate(particles);
  //clear();
  for(Particle p: particles)
  {
    p.show();
    p.drawPath();
  }
}

void simulate(ArrayList<Particle> particles) {
  
  for(int i = 0; i < particles.size(); i++) {
    for(int j = 0; j < particles.size(); j++) {
      if( i != j ) {
        PVector force = particles.get(i).attract(particles.get(j));

        stroke(255,255,255);
        float x = particles.get(i).location.x;
        float y = particles.get(i).location.y;
        
       // line(x, y, x + (force.x * 10), y + (force.y * 10 ) );
        particles.get(i).applyForce(force);
      }
    }
  }
}