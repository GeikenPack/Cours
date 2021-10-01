package tps.banque;

import java.util.*;

import tps.banque.exception.CompteException;

public class CompteDepot extends Compte {
	private ArrayList<Operation> alOperations;

	/**
	 * Constructeur par défaut initialisant le numero à "Pas de numéro" et le propriétaire à "Pas de propriétaire".
	 */
	public CompteDepot() {
		this("Pas de numéro", "Pas de propriétaire");
	}

	/**
	 * Constructeur paramétré
	 * <BR>
	 * Les crédits et débits sont initialisé à 0.
	 * <BR>
	 * @param pfNumCompte Le numéro du compte
	 * @param pfNomProp Le propriétaire du compte
	 */
	public CompteDepot(String pfNumCompte, String pfNomProp) {
		super(pfNumCompte, pfNomProp);
		this.alOperations = new ArrayList<Operation>();
	}

	/**
	 * Affiche un CompteDepot - <B>SPECIAL TP.</B><BR>
	 * <BR>
	 * Affiche super.afficher() et la liste des opérations.<BR>
	 * <BR>
	 * <B>ATTENTION : Méthode spéciale pour les TP.</B><BR>
	 * <BR>
	 */
	@Override
	public void afficher() {
		super.afficher();
		System.out.println("  Les Opérations :");
		for (Operation o : this.alOperations)
			System.out.println("    - " + o.getSens() + " : " + o.getMontant());
	}

	/**
	 * Permet d'effectuer un retrait sur un CompteDepot.<BR>
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
		super.retirer(pfMontant);
		this.alOperations.add(new Operation(SensOperation.DEBIT, pfMontant));
	}

	/**
	 * Permet d'effectuer un dépot sur un CompteDepot.<BR>
	 * <BR>
	 * Effectue un dépot (crédit) d'un montant en Euros sur le Compte.<BR>
	 * Lève une exception si le montant est < 0.<BR>
	 * 
	 * @param pfMontant
	 *            Le montant déposé sur le Compte.
	 * @throws CompteException
	 *             Lorsque montant < 0
	 */
	@Override
	public void deposer(double pfMontant) throws CompteException {
		super.deposer(pfMontant);
		this.alOperations.add(new Operation(SensOperation.CREDIT, pfMontant));
	}

	/**
	 * Retourne sous forme de tableau la liste des opérations effectuées.
	 * <BR>
	 * @return Le tableau des opéations réalisées
	 */
	public Operation[] getOperations() {
		return this.alOperations.toArray(new Operation[0]);
	}
}
