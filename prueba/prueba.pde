Cuadrados[][] cua;
int columna= 6, fila = 8, medidas=70, distanciaEntreCuadrados = 2;
int lives = 3;

int piso = fila-1, pilar = 0;

void setup() {
  size(452, 595);
  background(0);
  cua = new Cuadrados[fila][];

  int posx = 10, posy=10;
  for (int i=0; i<fila; i++) {
    cua[i] = new Cuadrados[columna];
    for (int n=0; n<columna; n++) {//preparo la array para hacer las filas y columnas
      cua[i][n] = new Cuadrados(posx, posy);
      cua[i][n].turnOn(); 
      posx+= medidas + distanciaEntreCuadrados;
    }
    posx=10;
    posy+= medidas + distanciaEntreCuadrados;
  }
  
  piso = 0;
  pilar = columna-1;
}

void draw() {
  
}
//-------------------------------------------------------
void keyPressed() {
  switch(key) {
  case 'a':

    break;
  }
}
//-------------Funciones globales-----------------------------
long tiempoGuardado=0;
void gameOver() {
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