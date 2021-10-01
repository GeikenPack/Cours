package main;

import tps.banque.Compte;
import tps.banque.exception.CompteException;

public class ClasseCompteEssaie_2_2_2 {
	public static void main (String[] argv)
    {
            Compte cUn ;
            Compte cDeux; //2.
            
            //cUn.afficher(); //3. Une erreur est retourn�, la variable n'�tant pas initialis�, elle ne r�f�rance aucun compte.
            
            cUn = new Compte("010101", "Jean");
            cDeux = new Compte("020202", "Marie"); //4.
            
            cUn.afficher();
            cDeux.afficher();
            System.out.println(System.identityHashCode(cUn));
            System.out.println(System.identityHashCode(cDeux));
            //5. On affiche les informations des deux comptes et leur r�f�rance :
            //Compte 1 : "Num. : 010101 - Prop. : Jean - Debit 0.0 E / Credit 0.0 E / NbOps 0", "1550089733".
            //Compte 2 : "  Num. : 020202 - Prop. : Marie - Debit 0.0 E / Credit 0.0 E / NbOps 0", "865113938".
            //Les deux variables ont bien �t� initialis�, on peut donc correctement acc�der � leur m�thodes.
            
    		System.out.println("Solde du compte " + cUn.getNumCompte() + " Appartenant � " + cUn.getProprietaire() + " est de : " + cUn.soldeCompte()); 
    		//6. On utlise les m�thodes de cUn ne soulevant pas d'erreurs.
    		//Le r�sultat est : "Solde du compte 010101 Appartenant � Jean est de : 0.0".
    		
    		try
    		{
    			cUn.deposer(1);
    			cDeux.deposer(1000);
    		}
    		catch (CompteException ce) {ce.printStackTrace();};
    		//7. Ces m�thodes pouvant soulever des erreurs, on doit les mettre dans un try catch.
    		
    		cUn.afficher();
            cDeux.afficher();
            System.out.println("Solde cUn : " + cUn.soldeCompte() + " Solde cDeux : " + cDeux.soldeCompte());
            //8. On afiche les diff�rentes infos des comptes :
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
            	//11. Cette instruction soul�ve une erreur.
            	cDeux.retirer(-100);
            	//12. Cette instruction soul�ve une erreur.
            	//Les deux erreurs sont le retrait d'une somme n�gative.
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
            //Les deux comptes ont les m�me informations et la m�me r�f�rence. En effet l'affectation � changer la r�f�rence de cDeux et donc a pris celle de cUn. Les deux variables pointent donc vers le m�me compte.
            
            try
            {
            	cUn.deposer(1000);
            }
            catch(CompteException ce) {ce.printStackTrace();};
            cUn.afficher();
            cDeux.afficher();
            System.out.println("Solde cUn : " + cUn.soldeCompte() + " Solde cDeux : " + cDeux.soldeCompte());
            //15. On affiche les informations des deux comptes apr�s changement :
            //Num. : 010101 - Prop. : Jean - Debit 1.0 E / Credit 1001.0 E / NbOps 3
            //Num. : 010101 - Prop. : Jean - Debit 1.0 E / Credit 1001.0 E / NbOps 3
            //Solde cUn : 1000.0 Solde cDeux : 1000.0
            //Le changement � bien �t� effectu� sur cUn et cDeux car ils ont la m�me r�f�rence.
            
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
            //18. On affiche les informations des diif�rents comptes :
            //  Num. : 010101 - Prop. : Jean - Debit 1.0 E / Credit 1001.0 E / NbOps 3
            //Num. : 010101 - Prop. : Jean - Debit 1.0 E / Credit 1001.0 E / NbOps 3
            //Num. : 010101 - Prop. : Jean - Debit 1.0 E / Credit 1001.0 E / NbOps 3
            //Num. : 010101 - Prop. : Jean - Debit 1.0 E / Credit 1001.0 E / NbOps 3
            //Solde cUn : 1000.0 Solde cDeux : 1000.0 Solde cTrois : 1000.0 Solde cQuatre : 1000.0
            //Les quatres comptes ont exactement les m�mes valeurs. En effet, une variable poss�de seulement la r�f�rence d'un objet. Lors de l'affectation, on a donn� la r�f�rence contenue dans cUn � cTrois et cQuatre. Ils pointes donc tous vers le m�me objet.
            
            System.out.println(System.identityHashCode(cUn));
            System.out.println(System.identityHashCode(cDeux));
            System.out.println(System.identityHashCode(cTrois));
            System.out.println(System.identityHashCode(cQuatre));
            //19. On affiche les r�f�rences de ses varibles :
            //1550089733
            //1550089733
            //1550089733
            //1550089733
            //Les quatres variables ont bien les m�mes r�f�rences.
            
            try
            {
            	cTrois.deposer(500);
            	cQuatre.retirer(200);
            }
            catch(CompteException ce) {ce.printStackTrace();};
            //20. Le solde de cUn et cDeux sera de 1300. En effet, les variables pointant vers le m�me objet, les modifications se font pour toutes.
            
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
            //Les soldes ont bien �t� changer pour toute les variables car elles ont la m�me r�f�rence.
            
            //22. On ne peut plus d�poser d'argent sur le compte ayant comme propri�taire "Marie". En effet, lorsque l'on a affect� cUn a cDeux, ont � perdu la r�f�rence qu'il poss�dait pr�c�demment et on ne peut donc plus y acceder.
            
            cUn = null;
            //23.
            
            System.out.println(cUn);
            //24. Nous obtenons null.
            
            cDeux.afficher();
            //25. Nous obtenons bie les iformations du compte. Changer la variables cUn ne change pas les autres variables. En effet, lors de l'affectation, une copie des r�f�rence � �t� faite.
    }
}
