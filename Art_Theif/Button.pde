class Button{
  
int x;
  int y;
  int size;
  
  color c;
  
 
  Button(int startingX,int startingY, int startingSize, color startingC){
    
    x = startingX;
    y = startingY;
    size = startingSize;
    
    c =  startingC;
  }
  
   void render() {
     rectMode (CENTER);
    fill(c);
    rect(x, y, size, size);
  }
  
  
  boolean isBetween(int num, int min, int max){
  if (num > min && num < max){
    return true;
  }
  else {
    return false;
  }
 }
  
  boolean isPressed(){
    int left = x - (size/2);
    int right = x + (size/2);
    int top = y - (size/2);
    int bottom = y + (size/2);
    
    if( isBetween(mouseX, left, right) && 
     isBetween( mouseY, top, bottom)){
       return true;
 }
 else{
   return false;
 }
}
  
}
