public abstract class SwarmNode implements IDrawable{
  protected PVector location;
  protected PVector velocity;
  protected PVector acceleration;
  protected color c;
  protected int size = 3;
  protected String id;
  
  //Constructor
  public SwarmNode(){
    location = new PVector(0, 0);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    c = color(0,0,0,0.5);
    id = "NOT ASSIGNED";
  }
  
  public abstract void simulate();
  
  // Generic draw method that can be overrride if needed
  public void draw() {
    noStroke();
    fill(c); //rgba
    ellipse(location.x, location.y, size, size);
  }
  
  // public interface
  public int getSize(){
    return size;
  }
  
  public PVector getLocation(){
    return location;
  }
  
  public PVector getVelocity() {
    return velocity;
  }
  
  public PVector getAccleration(){
    return acceleration;
  }
  
  public String toString(){
    String message = id + ":-------------";
    message += "\n\t|Location: " + this.location;
    message += "\n\t|Velocity: " + this.velocity;
    message += "\n\t|Acceleration: " + this.acceleration;
    message += "\n\t|Color: " + this.c;
    message += "\n\t|Size: " + this.size;
    
    
    return message;
  }
}