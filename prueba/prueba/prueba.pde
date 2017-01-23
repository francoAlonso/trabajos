Cuadrados[][] cua;
int columna= 6, fila = 8, medidas=70;
int lives = 3;

void setup() {
  size(477, 630);
  background(0);
  cua = new Cuadrados[fila][];
  
  int posx = 10, posy=10;
  for(int i=0;i<fila;i++){
    cua[i] = new Cuadrados[columna];
    for(int n=0; n<columna; n++){//preparo la array para hacer las filas y columnas
      cua[i][n] = new Cuadrados(posx,posy);
      cua[i][n].turnOff();
      cua[i][n].display();//lo muestro una vez listo
      posx+=77;
    }
    posx=10;
    posy+=77;
  }
  
  /*for(int i=0;i<fila;i++){
    for(int n=0; n<columna; n++){
      cua[i][n].display();
    }
  }//muestro las filas y columnas*/
}

void draw() {
  for(int i=0;i<columna;i++){
    cua[1][i].turnOn();
    cua[1][i].display();
    delay(500);
  }
}
//-------------------------------------------------------
void keyPressed(){
  switch(key){
     case 'a':
       
     break;
  }
}

//-------------------------------------------------------

class Cuadrados{
  
  int posx, posy;
  
  Cuadrados(int xpos, int ypos){
    posx = xpos;
    posy = ypos;
  }
  
  void display() {
    rect(posx, posy, medidas, medidas);
  }
  
  void turnOn(){
    fill(0, 14, 255);
  }
  void turnOff(){
    fill(0, 3, 64);
  }
  
  boolean rectOver(){
    if(mouseX >= posx && mouseX <= posx+medidas && 
      mouseY >= posy && mouseY <= posy+medidas) {
      return true;
    }else{
      return false;
    }
  }
 
}