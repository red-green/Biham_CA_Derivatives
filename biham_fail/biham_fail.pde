int w = 700, h = 700;

float fillpct = 36.0;
int speed = 1;

int off = (int)color(255);
int red = (int)color(255,0,0);
int blue = (int)color(0,0,255);

void setup() {
  size(w,h);
  randomfill(fillpct);
  frameRate(60);
}

void draw() {
  loadPixels();
  int nx,ny;
  for (int frame = 0; frame < speed; frame++) {
    for (int x = width-1; x >= 0; x--) {
      for (int y = height-1; y >= 0; y--) {
        nx = x+1;
        if (nx >= width) nx = 0;
        if (getpx(x,y) == red && getpx(nx,y) == off) {
          setpx(x,y,off);
          setpx(nx,y,red);
        }
      }
    }
    for (int x = width-1; x >= 0; x--) {
      for (int y = height-1; y >= 0; y--) {
        ny = y+1;
        if (ny >= height) ny = 0;
        if (getpx(x,y) == blue && getpx(x,ny) == off) {
          setpx(x,y,off);
          setpx(x,ny,blue);
        }
      }
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
  pixels[x+y*height] = col;
}

int getpx(int x, int y) {
  return pixels[x+y*height];
}

void keyPressed() {
  if (key==' ') {
    randomfill(fillpct);
  }
}
