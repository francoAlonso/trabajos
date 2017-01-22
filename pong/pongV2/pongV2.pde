import ddf.minim.*;   //libreria para la cumbia
AudioPlayer player;   //vamo a mete cumbia a esto
Minim minim;
  
PImage fondo;

Ball ball;
Player jugador;
Ball[] balls = {ball,ball};

void setup(){
  size(1000,600); 
  fondo = loadImage("fondo.jpg");
  minim = new Minim(this);
  player = minim.loadFile("pokemonOP.mp3", 2048);
  player.play();   // le doy play a la cumbia
  imageMode(CENTER);               
// noCursor();                          //codigo que no debes tocar 
  
  for(int i=0;i<balls.length;i++){
    balls[i] = new Ball();
  }
  
  jugador = new Player();
}
 
void draw(){
  background(fondo);    //las dimensiones de la imagen es de 1000x600    
  
  for(int i=0;i<balls.length;i++){
    balls[i].move(); 
  }
  
  jugador.move();
}




class Ball{
  PImage pokebola;
  float posX, posY;   //posicion inicial de la pelota
  float velX, velY;   //velocidad de la pelota
  boolean rebote = true;     //verificar cuando la pelota supero al jugador
  boolean colision = true;
  float rotacion;
  float angulo;
  
  Ball(){
    pokebola = loadImage("pokebola.png");
    posX = random(30,width-30);
    posY = posX/2+30;
    velX = 14;
    velY = random(velX+2); 
  }
  
  void move(){
    posX += velX; //hace mover en X la pelota
    posY += velY; //hace mover en Y la pelota
    
    if (second() % 2 == 0) {     //funcion magica      
      rotacion = 0.1;            //tocando el numero puedo cambiar la velocidad de rotacion
    }
    angulo= angulo + rotacion;   //cambio la rotacion para dar el efecto que este girando
    translate(posX, posY);       //aplico el movimiento 
    rotate(angulo);              //aplico la rotacion
   
    if(posX > width-30 || posX < 30){    //colision contra paredes laterales
      velX *=-1;
      rebote = true;
      colision = true;
    }
    if(posY > height-30){   //colision contra pared inferior
      velY *=-1; 
      rebote = false;
    }
    if(posY < 30){          //colision contra pared superior
      velY *=-1; 
      rebote = true;      //niego que la pelota vuelva a rebotar contra el jugador
      colision = true;
    }
    
    if(rebote == true){                      //niego el rebote contra el jugador cuando es superado
      if(colision == true){                  //niego el rebote entre si
        if(posY > 520 && posY < 540){        //rebote contra el jugador
          if(posX > mouseX-130 && posX < mouseX+130){
            velY *= -1;
            colision = false;
          }
        }
      }
    }
    image(pokebola,0,0);        //no le aplico posicion porque el translate lo hace por mi
    rotate(-angulo);
    translate(-posX,-posY);
  }
  
}

class Player{
 PImage barra;
 float posY;
 
 Player(){
  posY = 550; 
  barra = loadImage("barra.png");
 }
 
 void move(){
  image(barra,mouseX,posY); 
 }
 
}