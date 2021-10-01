package tps.banque;

import tps.banque.exception.CompteException;

public class CompteSecurise extends CompteDepot {
	private double debitAutorise;

	/**
	 * Constructeur par défaut.
	 * <BR>
	 * Initialise les crédits et débits à 0. Initialise le numéro de compte à "Pas de numéro" et le propriétaire à "Pas de propriétaire".
	 */
	public CompteSecurise() {
		this("Pas de numéro", "Pas de propriétaire");
	}

	/**
	 * Constructeur paramétrée.
	 * <BR>
	 * Initialise les débits, crédits et le déit autorisé à 0.
	 * Initialise le numéro de compte a pfNumCompte et le propriétaire à pfNomProp.
	 * <BR> 
	 * @param pfNumCompte
	 * @param pfNomProp
	 */
	public CompteSecurise(String pfNumCompte, String pfNomProp) {
		this(pfNumCompte, pfNomProp, 0);
	}

	/**
	 * Constructeur paramétrée
	 * <BR>
	 * Initialise les débits et crédits à 0.
	 * Initialise le numéro de compte a pfNumCompte, le propriétaire à pfNomProp et le débit autorisé à pfDA.
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
	 * Affiche super.afficher() et le découvert autorisé<BR>
	 * <BR>
	 * <B>ATTENTION : Méthode spéciale pour les TP.</B><BR>
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
	 * @param pfMontant Le montant à retirer
	 * @return true si retrait possible.
	 */
	public boolean isRetraitPossible(double pfMontant) {
		return (this.soldeCompte() - pfMontant >= (-1) * this.debitAutorise);
	}

	/**
	 * Permet d'effectuer un retrait sur un CompteSecurise.<BR>
	 * <BR>
	 * Effectue un retrait (débit) d'un montant en Euros sur le Compte.<BR>
	 * Lève une exception si le montant est < 0. <BR>
	 * 
	 * @param pfMontant
	 *            Le montant retiré sur le Compte.
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