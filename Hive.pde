public class Hive implements IDrawable {
  ArrayList<SwarmNode> nodes;
  ArrayList<ScoutNode> scouts;
  ArrayList<UnemployedNode> observers;
  PVector location;
  
  //Draw dimensions
  final int SIZE = 25; //pxs

  public Hive() {
    nodes = new ArrayList<SwarmNode>();
    scouts = new ArrayList<ScoutNode>();
    observers = new ArrayList<UnemployedNode>();
    location = new PVector(0, 0);
  }

  /**
   * Handles the observers, and their state changes
  /*************************************************/
  public void simulate() {
    
    for( ScoutNode s : scouts ){
      s.simulate();
    }
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
  }
}