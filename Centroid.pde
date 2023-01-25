public class Centroid {
  PVector pos;
  float radius;
  ArrayList<PVector> neighbours;
  Centroid() {
    pos = new PVector(random(1), random(1));
    radius = 0;
    neighbours = new ArrayList<>();
  }
  
  void update() {
    setPos();
    setRadius();
  }
  
  void setPos() {
    this.pos = new PVector(0,0);
    for (PVector p : this.neighbours) {
      this.pos.add(p);
    }
    this.pos.div(this.neighbours.size());
  }
  
  void setRadius() {
    this.radius = 0;
    for (PVector p : this.neighbours) {
      float r = p.dist(this.pos);
      this.radius = this.radius < r ? r : this.radius;
    }
  }
  
  void connectPoints() {
    fill(0, 255, 0);
    stroke(0, 255, 0);
    for(PVector p: this.neighbours){
      line(p.x*width, p.y*height, this.pos.x*width, this.pos.y*height);
    }
  }
  
  void addNeighbour(PVector p) {
    int i = 0;
    for (; i < this.neighbours.size(); i++) {
      if (calcAngle(p) < calcAngle(this.neighbours.get(i))) {
        break;
      }
    }
    this.neighbours.add(i, p);
  }
  
  float calcAngle(PVector p) {
    return degrees(atan2( (this.pos.y - p.y), (this.pos.x - p.x) ));
  }
  
  void display() {
    fill(0, 220, 35, 50);
    stroke(0, 255, 255);
    beginShape();
    for(PVector p: this.neighbours) {
      curveVertex(p.x, p.y);
    }
    endShape();
    
    //for (int i = 0; i < this.neighbours.size() - 3; i++){
    //  curve(this.neighbours.get(i).x, this.neighbours.get(i).y, this.neighbours.get(i+1).x, this.neighbours.get(i+1).y, this.neighbours.get(i+2).x, this.neighbours.get(i+2).y, this.neighbours.get(i+3).x, this.neighbours.get(i+3).y);
    //}
    
    circle(this.pos.x * width, this.pos.y * height, 2*this.radius*width);
    fill(0, 255, 0);
    circle(this.pos.x * width, this.pos.y * height, 10);
    connectPoints();
  }
  
  //connectPoints();
}
