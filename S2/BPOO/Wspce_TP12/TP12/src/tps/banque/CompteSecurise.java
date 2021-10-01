package tps.banque;

import tps.banque.exception.CompteException;

public class CompteSecurise extends CompteDepot {
	private double debitAutorise;

	/**
	 * Constructeur par d�faut.
	 * <BR>
	 * Initialise les cr�dits et d�bits � 0. Initialise le num�ro de compte � "Pas de num�ro" et le propri�taire � "Pas de propri�taire".
	 */
	public CompteSecurise() {
		this("Pas de num�ro", "Pas de propri�taire");
	}

	/**
	 * Constructeur param�tr�e.
	 * <BR>
	 * Initialise les d�bits, cr�dits et le d�it autoris� � 0.
	 * Initialise le num�ro de compte a pfNumCompte et le propri�taire � pfNomProp.
	 * <BR> 
	 * @param pfNumCompte
	 * @param pfNomProp
	 */
	public CompteSecurise(String pfNumCompte, String pfNomProp) {
		this(pfNumCompte, pfNomProp, 0);
	}

	/**
	 * Constructeur param�tr�e
	 * <BR>
	 * Initialise les d�bits et cr�dits � 0.
	 * Initialise le num�ro de compte a pfNumCompte, le propri�taire � pfNomProp et le d�bit autoris� � pfDA.
	 * <BR>
	 * @param pfNumCompte
	 * @param pfNomProp
	 * @param pfDA
	 */
	public CompteSecurise(String pfNumCompte, String pfNomProp, double pfDA) {
		super(pfNumCompte, pfNomProp);
		this.debitAutorise = pfDA;
	}

	/**
	 * Affiche un CompteSecurise - <B>SPECIAL TP.</B><BR>
	 * <BR>
	 * Affiche super.afficher() et le d�couvert autoris�<BR>
	 * <BR>
	 * <B>ATTENTION : M�thode sp�ciale pour les TP.</B><BR>
	 * <BR>
	 */
	@Override
	public void afficher() {
		super.afficher();
		System.out.println("  Decouvert autorise : " + this.debitAutorise);
	}

	/**
	 * Retourne true si un retrait est possible.
	 * <BR
	 * @param pfMontant Le montant � retirer
	 * @return true si retrait possible.
	 */
	public boolean isRetraitPossible(double pfMontant) {
		return (this.soldeCompte() - pfMontant >= (-1) * this.debitAutorise);
	}

	/**
	 * Permet d'effectuer un retrait sur un CompteSecurise.<BR>
	 * <BR>
	 * Effectue un retrait (d�bit) d'un montant en Euros sur le Compte.<BR>
	 * L�ve une exception si le montant est < 0. <BR>
	 * 
	 * @param pfMontant
	 *            Le montant retir� sur le Compte.
	 * @throws CompteException
	 *             Lorsque montant < 0
	 */
	@Override
	public void retirer(double pfMontant) throws CompteException {
		if (!this.isRetraitPossible(pfMontant)) {
			throw new CompteException("Retrait de : "+ pfMontant
					+ " impossible sur "+this.getNumCompte());
		}
		super.retirer(pfMontant);
	}
}