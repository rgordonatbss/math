// globals
PFont serifItalic;
PFont serif;
float angle = 45;
float quadrantHeight = 0;

// this runs once
void setup() {

  // canvas
  size(1200, 600);

  // Use HSB colour model
  colorMode(HSB, 360, 100, 100, 100);

  // background colour
  background(0, 0, 100); // white

  // Height that various interface elements will be constructed against
  quadrantHeight = width/5;

  // Draw initial unit circle image
  drawUnitCircle();
}

void draw() {
}

// Respond to key presses
void keyPressed()
{
  // Change angle based on keypresses
  if (key == CODED) {
    if (keyCode == LEFT) {
      angle++;
    }
    if (keyCode == RIGHT) {
      angle--;
    }
  }
  
  // Negative angles not permitted
  if (angle < 0) {
    angle = 0;
  }

  // Re-draw circle  
  drawUnitCircle();
  println(angle); // DEBUG
}

// drawUnitCircle
//
// Purpose: Draws all elements of the unit circle, using the most recent angle measure.
//
// Parameters: none
void drawUnitCircle() {

  // White rectangle over entire canvas
  noStroke();
  fill(0, 0, 100);
  rect(0, 0, width, height);

  // origin for unit circle at left side of screen
  translate(quadrantHeight, height/2);
  
  // Draw axes for unit circle
  stroke(0);
  strokeWeight(2);
  line(-1*quadrantHeight, 0, quadrantHeight, 0); // x-axis
  line(0, -1*quadrantHeight, 0, quadrantHeight); // y-axis

  // Labels for unit circle
  serifItalic = loadFont("Times-Italic-24.vlw");
  textFont(serifItalic);
  fill(0, 0, 0);
  text("x", quadrantHeight - quadrantHeight / 16, -1 * quadrantHeight / 16);
  text("y", quadrantHeight / 16, -1 * quadrantHeight + quadrantHeight / 16);

  // Unit circle
  noFill();
  float diameter = quadrantHeight*2 - quadrantHeight / 3 * 2;
  float radius = diameter / 2;
  ellipse(0, 0, diameter, diameter);

  // Mark unit points
  fill(0, 0, 0); // black
  serif = loadFont("Times-Roman-18.vlw");
  textFont(serif);
  text("(1, 0)", diameter/2 + quadrantHeight / 24, quadrantHeight/8);
  ellipse(diameter/2, 0, quadrantHeight / 36, quadrantHeight / 36);
  text("(0, 1)", quadrantHeight/24, (diameter/2 + quadrantHeight / 24) * -1);
  ellipse(diameter/2 * -1, 0, quadrantHeight / 36, quadrantHeight / 36);
  text("(-1, 0)", (diameter/2 + (quadrantHeight / 7) * 2) * -1, quadrantHeight/8);
  ellipse(0, diameter/2, quadrantHeight / 36, quadrantHeight / 36);
  text("(0, -1)", quadrantHeight/24, diameter/2 + quadrantHeight / 10);
  ellipse(0, diameter/2 * -1, quadrantHeight / 36, quadrantHeight / 36);

  // Draw 45 degree reference triangle
  strokeWeight(4);
  fill(300);
  float x = cos(radians(angle)) * radius;
  float y = sin(radians(angle)) * radius;
  noStroke();
  triangle(0, 0, x, 0, x, -1*y);
  stroke(0);
  line(0, 0, x, 0);  // x
  stroke(240, 80, 90);
  line(x, 0, x, -1*y); // y
  stroke(0);
  line(0, 0, x, -1*y); // r
  fill(0);

  // Draw point P on unit circle
  ellipse(x, -1*y, quadrantHeight / 36, quadrantHeight / 36);
  textFont(serifItalic);
  fill(0, 0, 0);
  float xLabel = cos(radians(angle)) * (radius + radius / 6);
  float yLabel = sin(radians(angle)) * (radius + radius / 6);
  text("P", xLabel, yLabel*-1);
  
  // Draw theta
  noFill();
  strokeWeight(2);
  stroke(0, 80, 90); // red
  scale(1, -1);
  arc(0, 0, radius/4, radius/4, radians(0), radians(angle));
}
