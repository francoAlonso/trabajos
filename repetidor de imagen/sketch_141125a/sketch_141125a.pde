import ddf.minim.*;

AudioPlayer player;
Minim minim;

PImage gabi;
PImage fondo;
boolean img = true;

boolean reproductor = false;
boolean transparencia = false;
int trans = 255;


void setup(){
  size(417,417);
  gabi = loadImage("png.png");
  fondo = loadImage("jpg.jpg");
  background(fondo);
  imageMode(CENTER);
  
  minim = new Minim(this);
  
  textSize(32);
}

void draw(){
  
  if(mousePressed){
    if(transparencia == false){
     tint(255, 255);
    }else{
     tint(255,trans);    
    }
    image(gabi,mouseX,mouseY); 
    img = false;
  }
  if(img == true){
   background(fondo);
  }
  if(img == true){
  image(gabi,mouseX,mouseY);
  }
  
}

void keyPressed(){
  
  switch(key){
    case 'r':
      img = true;
    break;
    
    case 'p':
      if(reproductor == false){
        reproductor = true;
        player = minim.loadFile("boom.mp3", 2048);
        player.play();
        
      }else{
        reproductor = false;
        player.close();
        minim.stop();
      }
    break;
    
    case 't':
      if(transparencia == true){
        transparencia = false;
      }else{
        transparencia = true;
      }
    break;
    
    case '+':
      if(trans < 255){ 
        trans +=5;
        fill(0, 102, 153);
        text("opacity:" + trans, 10, 30);
      }
    break;
    
    case '-':
      if(trans > 0){
        trans -=5;
        fill(0, 102, 153);
        text("opacity:" + trans, 10, 30);
      }
    break;
    
  }
}
