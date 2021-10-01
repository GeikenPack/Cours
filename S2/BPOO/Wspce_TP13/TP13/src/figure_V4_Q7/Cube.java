package figure_V4_Q7;

public class Cube extends Carre
{
	public Cube()
	{
		super();
	}
	
	public Cube(int pfX, int pfY, int pfCote)
	{
		super(pfX, pfY, pfCote);
	}
	
	public double surface()
	{
		return 6 * super.surface();
	}
	
	public double volume () {
		return this.getCote()*super.surface();
	}
	
	public void afficher() {
		super.afficher();
		System.out.println("Cube");
	}
	
	public double surfaceSurLaHauteur()
	{
		return 4 * super.surface();
	}
	
	public double diagonaleCube()
	{
		return this.getCote() * Math.sqrt(3);
	}
	
	public int getHauteur()
	{
		return this.getCote();
	}
	
	public void setHauteur(int pfHauteur)
	{
		this.setCote(pfHauteur);
	}
}
