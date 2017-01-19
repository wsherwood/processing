Hive hive;
ArrayList<FoodNode> food = new ArrayList<FoodNode>();
ArrayList<IDrawable> objects = new ArrayList<IDrawable>();
int frameCount = 0;

public enum Debug{
  FULL,
  CONSOLE,
  OFF;
}

Debug debug = Debug.OFF; //By default set the debug global to full

void setup(){
  size(600, 600);  
  translate(width/2, height/2);
  pushMatrix();
  hive = new Hive();
  
  objects.add(hive);

  int numF = (int) random(1, 10);
  for(int i = 0; i <= numF; i++){
    PVector rLoc = new PVector(random(-width/2, width/2), random(-height/2, height/2));
    food.add(new FoodNode(rLoc));
  }
  objects.addAll(food);
}

void draw(){
  //delay(200);
  background(255);
  hive.simulate();
  
  for(IDrawable obj: objects){
    obj.draw();
  }
  System.out.println(frameCount++);
}