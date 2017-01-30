public class EmployedNode extends SwarmNode {
  private PVector fLoc;
  public EmployedNode(){
    super();
    initialize();
  }
  
  // Becomeing a employed node requires know a food location
  protected EmployedNode( ObserverNode n, PVector foodLoc ){
    super();
    id = n.id;
    location = n.location;
    velocity = n.velocity;
    acceleration = n.acceleration;
    fLoc = foodLoc;
    initialize();
  }
  
  public void simulate(){
    location = PVector.lerp(this.location, fLoc, 0.05 );
  }
  
  private void initialize(){
    c = color(30, 30, 200, 125); // Blueish
    location.x = random( -12, 12);
    location.y = random( -12, 12);
    id = "" + (int) random(0, 999);
    size = 2;
  }
}