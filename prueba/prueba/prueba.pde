PGraphics layer;
import processing.video.*;
Capture cam;
PImage img;

void setup() {
  size(640, 480);
  layer = createGraphics(213, 160);
  
  cam = new Capture(this);
  cam.start();     
    
  img = loadImage("line.bmp");
}

void draw() {
  if (cam.available() == true) {
    cam.read();
    set(0,0, cam);
  }
  
  layer.beginDraw();
    layer.background(255);
    layer.image(img, 0, 0);
  layer.endDraw();
  image(layer, 417, 310); 
}

void keyPressed() {
  switch(key){
    case 'a':
      saveFrame("line.bmp"); 
      img = loadImage("line.bmp");
    break;
  }
}