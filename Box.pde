class Box {
  PVector pos, vel, size;
  color col;

  Box(PVector sz, PVector position, float speed) {
    size = sz;
    pos = position;
    vel = PVector.random2D();
    vel.setMag(speed);
    col = color(random(255), random(255), random(255));
  }

  void update(ArrayList<Box> others) {
    pos.add(vel);
    if (pos.x < 0 || pos.x > width) {
      vel.x *= -1;
    }
    if (pos.y < 0 || pos.y > height) {
      vel.y *= -1;
    }
    for (Box other : others) {
      if (this != other && pos.dist(other.pos) < size.x/2 + other.size.x/2) {
        vel = PVector.sub(pos, other.pos);
        vel.setMag(boxSpeed);
      }
    }
  }

  void display() {
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    fill(col);
    box(size.x, size.y, size.z);
    popMatrix();
  }
}
