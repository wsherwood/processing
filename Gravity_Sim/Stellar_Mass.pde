class Stellar_Mass extends Particle {
  float density = 1.0E-22;
  float temp = 1.0f;
  boolean isFixed = true;
  
  public Stellar_Mass() {
    super();
    init(density, temp, isFixed);
  }
  
  public Stellar_Mass(float d){
    super();
    init(d, temp, isFixed);
  }
  
  public Stellar_Mass(float d, float t) {
    super();
    init( d, t, isFixed);
  }
  
  public Stellar_Mass(float d, float t, boolean f) {
    super();
    init( d, t, f );
  }
  
  private void init(float d, float t, boolean f){
    density = d;
    temp = t;
    isFixed = f;
    
    if(isFixed) {
      velocity.x = 0;
      velocity.y = 0;
    }
  }
  
  //Density affects how the big the object appears.
  //Temp affects how hot the object is, this will affect the kind of object it is.
  //IsFixed affects whether the object moves or not
  public void show(){
     float radius = calculateRadius();
     calculateLocation();
     calculateColor();
     
     noStroke();
     ellipse(location.x, location.y, radius, radius);
  }
  
  public void applyForce(PVector force) {
    if(!isFixed){
      super.applyForce(force);
    }
  }
  
  public void drawPath() {
    return;
  }
  
  private float calculateRadius() {
    float rad = (float)Math.sqrt(density / mass);
    rad = map(rad, 0, 60, 50, 200);
    return rad;
  }
  
  private void calculateColor() {
    float r;
    float g;
    float b;
    float a;
    
    r = map(velocity.mag(), -MAX_VEL, MAX_VEL, 0, 255);
    g = calculateRadius();
    b  = map(mass, 1, 6E2, 0, 255);
    a = map(temp, 0, 1, 0, 255);
    
    color c = color(r, g, b, a );
    fill(c);
  }
  
  private void calculateLocation() {
      location.add(velocity);
      velocity.add(acceleration);
  }
}