
Map map;
Preceptor p = new Preceptor(2);
void setup() {
  size(800, 600);
  map = new Map();
}

void draw() {
  background(255, 255, 255);
  map.show();
  p.show();
  
  float x = random(0, 600);
  float y = random(0, 600);
  float [] in = {x, y};
  p.train( in, map.nodes[(int)x/Map.w][(int)y/Map.h].data); //<>//
}