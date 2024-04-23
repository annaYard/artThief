class Forgery {

  int x;
  int y;
  int d;

  color pc;

  int pr;
  int pg;
  int pb;

  Forgery() {
    x = 400;
    y = 350;
    d = 100;


    pr = 0;
    pg = 0;
    pb = 0;

    pc = color (pr, pg, pb);
  }

  void render() {
    pc = color (pr, pg, pb);
    fill (pc);
    circle(x, y, d);
  }



  void moreRed() {
    if (pr < 255 && pr >= 0) {
      pr = pr + 5;
    }
  }

  void moreGreen() {
    if (pg <= 255 && pg >= 0) {
      pg = pg + 5;
    }
  }

  void moreBlue() {
    if (pb <= 255 && pb >= 0) {
      pb = pb + 5;
    }
  }
}
