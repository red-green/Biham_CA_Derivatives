int w = 600,h = 600;

float fillpct = 36.0;
int speed = 1;

int off = (int)color(0);
int save1 = (int)color(253);
int red = (int)color(255,0,0);
int blue = (int)color(0,100,255);
int green = (int)color(0,255,0);
int yellow = (int)color(255,255,0);

void setup() {
  size(w,h);
  randomfill(fillpct);
  frameRate(1000);
}

void draw() {
  loadPixels();
  for (int frame = 0; frame < speed; frame++) {
    for (int x = width-1; x >= 0; x--) {
      for (int y = height-1; y >= 0; y--) {
        if (getpx(x,y) == red) {
          if (getpx(x+1,y) == off) {
            setpx(x,y,save1);
            setpx(x+1,y,red);
          } else if (getpx(x,y+1) == off) {
            setpx(x,y,save1);
            setpx(x,y+1,red);
          } else if (getpx(x,y-1) == off) {
            setpx(x,y,save1);
            setpx(x,y-1,red);
          }
        }
      }
    }
    for (int i = 0; i < w*h; i++) {
      if(pixels[i] == save1) pixels[i] = off;
    }
    for (int x = 0; x < width; x++) {
      for (int y = 0; y < height; y++) {
        if (getpx(x,y) == blue) {
          if (getpx(x-1,y) == off) {
            setpx(x,y,save1);
            setpx(x-1,y,blue);
          } else if (getpx(x,y-1) == off) {
            setpx(x,y,save1);
            setpx(x,y-1,blue);
          } else if (getpx(x,y+1) == off) {
            setpx(x,y,save1);
            setpx(x,y+1,blue);
          }
        }
      }
    }
    for (int i = 0; i < w*h; i++) {
      if(pixels[i] == save1) pixels[i] = off;
    }
    
    for (int x = width-1; x >= 0; x--) {
      for (int y = height-1; y >= 0; y--) {
        if (getpx(x,y) == green) {
          if (getpx(x,y+1) == off) {
            setpx(x,y,save1);
            setpx(x,y+1,green);
          } else if (getpx(x-1,y) == off) {
            setpx(x,y,save1);
            setpx(x-1,y,green);
          } else if (getpx(x+1,y) == off) {
            setpx(x,y,save1);
            setpx(x+1,y,green);
          }
        }
      }
    }
    for (int i = 0; i < w*h; i++) {
      if(pixels[i] == save1) pixels[i] = off;
    }
    for (int x = 0; x < width; x++) {
      for (int y = 0; y < height; y++) {
        if (getpx(x,y) == yellow) {
          if (getpx(x,y-1) == off) {
            setpx(x,y,save1);
            setpx(x,y-1,yellow);
          } else if (getpx(x+1,y) == off) {
            setpx(x,y,save1);
            setpx(x+1,y,yellow);
          } else if (getpx(x-1,y) == off) {
            setpx(x,y,save1);
            setpx(x-1,y,yellow);
          }
        }
      }
    }
    for (int i = 0; i < w*h; i++) {
      if(pixels[i] == save1) pixels[i] = off;
    } 
  }
  updatePixels();
}

void randomfill(float pct) {
  // pct is 0-100
  background(off);
  loadPixels();
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      if (random(100) < pct) {
        setpx(x,y,(random(1)<0.5?(random(1)<0.5?red:blue):(random(1)<0.5?green:yellow)));
      }
    }
  }
  updatePixels();
}

void setpx(int x, int y, int col) {
  int z = x+y*width;
  z = z % (width*height);
  if (z < 0) z += (width*height);
  pixels[z] = col;
}

int getpx(int x, int y) {
  int z = x+y*width;
  z = z % (width*height);
  if (z < 0) z += (width*height);
  return pixels[z];
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
