Cuadrados[][] cua;
int columna= 6, fila = 8, medidas=70, distanciaEntreCuadrados = 2;
int size = 2;

int piso = fila-1, pilar = 0, velocidad = 300;

long tiempoGuardado=0;//esta variable se usara para el timer.

void setup() {
  size(452, 595);
  background(0);
  cua = new Cuadrados[fila][];

  int posx = 10, posy=10;
  for (int i=0; i<fila; i++) {
    cua[i] = new Cuadrados[columna];
    for (int n=0; n<columna; n++) {//preparo la array para hacer las filas y columnas
      cua[i][n] = new Cuadrados(posx, posy);
      cua[i][n].turnOff(); 
      posx+= medidas + distanciaEntreCuadrados;
    }
    posx=10;
    posy+= medidas + distanciaEntreCuadrados;
  }
  
  piso = fila-1;
  pilar = 0;
}

void draw() {
  if(millis()-tiempoGuardado>velocidad){
    moverDerecha();
    tiempoGuardado = millis();
  }
}
//-------------------------------------------------------
void keyPressed() {
  switch(key) {
  case 'a':
      if(piso >=0){
        piso-=1;
        println(piso);
      }else{
        gameOver();
        piso = fila -1;
        
      }
    break;
  }
}
//-------------Funciones globales-----------------------------
void gameOver() {
  piso = 0;
  pilar = columna-1;
  
  while (piso<fila && pilar>-2) {
    if (millis()-tiempoGuardado>100) {
      tiempoGuardado=millis();
      
      println("["+piso+"]["+pilar+"]");
      cua[piso][pilar].turnOff();
      pilar-=1;
      
      if (pilar<0 && piso<fila) {
        piso +=1;
        pilar = columna-1;
      }
    }
  }
}

void moverDerecha(){
  clearPilar(piso);
  
  if(pilar>=0 && pilar+size<columna){
    for(int i=pilar;i<=pilar+size;i++){
      cua[piso][i].turnOn(); 
    }
    pilar++;
  }
  if(pilar+size==columna){
    pilar = 0; 
  }
  
  
}

void clearPilar(int piso){
  for(int i=0;i<columna;i++){
    cua[piso][i].turnOff(); 
  }
}
//-------------Clases------------------------------------------

class Cuadrados {

  int posx, posy;

  Cuadrados(int xpos, int ypos) {
    posx = xpos;
    posy = ypos;
  }

  void display() {
    if ( this.rectOver() ) {
      this.turnOn();
    } else {
      this.turnOff();
    }
  }

  void turnOn() {
    fill(0, 14, 255);
    rect(posx, posy, medidas, medidas);
  }
  void turnOff() {
    fill(0, 3, 64);
    rect(posx, posy, medidas, medidas);
  }

  boolean rectOver() {
    if (mouseX >= posx && mouseX <= posx+medidas && 
      mouseY >= posy && mouseY <= posy+medidas) {
      return true;
    } else {
      return false;
    }
  }
}