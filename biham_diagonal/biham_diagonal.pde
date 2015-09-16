int w = 700, h = 700;

float fillpct = 36.0;
int speed = 1;

int off = (int)color(255);
int save2 = (int)color(254);
int save1 = (int)color(253);
int red = (int)color(255,0,0);
int blue = (int)color(0,0,255);

void setup() {
  size(w,h);
  randomfill(fillpct);
  frameRate(100);
}

void draw() {
  loadPixels();
  for (int frame = 0; frame < speed; frame++) {
    for (int x = width-1; x >= 0; x--) {
      for (int y = height-1; y >= 0; y--) {
        if (getpx(x,y) == red && getpx((x+1)%width,(y+1)%height) == off) {
          setpx(x,y,save1);
          setpx((x+1)%width,(y+1)%height,red);
        }
      }
    }
    for (int i = 0; i < w*h; i++) {
      if(pixels[i] == save1) pixels[i] = save2;
      if(pixels[i] == save2) pixels[i] = off;
    }
    for (int x = width-1; x >= 0; x--) {
      for (int y = height-1; y >= 0; y--) {
        if (getpx(x,y) == blue && getpx((x-1)%width,(y+1)%height) == off) {
          setpx(x,y,save1);
          setpx((x-1)%width,(y+1)%height,blue);
        }
      }
    }
    for (int i = 0; i < w*h; i++) {
      if(pixels[i] == save1) pixels[i] = save2;
      if(pixels[i] == save2) pixels[i] = off;
    }
  }
  updatePixels();
}

void randomfill(float pct) {
  // pct is 0-100
  background(255);
  loadPixels();
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      if (random(100) < pct) {
        setpx(x,y,(random(1)<0.5?red:blue));
      }
    }
  }
  updatePixels();
}

void setpx(int x, int y, int col) {
  if (x<0) x = width-1;
  pixels[x+y*width] = col;
}

int getpx(int x, int y) {
  if (x<0) x = width-1;
  return pixels[x+y*width];
}

void keyPressed() {
  if (key==' ') {
    randomfill(fillpct);
  }
  if (key=='=') speed+=5;
  if (key=='-') {
    speed-=5;
    if (speed<1) speed = 1;
  }
  if (key=='[') {
    fillpct+=1;
    randomfill(fillpct);
  }
  if (key==']') {
    fillpct-=1;
    randomfill(fillpct);
  }
}
