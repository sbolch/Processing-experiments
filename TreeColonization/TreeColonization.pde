import peasy.*;

Tree tree;

PeasyCam cam;

float min_dist = 5;
float max_dist = 200;

void setup() {
  size(600, 900, P3D);
  cam = new PeasyCam(this, 1000);
  tree = new Tree();
}

void draw() {
  background(32, 128, 32);
  tree.show();
  tree.grow();
}