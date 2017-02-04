float angle;

void setup() {
  size(1200, 800);
}

void draw() {
  background(50);
  angle = PI / 4;
  stroke(200);
  translate(width / 2, height);
  branch(200);
}

void branch(float len) {
  line(0, 0, 0, -len);
  translate(0, -len);
  if(len > 16) {
    pushMatrix();
    rotate(angle);
    branch(len * 0.75);
    popMatrix();
    pushMatrix();
    rotate(-angle);
    branch(len * 0.75);
    popMatrix();
  }
}