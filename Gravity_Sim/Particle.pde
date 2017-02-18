import java.util.*;
class Particle {
  static final float MAX_VEL = 100.0f;
  float mass;
  LinkedList<PVector> points;
  PVector location;
  PVector velocity;
  PVector acceleration;
  color c = color(0, 0, 0);
  
  public Particle() {
    this.location = new PVector(random(0, width), random(0, height));
    this.mass = random(1, 1E2);
    this.velocity = new PVector(random(-2,2),random(-2,2));
    this.acceleration = new PVector(0,0);
    this.points = new LinkedList<PVector>();
    
    float r = map(this.velocity.mag(), -MAX_VEL, MAX_VEL, 0, 255);;
    float g = 0;
    float b = map(this.mass, 1, 1E2, 0, 255);
    
    c = color(r, g, b);
  }
  
  public void show() {
    constrain( velocity.x, -MAX_VEL, MAX_VEL);
    constrain( velocity.y, -MAX_VEL, MAX_VEL);
    
    if( Math.abs(velocity.x) > MAX_VEL ){
      velocity.x = MAX_VEL;
      System.out.println("ERROR: MAX Velocity exceeded");
    }
    if( Math.abs(velocity.y) > MAX_VEL ){
      velocity.y = MAX_VEL;
    }
    
    
    float r = map(this.velocity.mag(), -MAX_VEL, MAX_VEL, 0, 255);;
    float g = 0;
    float b = map(this.mass, 1, 6E2, 0, 255);
    
    c = color(r, g, b);
    stroke(c);
    fill(c);
    
    float radius = map(this.mass, 1, 6E2, 1, 150);
    
    //ellipse(location.x, location.y, radius, radius);
    
    location.add(velocity);
    //Draw line of motion
    if( points.size() > 50 - 1 ){
      points.removeFirst();
    }
    points.push( location );
    stroke( 0, 180, 0, 100 );
    point( location.x, location.y );
    //drawPath();
    
    if( location.x > width ) location.x = 0;
    if( location.x < 0 ) location.x = width;
    if( location.y > height ) location.y = 0;
    if( location.y < 0 ) location.y = height;
    
    //drawPath();
  }
  
  public PVector attract(Particle p ) {
    
    //Direction
    PVector force = PVector.sub(location, p.location);
    float distanceSquared = force.magSq();
    force.normalize();
    
    //Magnitude
    float magnitude = (G * p.mass * mass) / 
                      (distanceSquared);
                      
    force.mult(-magnitude);
    
    pushMatrix();
    translate(location.x, location.y);
    popMatrix();
    
    return force;
  }
  
  public void applyForce(PVector force){
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
    
    velocity.add(acceleration);
    
    acceleration.mult(0);
  }
  
  public void drawPath() {
    //PVector p1, p2;
    stroke( 0, 255, 0 );
    strokeWeight( 3 );
    System.out.println( points.size() );
 
  }
}