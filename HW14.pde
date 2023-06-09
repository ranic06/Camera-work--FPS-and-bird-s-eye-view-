ArrayList<Box> boxes;
Sphere sphere;
int numBoxes = 10;
float boxSpeed = 2.0;
float sphereSize = 20.0;
PVector boxSize = new PVector(20, 20, 20);
char cameraMode = '1';

void setup() {
  size(800, 800, P3D);
  boxes = new ArrayList<Box>();
  for (int i = 0; i < numBoxes; i++) {
    boxes.add(new Box(boxSize, new PVector(random(width), random(height), 0), boxSpeed));
  }
  sphere = new Sphere(sphereSize, new PVector(width/2, height/2, 0));
}

void draw() {
  background(255);
  for (Box box : boxes) {
    box.update(boxes);
    box.display();
  }
  sphere.update();
  sphere.display();

  if (cameraMode == '1') {
    camera(width/2.0, height/2.0, height, width/2.0, height/2.0, 0, 0, 1, 0);
  } else if (cameraMode == '2') {
    PVector cameraPosition = PVector.add(sphere.pos, new PVector(0, -sphereSize * 3, sphereSize * 3));
    camera(cameraPosition.x, cameraPosition.y, cameraPosition.z, sphere.pos.x, sphere.pos.y, sphere.pos.z, 0, 1, 0);
  }
}

void keyPressed() {
  if (key == '1' || key == '2') {
    cameraMode = key;
  }
}
