public class MapNode {
  private float data;
  private int iX;
  private int iY;
  
  public MapNode(int i, int j) {
    iX = i;
    iY = j;
    data = random(Float.MIN_VALUE, Float.MAX_VALUE);
  }
  
  public int getIndexI() {
    return iX;
  }
  
  public int getIndexJ() {
    return iY;
  }
  
  public void show() {
    int fillC = (int) map(data, Float.MIN_VALUE, Float.MAX_VALUE, 0, 255);
    fill(fillC);
    noStroke();
    strokeWeight(3);
    rect(iX * Map.w, iY * Map.h, Map.w, Map.h );

  }
}