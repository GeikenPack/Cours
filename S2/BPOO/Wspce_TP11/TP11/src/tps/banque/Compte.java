package tps.banque;

import java.io.Serializable;

import javax.swing.JOptionPane;

import application.Displayable;
import application.GraphicallyDisplayable;
import tps.banque.exception.CompteException;

/************************************************************
 * Classe Compte permettant de g�rer des comptes simples.<BR>
 * Un Compte a un num�ro, appartient � un propri�taire et on peut y faire des
 * versements (cr�dits) et des retraits (d�bits).<BR>
 * Seuls des contr�les de montants des op�rations >=0 sont r�alis�s.<BR>
 * 
 * @author Andr� P�ninou.
 * @version 3.01
 *****************************/

// Classe des comptes standards

@SuppressWarnings("unused")
public class Compte extends Object implements Displayable, GraphicallyDisplayable 
// Si cet h�ritage n'est pas pr�cis�, il est implicite
{
	/*********************************
	 * Partie priv�e d'impl�mentation
	 **********************************/

	// Attributs

	// Nom du propri�taire
	private String proprietaire;

	// Numero de Compte
	private String numCompte;

	// Attributs debit et credit
	// Permettent de comptabiliser depots et retraits
	private double debits, credits;

	// Nb Op�rations
	private int nbDebits, nbCredits;

	// Constructeurs

	/**
	 * Constructeur non param�tr�, appel� aussi constructeur "par d�faut".<BR>
	 * <BR>
	 * Permet de cr�er un Compte.<BR>
	 * Les cr�dits et d�bits sont initialis�s � 0. le num�ro est initialis� �
	 * "Pas de num�ro", le propri�taire � "Pas de propri�taire"<BR>
	 * <BR>
	 * 
	 * @see Compte#Compte(String, String)
	 */
	public Compte() {
		this("Pas de num�ro", "Pas de propri�taire");
	}

	/**
	 * Constructeur param�tr�.<BR>
	 * <BR>
	 * Permet de cr�er un Compte en donnant son num�ro et son propri�taire.<BR>
	 * Les cr�dits et d�bits sont initialis�s � 0.<BR>
	 * <BR>
	 * 
	 * @param pfNumCompte
	 *            Le num�ro du Compte.
	 * @param pfNomProp
	 *            Le nom du propri�taire.
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
	 * Permet d'obtenir le propri�taire d'un Compte.<BR>
	 * <BR>
	 * 
	 * @see Compte#setProprietaire(String)
	 * @return Le propri�taire du Compte.
	 */
	public String getProprietaire() {
		return this.proprietaire;
	}

	/**
	 * Permet d'obtenir le num�ro d'un Compte.<BR>
	 * <BR>
	 * 
	 * @return Le num�ro du Compte.
	 */
	public String getNumCompte() {
		return this.numCompte;
	}

	/**
	 * Affiche un Compte - <B>SPECIAL TP.</B><BR>
	 * <BR>
	 * Affiche this.toString()<BR>
	 * <BR>
	 * <B>ATTENTION : M�thode sp�ciale pour les TP.</B><BR>
	 * <BR>
	 */
	public void afficher() {
		System.out.println(this.toString());
	}

	/**
	 * Permet d'obtenir la repr�sentation String d'un compte.<BR>
	 * <BR>
	 * Construit une chaine contenant le num�ro de compte, le propri�taire, le
	 * total des d�bits, le total des cr�dits, le nombre d'op�rations r�alis�es.<BR>
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
	 * Effectue un retrait (d�bit) d'un montant en Euros sur le Compte.<BR>
	 * L�ve une exception si le montant est < 0. <BR>
	 * 
	 * @param pfMontant
	 *            Le montant retir� sur le Compte.
	 * @throws CompteException
	 *             Lorsque montant < 0
	 * @see Compte#deposer(double)
	 */
	public void retirer(double pfMontant) throws CompteException {
		if (pfMontant < 0) {
			throw new CompteException(
					"Erreur de somme n�gative lors d'un retrait sur " + this.numCompte);
		}
		this.debits = this.debits + pfMontant;
		this.nbDebits++;
	}

	/**
	 * Permet d'effectuer un d�pot sur un Compte.<BR>
	 * <BR>
	 * Effectue un d�pot (cr�dit) d'un montant en Euros sur le Compte.<BR>
	 * L�ve une exception si le montant est < 0.<BR>
	 * 
	 * @param pfMontant
	 *            Le montant d�pos� sur le Compte.
	 * @throws CompteException
	 *             Lorsque montant < 0
	 * @see Compte#retirer(double)
	 */
	public void deposer(double pfMontant) throws CompteException {
		if (pfMontant < 0) {
			throw new CompteException(
					"Erreur de somme n�gative lors d'un d�pot sur " + this.numCompte);
		}
		this.credits = this.credits + pfMontant;
		this.nbCredits++;
	}

	/**
	 * Permet de modifier le propri�taire d'un Compte.<BR>
	 * <BR>
	 * 
	 * @param pfNomProp
	 *            Le nom du propri�taire.
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
