public class Compte 
{

    private String proprietaire;
    private String numCompte;
    private double credits = 0;
    private double debits = 0;
    private int nbDebits = 0;
    private int nbCredits = 0;

    public Compte()
    {
		this.proprietaire = "Pas de Propriétaire";
		this.numCompte = "Pas de numéro";
    }

    public Compte(Compte numCompte, String nomProp)
    {
		this.proprietaire = nomProp;
		this.numCompte = numCompte
    }

    public String getNumCompte()
    {
		return numCompte;
    }

    public String getProprietaire()
    {
		return proprietaire;
    }

    public double soldeCompte()
    {
		return credits - debits;
    }

    public void setPropietaire(String nomProp)
    {
		proprietaire = nomProp;
    }

    public void retirer(double pfMontant) throws CompteException
    {
		if(pfMontant <0) {
			throw new ComtpeException("Montant inférieur a 0");
		}
		debit += pfMontant;
		nbDebits++;
    }

    public void deposer(double pfMontant)throws CompteException
    {
		if(pfMontant <0) {
		throw new CompteException("Montant inférieur a 0");
		}
		credits += pfMontant;
		nbCredits++;
    }

    public String toString()
    {
		return ("Num. : " + numCompte + " - Prop. : " + proprietaire + " - Debit " + debits + " E / Credit " + credits + " E / NbOps " nbDebits + nbCredits);
    }

    public void afficher()
    {
		System.out.println(this.toString());
    }
}

//=============================

public class Compte 
{
    private String proprietaire;
    private String numCompte;
    private double soldeCompte = 0;
    private int nbOperations = 0;

    public Compte()
    {
		this.proprietaire = "Pas de Propriétaire";
		this.numCompte = "Pas de numéro";
    }

    public Compte(Compte numCompte, String nomProp)
    {
		this.proprietaire = nomProp;
		this.numCompte = numCompte
    }

    public String getNumCompte()
    {
		return numCompte;
    }

    public String getProprietaire()
    {
		return proprietaire;
    }

    public double soldeCompte()
    {
		return soldeCompte;
    }

    public void setPropietaire(String nomProp)
    {
		proprietaire = nomProp;
    }

    public void retirer(double pfMontant) throws CompteException
    {
		if(pfMontant <0) 
		{
			throw new ComtpeException("Montant inférieur a 0");
		}
		soldeCompte -= pfMontant;
		nbOperations++;
	}


    public void deposer(double pfMontant)throws CompteException
    {
		if(pfMontant <0) {
			throw new CompteException("Montant inférieur a 0");
		}
		soldeCompte += pfMontant;
		nbOperations++;
    }

    public String toString()
    {
		return ("Num. : " + numCompte + " - Prop. : " + proprietaire + " -Solde du Comtpe : " + soldeCompte + " E / NbOps " nbOperations);
    }

    public void afficher()
    {
		System.out.println(this.toString());
    }
}