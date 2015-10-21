PImage bg1;
PImage bg2;
PImage enemy;
PImage fighter;
PImage hp;
PImage treasure;
PImage start2;
PImage start1;
PImage end1;
PImage end2;
boolean gamemode;
boolean gameover;
boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;


int x;
float z;
int y;
int x1;
int y1;
int L;
int k;
int speed;
int v;
int t;
void setup(){
  size(640,480);
  bg1 = loadImage("img/bg1.png");
  bg2 = loadImage("img/bg2.png");
  enemy = loadImage("img/enemy.png");
  fighter = loadImage("img/fighter.png");
  hp = loadImage("img/hp.png");
  treasure = loadImage("img/treasure.png");
  start2 = loadImage("img/start2.png");
  start1 = loadImage("img/start1.png");
  end1= loadImage("img/end1.png");
  end2= loadImage("img/end2.png");
  x=540;
  y=240;
  z=39;
  k=0;
  y=floor(random(415));
  L=640;
  t=floor(random(415));
  v=floor(random(590));
  gamemode=false;
  speed=7;
  gameover=false;
  x1=0;
  y1=floor(random(415));
  
}
void draw(){
  if(upPressed && y>0){
    y-=speed;
  }
  if(downPressed && y<430){
    y+=speed;
  }
  if(leftPressed && x>0){
    x -=speed;
  }
  if(rightPressed && x<590){
    x +=speed;
  }
  if(x==x1 && y==y1){
    gameover = true;
  }
  
  if(gamemode==true){
  
    image(bg2,-640+k,0);
    image(bg1,-640+L,0);
    fill(255,0,0);
    rect(20,10,z,20);
    image(hp,10,10);
    image(enemy,x1,y1);
    image(fighter,x,y);
    image(treasure,v,t);
    k=k+1 ;
    k%=1280;
    L=L+1 ;
    L%=1280 ;
    x1%=640;
    x1 +=5;
    if(x1+90<x && y>y1){
     y1 +=3; 
    }
    if(x1+40>x && y>y1){
     y1 +=3; 
    }
    if(x1+90<x && y<y1){
     y1 -=3; 
    }
    if(x1+40<x && y<y1){
     y1 -=3; 
    }
    if(z<0){
    z=0;
    }
    if(z>195){
      z=195;
    }
   if(x>=x1-40 && x1+40>x && y>=y1-40 && y<y1+60){
    z -=39;
    x1=0;
    y1=floor(random(415));
    image(enemy,x1,y1);
    }
    if (x>=v-40 && v+40>x && y>=t-40 && y<t+40  ){
    z +=19.5;
    t=floor(random(415));
    v=floor(random(590));
    image(treasure,v,t);
    }

  }
  if(gamemode == false){
  image(start2,0,0);
  }if(mouseX<450 && mouseY<420 && 200<mouseX && 370<mouseY && gamemode == false){
  image(start1,0,0);
  }
  if(gameover){
    image(end2,0,0);
  }
  if(mouseX<440 && mouseY<340 && 200<mouseX && 300<mouseY && gameover){
    image(end1,0,0);
  }
  if(z<0){
    gameover = true;
  }
}

void mousePressed(){
  if(mouseX<450 && mouseY<420 && 200<mouseX && 370<mouseY){
  gamemode = true;  
  }
  if(mouseX<440 && mouseY<340 && 200<mouseX && 300<mouseY  && gameover){
  gameover=false;
  gamemode=true;
  x=540;
  y=240;
  z=39;
  k=0;
  y=floor(random(415));
  L=640;
  t=floor(random(415));
  v=floor(random(590));
  speed=10;
  x1=0;
  y1=240;
  image(bg2,-640+k,0);
  image(bg1,-640+L,0);
  fill(255,0,0);
  rect(20,10,z,20);
  image(hp,10,10);
  image(enemy,x1,y1);
  image(fighter,x,y);
  image(treasure,v,t);
  k=k+1 ;
    k%=1280;
    L=L+1 ;
    L%=1280 ;
  
  }
}

void keyPressed(){
   if(key == CODED){
    switch(keyCode){
      case UP:
      upPressed = true;
      break;
      case DOWN:
      downPressed = true;
      break;
      case LEFT:
      leftPressed = true;
      break;
      case RIGHT:
      rightPressed = true;
      break;
    }
   }
}  
void keyReleased(){
   if(key == CODED){
    switch(keyCode){
      case UP:
      upPressed = false;
      break;
      case DOWN:
      downPressed = false;
      break;
      case LEFT:
      leftPressed = false;
      break;
      case RIGHT:
      rightPressed = false;
      break;
    }
   }
}  
