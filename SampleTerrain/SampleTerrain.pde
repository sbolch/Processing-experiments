import peasy.*;

int w = 2400;
int h = 2400;
int scl = 20;
int cols, rows;

float[][] terrain;

PeasyCam cam;

void setup() {
  size(800, 600, P3D);
  cam = new PeasyCam(this, 0);
  
  cols = w / scl;
  rows = h / scl;
  terrain = new float[cols][rows];
  float yoff = 0;
  for(int y = 0; y < rows; y++) {
    float xoff = 0;
    for(int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -30, 30);
      xoff += 0.1;
      yoff += 0.2;
    }
  }
}

void draw() {
  background(0);
  stroke(200);
  fill(128);
  
  for(int y = 0; y < rows - 1; y++) {
    beginShape(TRIANGLE_STRIP);
    for(int x = 0; x < cols; x++) {
      vertex(x * scl, y * scl, terrain[x][y]);
      vertex(x * scl, (y + 1) * scl, terrain[x][y + 1]);
    }
    endShape();
  }
}