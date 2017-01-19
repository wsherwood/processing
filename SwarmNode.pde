public abstract class SwarmNode implements IDrawable{
  protected PVector location;
  protected PVector velocity;
  protected PVector acceleration;
  protected color c;
  protected int size = 3;
  
  //Constructor
  public SwarmNode(){
    location = new PVector(0, 0);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    c = color(0,0,0,0.5);
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
    String message = super.toString();
    message += "\n\tLocation: " + this.location;
    message += "\n\tVelocity: " + this.velocity;
    message += "\n\tAcceleration: " + this.acceleration;
    message += "\n\tColor: " + this.c;
    message += "\n\tSize: " + this.size;
    
    
    return message;
  }
}