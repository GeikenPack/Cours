package main;

import tps.banque.Compte;
import tps.banque.exception.CompteException;

public class Test {
	public static void main(String argv[]) {
		/*
		Test.main1TestComptes();
		Test.main2TestComptes();
		*/

        System.out.println("-------- Test Class_A --------");

        Class_A a = new Class_A ();
        a.afficher();
        a.afficher_AUTRE();

        System.out.println("-------- Test Class_B --------");

        Class_B b = new Class_B ();
        b.afficher();
        b.afficher_AUTRE();

        System.out.println("-------- Test Class_C --------");

        Class_C c = new Class_C ();
        c.afficher();
        c.afficher_AUTRE();
        
        /*
         * 7.1 : Le résultat est normal.
         * 
         * 7.2 : Le résultat est bien normal, rien n'as changer
         * 
         * 7.4.b : Le résultat est bien normal, l'affichage des classB et classeC ont bien changer.
         * 
         * 7.5.b : Le résultat est bien normal, sel la classe C a changer.
         * 
         * 7.6.b : La méthode afficher de class B afficher bien le afficher autre de class A. Celle redéfinit affichent bien les informations de leur propre classe. En effet, lorsqu'elle sont redéfinis, les méthodes parentes ne prennent plus effets pour cette classe. 
         */
	}

	public static void main1TestComptes() {
		
		System.out.println("Partie 1");

		// Premiers essais

		Compte c;
		
		// Appliquer la méthode afficher à c. Que se passe-t-il ?
		// c.afficher (); // Erreur, c non initialisée

		// Créer un Compte à l'aide de c.
		c = new Compte("010101", "Lepoisson Benoit");

		// Utiliser les méthodes disponibles sur la classe Compte
		// (Modifieurs, Observateurs).
		c.afficher();
		System.out.println("  Solde : " + c.soldeCompte());

		try {
			c.deposer(2000);
			c.retirer(3000);
		} catch (CompteException e) {
			System.out.println(e);
		}
		c.setProprietaire("Test");
		c.afficher();
		System.out.println("  Solde : " + c.soldeCompte());
		
		// Essayer de retirer -100 euros du compte c. Que se passe-t-il ?
		// -> Exception
		try {
			c.retirer(-100);
		} catch (CompteException e) {
			System.out.println(e);
		}
		
		// Essayer de déposer -100 euros du compte c. Que se passe-t-il ?
		// -> Exception
		try {
			c.deposer(-100);
		} catch (CompteException e) {
			System.out.println(e);
		}
		
		// Essayer l'instruction : System.out.println(c); Quel est le
		// résultat ?
		System.out.println(c); // Affiche c.toString() 
		
		System.out.println(System.identityHashCode(c));

		// Affecter à c la valeur null.
		c = null;

		System.out.println(System.identityHashCode(c)); // Affiche : 0
		System.out.println(c); // Affiche : null

		// Appliquer la méthode afficher à c. Que se passe-t-il ?
		// c.afficher (); //
		// "Exception in thread "main" java.lang.NullPointerException"
	}
	
	public static void main2TestComptes() {
		
		System.out.println("Partie 2");

		// Références d'objets suite

		try {
			// 1) 1) Déclarer deux variables cUn et cDeux "de type Compte" :
			// références vers un Compte.
			// cf ci-dessus

			Compte cUn, cDeux;

			// 2) Créer un Compte à l'aide de cUn au nom de "Jean". Créer un
			// autre Compte à l'aide de cDeux au nom de "Marie".
			cUn = new Compte("3001", "Jean");
			cDeux = new Compte("3002", "Marie");

			// 3) Afficher cUn et cDeux.
			cUn.afficher();
			System.out.println("  Solde : " + cUn.soldeCompte());
			cDeux.afficher();
			System.out.println("  Solde : " + cDeux.soldeCompte());

			// 4) Déposer 1€ sur cUn. Déposer 1000€ sur cDeux.
			cUn.deposer(1);
			cDeux.deposer(1000);

			// 5) Afficher cUn et cDeux. Conclusion …
			System.out.println();
			System.out.println("Apres depot 1 et 1000");
			cUn.afficher();
			System.out.println("  Solde : " + cUn.soldeCompte());
			cDeux.afficher();
			System.out.println("  Solde : " + cDeux.soldeCompte());

			// 6) Retirer 1€ de cUn. Retirer 1000€ de cDeux.
			cUn.retirer(1);
			cDeux.retirer(1000);

			// 7) Afficher cUn et cDeux. Conclusion …
			System.out.println();
			System.out.println("Apres retrait 1 et 1000");
			cUn.afficher();
			System.out.println("  Solde : " + cUn.soldeCompte());
			cDeux.afficher();
			System.out.println("  Solde : " + cDeux.soldeCompte());
			// Deux objets vraiement différents
			
			// 8) Affecter cUn à cDeux (cDeux = cUn;).
			cDeux = cUn;

			// 9) Afficher cUn et cDeux. Conclusion …
			System.out.println();
			System.out.println("Apres Affectation");
			cUn.afficher();
			System.out.println("  Solde : " + cUn.soldeCompte());
			cDeux.afficher();
			System.out.println("  Solde : " + cDeux.soldeCompte());
			// Ils référencent le meme objet
			
			// 10) Déposer 2000€ sur le Compte ayant pour propriétaire Marie.
			// Conclusion …
			// Impossible, la référence est perdue ...

		} catch (CompteException e) {
			System.out.println(e);
		}
	}
}
