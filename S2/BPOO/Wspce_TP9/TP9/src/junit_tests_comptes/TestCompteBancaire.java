package junit_tests_comptes;

import junit.framework.TestCase;
import junit.framework.TestSuite;
import tps.banque.CompteBancaire;
import tps.banque.SensOperation;
import tps.banque.exception.CompteException;

/* Test de la classe Compte Bancaire, setNumCarteJisa ()
 *
 * Test simples : constructeurs, setNoCarteMoneo() 
 * ... et transformateurs (setters) h�rit�s
 * 
 */

public class TestCompteBancaire extends TestCase {

	// Attributs locaux pour les tests.
	// A ne pas modifier
	private CompteBancaire cDef, cTrois, cQuatre;

	private final String pasDeNC = "Pas de num�ro";
	private final String pasDeNP = "Pas de propri�taire";
	private final String pasDeNumCJ = "Pas de num�ro CJ";

	private final String np = "Durand";
	private final String nc = "010101";
	private final String cj = "JISA9999";

	private final double cre = 2000.0;
	private final double deb = 1000.0;

	private final double retrait = 1000.0;

	private final double decAutorise = 300.0;

	private void initCompte() {
		this.cDef = new CompteBancaire();
		this.cTrois = new CompteBancaire(new String(this.nc), new String(
				this.np), this.cj);
		this.cQuatre = new CompteBancaire(new String(this.nc), new String(
				this.np), this.cj, this.decAutorise);
	}

	public void testCompteBancaireDefaut() {
		this.initCompte();

		// test constructeur par d�faut
		TestCase.assertEquals(
				"PROBLEME CompteBancaire() : mauvais num�ro de CJ ...",
				this.pasDeNumCJ, this.cDef.getNumCarteJisa());
		TestCase.assertEquals("PROBLEME CompteBancaire() : mauvais solde ...",
				0.0, this.cDef.soldeCompte());
		TestCase.assertEquals(
				"PROBLEME CompteBancaire() : mauvais propri�taire ...",
				this.pasDeNP, this.cDef.getProprietaire());
		TestCase.assertEquals(
				"PROBLEME CompteBancaire() : mauvais num�ro de compte ...",
				this.pasDeNC, this.cDef.getNumCompte());
	}

	public void testCompteBancaire3Parametres() {
		this.initCompte();

		// test constructeur CompteBancaire (String pNumCompte, String pNomProp, String pNoCarteJisa)
		TestCase.assertEquals(
				"PROBLEME CompteBancaire(nc, np, cj) : mauvais num�ro de CJ ...",
				this.cj, this.cTrois.getNumCarteJisa());
		TestCase.assertEquals(
				"PROBLEME CompteBancaire(nc, np, cj) : mauvais solde ...", 0.0,
				this.cTrois.soldeCompte());
		TestCase.assertEquals(
				"PROBLEME CompteBancaire(nc, np, cj) : mauvais propri�taire ...",
				this.np, this.cTrois.getProprietaire());
		TestCase.assertEquals(
				"PROBLEME CompteBancaire(nc, np, cj) : mauvais num�ro de compte ...",
				this.nc, this.cTrois.getNumCompte());
	}

	public void testCompteBancaire4Parametres() {
		this.initCompte();

		// test constructeur CompteBancaire (String pNumCompte, String pNomProp, String pNoCarteJisa, double pDA)	
		TestCase.assertEquals(
				"PROBLEME CompteBancaire(nc, np, cj, dca) : mauvais num�ro de CJ ...",
				this.cj, this.cQuatre.getNumCarteJisa());
		TestCase.assertEquals(
				"PROBLEME CompteBancaire(nc, np, cj, dca) : mauvais solde ...",
				0.0, this.cQuatre.soldeCompte());
		TestCase.assertEquals(
				"PROBLEME CompteBancaire(nc, np, cj, dca) : mauvais propri�taire ...",
				this.np, this.cQuatre.getProprietaire());
		TestCase.assertEquals(
				"PROBLEME CompteBancaire(nc, np, cj, dca) : mauvais num�ro de compte ...",
				this.nc, this.cQuatre.getNumCompte());
	}

	public void testSetNumCarteJisa() {
		this.initCompte();

		String nouvNumCJ = "CORRIGE" + this.cj + "CORRIGE";

		this.cQuatre.setNumCarteJisa(nouvNumCJ);
		TestCase.assertEquals(
				"PROBLEME setNumCarteJisa() : mauvais num�ro de CJ ...",
				nouvNumCJ, this.cQuatre.getNumCarteJisa());
	}

	public void testIsRetraitPossibleTest1() 
			throws CompteException // Sur retraits et depts
	{
		// On v�rifie que le comportement h�rit� est conserv� ...
		
		this.initCompte();
		TestCase.assertFalse(
				"PROBLEME isRetraitPossible () : retrait accept� lorsque impossible ...",
				this.cTrois.isRetraitPossible(this.retrait));
		this.cTrois.deposer(this.cre);
		TestCase.assertTrue(
				"PROBLEME isRetraitPossible () : retrait refus� lorsque possible ...",
				this.cTrois.isRetraitPossible(this.retrait));
		this.cTrois.retirer(this.deb);
		TestCase.assertTrue(
				"PROBLEME isRetraitPossible () : retrait refus� lorsque possible ...",
				this.cTrois.isRetraitPossible(this.retrait));
		this.cTrois.retirer(this.deb);
		TestCase.assertFalse(
				"PROBLEME isRetraitPossible () : retrait accept� lorsque impossible ...",
				this.cTrois.isRetraitPossible(this.retrait));
		this.cTrois.deposer(this.cre);
		this.cTrois.retirer(this.deb);
		this.cTrois.retirer(this.deb);
		
		this.cTrois.deposer(this.retrait);
		TestCase.assertTrue(
				"PROBLEME isRetraitPossible () : retrait refus� lorsque possible ...",
				this.cTrois.isRetraitPossible(this.retrait));
		this.cTrois.retirer(this.retrait);
		this.cTrois.deposer(this.cre);
		this.cTrois.retirer(this.deb);
		this.cTrois.retirer(this.deb / 2);
		TestCase.assertFalse(
				"PROBLEME isRetraitPossible () : retrait accept� lorsque impossible ...",
				this.cTrois.isRetraitPossible(this.retrait));
	}


	public void testIsRetraitPossibleTest2() 
			throws CompteException // Sur retraits et depts
	{
		// On v�rifie que le comportement h�rit� est conserv� ...
		
		this.initCompte();
		TestCase.assertFalse(
				"PROBLEME isRetraitPossible () : retrait accept� lorsque impossible ...",
				this.cQuatre.isRetraitPossible(this.retrait));
		this.cQuatre.deposer(this.cre);
		TestCase.assertTrue(
				"PROBLEME isRetraitPossible () : retrait refus� lorsque possible ...",
				this.cQuatre.isRetraitPossible(this.retrait));
		this.cQuatre.retirer(this.deb);
		TestCase.assertTrue(
				"PROBLEME isRetraitPossible () : retrait refus� lorsque possible ...",
				this.cQuatre.isRetraitPossible(this.retrait));
		this.cQuatre.retirer(this.deb);
		TestCase.assertFalse(
				"PROBLEME isRetraitPossible () : retrait accept� lorsque impossible ...",
				this.cQuatre.isRetraitPossible(this.retrait));
		this.cQuatre.deposer(this.cre);
		this.cQuatre.retirer(this.deb);
		this.cQuatre.retirer(this.deb);
		
		this.cQuatre.deposer(this.retrait);
		TestCase.assertTrue(
				"PROBLEME isRetraitPossible () : retrait refus� lorsque possible ...",
				this.cQuatre.isRetraitPossible(this.retrait));
		this.cQuatre.retirer(this.retrait);
		TestCase.assertFalse(
				"PROBLEME isRetraitPossible () : retrait accept� lorsque impossible ...",
				this.cQuatre.isRetraitPossible(this.retrait));
	}

	public void testIsRetraitPossibleTest3() 
			throws CompteException // Sur retraits et depts
	{
		// On v�rifie que le comportement h�rit� est conserv� ...
		
		this.initCompte();
		this.cQuatre.deposer(this.decAutorise);
		TestCase.assertTrue(
				"PROBLEME isRetraitPossible () : retrait refus� lorsque possible ...",
				this.cQuatre.isRetraitPossible(this.decAutorise));
		this.cQuatre.retirer(1);
		TestCase.assertFalse(
				"PROBLEME isRetraitPossible () : retrait accept� lorsque impossible ...",
				this.cQuatre.isRetraitPossible(this.retrait));
	}

	public void testGetOperations()
			throws CompteException // Sur retraits et depts
	{
		this.initCompte() ;

		// un compte cr�� n'a pas d'op�ration.
		TestCase.assertNotNull("PROBLEME getOperations() : renvoie null ...",
				this.cQuatre.getOperations());
		TestCase.assertEquals(
				"PROBLEME getOperations() : compte cr�� contient des op�rations ...",
				0, this.cQuatre.getOperations().length);

		this.cQuatre.deposer(this.cre);

		TestCase.assertNotNull("PROBLEME getOperations() : renvoie null ...",
				this.cQuatre.getOperations());
		TestCase.assertEquals(
				"PROBLEME getOperations() : mauvaise taille tableau renvoy� ...",
				1, this.cQuatre.getOperations().length);
		TestCase.assertEquals(
				"PROBLEME getOperations() : mauvais montant suite � un d�pot ...",
				this.cre, this.cQuatre.getOperations()[0].getMontant());
		TestCase.assertEquals(
				"PROBLEME getOperations() : mauvais sens d'op�ration suite � un d�pot ...",
				SensOperation.CREDIT, this.cQuatre.getOperations()[0].getSens());

		this.cQuatre.retirer(this.deb);

		TestCase.assertNotNull("PROBLEME getOperations() : renvoie null ...",
				this.cQuatre.getOperations());
		TestCase.assertEquals(
				"PROBLEME getOperations() : mauvaise taille tableau renvoy� ...",
				2, this.cQuatre.getOperations().length);
		TestCase.assertEquals(
				"PROBLEME getOperations() : mauvais montant suite � un d�pot ...",
				this.cre, this.cQuatre.getOperations()[0].getMontant());
		TestCase.assertEquals(
				"PROBLEME getOperations() : mauvais sens d'op�ration suite � un d�pot ...",
				SensOperation.CREDIT, this.cQuatre.getOperations()[0].getSens());
		TestCase.assertEquals(
				"PROBLEME getOperations() : mauvais montant suite � un retrait ...",
				this.deb, this.cQuatre.getOperations()[1].getMontant());
		TestCase.assertEquals(
				"PROBLEME getOperations() : mauvais sens d'op�ration suite � un retrait ...",
				SensOperation.DEBIT, this.cQuatre.getOperations()[1].getSens());

		this.cQuatre.deposer(this.cre);
		this.cQuatre.retirer(this.deb);
		this.cQuatre.retirer(this.deb);
		this.cQuatre.retirer(this.deb);

		TestCase.assertNotNull("PROBLEME getOperations() : renvoie null ...",
				this.cQuatre.getOperations());
		TestCase.assertEquals(
				"PROBLEME getOperations() : mauvaise taille tableau renvoy� ...",
				6, this.cQuatre.getOperations().length);
		TestCase.assertEquals(
				"PROBLEME getOperations() : mauvais montant suite � un retrait ...",
				this.deb, this.cQuatre.getOperations()[4].getMontant());
		TestCase.assertEquals(
				"PROBLEME getOperations() : mauvais sens d'op�ration suite � un retrait ...",
				SensOperation.DEBIT, this.cQuatre.getOperations()[4].getSens());	
	}

	public void testpourVerifierFonctionnementMinimal() {
		this.initCompte();
		double soldeAvant;
		String nouvNom;

		// test deposer()
		soldeAvant = this.cTrois.soldeCompte();
		try {
			this.cTrois.deposer(this.cre);
		} catch (CompteException e) {
			TestCase.fail("PROBLEME deposer() : on ne peut pas deposer " +this.cre + " sur un compte");
		}
		TestCase.assertEquals("PROBLEME deposer() : mauvais solde...",
				soldeAvant + this.cre, this.cTrois.soldeCompte());

		// test retirer()
		soldeAvant = this.cTrois.soldeCompte();
		try {
			this.cTrois.retirer(this.deb);
		} catch (CompteException e) {
			TestCase.fail("PROBLEME retirer() : on ne peut pas retirer " + this.deb + " sur un compte");
		}
		TestCase.assertEquals("PROBLEME retirer() : mauvais solde...",
				soldeAvant - this.deb, this.cTrois.soldeCompte());

		// test retirer()
		soldeAvant = this.cTrois.soldeCompte();
		try {
			this.cTrois.retirer(this.deb);
		} catch (CompteException e) {
			TestCase.fail("PROBLEME retirer() : on ne peut pas retirer " + this.deb + " sur un compte");
		}
		TestCase.assertEquals("PROBLEME retirer() : mauvais solde...",
				soldeAvant - this.deb, this.cTrois.soldeCompte());

		// test setProprietaire
		nouvNom = "CORRIGE" + this.np + "CORRIGE";
		this.cTrois.setProprietaire(nouvNom);
		TestCase.assertEquals(
				"PROBLEME setProprietaire() : mauvaise modification ...",
				nouvNom, this.cTrois.getProprietaire());
	
		// test limites deposer/retirer
		try {
			this.cTrois.deposer(0);
		} catch (CompteException e) {
			TestCase.fail("PROBLEME deposer() : on ne peut pas deposer 0 sur un compte");
		}
		try {
			this.cTrois.deposer(-1);
			TestCase.fail("PROBLEME deposer() : on peut deposer une somme n�gative (-1) un compte");
		} catch (CompteException e) {}
		try {
			this.cTrois.retirer(0);
		} catch (CompteException e) {
			TestCase.fail("PROBLEME retirer() : on ne peut pas retirer 0 sur un compte");
		}
		try {
			this.cTrois.retirer(-1);
			TestCase.fail("PROBLEME retirer() : on peut retirer une somme n�gative (-1) sur un compte");
		} catch (CompteException e) {}
	}

	public static void main(String[] argv) {
		TestSuite suite = new TestSuite("Tests complets");
		suite.addTestSuite(TestCompteBancaire.class);
		junit.textui.TestRunner.run(suite);
	}
}
