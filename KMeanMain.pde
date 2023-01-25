ArrayList<PVector> points;
Centroid c1, c2;
ArrayList<PVector> ac1, ac2;
int n = 200;

void setup() {
  size(800, 800);
  background(100); 
  reset();
}

void reset() {
  points = new ArrayList<>();
  for (int i = 0; i < n; i++) {
    //points.add(new PVector(random(0, 0.55), random(0, 0.55)));    
    //points.add(new PVector(random(0.45, 1), random(0.45, 1)));
    points.add(new PVector(random(1), random(1)));
  }
  c1 = new Centroid();
  c2 = new Centroid();
  
  println("Data Reset!");
  println("New Centroids Set:");
  println("Centroid 1 set to: (", roundf(c1.pos.x, 2), ",", roundf(c1.pos.y, 2), ")");
  println("Centroid 2 set to: (", roundf(c2.pos.x, 2), ",", roundf(c2.pos.y, 2), ")");
  println();
}

void drawPoints() {
  for (PVector p: points) {
    fill(255, 0, 0);
    stroke(0);
    circle(p.x * width, p.y * height, 10);
  }
  c1.display();
  c2.display();
}

float getDistance(PVector p, Centroid c) {
  return p.dist(c.pos);
}

float roundf(float n, int x){
  return round(pow(10, x) * n) / pow(10, x);
}

void fitCircles(){
  c1.neighbours = new ArrayList<>();
  c2.neighbours = new ArrayList<>();

  for (PVector p : points) {
    float pc1 = p.dist(c1.pos);
    float pc2 = p.dist(c2.pos);
    
    if (pc1 > pc2) {
      c1.addNeighbour(p);
    } else {
      c2.addNeighbour(p);
    }
  }
  
  c1.update();
  c2.update();
  
  //c1.setPos(ac1);
  //c2.setPos(ac2);
  //c1.setRadius(ac1);
  //c2.setRadius(ac2);

  
  println("Centroids Set:");
  println("Centroid 1 set to: (", roundf(c1.pos.x, 2), ",", roundf(c1.pos.y, 2), ")");
  println("Centroid 2 set to: (", roundf(c2.pos.x, 2), ",", roundf(c2.pos.y, 2), ")");
  println();

}

void keyPressed(){
  reset();
}

void mousePressed(){
  fitCircles();
}

void draw() {
  background(100);
  drawPoints();
  
}
