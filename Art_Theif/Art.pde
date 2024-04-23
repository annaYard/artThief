class Art{
  
  int x;
  int y;
  int d;
  
  color c;
  
  float r;
  float g;
  float b;
  
  Art(){
    x = 100;
    y = 150;
    d = 100;
    
    r = random(0,255);
    g = random(0,255);
    b = random(0,255);
    
    c = color (r, g, b);
    
  }
  
  void render() {
    fill (c);
    circle(x,y,d);
  }
  
}
