package main.testPolymComptes;

import tps.banque.AgenceBancaire;
import tps.banque.Compte;
import tps.banque.CompteBancaire;
import tps.banque.CompteEpargne;
import tps.banque.CompteJeune;
import tps.banque.CompteMoneo;
import tps.banque.exception.CompteException;

public class ClassEssai {
	public static void main(String[] args) {
		//4.2.2
		Compte cUn, cDeux, cTrois;
		
		//4.2.3
		cUn = new CompteBancaire("010101", "prop01", "jisa010101", 500);
		cDeux = new CompteEpargne("02020202", "prop020202", 10);
		cTrois = new CompteMoneo("03030303", "prop030303", "moneo030303");

		//4.2.4
		try
		{
			cUn.deposer(2000);
			cDeux.deposer(2000);
			cTrois.deposer(2000);
		}
		catch(CompteException ce) {ce.printStackTrace();}
		
		//4.2.5
		cUn.afficherAvecSolde();
		cDeux.afficherAvecSolde();
		cTrois.afficherAvecSolde();
		//La m�thode affich�e appeler pour chacun d'eux est celle de la classe associ� a la question 4.2.3
		
		//4.2.6 et 4.2.7
		try
		{
			cUn.transferer(cDeux, 500);
			cDeux.transferer(cTrois, 500);
		}
		catch (CompteException ce) {ce.printStackTrace();}
		System.out.println("====");
		//4.2.8
		cUn.afficherAvecSolde();
		cDeux.afficherAvecSolde();
		cTrois.afficherAvecSolde();
		//Comme a la 4.2.5, les m�thode afficher appel�e sont celle des classes d�finit dans la 4.2.3
		
		System.out.println("========Partie 4.3========");
		//4.3.1
		Compte[] tabC;
		
		//4.3.2
		tabC = new Compte[3];
		
		//4.2.3
		tabC[0] = cUn;
		tabC[1] = cDeux;
		tabC[2] = cTrois;
		
		//4.2.4
		for (int i = 0; i < tabC.length; i++)
		{
			tabC[i].afficherAvecSolde();
			//4.2.5
			try
			{
				tabC[i].deposer(3000);
			}catch(CompteException ce) {ce.printStackTrace();}
		}
		//Comme pour la derniere partie, les methode afficher appel� sont celles de la classe de la 4.2.3
		
		//4.2.6 et 4.2.7
		try
		{
			tabC[0].transferer(tabC[1], 1000);
			tabC[0].transferer(tabC[2], 1000);
		} catch (CompteException ce) {ce.printStackTrace();}
		
		//4.2.8
		for (int i = 0; i < tabC.length; i++)
		{
			tabC[i].afficherAvecSolde();
		}
		//Comme pour la derniere partie, les methode afficher appel� sont celles de la classe de la 4.2.3
		
		System.out.println("========Partie 4.4========");
		
		//4.4.1
		AgenceBancaire ag;
		ag = new AgenceBancaire("Test Poly", "IUT");
		
		//4.4.2
		try
		{
			ag.addCompte(cUn);
			ag.addCompte(cDeux);
			ag.addCompte(cTrois);
		} catch (Exception e) {e.printStackTrace();}
		
		//4.4.3
		ag.afficher();
		
		//4.4.4
		System.out.println("========4.4.4========");
		Compte c;
		c = ag.getCompte("010101");
		try
		{
			c.deposer(100);
		} catch (CompteException ce) {ce.printStackTrace();}
		c = ag.getCompte("02020202");
		try
		{
			c.deposer(100);
		} catch (CompteException ce) {ce.printStackTrace();}
		c = ag.getCompte("03030303");
		try
		{
			c.deposer(100);
		} catch (CompteException ce) {ce.printStackTrace();}
		ag.afficher();
		
		//4.4.5
		try
		{
			ag.getCompte("010101").transferer(ag.getCompte("02020202"),  200);
		} catch (CompteException ce) {ce.printStackTrace();}
		ag.afficher();
		
		//4.4.6
		Compte cpt = new CompteJeune();
		Compte cpt2 = new CompteJeune();
		try
		{
			ag.addCompte(cpt);
			ag.addCompte(cpt2);
		} catch(Exception e) {e.printStackTrace();}
		ag.afficher();
		
		/*4.4.8
		 * Compte cpt = new CompteJeune();
		 * Compte cpt2 = new CompteSecurise();
		 * cDeux = new CompteEpargne("02020202", "prop020202", 10);
		 * cTrois = new CompteMoneo("03030303", "prop030303", "moneo030303");
		 */
		
		/*4.4.9
		 * cUn.afficherAvecSolde();
		 * cDeux.afficherAvecSolde();
		 * cTrois.afficherAvecSolde();
		 */
	}
}
