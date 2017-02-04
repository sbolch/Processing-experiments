// Szabolcs Surányi

import peasy.*;

float angle;

PeasyCam cam;

void setup() {
  size(1200, 800, P3D);
  cam = new PeasyCam(this, 1000);
}

void draw() {
  background(50);
  angle = PI / 4;
  stroke(200);
  translate(0, height / 2);
  branch(200);
}

void branch(float len) {
  line(0, 0, 0, -len);
  translate(0, -len);
  if(len > 64) {
    pushMatrix();
    rotateX(angle);
    branch(len * 0.75);
    popMatrix();
    pushMatrix();
    rotateX(-angle);
    branch(len * 0.75);
    popMatrix();
    pushMatrix();
    rotateZ(angle);
    branch(len * 0.75);
    popMatrix();
    pushMatrix();
    rotateZ(-angle);
    branch(len * 0.75);
    popMatrix();
  }
}