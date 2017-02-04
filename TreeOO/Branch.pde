class Branch {
  PVector begin, end;
  boolean finished;
  
  public Branch(PVector begin, PVector end) {
     this.begin = begin;
     this.end = end;
     this.finished = false;
  }
  
  public void show() {
    stroke(255);
    line(this.begin.x, this.begin.y, this.end.x, this.end.y);
  }
  
  public Branch branch(float rotate) {
    PVector dir = PVector.sub(this.end, this.begin);
    dir.rotate(rotate);
    dir.mult(0.75);
    PVector newEnd = PVector.add(this.end, dir);
    return new Branch(this.end, newEnd);
  }
}