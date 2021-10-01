package main;

import tps.banque.AgenceBancaire;
import tps.banque.Compte;
import tps.banque.exception.*;

public class TestToString 
{
	public static void main(String[] argv)
	{
		AgenceBancaire monAg;
		Compte c;
		monAg = new AgenceBancaire("Caisse Ep", "Pibrac");

		System.out.println(monAg);

		try {
		        c = new Compte("0101", "prop1");
		        monAg.addCompte(c);
		        c = new Compte("0202", "prop2");
		        monAg.addCompte(c);
		        c = new Compte("0303", "prop2");
		        monAg.addCompte(c);
		} catch (ABCompteNullException e) {
		        System.out.println("Exception ...");
		        System.out.println(e.getMessage());
		} catch (ABCompteDejaExistantException e) {
		        System.out.println("Exception ...");
		        System.out.println(e.getMessage());
		}

		System.out.println("println d'un objet AgenceBancaire");
		System.out.println (monAg);
		System.out.println("println de toString() d'un objet AgenceBancaire");
		System.out.println (monAg.toString());
		//5.1 Mettre toString en commentaire :
		//Quand toString est en commentaire, les println renvoient la référence de l'objet et non les informations voulu, a savoir le nom, la location et le nombre de comptes.
		//Enelever le commentaire de toString :
		//Maintenant, nous obtenons bien les informations voulues.
		//Le System.out.print(.) d'un objet écrit ce que renvoie toString si il est présent, sinon renvoie sa référence.
		String s = new String ("Bonjour");
		System.out.println (s);
		//On peut donc deviner que, pour les String, il  y a un toString présent dans le type qui permet d'afficher la chaine de caractère et non sa référence.
		//Nous pouvons voir que dans la classe System, le out est de type PrintStream. Dans cette classe, les methodes print et println d'un objet utilise la méthode toString de cet objet.
	}
}
