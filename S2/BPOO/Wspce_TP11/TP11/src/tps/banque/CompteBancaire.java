package tps.banque;

public class CompteBancaire extends CompteSecurise {

	// Attribut numero de carte JISA
	private String numCJ;

	// Constructeurs
	public CompteBancaire() // Constructeur par d?faut
	{
		this("Pas de num?ro", "Pas de propri?taire", "Pas de num?ro CJ");
	}

	public CompteBancaire(String pfNumCompte, String pfNomProp,
			String pNoCarteJisa) {
		this(pfNumCompte, pfNomProp, pNoCarteJisa, 0);
	}

	public CompteBancaire(String pfNumCompte, String pfNomProp,
			String pNoCarteJisa, double pDA) {
		super(pfNumCompte, pfNomProp, pDA);
		this.numCJ = pNoCarteJisa;
	}

	// Methodes de consultation

	// Numero de carte JISA
	public String getNumCarteJisa() {
		return this.numCJ;
		// Les objets String ?tant non modifiables
		// l'appelant ne pourra pas modifier la chaine
		// donc inutile de faire une copie ...
	}

	// Affichage d'un compte bancaire
	@Override
	public void afficher() {
		super.afficher();
		System.out.println("  Num?ro carte JISA : " + this.numCJ);
	}

	public void setNumCarteJisa(String pfNoCarteJisa) {
		this.numCJ = pfNoCarteJisa;
	}

} // Fin Classe CompteBancaire

