public abstract class SwarmNode implements IDrawable {
  protected PVector location;
  protected PVector velocity;
  protected PVector acceleration;
  protected Stack<PVector> path;
  protected color c;
  protected int size = 3;
  protected String id;

  protected final float _MSPEED = 1.5f;

  //Constructor
  public SwarmNode() {
    location = new PVector(0.0f, 0.0f);
    velocity = new PVector(0.0f, 0.0f);
    acceleration = new PVector(0.0f, 0.0f);
    c = color(0, 0, 0, 0.5);
    id = "NOT ASSIGNED";
  }

  public abstract void simulate();

  // Generic draw method that can be overrride if needed
  public void draw() {
    noStroke();
    fill(c); //rgba
    ellipse(location.x, location.y, size - 1, size - 1);
    ellipse(location.x, location.y + size, size, size + size );
  }

  // public interface
  public int getSize() {
    return size;
  }

  public PVector getLocation() {
    return location;
  }

  public PVector getVelocity() {
    return velocity;
  }

  public PVector getAccleration() {
    return acceleration;
  }

  public void applyForce( PVector force ) {
    acceleration.add( force );
  }

  public String toString() {
    String message = id + ":-------------";
    message += "\n\t|Location: " + this.location;
    message += "\n\t|Velocity: " + this.velocity;
    message += "\n\t|Acceleration: " + this.acceleration;
    message += "\n\t|Color: " + this.c;
    message += "\n\t|Size: " + this.size;


    return message;
  }

  protected class DanceInfo {
    private float theta;
    private float magnitude;
    private PVector location;

    public DanceInfo( PVector loc ) {
      location = loc;
      magnitude = loc.mag();
      theta = PVector.angleBetween(new PVector(0, 0), loc);
    }
  }
}