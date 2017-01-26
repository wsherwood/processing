import java.util.Stack; //<>// //<>// //<>// //<>// //<>//
import java.util.List;
public class ScoutNode extends SwarmNode {
  Stack<PVector> directions;
  private final float _RANGE = 300.0f;
  private PVector foodLocation;
  boolean returning; // else searching

  public ScoutNode() {
    super();
    initialize();
  }

  // State Constructor
  protected ScoutNode(UnemployedNode n) {
    super();
    id = n.id;
    location = n.location;
    velocity = n.velocity;
    acceleration = n.acceleration;
    path = n.path;
    initialize();
  }

  public void simulate() {
    //TODO: ACTUAL LOGIC

    if (path == null) {
      calculatePath();
    }

    if (location.equals(foodLocation)) {      // If the scout, has arrived at the food source.
      returning = true;
    }

    if (!returning) {           // If searching, move to the next dermined place.
      if ( directions.isEmpty() ) { 
        returning = true;
        return;
      }
      location = directions.pop();
      path.push(location);
    } else if (returning && !path.isEmpty()) { // Use the path taken to get here and return the same way.
      PVector nextDirection = path.pop();
      location = (nextDirection);
    } else {
      returning = !returning;
    }

    if (debug == Debug.FULL) {
      System.out.println(this.toString());
      /*System.out.printf( "Acceleration: " + "[%.3f, %.3f]%n", this.acceleration.x, this.acceleration.y);
       System.out.printf( "Velocity: " + "[%.3f, %.3f]%n", this.velocity.x, this.velocity.y);
       System.out.printf( "Location: " + "[%.3f, %.3f]%n", this.location.x, this.location.y);
       */
    }
  }

  public void draw() {
    super.draw();

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

  private void initialize() {
    size = 4;
    c = color(200, 0, 0, 100);
    directions = new Stack<PVector>();
    returning = false;
    foodLocation = null;
  }

  private void calculatePath() {

    path = new Stack<PVector>();

    // Randomly select a quadrant to move into
    int quadIndex = (int) random(4) + 1; // 1 to 4
    System.out.println( quadIndex );
    PVector end = null;
    noFill();
    stroke(6);
    // Select a random point within that quadrant to move to within the range of the scout
    if ( quadIndex == 1) {        // +x +y
      end = new PVector( random(_RANGE), random(_RANGE));
      rect(width/2, height/2, width/2, width/2);
    } else if ( quadIndex == 2) { // +x +y
      end = new PVector( random(_RANGE), -random(_RANGE));
      rect(width/2, height/2, width/2, -width/2);
    } else if ( quadIndex == 3) { // -x -y
      end = new PVector( -random(_RANGE), -random(_RANGE));
      rect(width/2, height/2, -width/2, -width/2);
    } else if ( quadIndex == 4) { // -x +y
      end = new PVector( -random(_RANGE), random(_RANGE));
      rect(width/2, height/2,-width/2, width/2);
    } else { //This is a bad catch
      end = new PVector( 0, 0 );
    }



    // interpolate the steps to get there
    // determine the number of interpolation by dividing the the calculated distance by the MSPEED
    // path.add(location); // lerp 0.0

    float numberOfInterpolations =  _MSPEED / PVector.dist(location, end);
    float iterations = 1;
    while (numberOfInterpolations * iterations  < 1.0) {
      path.push( PVector.lerp(location, end, numberOfInterpolations * iterations));
      iterations++;
    }


    // add steps to stack
    path.push( end );

    List<PVector> tempD = new ArrayList<PVector>( path );

    for (int i = tempD.size(); i > 0; i-- ) {
      directions.add( path.pop() );
    }

    if ( debug == Debug.FULL || debug == Debug.CONSOLE) {
      System.out.println("Starting location: " + location +
        "\nEnding location: " + end +
        "\n" + path.toString());
    }

    // set Directions to be the inverted stack order
    // finish
    return;
  }
}