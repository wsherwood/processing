public class ObserverNode extends SwarmNode { //<>//
  public ObserverNode() {
    super();
    initialize();
  }

  protected ObserverNode( SwarmNode n ) {
    super();
    id = n.id;
    location = n.location;
    velocity = n.velocity;
    acceleration = n.acceleration;
    initialize();
  }

  public void simulate() {
    shuffleAbout();
    
    velocity.add( this.acceleration );
    if ( velocity.mag() >= _MSPEED ) {
      velocity.normalize().mult(_MSPEED);
    }

    location.add( this.velocity );

    acceleration.mult(0);  // clear accumulated accleration forces
  }

  public void onNotify( SwarmNode sN, DanceInfo dI ) {
    // Don't really need the the swarmNode right now but just in case

    // Decide whether or not to go to the node described.
    if ( dI != null ) {
      // Calculate the path to get to the new location.
      pushMatrix();
      rotate( radians(dI.theta) );
      popMatrix();

      // Place self into employednodes
      hive.nodes.add(new EmployedNode( this, dI.location ) );

      // Deregister as an observer
      hive.observers.remove(this);
    }
  }

  private void initialize() {
    c = color(125, 125, 125, 125); // Grey
    location.x = random( -12, 12);
    location.y = random( -12, 12);
    id = "" + (int) random(0, 999);
    size = 2;
  }

  private void shuffleAbout() {
    float newX = random( -1, 1);
    float newY = random( -1, 1);

    if ( this.location.x <= (hive.location.x - hive.SIZE / 2) ) {
      newX = random( 0, 1 );
    }
    if ( this.location.x >= (hive.location.x + hive.SIZE / 2) ) {
      newX = -random( 0, 1 );
    }
    if ( this.location.y <= hive.location.y - hive.SIZE / 2 ) {
      newY = random( 0, 1 );
    }
    if ( this.location.y >= hive.location.y + hive.SIZE / 2 ) {
      newY = -random( 0, 1 );
    }

    PVector steeringForce = new PVector( newX, newY ).normalize();
    applyForce( steeringForce );
  }
}