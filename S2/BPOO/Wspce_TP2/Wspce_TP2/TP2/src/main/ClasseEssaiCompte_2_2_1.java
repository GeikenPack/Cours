package main;

import tps.banque.Compte;
import tps.banque.exception.CompteException;

public class ClasseEssaiCompte_2_2_1 {
	public static void main(String[] argv) {
		Compte cUn; 
		//2. Créer un compte
		
		cUn = new Compte("010101", "Lepoisson Benoit"); 
		//3. Initialise le compte
		
		cUn.afficher(); 
		//4. Affiche les infos du compte juste après l'initialisation : "Num. : 010101 - Prop. : Lepoisson Benoit - Debit 0.0 E / Credit 0.0 E / NbOps 0"
		
		System.out.println("Solde du compte " + cUn.getNumCompte() + " Appartenant à " + cUn.getProprietaire() + " est de : " + cUn.soldeCompte()); 
		//5. Test des 3 premières méthodes : "Solde du compte 010101 Appartenant à Lepoisson Benoit est de : 0.0"
		
		System.out.println(cUn.toString()); 
		//Test de toString, même résultat que
		
		try
		{
			//Ces trois méthodes peuvent soulever des exceptions, on les met dans un try catch
			cUn.deposer(1000); //On dépose 1000 sur le compte cUn.
			cUn.retirer(500); //On retire 500 du compte cUn
			cUn.setProprietaire("Dupont Jean"); //On change le propriétaire du compte.
		}
		catch (CompteException ce) {ce.printStackTrace();};
		cUn.afficher(); 
		//On affiche a nouveaux les infformations du compte après les modifications :
		//"Num. : 010101 - Prop. : Dupont Jean - Debit 500.0 E / Credit 1000.0 E / NbOps 2"
		try
		{
			//6. et 7.
			cUn.retirer(-100); 
			//6. Retourne une erreur de somme négative lors d'un retrait. 
			
			cUn.deposer(-100); 
			//7. Retourne une erreur de somme négative lors de depot.
		}
		catch (CompteException ce) {ce.printStackTrace();};
		System.out.println(cUn); 
		//9. Cette instruction donne le même résultat que toString : "Num. : 010101 - Prop. : Dupont Jean - Debit 500.0 E / Credit 1000.0 E / NbOps 2".
		
		System.out.println(System.identityHashCode(cUn)); 
		//10. Cette instruction retourne la référence de cUn : "1550089733".
		
		cUn = null; 
		//11.
		
		System.out.println(System.identityHashCode(cUn)); 
		//12. La référence à changer, c'est maintenant 0.
		
		cUn.afficher(); 
		//13. Cette instruction retourne une erreur. En effet, l'affectation de null a cUn à changer sa référence et n pointe plus vers un objet Compte.
	}
}
