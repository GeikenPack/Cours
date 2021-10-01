package main;

import java.util.Locale;
import java.util.Scanner;

import tps.banque.AgenceBancaire;
import tps.banque.Compte;
import tps.banque.exception.ABCompteDejaExistantException;
import tps.banque.exception.ABCompteInexistantException;
import tps.banque.exception.ABCompteNullException;
import tps.banque.exception.CompteException;

public class ClasseApplicationAgenceBancaire {
	
	/**
	 * Affichage du menu de l'application
	 * @param pfAg	AgenceBancaire pour r�cup�rer le nom et la localisation
	 */
	public static void afficherMenu(AgenceBancaire pfAg) {
		System.out.println("Menu de " + pfAg.getNomAgence() + " (" + pfAg.getLocAgence() + ")");
		System.out.println("c - Cr�er un nouveau compte dans l'agence");
		System.out.println("s - Supprimer un compte de l'agence (par son num�ro)");
		System.out.println("l - Liste des comptes de l'agence");
		System.out.println("v - Voir un compte (par son num�ro)");
		System.out.println("p - voir les comptes d'un Propri�taire (par son nom)");
		System.out.println("d - D�poser de l'argent sur un compte");
		System.out.println("r - Retirer de l'argent sur un compte");
		System.out.println("q - Quitter");
		System.out.print("Choix -> ");
	}
	
	/**
	 * Temporisation : Affiche un message et attend la frappe de n'importe quel caract�re.
	 */
	public static void tempo () {
		Scanner lect ;
		String s;
		
		lect = new Scanner (System.in );
		
		System.out.print("Tapper un car + return pour continuer ... ");
		s = lect.next(); // Inutile � stocker mais c'est l'usage normal ...  
	}

	public static void main(String[] argv) {
		
		String choix;

		boolean continuer ;
		Scanner lect;
		AgenceBancaire monAg ;
		
		String nom, numero;		
		Compte c;
		double montant;
		
		lect = new Scanner ( System.in );
		lect.useLocale(Locale.US);
		
		monAg = new AgenceBancaire("Caisse Ep", "Pibrac");
		
		continuer = true;
		while (continuer) {
			ClasseApplicationAgenceBancaire.afficherMenu(monAg);
			choix = lect.next();
			choix = choix.toLowerCase();
			switch (choix) {
				case "q" :
					System.out.println("ByeBye");
					ClasseApplicationAgenceBancaire.tempo();
					continuer = false;
					break;
				case "c" :
					System.out.print("Num compte -> ");
					numero = lect.next();
					System.out.print("Propri�taire -> ");
					nom = lect.next();
					c = new Compte(numero, nom);
					try {
						monAg.addCompte(c);
						System.out.println("Ajout effectu�\n");
					} catch (ABCompteNullException e) {
						System.out.println("Num�ro de compte existant");
						System.out.println(e.getMessage());
					}
					catch (ABCompteDejaExistantException e) {
						System.out.println("Num�ro de compte existant");
						System.out.println(e.getMessage());
					}
					ClasseApplicationAgenceBancaire.tempo();
					break;
				case "s" :
					System.out.print("Num compte -> ");
					numero = lect.next();
					try {
						monAg.removeCompte(numero);
						System.out.println("Suppression effectu�e\n");
					} catch (ABCompteInexistantException e) {
						System.out.println("Num�ro de compte inexistant");
						System.out.println(e.getMessage());
					}
					ClasseApplicationAgenceBancaire.tempo();
					break;
				case "l" :
					monAg.afficher();
					ClasseApplicationAgenceBancaire.tempo();
					break;	
				case "v" :
					System.out.print("Num compte -> ");
					numero = lect.next();
					c = monAg.getCompte(numero);
					if (c==null) {
						System.out.println("Compte inexistant ...");
					} else {
						c.afficher();
					}
					ClasseApplicationAgenceBancaire.tempo();
					break;
				case "p" :
					System.out.print("Propri�taire -> ");
					nom = lect.next();
					ClasseApplicationAgenceBancaire.comptesDUnPropretaire (monAg, nom);
					ClasseApplicationAgenceBancaire.tempo();
					break;		
				case "d" :
					System.out.print("Num compte -> ");
					numero = lect.next();
					System.out.print("Montant � d�poser -> ");
					montant = lect.nextDouble();
					ClasseApplicationAgenceBancaire.deposerSurUnCompte(monAg, numero, montant);
					ClasseApplicationAgenceBancaire.tempo();
					break;
				case "r" :
					System.out.print("Num compte -> ");
					numero = lect.next();
					System.out.print("Montant � retirer -> ");
					montant = lect.nextDouble();
					ClasseApplicationAgenceBancaire.retirerSurUnCompte(monAg, numero, montant);
					ClasseApplicationAgenceBancaire.tempo();
					break;
				default :
					System.out.println("Erreur de saisie ...");
					ClasseApplicationAgenceBancaire.tempo();
					break;
			}
		}
		
	}

	/**
	 * Permet d'afficher tous les comptes d'un propri�taire dans une agence. <BR>
	 * Affiche � l'�cran les comptes trouv�s, un message si saucun compte n'existe pour le propri�taire.<BR>
	 * 
	 * @param pfAg               agence dans laquelle les comptes sont cherch�s.  
	 * @param pfNomProprietaire  nom du propri�taire dont on cherche les comptes.
	 */
	public static void comptesDUnPropretaire (AgenceBancaire pfAg, String pfNomProprietaire) {
		Compte []  t; 
		
		t = pfAg.getComptesDe(pfNomProprietaire);
		if (t.length == 0) {
			System.out.println("pas de compte � ce nom ...");
		} else {
			System.out.println("  " + t.length + " comptes pour " + pfNomProprietaire);
			for (int i=0; i<t.length; i++)
				t[i].afficher();
		}
	}

	/**
	 * R�alise un d�pot sur le compte d'une agence. <BR>
	 * Recherche le compte dans l'agence � partir de son num�ro et r�alise le d�p�t.<BR>
	 * Affiche un message si d�p�t r�ussi, si d�p�t impossible ou si compte non trouv�.
	 * 
	 * @param pfAg            agence dans laquelle le comptes est cherch�. 
	 * @param pfNumeroCompte  num�ro du compte sur lequel est fait le d�p�t. 
	 * @param pfMontant       montant du d�p�t � effectuer.
	 */
	public static void deposerSurUnCompte (AgenceBancaire pfAg, String pfNumeroCompte, double pfMontant) {
		Compte c;
		
		c = pfAg.getCompte(pfNumeroCompte);
		if (c==null) {
			System.out.println("Compte inexistant ...");
		} else {
			System.out.println("Solde avant d�p�t: "+c.soldeCompte());
			try {
				c.deposer(pfMontant);
				System.out.println("Montant d�pos�, solde : "+c.soldeCompte());
			} catch (CompteException e) {
				System.out.println("Erreur de d�pot, solde inchang� : " + c.soldeCompte());
				System.out.println(e.getMessage());
			}
		}
	}
	
	/**
	 * R�alise un retrait sur le compte d'une agence. <BR>
	 * Recherche le compte dans l'agence � partir de son num�ro et r�alise le retrait.<BR>
	 * Affiche un message si retrait r�ussi, si retrait impossible ou si compte non trouv�.
	 *
	 * @param pfAg            agence dans laquelle le comptes est cherch�. 
	 * @param pfNumeroCompte  num�ro du compte sur lequel est fait le retrait. 
	 * @param pfMontant       montant du retrait � effectuer.
	 */
	public static void retirerSurUnCompte (AgenceBancaire pfAg, String pfNumeroCompte, double pfMontant) {
		Compte c;
		
		c = pfAg.getCompte(pfNumeroCompte);
		if (c==null) {
			System.out.println("Compte inexistant ...");
		} else {
			System.out.println("Solde avant retrait : " + c.soldeCompte());
			try {
				c.retirer(pfMontant);
				System.out.println("Montant retir�, solde : "+c.soldeCompte());
			} catch (CompteException e) {
				System.out.println("Erreur de d�pot, solde inchang� : " + c.soldeCompte());
				System.out.println(e.getMessage());
			}
		}

	}
}
