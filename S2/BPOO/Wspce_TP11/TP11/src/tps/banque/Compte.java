package tps.banque;

import java.io.Serializable;

import javax.swing.JOptionPane;

import application.Displayable;
import application.GraphicallyDisplayable;
import tps.banque.exception.CompteException;

/************************************************************
 * Classe Compte permettant de gérer des comptes simples.<BR>
 * Un Compte a un numéro, appartient à un propriétaire et on peut y faire des
 * versements (crédits) et des retraits (débits).<BR>
 * Seuls des contrôles de montants des opérations >=0 sont réalisés.<BR>
 * 
 * @author André Péninou.
 * @version 3.01
 *****************************/

// Classe des comptes standards

@SuppressWarnings("unused")
public class Compte extends Object implements Displayable, GraphicallyDisplayable 
// Si cet héritage n'est pas précisé, il est implicite
{
	/*********************************
	 * Partie privée d'implémentation
	 **********************************/

	// Attributs

	// Nom du propriétaire
	private String proprietaire;

	// Numero de Compte
	private String numCompte;

	// Attributs debit et credit
	// Permettent de comptabiliser depots et retraits
	private double debits, credits;

	// Nb Opérations
	private int nbDebits, nbCredits;

	// Constructeurs

	/**
	 * Constructeur non paramétré, appelé aussi constructeur "par défaut".<BR>
	 * <BR>
	 * Permet de créer un Compte.<BR>
	 * Les crédits et débits sont initialisés à 0. le numéro est initialisé à
	 * "Pas de numéro", le propriétaire à "Pas de propriétaire"<BR>
	 * <BR>
	 * 
	 * @see Compte#Compte(String, String)
	 */
	public Compte() {
		this("Pas de numéro", "Pas de propriétaire");
	}

	/**
	 * Constructeur paramétré.<BR>
	 * <BR>
	 * Permet de créer un Compte en donnant son numéro et son propriétaire.<BR>
	 * Les crédits et débits sont initialisés à 0.<BR>
	 * <BR>
	 * 
	 * @param pfNumCompte
	 *            Le numéro du Compte.
	 * @param pfNomProp
	 *            Le nom du propriétaire.
	 */
	public Compte(String pfNumCompte, String pfNomProp) {
		this.numCompte = pfNumCompte;
		this.proprietaire = pfNomProp;
		this.debits = 0;
		this.credits = 0;
		this.nbCredits = 0;
		this.nbDebits = 0;
	}

	/**
	 * Permet d'obtenir le solde d'un Compte.<BR>
	 * <BR>
	 * 
	 * @return Le solde du Compte.
	 */
	public double soldeCompte() {
		return this.credits - this.debits;
	}

	/**
	 * Permet d'obtenir le propriétaire d'un Compte.<BR>
	 * <BR>
	 * 
	 * @see Compte#setProprietaire(String)
	 * @return Le propriétaire du Compte.
	 */
	public String getProprietaire() {
		return this.proprietaire;
	}

	/**
	 * Permet d'obtenir le numéro d'un Compte.<BR>
	 * <BR>
	 * 
	 * @return Le numéro du Compte.
	 */
	public String getNumCompte() {
		return this.numCompte;
	}

	/**
	 * Affiche un Compte - <B>SPECIAL TP.</B><BR>
	 * <BR>
	 * Affiche this.toString()<BR>
	 * <BR>
	 * <B>ATTENTION : Méthode spéciale pour les TP.</B><BR>
	 * <BR>
	 */
	public void afficher() {
		System.out.println(this.toString());
	}

	/**
	 * Permet d'obtenir la représentation String d'un compte.<BR>
	 * <BR>
	 * Construit une chaine contenant le numéro de compte, le propriétaire, le
	 * total des débits, le total des crédits, le nombre d'opérations réalisées.<BR>
	 * "  Num. : aaa  - Prop. : bbb - Debit xxx E / Credit yyy E / NbOps zzz"<BR>
	 * <BR>
	 */
	public String toString() {
		return "  Num. : " + this.numCompte + " - Prop. : " + this.proprietaire
				+ " - Debit " + this.debits + " E / Credit " + this.credits
				+ " E / NbOps " + (this.nbCredits + this.nbDebits);
	}

	// Methodes de mise a jour

	/**
	 * Permet d'effectuer un retrait sur un Compte.<BR>
	 * <BR>
	 * Effectue un retrait (débit) d'un montant en Euros sur le Compte.<BR>
	 * Lève une exception si le montant est < 0. <BR>
	 * 
	 * @param pfMontant
	 *            Le montant retiré sur le Compte.
	 * @throws CompteException
	 *             Lorsque montant < 0
	 * @see Compte#deposer(double)
	 */
	public void retirer(double pfMontant) throws CompteException {
		if (pfMontant < 0) {
			throw new CompteException(
					"Erreur de somme négative lors d'un retrait sur " + this.numCompte);
		}
		this.debits = this.debits + pfMontant;
		this.nbDebits++;
	}

	/**
	 * Permet d'effectuer un dépot sur un Compte.<BR>
	 * <BR>
	 * Effectue un dépot (crédit) d'un montant en Euros sur le Compte.<BR>
	 * Lève une exception si le montant est < 0.<BR>
	 * 
	 * @param pfMontant
	 *            Le montant déposé sur le Compte.
	 * @throws CompteException
	 *             Lorsque montant < 0
	 * @see Compte#retirer(double)
	 */
	public void deposer(double pfMontant) throws CompteException {
		if (pfMontant < 0) {
			throw new CompteException(
					"Erreur de somme négative lors d'un dépot sur " + this.numCompte);
		}
		this.credits = this.credits + pfMontant;
		this.nbCredits++;
	}

	/**
	 * Permet de modifier le propriétaire d'un Compte.<BR>
	 * <BR>
	 * 
	 * @param pfNomProp
	 *            Le nom du propriétaire.
	 * @see Compte#getProprietaire()
	 */
	public void setProprietaire(String pfNomProp) {
		this.proprietaire = pfNomProp;
	}

	public void displayObject()
	{
		this.afficher();
	}
	
	public void graphicallyDisplayObject()
	{
		JOptionPane.showMessageDialog(null, this.toString());
	}
}
