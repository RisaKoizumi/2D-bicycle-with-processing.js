// СДВИНУТЬ ВСЁ ПО КООРДИНАТЕ ИКС, ЧТОБ БЫЛО РОВНО
int x, y;
int deg = 10;
float coefficientCos, coefficientSin; 
Wheel bigWheel = new Wheel(400, 345, 345);
Wheel smallWheel = new Wheel(100, 120, 495);
Frame frameUp = new Frame(345, 345, 450, 450, PI-PI/12, TWO_PI-PI/2);
Helm helm = new Helm(345, 120, 345, 70, 45, 20);
Saddle saddle = new Saddle(200, 170, 70, 50, 20);

// Setup the Processing Canvas
void setup()
{
  size(550, 550);
  background(#a5e2f4);
  strokeWeight(3);
  frameRate(60);

  x = width/2;
  y = height/2;  

  frameUp.showFrame();
  frameUp.attachToWheels(bigWheel.centerX, bigWheel.centerY, smallWheel.centerX, smallWheel.centerY, bigWheel.diameter, smallWheel.diameter);
  bigWheel.showWheel();
  smallWheel.showWheel();
  helm.showHelm();
  saddle.showSaddle();
}

// Main draw loop
void draw()
{  
  
}


// TODO: FULL CYCLE
// TODO: IF RIGHT - GEG PLUS, ELSE DEG MINUS
void mousePressed()
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

	deg += 5;

	frameUp.attachToWheels(bigWheel.centerX, bigWheel.centerY, smallWheel.centerX, smallWheel.centerY, bigWheel.diameter, smallWheel.diameter);
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
		//200, 170, 50, 50
		//Седло, которое тоже без класса, а надо бы
  		line(attachingPointX, attachingPointY, attachingPointX, topPointY);	
  		// 85 width, 20 - height
  		// 110
  		ellipse(attachingPointX, topPointY - height1 / 4, width1, height1);
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
  		//line(0, 0, 0, -diameter / 2);
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
  		//line(0, 0, 0, -diameter / 2);
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