  
import processing.video.*;
import java.io.File;

Capture cam;

int cantidadFotosTomadas;
int tiempo;

void setup() {
  frameRate(25);
  size(640, 480);
  cantidadFotosTomadas = 0;
  
  tiempo = millis()/1000;
  
  String[] cameras = Capture.list();
  
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  }else{ 
    cam = new Capture(this);
    cam.start();     
  }      
}

void draw() {
  if (cam.available() == true) {
    cam.read();
  }
  set(0, 0, cam);
}

@Override void exit() { //call funtion when sket is closed
  borrarFotos();
  super.exit(); // Now call original exit()
}

void keyPressed(){
   switch(key){
     case 'a':
       tomarFoto();
     break;
     
     case 'd':
       borrarFotos();
     break;
     
     case 'r':
       tomarVariasFotos(2, 3);
     break;
     
     default:
       println("Estas apretando cualquier cosa");
   }
}

//----------------------------------------------------------------------------------------------

void tomarVariasFotos(int cantidad,int intervalo){
  int i=1;
  while(i <= cantidad){
    if( temporizador(intervalo) ){
      tomarFoto();
      i++;
    }
    cam.read();
  }
}
boolean temporizador(int intervalo){
  boolean pepe = false;
  int tiempoActual = millis()/1000;
  if(tiempoActual > tiempo + intervalo){
    tiempo = millis()/1000;
    pepe = true;
  }
  text(tiempoActual, 20, 20);
  
  return pepe;
}

void tomarFoto(){
  PImage img;
  cantidadFotosTomadas += 1;
  saveFrame("data/photo" + cantidadFotosTomadas + ".tif"); 
  img = loadImage("photo" + cantidadFotosTomadas + ".tif");
  image(img, 20, 20, width/2, height/2);
  println("Photo["+ cantidadFotosTomadas +"] taken. Tiempo: " + tiempo);
}

void borrarFotos(){
  if(cantidadFotosTomadas > 0){
    File f;
    for(int i=1; i<=cantidadFotosTomadas; i++){
      f = new File(dataPath("photo" + i + ".tif"));
      if (f.exists()) {
        f.delete();
      }
    }
    cantidadFotosTomadas = 0;
    println("fotos borradas");
  }else{
    println("No hay fotos tomadas");
  }
  
}