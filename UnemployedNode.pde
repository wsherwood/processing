public class UnemployedNode extends SwarmNode{
  public UnemployedNode(){
    super();
    initialize();
  }
  
  protected UnemployedNode( ScoutNode n ){
    super();
    id = n.id;
    location = n.location;
    velocity = n.velocity;
    acceleration = n.acceleration;
    initialize();
  }
  
  public void simulate(){
    
  }
  
  private void initialize(){
    c = color(125, 125, 125, 125); // Grey
    location.x = random( -12, 12);
    location.y = random( -12, 12);
    id = "" + (int) random(0, 999);
    size = 2;
  }
}