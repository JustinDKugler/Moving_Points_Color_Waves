int columnCount = 16;
int rowCount = 16;

float columnSpacing, rowSpacing;
float theta;

void setup() {
  //size(1000, 1000, P2D);
  fullScreen();
  frameRate(60);
  background(0);

  columnSpacing = width/(columnCount);
  rowSpacing = height/(rowCount);

  stroke(255);
  strokeWeight(3);
}

void draw() {
  background(0);
  theta = radians(frameCount);
  for (int rowNumber = 1; rowNumber < rowCount; rowNumber++) {
    beginShape();
    for (int columnNumber = 1; columnNumber < columnCount; columnNumber++) {
      stroke(columnNumber*255/columnCount, 0, 255 - (rowNumber*255/rowCount));
      vertex((columnNumber - 0.5) * columnSpacing, (rowNumber - 0.5) * rowSpacing);
      
      stroke(0, 255 - (rowNumber*255/rowCount), columnNumber*255/columnCount);
      vertex((columnNumber + 0.3) * columnSpacing, (rowNumber + 0.3) * rowSpacing);
    }
    endShape();
  }
}

void keyPressed() {
  if (key == 's' || key == 'S') {
    save("Moving_Points_"+year()+"-"+month()+"-"+day()+"_"+hour()+"h"+minute()+"m"+second()+"s_ex.png");
    println("Picture taken.");
  }
}
