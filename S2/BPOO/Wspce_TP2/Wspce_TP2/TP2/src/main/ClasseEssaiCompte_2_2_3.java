package main;

import tps.banque.Compte;
import tps.banque.exception.CompteException;

public class ClasseEssaiCompte_2_2_3 {
	public static void main (String[] argv)
    {
		Compte cUn;
		Compte cDeux;
		Compte cptTemp;

		cUn = new Compte ("010101", "Jean");
		cDeux = new Compte ("020202", "Marie");
		try {
		    cUn.deposer( 1000 );
		    cUn.retirer ( 500 );
		    cDeux.deposer( 2000 );
		    cDeux.retirer ( 200 );
		} catch (CompteException e) {
		        System.out.println("Erreur ...");
		}

		cptTemp = cUn;
		cUn = cDeux;
		cDeux = cptTemp;

		cUn.afficher(); // 1
		cDeux.afficher(); // 2
		//Les deux références ont été échanger. cUn a donc l'ancienne référence cDeux et pareil pour cDeux qui possède l'ancienne de cUn.
    }
}
