// NNet input
public class Preceptor {
  private float[] weights;
  private float c = 0.001f;     // "Learning Constant" 
  //private float bias;

  public Preceptor( int n ) {
    weights = new float[n];
    for ( int i = 0; i < n; i++ ) {
      weights[i] = random(-1, 1);
    }
  }
  
  public int feedForward( float[] in ) { //<>//
    float sum = 0;
    for ( int i = 0; i < weights.length; i++ ){
      sum += in[i] * weights[i];
    }
    
    return activate(sum);
  }
  
  public void train( float [] vals, float answer ) {
    int guess = feedForward( vals );
    float error = answer - guess;
    
    // Draw a line fron input to the preceptor
    stroke(#F57483);
    line(vals[0], vals[1], (width - 40 - 100), 40);
    
    for ( int i = 0 ; i < weights.length; i++ ){
      weights[i] += c * error * vals[i];
    }
    
    line( width - 140, 40, 700, 40 );
    text(" Guess: " + guess, 700, 40);
   }
  
  private int activate( float sum ) {
    if ( sum > 0.0 ){
      return 1;
    } else {
      return -1;
    }
  }
  
  public void show() {
    stroke(0, 100);
    fill(#C4D8FF);
    ellipseMode(CENTER);
    ellipse(width - 40 - 100, 40, 40, 40); 
  }
}