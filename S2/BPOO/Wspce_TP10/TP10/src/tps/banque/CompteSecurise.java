package tps.banque;

import tps.banque.exception.CompteException;

public abstract class CompteSecurise extends CompteDepot
{
	private double decouvert;
	
	public CompteSecurise()
	{
		super();
		this.decouvert = 0;
	}
	
	public CompteSecurise(String pfNumCompte, String pfNomProp)
	{
		super(pfNumCompte, pfNomProp);
		this.decouvert = 0;
	}
	
	public CompteSecurise(String pfNumCompte, String pfNomProp, double pfDA)
	{
		super(pfNumCompte, pfNomProp);
		if (pfDA < 0)
			this.decouvert = 0;
		else
			this.decouvert = pfDA;
	}
	
	public boolean isRetraitPossible(double pfMontant)
	{
		return !((this.soldeCompte() - pfMontant) < (0 - this.decouvert));
	}
	
	public void retirer(double pfMontant) throws CompteException
	{
		if (!this.isRetraitPossible(pfMontant))
			throw new CompteException("Retrait impossible, decouvert max atteint si debit effectuer");
		try
		{
			super.retirer(pfMontant);
		}
		catch(Exception ce) {ce.printStackTrace();}
	}
	
	public void afficher()
	{
		super.afficher();
		System.out.println("Decouvert autoriser : " + this.decouvert);
	}
}
