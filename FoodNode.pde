public class FoodNode extends SwarmNode{
  PVector location;
  int currentFood;
  
  public FoodNode(){
    super();
    size = 6;
  }
  
  public void simulate(){
    return;
  }
  
  //@override
  public void draw(){
    noStroke();
    fill(0, 255, 0);
    rect(this.location.x, this.location.y, size, size);
  }
}