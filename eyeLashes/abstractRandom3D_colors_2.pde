PShape s;
int nbPts = 500;
float AngleSpeed = 0.001;
int col = 0;

void setup() {
  size(800, 600, P3D);
  s = createShape();
  s.beginShape();
  for(int i = 0; i <= nbPts; i++) {
    int x = int(random(width/10-width, width-width/10));
    int y = int(random(height/10-height, height-height/10));
    int z = int(random(width/10-width, width - width/10));
    s.vertex(x, y, z);
  }
  s.endShape();
  colorMode(HSB, 360, 100, 100);
  ellipseMode(CENTER);
  strokeWeight(10);
}

void draw() {
  noFill();
  background(col, 50, 100);
  stroke(col, 50, 100);
  translate(width/2, height/2, -width/2);
  camera();
  for (int i = 0; i < s.getVertexCount(); i++) {
    float x = s.getVertexX(i);
    float y = s.getVertexY(i);
    float z = s.getVertexZ(i);
    x += random(-1, 1);
    y += random(-1, 1);
    z += random(-1, 1);
    s.setVertex(i, x, y, z);
  }
  s.disableStyle();
  shape(s, 0, 0);
  s.rotateY(AngleSpeed);
  s.rotateX(random(0, AngleSpeed));
  s.rotateZ(random(0, AngleSpeed));
  
  pushMatrix();
  translate(0, 0, -width/2);
  fill(225, 0, 100);
  ellipse(width/2, height/2, width, width);
  popMatrix();
}

void mousePressed() {
  col = int(random(0, 255));
  for(int i = 0; i <= nbPts; i++) {
    int x = int(random(width/10-width, width-width/10));
    int y = int(random(height/10-height, height-height/10));
    int z = int(random(width/10-width, width - width/10));
    s.setVertex(i, x, y, z);
  }
}
