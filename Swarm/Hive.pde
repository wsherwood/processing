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
    }
    //   Abandoned food sources are determined and scouts search for new foods.
    if ( scouts.size() <= 3 ) {
      // unregister possible observers
      ObserverNode ob = observers.get( 0 );
      for ( ScoutNode s : scouts ) {
        s.remove( ob );
      }
      
      scouts.add( new ScoutNode( ob ) );
      observers.remove( ob );
      
      ScoutNode sN = scouts.get( scouts.size() -1 ); // get the new scout
      
      // register observers for the new scout
      int [] observerIndex = sampleRandomNumbersWithoutRepetition(0, observers.size(), 5);
      for ( int i = 0; i < observerIndex.length; i++ ) {
        sN.add( observers.get( observerIndex[i] ) );
      }
      
    }  
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
  
  private int[] sampleRandomNumbersWithoutRepetition(int start, int end, int count) {

    int[] result = new int[count];
    int cur = 0;
    int remaining = end - start;
    for (int i = start; i < end && count > 0; i++) {
        float probability = random( 0, Float.MAX_VALUE );
        if (probability < ((float) count) / (float) remaining) {
            count--;
            result[cur++] = i;
        }
        remaining--;
    }
    return result;
}
  
  
}