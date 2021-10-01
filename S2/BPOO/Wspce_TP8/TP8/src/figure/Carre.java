package figure;

public class Carre extends Rectangle
{	
	public Carre()
	{
		super();
	}
	
	public Carre(int pfX, int pfY, int pfCote)
	{
		super(pfX, pfY, pfCote, pfCote);
	}
	
	public int getCote()
	{
		return this.getLargeur();
	}
	
	public void setLargeur(int pfLargeur)
	{
		this.setCote(pfLargeur);
	}
	public void setLongueur(int pfLargeur)
	{
		this.setCote(pfLargeur);
	}
	
	public void setCote(int pfCote)
	{
		this.setLargeur(pfCote);
		this.setLongueur(pfCote);
	}
	
	public void afficher()
	{
		super.afficher();
		System.out.println("Carre : Cote : " + this.getLargeur());
	}
}
