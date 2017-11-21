int x, y;
int deg = 10;
int matrixDeg = 0;
int a = 1;
boolean rotateWheel = false;
Wheel bigWheel = new Wheel(400, 345, 345);
Wheel smallWheel = new Wheel(100, 120, 495);
Frame frameUp = new Frame(345, 345, 450, 450, PI-PI/12, TWO_PI-PI/2);
Helm helm = new Helm(345, 120, 345, 70, 45, 20);
Saddle saddle = new Saddle(200, 170, 70, 50, 20);

// Setup the Processing Canvas
void setup()
{
  size(560, 560);
  background(#a5e2f4);
  strokeWeight(3);
  frameRate(60);

  x = 0;
  y = 0; 

  // TODO: REFACTOR THIS WITH BICYCLE CLASS
  frameUp.showFrame();  	
  bigWheel.showWheel();
  smallWheel.showWheel();
  frameUp.attachToWheels(bigWheel.centerX, bigWheel.centerY, smallWheel.centerX, smallWheel.centerY, bigWheel.diameter, smallWheel.diameter);
  helm.showHelm();
  saddle.showSaddle();  	
}

// Main draw loop
void draw()
{  
 	if(rotateWheel)
 	{
 		for (int i = 0; i < 36; i++)
		{
			bigWheel.rotateWheel(deg);
			deg += 5;
		}			
	
		for (int i = 0; i < 36; i++)
		{
			smallWheel.rotateWheel(deg);
			deg += 5;
		}

		deg += 2;

		frameUp.attachToWheels(bigWheel.centerX, bigWheel.centerY, smallWheel.centerX, smallWheel.centerY, bigWheel.diameter, smallWheel.diameter);
 	} 
}

void mousePressed()
{
	rotateWheel = !rotateWheel;	
}

void keyPressed()
{
 	if((keyCode == UP) || (keyCode == DOWN) || (keyCode == LEFT) || (keyCode == RIGHT))
 	{
 		moveBicycle();
 	}

 	if((keyCode == ENTER) || (keyCode == ALT))
 	{
 		rotateBicycle();
 	}

 	if ((keyCode == CONTROL) || (keyCode == SHIFT))
 	{
 		changeBicycleSize();
 	}
}

void changeBicycleSize()
{
	if (keyCode == CONTROL)
	{
		if(a > 0)
		{
			a -= 0.1;
		}
		
	}

	if (keyCode == SHIFT)
	{
		a += 0.1;
	}

	fill(#a5e2f4);
    noStroke();
    rect(0, 0, 560, 560);
    stroke(0);

    scale(a);

    frameUp.showFrame();  	
  	bigWheel.showWheel();
  	smallWheel.showWheel();
  	frameUp.attachToWheels(bigWheel.centerX, bigWheel.centerY, smallWheel.centerX, smallWheel.centerY, bigWheel.diameter, smallWheel.diameter);
  	helm.showHelm();
  	saddle.showSaddle();  
}

void rotateBicycle()
{
	if (keyCode == ENTER)
	{
		matrixDeg += 5;
	}
	if (keyCode == ALT)
	{
		matrixDeg -= 5;
	}
	
	fill(#a5e2f4);
    noStroke();
    rect(0, 0, 560, 560);
    stroke(0);

	rotate(matrixDeg);

	frameUp.showFrame();  	
  	bigWheel.showWheel();
  	smallWheel.showWheel();
  	frameUp.attachToWheels(bigWheel.centerX, bigWheel.centerY, smallWheel.centerX, smallWheel.centerY, bigWheel.diameter, smallWheel.diameter);
  	helm.showHelm();
  	saddle.showSaddle();  
}

void moveBicycle()
{
	// В 2D-режиме камера недоступна, так что приходится делать ручками

	int step = 50;

	if (keyCode == UP) 
	{
		y += step;
    }

	if (keyCode == DOWN) 
	{
		y -= step;
    } 

    if (keyCode == LEFT) 
	{
		x -= step;
    }

    if (keyCode == RIGHT) 
	{
		x += step;
    }  
    fill(#a5e2f4);
    noStroke();
    rect(-x, -y, 560, 560);
    stroke(0);

    translate(x, y);    
    
    x = 0;
  	y = 0;

    frameUp.showFrame();  	
  	bigWheel.showWheel();
  	smallWheel.showWheel();
  	frameUp.attachToWheels(bigWheel.centerX, bigWheel.centerY, smallWheel.centerX, smallWheel.centerY, bigWheel.diameter, smallWheel.diameter);
  	helm.showHelm();
  	saddle.showSaddle(); 
}

class Saddle
{
	float attachingPointX, attachingPointY;
	float topPointY;
	float height1, width1;	

	Saddle(attX, attY, sadWidth1, height, sadHeight)
	{
		attachingPointX = attX;
		attachingPointY = attY;
		height1 = sadHeight;
		width1 = sadWidth1;
		topPointY = attY - height;
	}

	void showSaddle()
	{
  		line(attachingPointX, attachingPointY, attachingPointX, topPointY);  			
  		fill(#B7410E);
  		ellipse(attachingPointX, topPointY - height1 / 4, width1, height1);
  		fill(#B7410E);
  		ellipse(attachingPointX - width1 / 3, topPointY - height1 / 2, width1 * 0.7, height1 * 1.4); 
	}
}

class Helm
{
	float attachingPointX, attachingPointY;
	float topPointX, topPointY;
	float helmWidth, helmHeight;

	Helm(attPointX, attPointY, topX, topY, width, height)
	{
		attachingPointX = attPointX;
		attachingPointY = attPointY;
		topPointX = topX;
		topPointY = topY;
		helmWidth = width;
		helmHeight = height;
	}

	void showHelm()
	{
  		line(attachingPointX, attachingPointY, topPointX, topPointY);
  		arc(topPointX, topPointY - helmHeight / 2, helmWidth, helmHeight, PI/2, PI);
  		line(topPointX - helmWidth / 2, topPointY - helmHeight / 2, topPointX - helmWidth / 2 - 40, topPointY - helmHeight / 2);
	}
}

class Wheel 
{
  float diameter, centerX, centerY;

  Wheel(float d, float cX, float cY)
  {
    diameter = d;
    centerX = cX;
    centerY = cY;
  }

  void showWheel()
  {
  	fill(#292929);
  	ellipse(centerX, centerY, diameter + 10, diameter + 10);
  	fill(#a5e2f4);
    ellipse(centerX, centerY, diameter, diameter);
   	degrees = 10;
	
    for (int i = 0; i < 36; i++)
    {
    	pushMatrix();
  		// Нужная точка сетки, относительно которой надо повернуть колесо
  		translate(centerX, centerY);
  		rotate(radians(degrees));
  		line(0, 0, diameter / 2, 0);
  		line(0, 0, -diameter / 2, 0);
  		line(0, 0, 0, diameter / 2);
  		line(0, 0, 0, -diameter / 2);
  		popMatrix();	
  		degrees += 10;
    }  	

    fill(#a5e2f4);
  }

  void rotateWheel(int degrees)
  {  	
  	 // Стираем предыдущие спицы
  	 fill(#a5e2f4);
  	 ellipse(centerX, centerY, diameter, diameter);

  	 // Рисуем новые
  	for (int i = 0; i < 36; i++)
    {
    	pushMatrix();
  		// Нужная точка сетки, относительно которой надо повернуть колесо
  		translate(centerX, centerY);
  		rotate(radians(degrees));
  		line(0, 0, diameter / 2, 0);
  		line(0, 0, -diameter / 2, 0);
  		line(0, 0, 0, diameter / 2);
  		line(0, 0, 0, -diameter / 2);
  		popMatrix();	
  		degrees += 10;
    }
  }
  
}

class Frame 
{
  float centerX, centerY, width, height, start, stop;

  Frame(x, y, w, h, startPoint, endPoint) 
  {
    centerX = x;
    centerY = y;
    width = w;
    height = h;
    start = startPoint;
    stop = endPoint;
  }

  void showFrame()
  {
    fill(#a5e2f4);
    arc(centerX, centerY, width, height, start, stop);        
  }

  void attachToWheels(centerOfBigWheelX, centerOfBigWheelY, centerOfSmallWheelX, centerOfSmallWheelY, diameterOfBigWheel, diameterOfSmallWheel)
  {  	
  	line(centerOfSmallWheelX, centerOfSmallWheelY, centerOfSmallWheelX + 10, centerOfSmallWheelY - 60);
  	line(centerOfSmallWheelX + 10, centerOfSmallWheelY - 60, centerOfSmallWheelX + 7, centerOfSmallWheelY - 95);
  	line(centerOfBigWheelX, centerOfBigWheelY, centerOfBigWheelX, centerOfBigWheelY - diameterOfBigWheel / 2 - 22);
  }
}