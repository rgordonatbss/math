// globals
PFont serifItalic;

// this runs once
void setup() {
  
  // canvas
  size(1200, 600);
  
  // Use HSB colour model
  colorMode(HSB, 360, 100, 100, 100);
  
  // background colour
  background(0, 0, 100); // white
  
  // origin at left side of screen
  translate(width/6, height/2);
  
  // Height that various interface elements will be constructed against
  float quadrantHeight = width/6;
  
  // Draw axes for unit circle
  strokeWeight(2);
  line(-1*quadrantHeight, 0, quadrantHeight, 0); // x-axis
  line(0, -1*quadrantHeight, 0, quadrantHeight); // y-axis
  
  // Labels for unit circle
  serifItalic = loadFont("Times-Italic-48.vlw");
  textFont(serifItalic, 24);
  fill(0, 0, 0);
  text("x", quadrantHeight - quadrantHeight / 16, -1 * quadrantHeight / 16);
  text("y", quadrantHeight / 16, -1 * quadrantHeight + quadrantHeight / 16);
  
  
}
