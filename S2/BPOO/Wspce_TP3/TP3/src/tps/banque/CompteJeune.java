package tps.banque;

public class CompteJeune extends CompteSecurise {
	// Constructeurs
	public CompteJeune() // Constructeur par d�faut
	{
		this("Pas de num�ro", "Pas de propri�taire");
	}

	public CompteJeune(String pfNumCompte, String pfNomProp) {
		super(pfNumCompte, pfNomProp);
	}

	@Override
	public void afficher() {
		System.out.println("Compte Jeune");
		super.afficher();
	}
} // Fin Classe CompteJeune
