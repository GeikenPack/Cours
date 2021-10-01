package tps.banque;

import tps.banque.exception.*;

public class CompteEpargne extends CompteDepot
{
	private double interet;
	
	public CompteEpargne()
	{
		super();
		this.interet = 0.0;
	}
	
	public CompteEpargne(String pfNumCompte, String pfNomProp, double pfTxInterets)
	{
		super(pfNumCompte, pfNomProp);
		this.interet = pfTxInterets;
	}
	
	public double getTauxInterets()
	{
		return this.interet;
	}
	
	public double interetsCompte()
	{
		if (this.interet > 0 && this.interet < 10 && super.soldeCompte() >= 0)
			return super.soldeCompte() * this.interet / 100;
		return 0;
	}
	
	public void ajouterInterets()
	{
		try
		{
			this.deposer(interetsCompte());
		}
		catch(CompteException ce) {ce.printStackTrace();};
	}
	
	public void afficher()
	{
		super.afficher();
		System.out.println("Taux d'interets : " + this.interet + " Interets : " + this.interetsCompte());
	}
}
