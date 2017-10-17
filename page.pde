// Глобальные переменные
// СДВИНУТЬ ВСЁ ПО КООРДИНАТЕ ИКС, ЧТОБ БЫЛО РОВНО
Wheel bigWheel = new Wheel(400, 345, 345);
Wheel smallWheel = new Wheel(100, 120, 495);
Frame frameUp = new Frame(345, 345, 450, 450, PI-PI/12, TWO_PI-PI/2);

// Setup the Processing Canvas
void setup()
{
  size(550, 550);
  background(#a5e2f4);
  strokeWeight(3);
  frameRate(15);
}

// Main draw loop
void draw()
{    
  frameUp.showFrame();
  bigWheel.showWheel();
  smallWheel.showWheel();

  // Эти линии так-то для рамы.
  // Надо делать так:
  // в раму передаются координаты центров большого и маленького колеса, их диаметры
  // арки рисуются исходя из диаметров и центров
  // линии рисуются исходя из центров и должны всегда попадать в арки
  line(120, 495, 130, 435);
  line(130, 435, 127, 400);
  line(345, 345, 345, 120);

  // Руль, надо создать класс
  // Но вообще годится и для седла
  line(345, 120, 345, 70);
  arc(345, 60, 45, 20, PI/2, PI);
  line(320, 60, 300, 60);
  line(320, 58, 300, 58);
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
    // СДЕЛАТЬ ЦИКЛ ДЛЯ СПИЦ!!!

    fill(#a5e2f4);
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
    arc(centerX, centerY, width, height, start, stop);    
  }
}