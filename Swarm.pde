Hive hive;

public enum Debug{
  FULL,
  OFF;
}

Debug debug = Debug.FULL; //By default set the debug global to full

void setup(){
  size(600, 600);  
  translate(width/2, height/2);
  pushMatrix();
  hive = new Hive();

}

void draw(){
  //delay(200);
  background(255);
  hive.simulate();
  hive.draw();
}