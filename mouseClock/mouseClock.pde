void setup() {
  size(100, 100);
  strokeWeight(8);
}

void draw() {
  background(204);
  float angle = map(mouseY, 0, width, 0, TWO_PI);
  translate(50, 50);
  rotate(angle);
  line(0, 0, 40, 0);
}
