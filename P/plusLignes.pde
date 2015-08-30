//Position
int tX = 500;
int tY = -500;
float ROT = PI/2;
//Nb of lines
int NLIGNES = 100;
//Margins and space between lines
float MARGE = 10.0;
float ESP = 30.0;

//Thickness
int L = 30;
//Color
int col1 = 110;
int col2 = col1;

//Declare coord arrays
float[] fixe = new float[NLIGNES+1];
float[] bouts = new float[NLIGNES*2];

//Declare logo
PShape p;

void setup() {
  
  size(700, 300);
  colorMode(HSB, 360, 100, 100);
  p = loadShape("P.svg");
  smooth();
  
  //Assign coordinates
  fixe[0] = MARGE;
  for (int i = 0; i < NLIGNES; i++) {
    bouts[i] = width-ESP;
    if (NLIGNES%2 == 0) {
      fixe[i+1] = (height/2) + MARGE*((i-NLIGNES/2.0)) ;
      bouts[i+NLIGNES] = fixe[i+1];
    } else {
      fixe[i+1] = (height/2) + MARGE*((i-NLIGNES/2)) ;
      bouts[i+NLIGNES] = fixe[i+1];
    }
  }
  
  //Shuffle 70 times 
  for(int j = 0; j<70;j++) {
    shufl();
  }
  
}


void draw() {
  background(360-col1, 60, 100);
  strokeWeight(L);
  stroke(col2, 60, 100);  
  lines(NLIGNES, tX, tY, ROT);
  shape(p, 200, 0, 300, 300);
  shufl();
  col2++;
  
}

void lines(int n, int tx, int ty, float r) {
  /* 
  seriesOfLines
  n = nb of lines
  tx, ty = translation x, y
  r = rotation
  */
  pushMatrix();
  translate(tx, ty);
  rotate(r);
  for (int j = 0; j < n; j++) {
    line(fixe[0], fixe[j+1], bouts[j], bouts[j+NLIGNES]);
  }
  popMatrix();
}

void shufl() {
  for (int i = 0; i < NLIGNES*2; i++) {
    if (bouts[i] < width - MARGE) {
      bouts[i] += random(-1, 1);
    } else {
      bouts[i] += random(-1, 0);
    }    
  }
}


void mousePressed() {
  col1 = int(random(10, 300));
  col2 = col1;
}








