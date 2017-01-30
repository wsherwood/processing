import java.util.Stack; //<>//
public class ScoutNode extends SwarmNode implements ISubject{
  private Stack<PVector> directions;
  private ArrayList<ObserverNode> observers;
  private final float _RANGE = 150.0f;
  private final int _MAX_OBSERVERS = 5;
  private PVector hiveLocation;
  private boolean returning; // else searching

  public ScoutNode() {
    super();
    initialize();
  }

  // State Constructor
  protected ScoutNode( ObserverNode n ) {
    super();
    id = n.id;
    location = n.location;
    velocity = n.velocity;
    acceleration = n.acceleration;
    path = n.path;
    hiveLocation = n.location;      // Since we can only create scouts from unemployed bees within the hive, we can safely assume that it's current location is within.
    initialize();
  }

  public void simulate() {
    //TODO: ACTUAL LOGIC
    // If in the hive
    if ( this.location.x >= hive.location.x - ( hive.SIZE /2 ) && this.location.x <= hive.location.x + ( hive.SIZE / 2 ) &&
         this.location.y >= hive.location.y - ( hive.SIZE /2 ) && this.location.y <= hive.location.y + ( hive.SIZE / 2 ) &&
         returning ) {
           // let the possible observers in the hive know the new info.
           // Dance or send notify
           sendNotify();
           
           // begin to search again
           returning = false;
    } else if ( PVector.dist( location, hiveLocation ) >= _RANGE ) {
      System.out.println( "RANGE HTI" );
      returning = true;
    } 
    calculatePath();
    
    acceleration = directions.peek();
    
    
    velocity.add( acceleration );
    if( velocity.mag() >= _MSPEED ) {
      velocity.normalize().mult(_MSPEED);      //Ensure it doesn't travel faster than possible.
    }

    location.add( velocity );
    acceleration.mult( 0 );       // Zero out forces
    
    if (debug == Debug.FULL) {
      System.out.println( PVector.dist( hiveLocation, location ) );
      System.out.println( this.toString() );
    }
  }

  public void draw() {
    super.draw();

    // Debug code
    if (debug == Debug.FULL) {
      String message;
      if (returning) {
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
  
  public void add( ObserverNode n ) {
    observers.add( n );
  }
  
  public void remove( ObserverNode n ) {
    observers.remove( n );
  }
  
  public void sendNotify(){
    if( observers.isEmpty() == false ) {
      for ( ObserverNode obs : observers ) {
        obs.onNotify( this, new DanceInfo( directions.pop() ) );
      }
    }
  }

  private void initialize() {
    size = 4;
    c = color(200, 0, 0, 100);
    directions = new Stack<PVector>();
    returning = false;
    hiveLocation = location.copy();
    id = "" + (int) random(0, 999);
    observers = new ArrayList<ObserverNode>();
  }

  private void calculatePath() {
    float theta;
    PVector target = new PVector();
    if ( returning ) {
      directions.pop();
    } else if ( !returning ) {
      theta = random( 0, 360 );     // select a random angle
      target = PVector.fromAngle( theta ); // Create a new PVector from the randomly created angle.
      directions.add( target );
    }
    
  }
}