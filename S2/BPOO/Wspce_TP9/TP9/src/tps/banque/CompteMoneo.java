package tps.banque;

public class CompteMoneo extends Compte
{
	//Numero de la carte Moneo
	private String noCarteMoneo;
	
	public CompteMoneo() 
	{
		super();
		this.noCarteMoneo = "Pas de numéro monéo";
	}
	
	public CompteMoneo(String pfNoCarteMoneo)
	{
		super();
		this.noCarteMoneo = pfNoCarteMoneo;
	}
	
	public CompteMoneo(String pfNumCompte, String pfNomProp, String pfNoCarteMoneo)
	{
		super(pfNumCompte, pfNomProp);
		this.noCarteMoneo = pfNoCarteMoneo;
	}
	
	public String getNoCarteMoneo()
	{
		return this.noCarteMoneo;
	}
	
	public void setNoCarteMoneo(String pfNCarteMoneo)
	{
		this.noCarteMoneo = pfNCarteMoneo;
	}
	
	public void afficher()
	{
		super.afficher();
		System.out.println("Numero de carte moneo :" + this.noCarteMoneo);
	}
}
