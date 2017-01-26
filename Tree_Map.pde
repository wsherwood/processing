public class Tree_Map {
  Tree_Map [] child = new Tree_Map[4];
  PVector location;
  private final float _TOLERANCE = 20;
  
  public Tree_Map(PVector location) {
    this.location = location;
    
    // Find the new mid point from the last root
    float rWidth = this.location.x + (width - this.location.x);
    float rHeight = this.location.y + (width - this.location.y);
    
    // If the diff is less than tolerance set all children to null;
    if ( abs(rWidth) < 20 || abs(rHeight) < 20 ) {
      for ( int i = 0; i < 4; i++ ) {
        child[i] = null;
      }
      return; //End
    }
    
    for ( int i = 0; i < 4; i++ ) {
       child[i] = new Tree_Map(location);
    }
  }
  
  
}