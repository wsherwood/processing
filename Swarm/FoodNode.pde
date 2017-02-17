public class FoodNode extends SwarmNode { //implements IDrawable{
  private int currentFood;
  private boolean occupied = false;

  public FoodNode() {
    super();                //Explicit method call because I said so
    initilize();
  }
  public FoodNode(PVector location) {
    super();                //Same here
    this.location = location;
    initilize();
  }

  public void simulate() {
    return;
  }

  //@Override
  public void draw() {
    noStroke();
    fill(0, 255, 0);
    rect(this.location.x, this.location.y, size, size);
    if (debug == Debug.FULL) {
      text("X: " + (int) location.x + ", Y: " + (int) location.y, location.x, location.y);
    }
  }

  public int getFood() {
    return currentFood;
  }

  public boolean isOccupied() {
    return occupied;
  }
  
  public void setOccupied( boolean val ) {
    occupied = val;
  }

  //**************************************Private methods*********************************************
  private void initilize() {
    this.c = color(0, 202, 0, 200);
    this.size = 6;
    this.currentFood = (int) random(0, 100);
  }
}