package main;

import tps.banque.Compte;
import tps.banque.AgenceBancaire;
import tps.banque.exception.*;

public class ClasseEssaiAgenceBancaire_3_2 {
	public static void main (String[] argv)
    {
            AgenceBancaire monAg;
            //3.
            
            monAg = new AgenceBancaire("Banque Popiulaire", "Blagnac");
            //4.
            
            monAg.afficher();
            //5/ On affiche les informations de l'agence :
            //Nom : Banque Popiulaire (Blagnac)
            //0 Comptes :
            
            System.out.println(monAg.getNbComptes());
            //6. On affiche le nombre de compte de l'agence : "0".
            
            Compte cUn;
            cUn = new Compte("0101", "prop1");
            Compte cDeux, cTrois;
            cDeux = new Compte("0202", "prop2");
            cTrois = new Compte("0303", "prop2");
            //7.
            
            try
            {
            	monAg.addCompte(cUn);
            	monAg.addCompte(cDeux);
            	monAg.addCompte(cTrois);
            }
            catch (ABCompteNullException e) {e.printStackTrace();}
            catch (ABCompteDejaExistantException e) {e.printStackTrace();};
            //8.
            
            monAg.afficher();
            //9. On affiche les informatiosn de l'agence après ajouts de comptes :
            //Nom : Banque Popiulaire (Blagnac)
            //3 Comptes :
            // 	  Num. : 0101 - Prop. : prop1 - Debit 0.0 E / Credit 0.0 E / NbOps 0
            //	   Solde : 0.0
            //	  Num. : 0202 - Prop. : prop2 - Debit 0.0 E / Credit 0.0 E / NbOps 0
            //	   Solde : 0.0
            //	  Num. : 0303 - Prop. : porp2 - Debit 0.0 E / Credit 0.0 E / NbOps 0
            //	   Solde : 0.0
            
            Compte cTmp;
            cTmp = monAg.getCompte("0101");
            cTmp.afficher();
            try
            {
            	cTmp.deposer(1000);
            }
            catch(CompteException ce) {ce.printStackTrace();};
            cTmp.afficher();
            cTmp = monAg.getCompte("0101");
            cTmp.afficher();
            //10. Les informations ont bien été modifier et stocké dans monAg.
            
            //cTmp = monAg.getCompte("9999");
            //cTmp.afficher();
            //11. Le compte avec ce numéro n'existe pas. Nous obtenons donc une erreur.
            
            Compte[] cTabTmp;
            cTabTmp = monAg.getComptesDe("prop2");
            for (int i = 0; i < cTabTmp.length; i++)
            {
            	cTabTmp[i].afficher();
            }
            //12. On obtient deux compte :
            //  Num. : 0202 - Prop. : prop2 - Debit 0.0 E / Credit 0.0 E / NbOps 0
            //Num. : 0303 - Prop. : prop2 - Debit 0.0 E / Credit 0.0 E / NbOps 0
            
            try
            {
            	monAg.getCompte("0202").deposer(2000);
            	monAg.getCompte("0303").deposer(3000);
            }
            catch(CompteException ce) {ce.printStackTrace();};
            //13.
            
            cTabTmp = monAg.getComptesDe("prop2");
            for (int i = 0; i < cTabTmp.length; i++)
            {
            	cTabTmp[i].afficher();
            }
            //14. Les informatiosn des deux comptes ont bien été modifiées :
            //Num. : 0202 - Prop. : prop2 - Debit 0.0 E / Credit 2000.0 E / NbOps 1
            //Num. : 0303 - Prop. : prop2 - Debit 0.0 E / Credit 3000.0 E / NbOps 1
            //Les modifications apporté aux comptes sont aussi modifiées directement dans l'agence.
            
            cTabTmp = monAg.getComptesDe("ABSENT");
            for (int i = 0; i < cTabTmp.length; i++)
            {
            	cTabTmp[i].afficher();
            }
            //15. Rien ne s'affiche car aucun compte n'a ce propriétaire.
            
            try
            {
            	cTmp = null;
            	monAg.addCompte(cTmp);
            }
            catch (ABCompteNullException e) {e.printStackTrace();}
            catch (ABCompteDejaExistantException e) {e.printStackTrace();};
            //16. Ajouter un compte null retourne une rreur de type :ABCompteNullException.
            
            try
            {
            	monAg.removeCompte("0202");
            	//17. Cela fonctionne sans problème
            	
            	//monAg.removeCompte("9999");
            	//18. On obtient une exception de type ABCompteInexistantException.
            	
            	cTmp = new Compte("0101", "prop99");
            	monAg.addCompte(cTmp);
            	//19. On essaye d'ajouter un compte alors que le numéro associé existe déjà pour un autre compte. On obtient une erreur de type : ABCompteDejaExistantException.
            }
            catch (ABCompteInexistantException e) {e.printStackTrace();}
            catch (ABCompteNullException e) {e.printStackTrace();}
            catch (ABCompteDejaExistantException e) {e.printStackTrace();};
    }
}
