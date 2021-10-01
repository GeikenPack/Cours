package figure;

//import java.lang.Math;

public class Cercle extends FormeGraphique 
{
	private int rayon;
	
	public Cercle()
	{
		super();
		rayon = 0;
	}
	public Cercle(int pfX, int pfY, int pfRayon)
	{
		super(pfX, pfY);
		this.rayon = pfRayon;
	}
	
	public int getRayon()
	{
		return this.rayon;
	}
	
	public void setRayon(int pfRayon)
	{
		this.rayon = pfRayon;
	}
	
	public double surface()
	{
		return Math.PI * (this.rayon*this.rayon);
	}
	
	public void afficher()
	{
		super.afficher();
		System.out.println("Cercle : Rayon : " + this.rayon);
	}
}
