package tps.banque;

public class CompteBancaire extends CompteSecurise
{
	private String noCarteJ;
	
	public CompteBancaire()
	{
		super();
		this.noCarteJ = "Pas de numéro CJ";
	}
	
	public CompteBancaire(String pfNumCompte, String pfNomProp, String pfNoCarteJisa)
	{
		super(pfNumCompte, pfNomProp);
		this.noCarteJ = pfNoCarteJisa;
	}
	
	public CompteBancaire(String pfNumCompte, String pfNomProp, String pfNoCarteJisa, double pfDA)
	{
		super(pfNumCompte, pfNomProp, pfDA);
		this.noCarteJ = pfNoCarteJisa;
	}
	
	public String getNumCarteJisa()
	{
		return this.noCarteJ;
	}
	
	public void setNumCarteJisa(String pfNoCarteJisa)
	{
		this.noCarteJ = pfNoCarteJisa;
	}
	
	public void afficher()
	{
		super.afficher();
		System.out.println("Numero de carte Jisa : " + this.noCarteJ);
	}
}
