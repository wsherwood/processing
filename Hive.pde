public class Hive implements IDrawable {
  ArrayList<SwarmNode> nodes;
  ArrayList<ScoutNode> scouts;
  ArrayList<UnemployedNode> observers;
  PVector location;
  
  //Draw dimensions
  final int SIZE = 25; //pxs
  
  //Hive capacity
  final int CAPACITY = 50;

  public Hive() {
    nodes = new ArrayList<SwarmNode>();
    scouts = new ArrayList<ScoutNode>();
    observers = new ArrayList<UnemployedNode>();
    
    for(int i = 0; i < CAPACITY; i++){
      observers.add(new UnemployedNode());
    }
    
    location = new PVector(0, 0);
  }

  /**
   * Handles the observers, and their state changes
  /*************************************************/
  public void simulate() {
    for( ScoutNode s : scouts ){
      s.simulate();
    }
  
  /* Create scouts based on how many there currently are associated with the hive,
   * 
   * % of turning an observer into a scout 
   *         current number of observers
   *    =     ____________________________
   *    3 * (max capacity + number of current scouts)
   */
   double chance =  100.0 * (((double) observers.size()) / (3 * (CAPACITY + Math.pow(scouts.size(),2.0))));
   
   System.out.println("Chance: " + chance);

   if( random(0, 100) <= chance ){
     System.out.println("New scout!");
     // Select an arbitrary observer to transform into a scout
     scouts.add( new ScoutNode(observers.remove(0)));
   }
   
   // negative feed back
   chance = (double) scouts.size() / CAPACITY;
   if( random( 0, 100) <= chance ){
     System.out.println("New Observer!");
     observers.add( new UnemployedNode( scouts.remove(0)));
   }
   
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
  
  private void drawSwarms(){
    for( ScoutNode s : scouts ){
      s.draw();
    }
    for( UnemployedNode o : observers ){
      o.draw();
    }
  }
}