class Sphere {
  PVector pos;
  float sz;

  Sphere(float s, PVector position) {
    sz = s;
    pos = position;
  }

  void update() {
    if (keyPressed) {
      if (key == 'w') pos.y -= 2;
      if (key == 's') pos.y += 2;
      if (key == 'a') pos.x -= 2;
      if (key == 'd') pos.x += 2;
    }
  }

  void display() {
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    fill(255, 0, 0);
    sphere(sz);
    popMatrix();
  }
}
