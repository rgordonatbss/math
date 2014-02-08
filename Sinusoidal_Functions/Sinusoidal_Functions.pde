// globals
PFont serifItalic;
PFont serif;

// this runs once
void setup() {
  
  // canvas
  size(1200, 600);
  
  // Use HSB colour model
  colorMode(HSB, 360, 100, 100, 100);
  
  // background colour
  background(0, 0, 100); // white
  
  // origin at left side of screen
  translate(width/5, height/2);
  
  // Height that various interface elements will be constructed against
  float quadrantHeight = width/5;
  
  // Draw axes for unit circle
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
 
  
  
  
}
