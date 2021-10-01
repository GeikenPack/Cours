package main;

import java.util.Locale;
import java.util.Scanner;

import tps.banque.Compte;
import tps.banque.exception.CompteException;
import tps.banque.AgenceBancaire;
import tps.banque.exception.ABCompteInexistantException;
import tps.banque.exception.ABCompteNullException;
import tps.banque.exception.ABCompteDejaExistantException;

public class ClasseApplicationAgenceBancaire {

	/**
	 * Affichage du menu de l'application
	 * 
	 * @param ag
	 *            AgenceBancaire pour r�cup�rer le nom et la localisation
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
	 * Temporisation : Affiche un message et attend la frappe de n'importe quel
	 * caract�re.
	 */
	public static void tempo() {
		Scanner lect;
		String s;

		lect = new Scanner(System.in);

		System.out.print("Tapper un car + return pour continuer ... ");
		s = lect.next(); // Inutile � stocker mais c'est l'usage normal ...
	}

	public static void compteDUnProprietaire(AgenceBancaire pfAg, String pfNomProprietaire)
	{
		Compte[] tabCompte = pfAg.getComptesDe(pfNomProprietaire);
		for(int i = 0; i < tabCompte.length; i++)
		{
			tabCompte[i].afficher();
		}
	}
	
	public static void deposerSurCompte(AgenceBancaire pfAg, String pfNumeroCompte, double pfMontant)
	{
		try
		{
			pfAg.getCompte(pfNumeroCompte).deposer(pfMontant);
			System.out.println("D�pot r�ussi");
		}
		catch (CompteException ce) {System.out.println("Montant incorrecte."); ce.printStackTrace();};
	}
	
	public static void retirerSurCompte(AgenceBancaire pfAg, String pfNumeroCompte, double pfMontant)
	{
		try
		{
			pfAg.getCompte(pfNumeroCompte).retirer(pfMontant);
			System.out.println("Retrait r�ussi");
		}
		catch (CompteException ce) {System.out.println("Montant incorrecte."); ce.printStackTrace();};
	}
	
	public static void main(String[] argv) {

		String choix;
		String nom, numero;
		double montant;
		boolean continuer;
		Scanner lect;
		AgenceBancaire monAg;

		lect = new Scanner(System.in);
		lect.useLocale(Locale.US);

		monAg = new AgenceBancaire("Caisse Ep", "Pibrac");

		continuer = true;
		while (continuer) {
			ClasseApplicationAgenceBancaire.afficherMenu(monAg);
			choix = lect.next();
			choix = choix.toLowerCase();
			switch (choix) {
			case "q":
				System.out.println("ByeBye");
				ClasseApplicationAgenceBancaire.tempo();
				continuer = false;
				break;

			case "c":
				System.out.print("Num compte -> ");
				numero = lect.next();
				System.out.print("Propri�taire -> ");
				nom = lect.next();

				// A FAIRE ICI :
				// Cr�er un compte avec le num�ro et le nom saisis

				// Ajouter ce compte � la Banque et traiter les exceptions possibles
				// Avec un message "pertinent" pour l'utilisateur "banquier"
				
				try
				{
					monAg.addCompte(new Compte(numero, nom));
					System.out.println("Ajour effectu�");
				}
				catch (ABCompteNullException e) {System.out.println("Aucune valeur fournis pour le compte."); e.printStackTrace();}
				catch (ABCompteDejaExistantException e) {System.out.println("Ce compte existe d�j�."); e.printStackTrace();};

				ClasseApplicationAgenceBancaire.tempo();
				break;

			case "s":
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

			// A CONTINUER ICI
				
			case "l":
				monAg.afficher();
				ClasseApplicationAgenceBancaire.tempo();
				break;

			case "v":
				System.out.print("Num compte -> ");
				numero = lect.next();
				if (monAg.getCompte(numero) == null)
				{
					System.out.println("Compte inexistant");
				}
				else
				{
					monAg.getCompte(numero).afficher();
				}
				ClasseApplicationAgenceBancaire.tempo();
				break;
				
			case "p":
				System.out.print("Propri�taire -> ");
				nom = lect.next();
				compteDUnProprietaire(monAg, nom);
				ClasseApplicationAgenceBancaire.tempo();
				break;
				
			case "d":
				System.out.print("Num compte -> ");
				numero = lect.next();
				System.out.print("Montant � d�poser -> ");
				montant = lect.nextDouble();
				deposerSurCompte(monAg, numero, montant);
				ClasseApplicationAgenceBancaire.tempo();
				break;
				
			case "r":
				System.out.print("Num compte -> ");
				numero = lect.next();
				System.out.print("Montant � retirer -> ");
				montant = lect.nextDouble();
				retirerSurCompte(monAg, numero, montant);
				ClasseApplicationAgenceBancaire.tempo();
				break;
				
			default:
				System.out.println("Erreur de saisie ...");
				ClasseApplicationAgenceBancaire.tempo();
				break;
			}
		}

	}

}