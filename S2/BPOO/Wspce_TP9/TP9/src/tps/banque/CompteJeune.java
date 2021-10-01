package tps.banque;

public class CompteJeune extends CompteSecurise
{
	public CompteJeune()
	{
		super();
	}
	
	public CompteJeune(String pfNumCompte, String pfNomProp)
	{
		super(pfNumCompte, pfNomProp, 0);
	}
}
