package figure;

//import java.lang.Math;

public class Sphere extends Cercle
{	
	public Sphere()
	{
		super();
	}
	
	public Sphere(int pfX, int pfY, int pfRayon)
	{
		super(pfX, pfY, pfRayon);
	}
	/*
	public double surface()
	{
		return 4 * Math.PI * (this.getRayon()*this.getRayon());
	}
	
	public double volume()
	{
		return (4 * Math.PI * (this.getRayon() * this.getRayon() * this.getRayon())) / 3; 
	}
	*/
	public double surface()
	{
		return 4 * super.surface();
	}
	
	public double volume()
	{
		return (4 * super.surface() * this.getRayon()) / 3;
	}
	
	public void afficher()
	{
		super.afficher();
		System.out.println("Sphere : Rayon Sphere : " + this.getRayon());
	}
}
