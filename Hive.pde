public class Hive implements IDrawable {
  ArrayList<SwarmNode> nodes;
  ArrayList<ScoutNode> scouts;
  ArrayList<ObserverNode> observers;
  PVector bestFood;
  PVector location;

  //Draw dimensions
  final int SIZE = 25; //pxs

  //Hive capacity
  final int CAPACITY = 30;

  public Hive() {
    nodes = new ArrayList<SwarmNode>();
    scouts = new ArrayList<ScoutNode>();
    observers = new ArrayList<ObserverNode>();

    for (int i = 0; i < CAPACITY; i++) {
      observers.add(new ObserverNode());
    }

    location = new PVector(0, 0);
    bestFood = new PVector();
  }

  /**
   * Handles the observers, and their state changes
  /*************************************************/
  public void simulate() {
    // REPEAT
    //   For each employed bee goes to a food source in her memory and determines a neighbour source, then evaluates the food amout and dances
    //   Onlooker bees watch the dances or employed bees and chooses a source based on the dance score, becoming an employed bee.


    for ( ObserverNode o : observers ) {
      o.simulate();
      o.toString();
    }

    //   Abandoned food sources are determined and scouts search for new foods.
    for ( ScoutNode s : scouts ) {
      s.simulate();
    }
    //   Best food sources found is registered
    // UNTIL (requirements are met)

    return;
  }

  /****
   * IDrawable implementations
   */
  public int getSize() { 
    return SIZE;
  } 
  public PVector getLocation() { 
    return location;
  }
  //display fucntion
  public void draw() {
    //noStroke();
    popMatrix();
    fill(255, 255, 0);
    rect(location.x - (SIZE / 2), location.y - (SIZE / 2), SIZE, SIZE);
    pushMatrix();
    drawSwarms();
  }

  private void drawSwarms() {
    for ( ScoutNode s : scouts ) {
      s.draw();
    }
    for ( ObserverNode o : observers ) {
      o.draw();
    }
  }


  // ISubject interface
  public void add( ObserverNode ob ) {
  }

  public void remove( ObserverNode ob ) {
  }

  public void sendNotify() {
  };
}