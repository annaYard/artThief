import processing.sound.*;

PImage frame;
PImage gallery;
PImage money;
PImage controls;
PImage background;
PImage jail;

SoundFile spySound;
SoundFile splatSound;

ArrayList<Art> artList;

Art art;

Forgery forgery;

Button red;
Button green;
Button blue;

color rp;
color gp;
color bp;

int state = 0;

int startTime;
int startTimeTwo;
int startTimeThree;

int currentTime;
int interval;

void setup(){
  size(600,600);
  
  frame = loadImage("frame.png");
  gallery = loadImage("gallery.png");
  money = loadImage("money.png");
  controls = loadImage("controls.png");
  background = loadImage("background.png");
  jail = loadImage("jail.png");
  
  artList = new ArrayList <Art>();
  
  startTime = millis();

  
  spySound = new SoundFile(this, "spy.wav");
  splatSound = new SoundFile(this, "splat.wav");
  
  art = new Art();
  red = new Button(200, 500, 50, color (255,0,0));
  green = new Button(300, 500, 50, color (0,255,0));
  blue = new Button(400, 500, 50, color (0,0,255));
  forgery = new Forgery();
  
  
}


void draw(){
  
  if (spySound.isPlaying() == false){
    spySound.play();
  }
  
  
  switch (state){
    case 0:
      startScreen();
    break;
    
    case 1:
      levelOne();
    break;
    
    case 2:
      levelTwo();
    break;
    
    case 3: 
     levelThree();
     break;
     
   case 4:
     win();
     break;
     
   case 5:
     lose();
     break;
     
   case 6:
   inbetween();
   break;
   
   case 7:
   inbetweenTwo();
   break;
  }
}

void keyPressed(){
  if (key == ' '){
    state = 1;
  }
}


void mousePressed(){
  splatSound.play();
  
  if(red. isPressed()){
    forgery. moreRed();
  }
  
  
  if(green. isPressed()){
    forgery. moreGreen();
  }
  
  
  if(blue. isPressed()){
    forgery. moreBlue();
  }
  
  println("red val: " + forgery.pr);
  println("green val: " + forgery.pg);
  println("blue val: " + forgery.pb);
}

void startScreen(){
   imageMode(CENTER);
  image(controls, 300,300);
  
  controls.resize(600,600);

  fill(255);
  rect(120, 450, 420, 140);
  
  
   textSize(20);
  fill(0);
  text ("You will need to copy three paintings", 170, 500);
  text ("each more difficult than the last", 190,525);
  text (" press space when you are ready and good luck!", 130, 550);
  }

void levelOne(){
  
  imageMode(CENTER);
  image(background, 300,300);
  background. resize(900,900);
  
  interval = 30000;
  
  forgery.render();
  
  textSize(25);
  text(("goal : below 80"), 420, 55);

  
  textSize(60);
  text ((interval-(currentTime - startTime))/1000, 400, 200);
  
    game();
  
  currentTime = millis();
    if ((currentTime - startTime > interval) && (similarity (art.r, forgery.pr,
                                                            art.g, forgery.pg,
                                                            art.b, forgery.pb)) <= 80) {                                                     
      state = 6;
      println(similarity (art.r, forgery.pr, art.g, forgery.pg, art.b, forgery.pb));
    }
    
    if ((similarity (art.r, forgery.pr, art.g, forgery.pg, art.b, forgery.pb)) <= 80) {                                                     
      state = 6;
    }
    
   if ((currentTime - startTime > interval) && (similarity (art.r, forgery.pr,
                                                            art.g, forgery.pg,
                                                            art.b, forgery.pb)) > 80){
      state = 5 ; 
      print(similarity (art.r, forgery.pr, art.g, forgery.pg, art.b, forgery.pb)); 
    }
}

void levelTwo(){
    imageMode(CENTER);
  image(background, 300,300);
  background. resize(900,900);
  
  interval = 20000;
 
  game();
  
  forgery.render();
  
  textSize(25);
  text(("goal : below 50"), 420, 55);
 
   textSize(60);
  text ((interval-(currentTime - startTimeTwo))/1000, 400, 200);

 
  currentTime = millis();
  
    if ((currentTime - startTimeTwo > interval) && (similarity (art.r, forgery.pr,
                                                            art.g, forgery.pg,
                                                            art.b, forgery.pb) <= 50)) {
      state = 7;
    }
    
     if ((similarity (art.r, forgery.pr, art.g, forgery.pg, art.b, forgery.pb)) <= 50) {                                                     
      state = 7;
    }
    
   if ((currentTime - startTimeTwo > interval) && (similarity (art.r, forgery.pr,
                                                            art.g, forgery.pg,
                                                            art.b, forgery.pb) > 50)){
      print("in level 2");
                                                              state = 5;        
    }
}

void levelThree(){
    imageMode(CENTER);
  image(background, 300,300);
  background. resize(900,900);
  
  interval = 20000;
  
   game();
  
  forgery.render();
  
  textSize(25);
  text(("goal : below 20"), 420, 55);
 
  textSize(60);
  text ((interval-(currentTime - startTimeThree))/1000 , 400, 200);

  

 
  currentTime = millis();
  
    if ((currentTime - startTimeThree > interval) && (similarity (art.r, forgery.pr,
                                                            art.g, forgery.pg,
                                                            art.b, forgery.pb) <= 20)) {
      state = 4;
    }
    
     if ((similarity (art.r, forgery.pr, art.g, forgery.pg, art.b, forgery.pb)) <= 20) {                                                     
      state = 4;
    }
    
   if ((currentTime - startTimeTwo > interval) && (similarity (art.r, forgery.pr,
                                                            art.g, forgery.pg,
                                                            art.b, forgery.pb) > 20)){
             print("in level 3");
                                                              state = 5;        
    }
  
  
}

void lose(){
  
   imageMode(CENTER);
  image(jail, 300, 300);
  jail. resize(600,600);
  
  textSize(50);
  fill(255);
  text ("you lose", 240, 580);
}

void game(){
 
  imageMode(CENTER);
  image(frame, 98,145);
  frame. resize(220,220);
  art. render();
  
  red. render();
  green. render();
  blue. render();
  
  forgery. render();
  
  textSize (50);
  text (similarity (art.r, forgery.pr,
                     art.g, forgery.pg,
                     art.b, forgery.pb), 400, 100);
                     
  textSize(25);
  fill(255,0,0);
  text (forgery.pr, 175, 550);
  
  textSize(25);
  fill(0,255,0);
  text (forgery.pg, 275, 550);
  
   textSize(25);
  fill(0,0,255);
  text (forgery.pb, 375, 550);
}
  
  float squareIt(float num){
    return (num * num);
  }
  
  float similarity (float rOne, float rPlayer, 
                    float gOne, float gPlayer, 
                    float bOne, float bPlayer){
    return sqrt( (squareIt( rOne - rPlayer)) + 
                 (squareIt( gOne - gPlayer)) + 
                 (squareIt( bOne - bPlayer)));
}

void win(){
    
     imageMode(CENTER);
  image(money, 300,300);
  money. resize(600,600);
  
    textSize(50);
    fill(255);
    text ("you win!", 20, 100);
}

void reStart(){
  
 startTimeTwo = millis();
 startTimeThree = millis();
 
  
  art = new Art();
  red = new Button(200, 500, 50, color (255,0,0));
  green = new Button(300, 500, 50, color (0,255,0));
  blue = new Button(400, 500, 50, color (0,0,255));
  forgery = new Forgery();

  
}

void inbetween(){ 
  
  imageMode(CENTER);
  image(gallery, 300,300);
  
  fill(255);
  rect(330, 490, 320, 80);
  
  textSize(35);
  fill(0);
  text ("press 'r' to move on", 190, 500);
  
  
  if (key == 'r'){
    
   reStart();  
   state = 2;}
}

void inbetweenTwo(){
  
   imageMode(CENTER);
  image(gallery, 300,300);
  
  fill(255);
  rect(330, 490, 320, 80);
  
  textSize(35);
  fill(0);
  text ("press 's' to move on", 190, 500);
  
  if (key == 's'){
    
   reStart();  
   state = 3;}
}
