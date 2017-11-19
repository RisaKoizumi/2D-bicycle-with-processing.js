int x, y;
Wheel bigWheel = new Wheel(400, 235, 215);
Wheel smallWheel = new Wheel(100, 120, 495);


void setup()
{
  size(550, 550);
  //background(#a5e2f4);
  strokeWeight(3);
  frameRate(30);

  x = width/2;
  y = height/2;

  bigWheel.loadWheel();
}

void draw()
{
	bigWheel.drawWheel();
}

void mousePressed()
{
	bigWheel.rotateWheel(30);
}

class Wheel 
{
  float diameter, centerX, centerY;
  PShape wheelImage;

  Wheel(float d, float cX, float cY)
  {
    diameter = d;
    centerX = cX;
    centerY = cY;
  }

  void loadWheel()
  {    
    wheelImage = loadShape("radial.svg");  
    smooth();
  }

  void drawWheel()
  {  	
    shape(wheelImage, centerX, centerY);  
  }

  void wheelResize(float scale)
  {
  	diameter *= scale;
  	loadWheel();
  }

  void rotateWheel(float angle)
  {
  	translate(0, diameter);
  	wheelImage.rotate(radians(angle));
  }
  
}