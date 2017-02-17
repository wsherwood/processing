public class Map {
  final static int w = 10;
  final static int h = 10;
  MapNode[][] nodes;

  public Map() {    
    nodes = new MapNode [height/ w][height / h];

    for ( int i = 0; i < (height / w); i++ ) {
      for ( int j = 0; j < (height/ h); j++ ) {
        nodes[i][j] = new MapNode(i, j);
      }
    }
  }

  public void show() {
    for ( int i = 0; i < (height / w); i++ ) {
      for ( int j = 0; j < (height/ h); j++ ) {
        nodes[i][j].show();
      }
    }
  }
}