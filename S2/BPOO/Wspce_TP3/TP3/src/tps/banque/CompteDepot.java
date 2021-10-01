package tps.banque;

import java.util.*;

import tps.banque.exception.CompteException;

public class CompteDepot extends Compte {
	private ArrayList<Operation> alOperations;

	/**
	 * Constructeur par d�faut initialisant le numero � "Pas de num�ro" et le propri�taire � "Pas de propri�taire".
	 */
	public CompteDepot() {
		this("Pas de num�ro", "Pas de propri�taire");
	}

	/**
	 * Constructeur param�tr�
	 * <BR>
	 * Les cr�dits et d�bits sont initialis� � 0.
	 * <BR>
	 * @param pfNumCompte Le num�ro du compte
	 * @param pfNomProp Le propri�taire du compte
	 */
	public CompteDepot(String pfNumCompte, String pfNomProp) {
		super(pfNumCompte, pfNomProp);
		this.alOperations = new ArrayList<Operation>();
	}

	/**
	 * Affiche un CompteDepot - <B>SPECIAL TP.</B><BR>
	 * <BR>
	 * Affiche super.afficher() et la liste des op�rations.<BR>
	 * <BR>
	 * <B>ATTENTION : M�thode sp�ciale pour les TP.</B><BR>
	 * <BR>
	 */
	@Override
	public void afficher() {
		super.afficher();
		System.out.println("  Les Op�rations :");
		for (Operation o : this.alOperations)
			System.out.println("    - " + o.getSens() + " : " + o.getMontant());
	}

	/**
	 * Permet d'effectuer un retrait sur un CompteDepot.<BR>
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
		super.retirer(pfMontant);
		this.alOperations.add(new Operation(SensOperation.DEBIT, pfMontant));
	}

	/**
	 * Permet d'effectuer un d�pot sur un CompteDepot.<BR>
	 * <BR>
	 * Effectue un d�pot (cr�dit) d'un montant en Euros sur le Compte.<BR>
	 * L�ve une exception si le montant est < 0.<BR>
	 * 
	 * @param pfMontant
	 *            Le montant d�pos� sur le Compte.
	 * @throws CompteException
	 *             Lorsque montant < 0
	 */
	@Override
	public void deposer(double pfMontant) throws CompteException {
		super.deposer(pfMontant);
		this.alOperations.add(new Operation(SensOperation.CREDIT, pfMontant));
	}

	/**
	 * Retourne sous forme de tableau la liste des op�rations effectu�es.
	 * <BR>
	 * @return Le tableau des op�ations r�alis�es
	 */
	public Operation[] getOperations() {
		return this.alOperations.toArray(new Operation[0]);
	}
}
