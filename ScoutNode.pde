import java.util.Stack;
public class ScoutNode extends SwarmNode{
  Stack<PVector> directions;
  private final float _RANGE = 1.5f;
  boolean returning;
  
  public ScoutNode(){
    super();
    c = color(200, 0, 0, 100);
    directions = new Stack<PVector>();
    returning = false;
  }
  
  public void simulate(){
    //TODO: ACTUAL LOGIC
    
    if( directions.size() > 500 ){ 
      returning = true; 
    }
    
    if(!returning){
      float randomX = random(-_RANGE, _RANGE);
      float randomY = random(-_RANGE, _RANGE);
      
      PVector nextDirection = new PVector(randomX, randomY);
      directions.push(nextDirection.copy()); // Get a copy of the newly created location vector
      
      //acceleration.add(nextDirection);        
      //velocity.add(acceleration);
      
      location.add(nextDirection);
      
    } else if(!directions.isEmpty() && returning) {
      PVector nextDirection = directions.pop();
      location.sub(nextDirection);
    } else {
      returning = !returning;
    }
    
    if(debug == Debug.FULL){
      System.out.println(this.toString());
      /*System.out.printf( "Acceleration: " + "[%.3f, %.3f]%n", this.acceleration.x, this.acceleration.y);
      System.out.printf( "Velocity: " + "[%.3f, %.3f]%n", this.velocity.x, this.velocity.y);
      System.out.printf( "Location: " + "[%.3f, %.3f]%n", this.location.x, this.location.y);
      */
    }
  }
  
  public void draw(){
    super.draw();
    
    if(debug == Debug.FULL){
      String message;
      if(returning) {
        message = "Returning";
      } else {
        message = "Searching";
      }
      pushMatrix();
        translate(-width/2, (-height/2) +20);
        textSize(20);
        text(message, 0, 0);
      popMatrix();
      //message = "X: " + (int) location.x + ", Y: " + (int) location.y;
      text(message, location.x, location.y);
    }
  }
}