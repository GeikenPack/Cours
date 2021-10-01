package junit_tests_comptes;


import junit.framework.TestCase;
import junit.framework.TestSuite;
import tps.banque.CompteSecurise;
import tps.banque.SensOperation;
import tps.banque.exception.CompteException;

/* Test de la classe CompteMoneo
 *
 * Test simples : constructeurs, m�thodes
 * ... et transformateurs (setters) h�rit�s
 * 
 */

public class TestCompteSecurise extends TestCase {

	// Attributs locaux pour les tests.
	// A ne pas modifier
	private CompteSecurise cDef, cDeux, cTrois;

	private final String pasDeNC = "Pas de num�ro";
	private final String pasDeNP = "Pas de propri�taire";
	private final String np = "Durand";
	private final String nc = "010101";

	private final double cre = 2000.0;
	private final double deb = 1000.0;

	private final double retrait = 1000.0;

	private final double decAutorise = 300.0;

	private void initCompte() {
		this.cDef = new CompteSecurise();
		this.cDeux = new CompteSecurise(new String(this.nc),
				new String(this.np));
		this.cTrois = new CompteSecurise(new String(this.nc), 
				new String(this.np), this.decAutorise);
	}

	public void testCompteSecuriseDefaut() {
		this.initCompte();
		// test constructeur par d�faut
		TestCase.assertEquals("PROBLEME CompteSecurise() : mauvais solde ...",
				0.0, this.cDef.soldeCompte());
		TestCase.assertEquals(
				"PROBLEME CompteSecurise() : mauvais propri�taire ...",
				this.pasDeNP, this.cDef.getProprietaire());
		TestCase.assertEquals(
				"PROBLEME CompteSecurise() : mauvais num�ro de compte ...",
				this.pasDeNC, this.cDef.getNumCompte());
	}

	public void testCompteSecurise2Parametres() {
		this.initCompte();
		// test constructeur CompteSecurise (String pNumCompte, String pNomProp)
		TestCase.assertEquals(
				"PROBLEME CompteSecurise(nc, np) : mauvais solde ...", 0.0,
				this.cDeux.soldeCompte());
		TestCase.assertEquals(
				"PROBLEME CompteSecurise(nc, np) : mauvais propri�taire ...",
				this.np, this.cDeux.getProprietaire());
		TestCase.assertEquals(
				"PROBLEME CompteSecurise(nc, np) : mauvais num�ro de compte ...",
				this.nc, this.cDeux.getNumCompte());
	}

	public void testCompteSecurise3Parametres() {
		this.initCompte();
		// test constructeur CompteSecurise (String pNumCompte, String pNomProp)
		TestCase.assertEquals(
				"PROBLEME CompteSecurise(nc, np, dca) : mauvais solde ...",
				0.0, this.cTrois.soldeCompte());
		TestCase.assertEquals(
				"PROBLEME CompteSecurise(nc, np, dca) : mauvais propri�taire ...",
				this.np, this.cTrois.getProprietaire());
		TestCase.assertEquals(
				"PROBLEME CompteSecurise(nc, np, dca) : mauvais num�ro de compte ...",
				this.nc, this.cTrois.getNumCompte());
	}

	public void testIsRetraitPossibleTest1() 
			throws CompteException // Sur retraits et depts
	{
		this.initCompte();
		TestCase.assertFalse(
				"PROBLEME isRetraitPossible () : retrait accept� lorsque impossible ...",
				this.cDeux.isRetraitPossible(this.retrait));
		this.cDeux.deposer(this.cre);
		TestCase.assertTrue(
				"PROBLEME isRetraitPossible () : retrait refus� lorsque possible ...",
				this.cDeux.isRetraitPossible(this.retrait));
		this.cDeux.retirer(this.deb);
		TestCase.assertTrue(
				"PROBLEME isRetraitPossible () : retrait refus� lorsque possible ...",
				this.cDeux.isRetraitPossible(this.retrait));
		this.cDeux.retirer(this.deb);
		TestCase.assertFalse(
				"PROBLEME isRetraitPossible () : retrait accept� lorsque impossible ...",
				this.cDeux.isRetraitPossible(this.retrait));
		this.cDeux.deposer(this.cre);
		this.cDeux.retirer(this.deb);
		this.cDeux.retirer(this.deb);
		this.cDeux.deposer(this.retrait);
		TestCase.assertTrue(
				"PROBLEME isRetraitPossible () : retrait refus� lorsque possible ...",
				this.cDeux.isRetraitPossible(this.retrait));
		this.cDeux.retirer(this.retrait);
		this.cDeux.deposer(this.cre);
		this.cDeux.retirer(this.deb);
		this.cDeux.retirer(this.deb / 2);
		TestCase.assertFalse(
				"PROBLEME isRetraitPossible () : retrait accept� lorsque impossible ...",
				this.cDeux.isRetraitPossible(this.retrait));
	}

	public void testIsRetraitPossibleTest2() 
			throws CompteException // Sur retraits et depts
	{
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
		TestCase.assertFalse(
				"PROBLEME isRetraitPossible () : retrait accept� lorsque impossible ...",
				this.cTrois.isRetraitPossible(this.retrait));
	}

	public void testIsRetraitPossibleTest3() 
			throws CompteException // Sur retraits et depts
	{
		this.initCompte();
		this.cTrois.deposer(this.decAutorise);
		TestCase.assertTrue(
				"PROBLEME isRetraitPossible () : retrait refus� lorsque possible ...",
				this.cTrois.isRetraitPossible(this.decAutorise));
		this.cTrois.retirer(1);
		TestCase.assertFalse(
				"PROBLEME isRetraitPossible () : retrait accept� lorsque impossible ...",
				this.cTrois.isRetraitPossible(this.retrait));
	}
	
	public void testIsRetraitPossibleTest4() 
			throws CompteException // Sur retraits et depts
	{
		this.cTrois = new CompteSecurise(new String(this.nc), new String(this.np), this.decAutorise);
		double montant = this.decAutorise;
		this.cTrois.deposer(montant);

		TestCase.assertTrue(
				"PROBLEME isRetraitPossible () : retrait refus� lorsque possible ...",
				this.cTrois.isRetraitPossible(montant * 2.0));
		this.cTrois.retirer(montant*2.0);
	}

	public void testGetOperations()
			throws CompteException // Sur retraits et depts
	{
		this.initCompte() ;

		// un compte cr�� n'a pas d'op�ration.
		TestCase.assertNotNull("PROBLEME getOperations() : renvoie null ...",
				this.cTrois.getOperations());
		TestCase.assertEquals(
				"PROBLEME getOperations() : compte cr�� contient des op�rations ...",
				0, this.cTrois.getOperations().length);

		this.cTrois.deposer(this.cre);

		TestCase.assertNotNull("PROBLEME getOperations() : renvoie null ...",
				this.cTrois.getOperations());
		TestCase.assertEquals(
				"PROBLEME getOperations() : mauvaise taille tableau renvoy� ...",
				1, this.cTrois.getOperations().length);
		TestCase.assertEquals(
				"PROBLEME getOperations() : mauvais montant suite � un d�pot ...",
				this.cre, this.cTrois.getOperations()[0].getMontant());
		TestCase.assertEquals(
				"PROBLEME getOperations() : mauvais sens d'op�ration suite � un d�pot ...",
				SensOperation.CREDIT, this.cTrois.getOperations()[0].getSens());

		this.cTrois.retirer(this.deb);

		TestCase.assertNotNull("PROBLEME getOperations() : renvoie null ...",
				this.cTrois.getOperations());
		TestCase.assertEquals(
				"PROBLEME getOperations() : mauvaise taille tableau renvoy� ...",
				2, this.cTrois.getOperations().length);
		TestCase.assertEquals(
				"PROBLEME getOperations() : mauvais montant suite � un d�pot ...",
				this.cre, this.cTrois.getOperations()[0].getMontant());
		TestCase.assertEquals(
				"PROBLEME getOperations() : mauvais sens d'op�ration suite � un d�pot ...",
				SensOperation.CREDIT, this.cTrois.getOperations()[0].getSens());
		TestCase.assertEquals(
				"PROBLEME getOperations() : mauvais montant suite � un retrait ...",
				this.deb, this.cTrois.getOperations()[1].getMontant());
		TestCase.assertEquals(
				"PROBLEME getOperations() : mauvais sens d'op�ration suite � un retrait ...",
				SensOperation.DEBIT, this.cTrois.getOperations()[1].getSens());

		this.cTrois.deposer(this.cre);
		this.cTrois.retirer(this.deb);
		this.cTrois.retirer(this.deb);
		this.cTrois.retirer(this.deb);

		TestCase.assertNotNull("PROBLEME getOperations() : renvoie null ...",
				this.cTrois.getOperations());
		TestCase.assertEquals(
				"PROBLEME getOperations() : mauvaise taille tableau renvoy� ...",
				6, this.cTrois.getOperations().length);
		TestCase.assertEquals(
				"PROBLEME getOperations() : mauvais montant suite � un retrait ...",
				this.deb, this.cTrois.getOperations()[4].getMontant());
		TestCase.assertEquals(
				"PROBLEME getOperations() : mauvais sens d'op�ration suite � un retrait ...",
				SensOperation.DEBIT, this.cTrois.getOperations()[4].getSens());	
	}


	public void testpourVerifierFonctionnementMinimal() {
		this.initCompte();
		double soldeAvant;
		String nouvNom;

		// test deposer()
		soldeAvant = this.cDeux.soldeCompte();
		try {
			this.cDeux.deposer(this.cre);
		} catch (CompteException e) {
			TestCase.fail("PROBLEME deposer() : on ne peut pas deposer " +this.cre + " sur un compte");
		}
		TestCase.assertEquals("PROBLEME deposer() : mauvais solde...",
				soldeAvant + this.cre, this.cDeux.soldeCompte());

		// test retirer()
		soldeAvant = this.cDeux.soldeCompte();
		try {
			this.cDeux.retirer(this.deb);
		} catch (CompteException e) {
			TestCase.fail("PROBLEME retirer() : on ne peut pas retirer " + this.deb + " sur un compte");
		}
		TestCase.assertEquals("PROBLEME retirer() : mauvais solde...",
				soldeAvant - this.deb, this.cDeux.soldeCompte());

		// test retirer()
		soldeAvant = this.cDeux.soldeCompte();
		try {
			this.cDeux.retirer(this.deb);
		} catch (CompteException e) {
			TestCase.fail("PROBLEME retirer() : on ne peut pas retirer " + this.deb + " sur un compte");
		}
		TestCase.assertEquals("PROBLEME retirer() : mauvais solde...",
				soldeAvant - this.deb, this.cDeux.soldeCompte());

		// test setProprietaire
		nouvNom = "CORRIGE" + this.np + "CORRIGE";
		this.cDeux.setProprietaire(nouvNom);
		TestCase.assertEquals(
				"PROBLEME setProprietaire() : mauvaise modification ...",
				nouvNom, this.cDeux.getProprietaire());
	
		// test limites deposer/retirer
		try {
			this.cDeux.deposer(0);
		} catch (CompteException e) {
			TestCase.fail("PROBLEME deposer() : on ne peut pas deposer 0 sur un compte");
		}
		try {
			this.cDeux.deposer(-1);
			TestCase.fail("PROBLEME deposer() : on peut deposer une somme n�gative (-1) un compte");
		} catch (CompteException e) {}
		try {
			this.cDeux.retirer(0);
		} catch (CompteException e) {
			TestCase.fail("PROBLEME retirer() : on ne peut pas retirer 0 sur un compte");
		}
		try {
			this.cDeux.retirer(-1);
			TestCase.fail("PROBLEME retirer() : on peut retirer une somme n�gative (-1) sur un compte");
		} catch (CompteException e) {}
	}

	public static void main(String[] argv) {
		TestSuite suite = new TestSuite("Tests complets");
		suite.addTestSuite(TestCompteSecurise.class);
		junit.textui.TestRunner.run(suite);
	}
}
