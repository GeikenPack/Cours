public class Point
{
	private float x, y , rho, theta;
	
	Point(float x, y, rho, theta)
	{}
	
	public void translate()
	{}
	
	public void rotate()
	{}
	
	public void scale()
	{}
	
	public float getCoordX()
	{
		return x;
	}
	
	public float getCoordY()
	{
		return y;
	}
}

public class Ligne
{
	private Point p1, p2;
	
	Ligne()
	{}
	
	public Point getP1()
	{
		return p1;
	}
	
	public Point getP2()
	{
		return p2;
	}
	
	public void translate()
	{}
	
	public void rotate()
	{}
}