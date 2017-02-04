Branch[] tree;
PVector[] leaves;
int count, leafCount, branchCount;

void setup() {
  size(400, 400);
  tree = new Branch[200];
  leaves = new PVector[200];
  PVector a = new PVector(width / 2, height);
  PVector b = new PVector(width / 2, height - 100);
  Branch root = new Branch(a, b);
  leafCount = 0;
  branchCount = 0;
  tree[branchCount++] = root;
}

void draw() {
  background(50);
  
  for(int i = 0; i < tree.length; i++) {
    if(tree[i] != null) {
      tree[i].show();
    }
  }
  
  for(int i = 0; i < leaves.length; i++) {
    if(leaves[i] != null) {
      fill(255, 0, 100, 100);
      noStroke();
      ellipse(leaves[i].x, leaves[i].y, 8, 8);
      leaves[i].y += random(0, 1);
      leaves[i].x += random(-2, 2);
    }
  }
}

void mousePressed() {
  if(count < 5) {
    for(int i = tree.length - 1; i >= 0; i--) {
      if(tree[i] != null) {
        if(!tree[i].finished) {
          tree[branchCount++] = tree[i].branch(-PI / 4);
          tree[branchCount++] = tree[i].branch(PI / 4);
        }
        tree[i].finished = true;
      }
    }
    count++;
  }
  
  if(count == 5) {
    for(int i = 0; i < tree.length; i++) {
      if(tree[i] != null && !tree[i].finished) {
        PVector leaf = tree[i].end.copy();
        leaves[i++] = leaf;
      }
    }
    leafCount = 0;
  }
}