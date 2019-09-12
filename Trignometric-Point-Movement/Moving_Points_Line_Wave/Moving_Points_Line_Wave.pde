int columnCount = 16;
int rowCount = 16;

float columnSpacing, rowSpacing;

void setup() {
  size(1000, 1000, P2D);
  background(0);

  columnSpacing = width/(columnCount - 1);
  rowSpacing = height/(rowCount - 1);
  
  stroke(255);
  strokeWeight(3);
}

void draw() {
  background(0);
  for (int rowNumber = 0; rowNumber <= rowCount; rowNumber++) {
    beginShape(LINES);
    vertex(0, rowNumber * rowSpacing);
    for (int columnNumber = 1; columnNumber < columnCount; columnNumber++) {
      stroke((columnNumber*255)/columnCount, 0, (rowNumber*255)/rowCount);
      vertex(((columnNumber - 0.5) * columnSpacing) + oscillateSin(rowNumber, columnSpacing), ((rowNumber - 0.5) * rowSpacing) + oscillateSin(columnNumber, rowSpacing));
      vertex(columnNumber * columnSpacing, rowNumber * rowSpacing);
    }
    endShape();
  }
}

float oscillateSin(int position, float range) {
  return (range/2) * sin(radians((position * rowSpacing) + frameCount));
}

void keyPressed() {
  if (key == 's' || key == 'S') {
    save("Moving_Points_"+year()+"-"+month()+"-"+day()+"_"+hour()+"h"+minute()+"m"+second()+"s_ex.png");
    println("Picture taken.");
  }
}
