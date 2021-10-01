package main;

import tps.banque.*;
import tps.banque.exception.*;

public class TestComptes 
{
	public static void main(String argv[])
	{
		//Test Compte Moneo
		CompteMoneo coMo;
		coMo = new CompteMoneo("123456");
		System.out.println("Numero de la carte :" + coMo.getNoCarteMoneo());
		coMo.afficher();
		
		System.out.println("======================");
		
		//Test Compte Depots
		CompteDepot coDe;
		coDe = new CompteDepot();
		try
		{
			coDe.deposer(800);
			coDe.retirer(500);
		}
		catch(CompteException ce) {ce.printStackTrace();}
		coDe.afficher();
		
		System.out.println("======================");
		
		//Test Compte Epargne
		CompteEpargne coEp;
		coEp = new CompteEpargne("0101", "Jean", 5.0);
		try
		{
			coEp.deposer(80000);
		}
		catch(CompteException ce) {ce.printStackTrace();}
		System.out.println("Interets du compte :" + coEp.interetsCompte());
		coEp.afficher();
		
		System.out.println("======================");
		
		//Test Compte Securise
		CompteSecurise coSe;
		coSe = new CompteSecurise("0202", "Lot", 600);
		try
		{
			coSe.retirer(500);
		}
		catch(CompteException ce) {ce.printStackTrace();}
		coSe.afficher();
		
		System.out.println("======================");
		
		//Test Compte Bancaire
		CompteBancaire coBa;
		coBa = new CompteBancaire("0303", "Test","586936", 600.0);
		coBa.afficher();
	}
}
