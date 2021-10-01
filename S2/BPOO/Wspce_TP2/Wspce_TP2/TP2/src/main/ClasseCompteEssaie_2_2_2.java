package main;

import tps.banque.Compte;
import tps.banque.exception.CompteException;

public class ClasseCompteEssaie_2_2_2 {
	public static void main (String[] argv)
    {
            Compte cUn ;
            Compte cDeux; //2.
            
            //cUn.afficher(); //3. Une erreur est retourné, la variable n'étant pas initialisé, elle ne référance aucun compte.
            
            cUn = new Compte("010101", "Jean");
            cDeux = new Compte("020202", "Marie"); //4.
            
            cUn.afficher();
            cDeux.afficher();
            System.out.println(System.identityHashCode(cUn));
            System.out.println(System.identityHashCode(cDeux));
            //5. On affiche les informations des deux comptes et leur référance :
            //Compte 1 : "Num. : 010101 - Prop. : Jean - Debit 0.0 E / Credit 0.0 E / NbOps 0", "1550089733".
            //Compte 2 : "  Num. : 020202 - Prop. : Marie - Debit 0.0 E / Credit 0.0 E / NbOps 0", "865113938".
            //Les deux variables ont bien été initialisé, on peut donc correctement accéder à leur méthodes.
            
    		System.out.println("Solde du compte " + cUn.getNumCompte() + " Appartenant à " + cUn.getProprietaire() + " est de : " + cUn.soldeCompte()); 
    		//6. On utlise les méthodes de cUn ne soulevant pas d'erreurs.
    		//Le résultat est : "Solde du compte 010101 Appartenant à Jean est de : 0.0".
    		
    		try
    		{
    			cUn.deposer(1);
    			cDeux.deposer(1000);
    		}
    		catch (CompteException ce) {ce.printStackTrace();};
    		//7. Ces méthodes pouvant soulever des erreurs, on doit les mettre dans un try catch.
    		
    		cUn.afficher();
            cDeux.afficher();
            System.out.println("Solde cUn : " + cUn.soldeCompte() + " Solde cDeux : " + cDeux.soldeCompte());
            //8. On afiche les différentes infos des comptes :
            //Num. : 010101 - Prop. : Jean - Debit 0.0 E / Credit 1.0 E / NbOps 1
            //Num. : 020202 - Prop. : Marie - Debit 0.0 E / Credit 1000.0 E / NbOps 1
            //Solde cUn : 1.0 Solde cDeux : 1000.0
            
            try
            {
            	cUn.retirer(1);
            	cDeux.retirer(1000);
            }
            catch(CompteException ce) {ce.printStackTrace();};
            //9;
            
            cUn.afficher();
            cDeux.afficher();
            System.out.println("Solde cUn : " + cUn.soldeCompte() + " Solde cDeux : " + cDeux.soldeCompte());
            //10. On affiche les infos des comptes :
            //Num. : 010101 - Prop. : Jean - Debit 1.0 E / Credit 1.0 E / NbOps 2
            //Num. : 020202 - Prop. : Marie - Debit 1000.0 E / Credit 1000.0 E / NbOps 2
            //Solde cUn : 0.0 Solde cDeux : 0.0
            //Les deux comptes sont bien vides
            
            try
            {
            	cUn.retirer(-100);
            	//11. Cette instruction soulève une erreur.
            	cDeux.retirer(-100);
            	//12. Cette instruction soulève une erreur.
            	//Les deux erreurs sont le retrait d'une somme négative.
            }
            catch(CompteException ce) {ce.printStackTrace();};
            
            cDeux = cUn;
            //13.
            
            cUn.afficher();
            cDeux.afficher();
            System.out.println("Solde cUn : " + cUn.soldeCompte() + " Solde cDeux : " + cDeux.soldeCompte());
            System.out.println(System.identityHashCode(cUn));
            System.out.println(System.identityHashCode(cDeux));
            //14. On affiche les informations des deux comptes :
            //Num. : 010101 - Prop. : Jean - Debit 1.0 E / Credit 1.0 E / NbOps 2
            //Num. : 010101 - Prop. : Jean - Debit 1.0 E / Credit 1.0 E / NbOps 2
            //Solde cUn : 0.0 Solde cDeux : 0.0
            //1550089733
            //1550089733
            //Les deux comptes ont les même informations et la même référence. En effet l'affectation à changer la référence de cDeux et donc a pris celle de cUn. Les deux variables pointent donc vers le même compte.
            
            try
            {
            	cUn.deposer(1000);
            }
            catch(CompteException ce) {ce.printStackTrace();};
            cUn.afficher();
            cDeux.afficher();
            System.out.println("Solde cUn : " + cUn.soldeCompte() + " Solde cDeux : " + cDeux.soldeCompte());
            //15. On affiche les informations des deux comptes après changement :
            //Num. : 010101 - Prop. : Jean - Debit 1.0 E / Credit 1001.0 E / NbOps 3
            //Num. : 010101 - Prop. : Jean - Debit 1.0 E / Credit 1001.0 E / NbOps 3
            //Solde cUn : 1000.0 Solde cDeux : 1000.0
            //Le changement à bien été effectué sur cUn et cDeux car ils ont la même référence.
            
            Compte cTrois;
            Compte cQuatre;
            //16.
            
            cTrois = cUn;
            cQuatre = cUn;
            //17.
            
            cUn.afficher();
            cDeux.afficher();
            cTrois.afficher();
            cQuatre.afficher();
            System.out.println("Solde cUn : " + cUn.soldeCompte() + " Solde cDeux : " + cDeux.soldeCompte() + " Solde cTrois : " + cTrois.soldeCompte() + " Solde cQuatre : " + cQuatre.soldeCompte());
            //18. On affiche les informations des diiférents comptes :
            //  Num. : 010101 - Prop. : Jean - Debit 1.0 E / Credit 1001.0 E / NbOps 3
            //Num. : 010101 - Prop. : Jean - Debit 1.0 E / Credit 1001.0 E / NbOps 3
            //Num. : 010101 - Prop. : Jean - Debit 1.0 E / Credit 1001.0 E / NbOps 3
            //Num. : 010101 - Prop. : Jean - Debit 1.0 E / Credit 1001.0 E / NbOps 3
            //Solde cUn : 1000.0 Solde cDeux : 1000.0 Solde cTrois : 1000.0 Solde cQuatre : 1000.0
            //Les quatres comptes ont exactement les mêmes valeurs. En effet, une variable possède seulement la référence d'un objet. Lors de l'affectation, on a donné la référence contenue dans cUn à cTrois et cQuatre. Ils pointes donc tous vers le même objet.
            
            System.out.println(System.identityHashCode(cUn));
            System.out.println(System.identityHashCode(cDeux));
            System.out.println(System.identityHashCode(cTrois));
            System.out.println(System.identityHashCode(cQuatre));
            //19. On affiche les références de ses varibles :
            //1550089733
            //1550089733
            //1550089733
            //1550089733
            //Les quatres variables ont bien les mêmes références.
            
            try
            {
            	cTrois.deposer(500);
            	cQuatre.retirer(200);
            }
            catch(CompteException ce) {ce.printStackTrace();};
            //20. Le solde de cUn et cDeux sera de 1300. En effet, les variables pointant vers le même objet, les modifications se font pour toutes.
            
            cUn.afficher();
            cDeux.afficher();
            cTrois.afficher();
            cQuatre.afficher();
            System.out.println("Solde cUn : " + cUn.soldeCompte() + " Solde cDeux : " + cDeux.soldeCompte() + " Solde cTrois : " + cTrois.soldeCompte() + " Solde cQuatre : " + cQuatre.soldeCompte());
            //21. On affiche les informations des comptes :
            //  Num. : 010101 - Prop. : Jean - Debit 201.0 E / Credit 1501.0 E / NbOps 5
            //Num. : 010101 - Prop. : Jean - Debit 201.0 E / Credit 1501.0 E / NbOps 5
            //Num. : 010101 - Prop. : Jean - Debit 201.0 E / Credit 1501.0 E / NbOps 5
            //Num. : 010101 - Prop. : Jean - Debit 201.0 E / Credit 1501.0 E / NbOps 5
            //Solde cUn : 1300.0 Solde cDeux : 1300.0 Solde cTrois : 1300.0 Solde cQuatre : 1300.0
            //Les soldes ont bien été changer pour toute les variables car elles ont la même référence.
            
            //22. On ne peut plus déposer d'argent sur le compte ayant comme propriétaire "Marie". En effet, lorsque l'on a affecté cUn a cDeux, ont à perdu la référence qu'il possédait précédemment et on ne peut donc plus y acceder.
            
            cUn = null;
            //23.
            
            System.out.println(cUn);
            //24. Nous obtenons null.
            
            cDeux.afficher();
            //25. Nous obtenons bie les iformations du compte. Changer la variables cUn ne change pas les autres variables. En effet, lors de l'affectation, une copie des référence à été faite.
    }
}
