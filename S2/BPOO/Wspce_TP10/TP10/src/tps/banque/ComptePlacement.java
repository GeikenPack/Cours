package tps.banque;

public class ComptePlacement extends CompteEpargne
{
	public ComptePlacement(String pfNum, String pfnom, double pfInteret)
	{
		super(pfNum, pfnom, pfInteret);
	}
	
	public void afficher()
	{
		super.afficher();
		System.out.println("Compte Placement");
	}
}
