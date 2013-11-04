//import gab.opencv.*;

//OpenCV opencv;
PImage img;
color[] vividColors = 
  {#FB6086, #F7ECF0, #73D6E5, #FB0006, #FFFFFF, 
   #F3FF0B, #FB007A, #F8FFE3, #F5CBEA, #FEFAEE,
   #94C526, #CD781A, #46D3E5, #2AAC1C, #F29C96,
   #E6C645, #FA0462, #1440E0, #DEB18B, #41B7C7};

color[] imgColors = new color[4];
color[] selectedColors = new color[4];
int colorIndex = 0;
String indexStr = "02";

void setup() {  
  img = loadImage("em_" + indexStr + ".png");
  size(img.width, img.height, P2D);
  
  for(int i = 0; i < vividColors.length; i++) {
    println("(" + red(vividColors[0]) + "," + green(vividColors[0]) + "," + blue(vividColors[0]) + ")");  
  }
  
  img.loadPixels();
  for(int y = 0; y < img.height; y++) {
    for(int x = 0; x < img.width; x++) {
      int i = x + y*width;
      if (colorIndex == 0) {
        imgColors[colorIndex] = img.pixels[i];
        vividColors[colorIndex] = vividColors[int(random(vividColors.length))];
        img.pixels[i] = vividColors[colorIndex];
        colorIndex++;
      } else {
        boolean isMatched = false;
        
        for(int k = 0; k < colorIndex; k++) {
          if (imgColors[k] == img.pixels[i]) {
            img.pixels[i] = vividColors[k];
            isMatched = true;
            break;
          }
        }
        
        if (!isMatched) {
          imgColors[colorIndex] = img.pixels[i];
          color randomColor = vividColors[int(random(vividColors.length))];
          boolean isDiff = true;
          while(true) {
            for (int k = 0; k < colorIndex; k++) {
              if (randomColor == vividColors[k]) {
                isDiff = false;
                break;
              }
            }
            
            if(isDiff) {
              vividColors[colorIndex] = randomColor;
              break;
            } else {
              randomColor = vividColors[int(random(vividColors.length))];
              isDiff = true;
            }
          }
//          vividColors[colorIndex] = vividColors[int(random(vividColors.length))];
          img.pixels[i] = vividColors[colorIndex];
          colorIndex++;
        }
      }
    }
  }
  img.updatePixels();
  
  image(img, 0, 0);
//  save("vivid/vivid_" + indexStr + ".png");
}

void draw() {
}
