class Wheel 
{
	float diameter, centerX, centerY;

	Wheel(float d, float cX, float cY)
	{
		radius = d;
		centerX = cX;
		centerY = cY;
	}

	void showWheel()
	{
		ellipse(centerX, centerY, d, d);
	}
}