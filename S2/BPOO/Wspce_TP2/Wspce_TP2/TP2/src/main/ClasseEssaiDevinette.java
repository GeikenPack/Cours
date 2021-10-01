package main;

import tps.jeux.*;
import tps.jeux.exception.*;

import java.util.Scanner;

public class ClasseEssaiDevinette {
	public static void main (String[] argv)
    {
		//On initialise une nouvelle devinette pour chaue partie.
		Devinette d;
		d = new Devinette();
		jouerPartie(d);
		d = new Devinette();
		jouerPartie(d);
		d = new Devinette();
		jouerPartie(d);
    }
	
	public static int saisieEntier() 
    {
		//Permet de saisir un entier
        Scanner clavier = new Scanner(System.in) ;
        int nombreSaisi = clavier.nextInt() ;
        return nombreSaisi ;
    } //Fin saisieEntier() 
	
	public static void jouerPartie(Devinette d)
	{
		//Permet de jouer unepartie de devinette
		System.out.println("Coup : (" + d.getBas() + " - " + d.getHaut() + ")");
		int coup = saisieEntier();
		while(!d.isValeurDansBornes(coup))
		{
			//Letmeps que la valeur saisie n'est pas dans les bornes, le joueur doit saisir une valeur.
			System.out.println("La valeur sasie doit etre comrpises dans les bornes");
			coup = saisieEntier();
		}
		while(!d.isDernierCoupGagnant())
		{
			try
			{
				//soumettreCoup() peut soulever une erreur, on doit donc le mettre dans un try catch.
				d.soumettreCoup(coup);
			}
			catch(ErreurExecutionDevinette e) {e.printStackTrace();};
			
			if (d.isDernierCoupTropBas())
			{
				//Verifie si la valeur donnée est plus basse que celle recherché.
				System.out.println("Plus Haut ... Coup : (" + d.getBas() + " - " + d.getHaut() + ")");
			}
			else
			{
				Verifie si la valeur donnée est plus haute que celle recherché.
				System.out.println("Plus Bas ... Coup : (" + d.getBas() + " - " + d.getHaut() + ")");
			}
			System.out.println("");
			coup = saisieEntier();
			while(!d.isValeurDansBornes(coup))
			{
				coup = saisieEntier();
			}
		}
		//Le joueur a gagné si il arrive ici.
		System.out.println("Bravo ! En " + d.getNbCoupsJoues() + " coups !");
	} //Fin jouerPartie
}
