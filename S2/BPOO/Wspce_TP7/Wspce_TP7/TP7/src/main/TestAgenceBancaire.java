
package main;

import tps.banque.AgenceBancaire;
import tps.banque.Compte;
import tps.banque.exception.ABCompteDejaExistantException;
import tps.banque.exception.ABCompteInexistantException;
import tps.banque.exception.ABCompteNullException;
import junit.framework.TestCase;
import junit.framework.TestSuite;

/* 
 * Test de la classe AgenceBancaire
 */

public class TestAgenceBancaire extends TestCase {

    // Attributs locaux pour les tests.
    // A ne pas modifier

    private AgenceBancaire uneAg; // L'AgenceBancaire test�e
    private Compte c1, c2, c3, c4; // 3 comptes diff�rents (num compte diff�rents)
    private Compte c1TestProp, c2TestProp, c3TestProp; // 3 comptes meme proprio
    private final String nom = "AgenceBancaire Test";
    private final String loc = "Localisation AgenceBancaire Test";

    // Num�ros et propri�taires de 4 comptes diff�rents 
    private final String numC1 = "11Exist";
    private final String propC1 = "11propExist";
    private final String numC2 = "22Exist";
    private final String propC2 = "22propExist";
    private final String numC3 = "33Exist";
    private final String propC3 = "33propExist";
    private final String numC4 = "44Exist";
    private final String propC4 = "44propExist";

    // 3 Num�ros diff�rents de comptes d'un m�me propri�taire. 
    private final String numTC1prop = "55AmemeProp";
    private final String numTC2prop = "55BmemeProp";
    private final String numTC3prop = "55CmemeProp";
    private final String propTprop = "55MEMEPROPRIETAIRE";

    private final String numInexistant = "88Inexist"; // num�ro sans compte
    private final String propInexistant = "88propInExist"; // propri�taire sans compte

    // Nombre d'ajouts de compte max pour remplissages
    // Nombre de valeurs dans initialisation de tabCptesTests
    private final int MAX_CPTS_TESTS = 20;
    
    // MAX_CPTS_TESTS comptes de tests
    private final Compte[] tabCptesTests = {
            new Compte ("99a", "99"), new Compte ("99b", "99"), new Compte ("99c", "99"), new Compte ("99d", "99"),
            new Compte ("99e", "99"), new Compte ("99f", "99"), new Compte ("99g", "99"), new Compte ("99h", "99"),
            new Compte ("99i", "99"), new Compte ("99j", "99"),
            new Compte ("99k", "99"), new Compte ("99l", "99"), new Compte ("99m", "99"), new Compte ("99n", "99"),
            new Compte ("99o", "99"), new Compte ("99p", "99"), new Compte ("99q", "99"), new Compte ("99r", "99"),
            new Compte ("99s", "99"), new Compte ("99t", "99")
    };


    // Appel�e en d�but de tests pour initialiser les datas de test.
    private void initTests() {
        // On fait des "new String ()" � chaque fois
        // pour invalider des tests dans l'AgenceBancaire
        // du type : if (numCpte == autreNumCpte) ...
        this.uneAg = new AgenceBancaire(new String(this.nom), new String(this.loc));
        this.c1 = new Compte(new String(this.numC1), new String(this.propC1));
        this.c2 = new Compte(new String(this.numC2), new String(this.propC2));
        this.c3 = new Compte(new String(this.numC3), new String(this.propC3));
        this.c4 = new Compte(new String(this.numC4), new String(this.propC4));
        this.c1TestProp = new Compte(new String(this.numTC1prop), new String(this.propTprop));
        this.c2TestProp = new Compte(new String(this.numTC2prop), new String(this.propTprop));
        this.c3TestProp = new Compte(new String(this.numTC3prop), new String(this.propTprop));
    }

    // Ajoute entre 0 et MAX_CPTS_TESTS comptes au hasard de tabCptesTests dans l'AgenceBancaire ag
    private void ajoutsComptes(AgenceBancaire pfAg) {
        int i, jcpte;
        int nbAdd = (int) (Math.random() * this.MAX_CPTS_TESTS);
        for (i = 0; i < nbAdd; i++) {
            jcpte = (int) (Math.random() * this.MAX_CPTS_TESTS);
            try {
				pfAg.addCompte(this.tabCptesTests[jcpte]);
    		} catch (ABCompteNullException e) {} 
              catch (ABCompteDejaExistantException e) {}
        }
    }

    // Retire entre 0 et MAX_CPTS_TESTS comptes au hasard de tabCptesTests dans l'AgenceBancaire ag
    private void retraitsComptes(AgenceBancaire pfAg) {
    	int i, jcpte;
	    int nbRem = (int) (Math.random() * this.MAX_CPTS_TESTS);
	    for (i = 0; i < nbRem; i++) {
	        jcpte = (int) (Math.random() * this.MAX_CPTS_TESTS);
	        try {	  
				pfAg.removeCompte(this.tabCptesTests[jcpte].getNumCompte());
			} catch (ABCompteInexistantException e) {}
	    }
    }

    // Retire tous les comptes de tabCptesTests pr�sents dans l'AgenceBancaire ag
    private void retraitsTousLesComptes(AgenceBancaire pfAg) {
    	int i;
        for (i = 0; i < this.MAX_CPTS_TESTS; i++) {
            try {
            	pfAg.removeCompte(this.tabCptesTests[i].getNumCompte());
    		} catch (ABCompteInexistantException e) {}
        }
	}
    
	public void testAgenceBancaire() {
		this.initTests();
        /*
         * Teste le constucteur.
         * Tetse le nom de l'agence la localisation, le nombre de comptes apr�s cr�ation.
         * Teste que aucun compte ne peut �tre trouv�.
         */
		
        TestCase.assertEquals("PROBLEME AgenceBancaire () : mauvais nom de AgenceBancaire ...",
                this.nom, this.uneAg.getNomAgence());
        TestCase.assertEquals("PROBLEME AgenceBancaire () : mauvaise localisation ...",
                this.loc, this.uneAg.getLocAgence());
        TestCase.assertEquals("PROBLEME AgenceBancaire () : mauvais nombre de comptes ...",
                0, this.uneAg.getNbComptes());
        TestCase.assertNull("PROBLEME AgenceBancaire () : un compte est trouv� dans une AgenceBancaire vide ...",
                this.uneAg.getCompte(this.numInexistant));
        Compte[] t;
        t = this.uneAg.getComptesDe(this.propInexistant);
        TestCase.assertEquals("PROBLEME AgenceBancaire () : un propor�taire est trouv� dans une AgenceBancaire vide ...",
                0, t.length);
    }

    public void testAddCompte_1 () {
		boolean exceptionOuPas;

		this.initTests();
    	
    	/*
    	 *  Test ajout de compte sur AgenceBancaire vide
    	 *  Ajouts et tests successifs � partir d'une agence vide (0 comptes)
    	 */
		
		exceptionOuPas = false;
		try {
			this.uneAg.addCompte(null);
		} catch (ABCompteNullException e) {
			exceptionOuPas=true;
		} catch (ABCompteDejaExistantException e) {
			exceptionOuPas = false;
		}
        TestCase.assertTrue("PROBLEME addCompte() : on peut ajouter un objet Compte � null ...", 
        		exceptionOuPas);

		exceptionOuPas = false;
		try {
			this.uneAg.addCompte(this.c1);
		} catch (ABCompteNullException e) {
			exceptionOuPas=true;
		} catch (ABCompteDejaExistantException e) {
			exceptionOuPas = true;
		}
        TestCase.assertFalse("PROBLEME addCompte() : on ne peut pas ajouter un compte nouveau dans l'AgenceBancaire : "+this.c1.getNumCompte(),
        		exceptionOuPas);
        
		exceptionOuPas = false;
		try {
			this.uneAg.addCompte(this.c1);
		} catch (ABCompteNullException e) {
			exceptionOuPas=false;
		} catch (ABCompteDejaExistantException e) {
			exceptionOuPas = true;
		}
		TestCase.assertTrue("PROBLEME addCompte() : on peut ajouter un compte dont le num�ro est d�j� existant dans l'AgenceBancaire : "+this.c1.getNumCompte(),
				exceptionOuPas);
		
		exceptionOuPas = false;
		try {
			this.uneAg.addCompte(this.c2);
		} catch (ABCompteNullException e) {
			exceptionOuPas=true;
		} catch (ABCompteDejaExistantException e) {
			exceptionOuPas = true;
		}
        TestCase.assertFalse("PROBLEME addCompte() : on ne peut pas ajouter un compte nouveau dans l'AgenceBancaire : "+this.c2.getNumCompte(),
        		exceptionOuPas);
        
		exceptionOuPas = false;
		try {
			this.uneAg.addCompte(this.c3);
		} catch (ABCompteNullException e) {
			exceptionOuPas=true;
		} catch (ABCompteDejaExistantException e) {
			exceptionOuPas = true;
		}
        TestCase.assertFalse("PROBLEME addCompte() : on ne peut pas ajouter un compte nouveau dans l'AgenceBancaire : "+this.c3.getNumCompte(),
        		exceptionOuPas);
    }

    public void testAddCompte_2 () {
		boolean exceptionOuPas;

		this.initTests();
		
        /*
         *  Test ajout de Compte sur AgenceBancaire apr�s des ajouts de comptes
         *  On ajoute des comtes et on teste les ajouts nouveaux
         */
		
        try {
			this.uneAg.addCompte(this.c1);
	        this.ajoutsComptes(this.uneAg);
	        this.uneAg.addCompte(this.c2);
	        this.ajoutsComptes(this.uneAg);
	        this.uneAg.addCompte(this.c3);
	    } catch (ABCompteNullException e1) { e1.printStackTrace(); }
          catch (ABCompteDejaExistantException e1) {e1.printStackTrace(); }

        // Test ajout d�but, milieu, fin
        exceptionOuPas = false;
		try {
			this.uneAg.addCompte(null);
		} catch (ABCompteNullException e) {
			exceptionOuPas=true;
		} catch (ABCompteDejaExistantException e) {
			exceptionOuPas = false;
		}
        TestCase.assertTrue("PROBLEME addCompte() : on peut ajouter un objet Compte � null ...", 
        		exceptionOuPas);

		exceptionOuPas = false;
		try {
			this.uneAg.addCompte(this.c1);
		} catch (ABCompteNullException e) {
			exceptionOuPas=false;
		} catch (ABCompteDejaExistantException e) {
			exceptionOuPas = true;
		}
        TestCase.assertTrue("PROBLEME addCompte() : on peut ajouter un compte dont le num�ro est d�j� existant dans l'AgenceBancaire : "+this.c1.getNumCompte(),
        		exceptionOuPas);
        
		exceptionOuPas = false;
		try {
			this.uneAg.addCompte(this.c2);
		} catch (ABCompteNullException e) {
			exceptionOuPas=false;
		} catch (ABCompteDejaExistantException e) {
			exceptionOuPas = true;
		}
		TestCase.assertTrue("PROBLEME addCompte() : on peut ajouter un compte dont le num�ro est d�j� existant dans l'AgenceBancaire : "+this.c2.getNumCompte(),
        		exceptionOuPas);
		
		exceptionOuPas = false;
		try {
			this.uneAg.addCompte(this.c3);
		} catch (ABCompteNullException e) {
			exceptionOuPas=false;
		} catch (ABCompteDejaExistantException e) {
			exceptionOuPas = true;
		}
		TestCase.assertTrue("PROBLEME addCompte() : on peut ajouter un compte dont le num�ro est d�j� existant dans l'AgenceBancaire : "+this.c3.getNumCompte(),
        		exceptionOuPas);
		
		exceptionOuPas = false;
		try {
			this.uneAg.addCompte(this.c4);
		} catch (ABCompteNullException e) {
			exceptionOuPas=true;
		} catch (ABCompteDejaExistantException e) {
			exceptionOuPas = true;
		}
		TestCase.assertFalse("PROBLEME addCompte() : on ne peut pas ajouter un objet Compte inexistant : "+this.c4.getNumCompte(),
				exceptionOuPas);
		
		exceptionOuPas = false;
		try {
			this.uneAg.addCompte(this.c4);
		} catch (ABCompteNullException e) {
			exceptionOuPas=false;
		} catch (ABCompteDejaExistantException e) {
			exceptionOuPas = true;
		}
        TestCase.assertTrue("PROBLEME addCompte() : on peut ajouter un compte dont le num�ro est d�j� existant dans l'AgenceBancaire : "+this.c4.getNumCompte(),
				exceptionOuPas);
    }

    public void testAddCompte_3 () {
		boolean exceptionOuPas;

		this.initTests();

		/* Test ajout de comptes sur AgenceBancaire apr�s des ajouts et des retraits de comptes
		 * On teste les ajouts apr�s une s�rie d'ajouts et de retraits de comptes.
		 */
		
        try {
			this.uneAg.addCompte(this.c1);
	        this.ajoutsComptes(this.uneAg);
	        this.uneAg.addCompte(this.c2);
	        this.ajoutsComptes(this.uneAg);
	        this.uneAg.addCompte(this.c3);
	    } catch (ABCompteNullException e1) { e1.printStackTrace(); }
          catch (ABCompteDejaExistantException e1) {e1.printStackTrace(); }
        
        this.retraitsComptes(this.uneAg);
        
        // Test ajout d�but, milieu, fin
		exceptionOuPas = false;
		try {
			this.uneAg.addCompte(null);
		} catch (ABCompteNullException e) {
			exceptionOuPas=true;
		} catch (ABCompteDejaExistantException e) {
			exceptionOuPas = false;
		}
        TestCase.assertTrue("PROBLEME addCompte() : on peut ajouter un objet Compte � null ...", 
        		exceptionOuPas);

		exceptionOuPas = false;
		try {
			this.uneAg.addCompte(this.c1);
		} catch (ABCompteNullException e) {
			exceptionOuPas=false;
		} catch (ABCompteDejaExistantException e) {
			exceptionOuPas = true;
		}
        TestCase.assertTrue("PROBLEME addCompte() : on peut ajouter un compte dont le num�ro est d�j� existant dans l'AgenceBancaire : "+this.c1.getNumCompte(),
        		exceptionOuPas);
        
		exceptionOuPas = false;
		try {
			this.uneAg.addCompte(this.c2);
		} catch (ABCompteNullException e) {
			exceptionOuPas=false;
		} catch (ABCompteDejaExistantException e) {
			exceptionOuPas = true;
		}
		TestCase.assertTrue("PROBLEME addCompte() : on peut ajouter un compte dont le num�ro est d�j� existant dans l'AgenceBancaire : "+this.c2.getNumCompte(),
        		exceptionOuPas);
		
		exceptionOuPas = false;
		try {
			this.uneAg.addCompte(this.c3);
		} catch (ABCompteNullException e) {
			exceptionOuPas=false;
		} catch (ABCompteDejaExistantException e) {
			exceptionOuPas = true;
		}
		TestCase.assertTrue("PROBLEME addCompte() : on peut ajouter un compte dont le num�ro est d�j� existant dans l'AgenceBancaire : "+this.c3.getNumCompte(),
        		exceptionOuPas);
		
		exceptionOuPas = false;
		try {
			this.uneAg.addCompte(this.c4);
		} catch (ABCompteNullException e) {
			exceptionOuPas=true;
		} catch (ABCompteDejaExistantException e) {
			exceptionOuPas = true;
		}
		TestCase.assertFalse("PROBLEME addCompte() : on ne peut pas ajouter un objet Compte inexistant : "+this.c4.getNumCompte(),
				exceptionOuPas);
		
		exceptionOuPas = false;
		try {
			this.uneAg.addCompte(this.c4);
		} catch (ABCompteNullException e) {
			exceptionOuPas=false;
		} catch (ABCompteDejaExistantException e) {
			exceptionOuPas = true;
		}
        TestCase.assertTrue("PROBLEME addCompte() : on peut ajouter un compte dont le num�ro est d�j� existant dans l'AgenceBancaire : "+this.c4.getNumCompte(),
				exceptionOuPas);
    }
    
    public void testAddCompte_4 () throws ABCompteInexistantException {
    	boolean exceptionOuPas;
    	
		this.initTests();

        /*
         *  Test ajouts de comptes sur AgenceBancaire apr�s des ajouts et retrait de tous les comptes (AgenceBancaire "vide")
         *  On ajoute une s�rie de comptes, on les enl�ve tous et on teste les ajouts nouveaux.
         */
		
        try {
			this.uneAg.addCompte(this.c1);
	        this.ajoutsComptes(this.uneAg);
	        this.uneAg.addCompte(this.c2);
	        this.ajoutsComptes(this.uneAg);
	        this.uneAg.addCompte(this.c3);
	    } catch (ABCompteNullException e1) { e1.printStackTrace(); }
          catch (ABCompteDejaExistantException e1) {e1.printStackTrace(); }

        this.retraitsTousLesComptes(this.uneAg);
        
		this.uneAg.removeCompte(numC1);
        this.uneAg.removeCompte(numC2);
        this.uneAg.removeCompte(numC3);

		exceptionOuPas = false;
		try {
			this.uneAg.addCompte(this.c1);
		} catch (ABCompteNullException e) {
			exceptionOuPas=true;
		} catch (ABCompteDejaExistantException e) {
			exceptionOuPas = true;
		}
        TestCase.assertFalse("PROBLEME addCompte() : on ne peut pas ajouter un objet Compte inexistant : "+this.c1.getNumCompte(),
        		exceptionOuPas);
        
		exceptionOuPas = false;
		try {
			this.uneAg.addCompte(this.c1);
		} catch (ABCompteNullException e) {
			exceptionOuPas=false;
		} catch (ABCompteDejaExistantException e) {
			exceptionOuPas = true;
		}
        TestCase.assertTrue("PROBLEME addCompte() : on peut ajouter un compte dont le num�ro est d�j� existant dans l'AgenceBancaire : "+this.c1.getNumCompte(),
        		exceptionOuPas);
        
		exceptionOuPas = false;
		try {
			this.uneAg.addCompte(this.c4);
		} catch (ABCompteNullException e) {
			exceptionOuPas=true;
		} catch (ABCompteDejaExistantException e) {
			exceptionOuPas = true;
		}
		TestCase.assertFalse("PROBLEME addCompte() : on ne peut pas ajouter un objet Compte inexistant : "+this.c4.getNumCompte(),
				exceptionOuPas);
		
		exceptionOuPas = false;
		try {
			this.uneAg.addCompte(this.c4);
		} catch (ABCompteNullException e) {
			exceptionOuPas=false;
		} catch (ABCompteDejaExistantException e) {
			exceptionOuPas = true;
		}
        TestCase.assertTrue("PROBLEME addCompte() : on peut ajouter un compte dont le num�ro est d�j� existant dans l'AgenceBancaire : "+this.c4.getNumCompte(),
				exceptionOuPas);
    }
   
    public void testAddCompte_5 () throws ABCompteInexistantException {
    	String nomAvant;
    	String locAvant;
		
    	this.initTests();
    	
    	/*
    	 *  Teste le nom et la localisation de l'agence sur des ajouts de comptes
    	 *  On teste le nom et la localisation (qui ne doivent pas changer)
    	 *  apr�s des s�ries d'ajouts et retraits puis ajouts de nouveau.
    	 */
    	
    	// Test sur AgenceBancaire apr�s un seul ajout
    	
    	nomAvant = this.uneAg.getNomAgence();
    	locAvant = this.uneAg.getLocAgence();
        
        try {
			this.uneAg.addCompte(this.c1);
	    } catch (ABCompteNullException e1) { e1.printStackTrace(); }
          catch (ABCompteDejaExistantException e1) {e1.printStackTrace(); }

        TestCase.assertEquals("PROBLEME addCompte() : modifie le nom de l'AgenceBancaire  ...",
        		nomAvant, this.uneAg.getNomAgence());
        TestCase.assertEquals("PROBLEME addCompte() : modifie la localisation de l'AgenceBancaire  ...",
        		locAvant, this.uneAg.getLocAgence());

        // Test sur AgenceBancaire apr�s ajouts de comptes
        
        nomAvant = this.uneAg.getNomAgence();
        locAvant = this.uneAg.getLocAgence();

        this.ajoutsComptes(this.uneAg);
        try {
			this.uneAg.addCompte(this.c2);
	    } catch (ABCompteNullException e1) { e1.printStackTrace(); }
          catch (ABCompteDejaExistantException e1) {e1.printStackTrace(); }
        
        TestCase.assertEquals("PROBLEME addCompte() : modifie le nom de l'AgenceBancaire  ...",
        		nomAvant, this.uneAg.getNomAgence());
        TestCase.assertEquals("PROBLEME addCompte() : modifie la localisation de l'AgenceBancaire  ...",
        		locAvant, this.uneAg.getLocAgence());
        
        // Test sur AgenceBancaire apr�s retraits de quelques comptes
        
        nomAvant = this.uneAg.getNomAgence();
        locAvant = this.uneAg.getLocAgence();
        
        this.retraitsComptes(this.uneAg);
 		this.uneAg.removeCompte(this.numC1);
        
        try {
			this.uneAg.addCompte(this.c1);
	    } catch (ABCompteNullException e1) { e1.printStackTrace(); }
          catch (ABCompteDejaExistantException e1) {e1.printStackTrace(); }
        
        TestCase.assertEquals("PROBLEME addCompte() : modifie le nom de l'AgenceBancaire  ...",
        		nomAvant, this.uneAg.getNomAgence());
        TestCase.assertEquals("PROBLEME addCompte() : modifie la localisation de l'AgenceBancaire  ...",
        		locAvant, this.uneAg.getLocAgence());

        // Test sur AgenceBancaire "vid�e"
        
        this.retraitsTousLesComptes(this.uneAg);
		this.uneAg.removeCompte(this.numC1);
	    this.uneAg.removeCompte(this.numC2);

        nomAvant = this.uneAg.getNomAgence();
        locAvant = this.uneAg.getLocAgence();

        try {
			this.uneAg.addCompte(this.c1);
	    } catch (ABCompteNullException e1) { e1.printStackTrace(); }
          catch (ABCompteDejaExistantException e1) {e1.printStackTrace(); }
        
        TestCase.assertEquals("PROBLEME addCompte() : modifie le nom de l'AgenceBancaire  ...",
        		nomAvant, this.uneAg.getNomAgence());
        TestCase.assertEquals("PROBLEME addCompte() : modifie la localisation de l'AgenceBancaire  ...",
        		locAvant, this.uneAg.getLocAgence());
    }

    public void testRemoveCompte_1 () {
    	boolean exceptionOuPas;
    	
		this.initTests();
    	
    	/* Test remove comptes sur AgenceBancaire vide
    	 * Test d'enlever un compte d'une agence vide (0 comptes)
    	 */
		
		exceptionOuPas = false;
        try {
			this.uneAg.removeCompte(this.numInexistant);
		} catch (ABCompteInexistantException e) {
			exceptionOuPas = true;
		}
        
        TestCase.assertTrue("PROBLEME removeCompte() : on peut enlever un compte inexistant ...",
        		exceptionOuPas);
    }

    public void testRemoveCompte_2 () throws ABCompteNullException, ABCompteDejaExistantException {
    	boolean exceptionOuPas;
    	
		this.initTests();

        /* Test remove comptes sur AgenceBancaire apr�s des ajouts de comptes
         * Tests de retraits de compte apr�s une s�rie d'ajouts. 
         */
		
        this.uneAg.addCompte(this.c1);
        this.ajoutsComptes(this.uneAg);
        this.uneAg.addCompte(this.c2);
        this.ajoutsComptes(this.uneAg);
        this.uneAg.addCompte(this.c3);

        // Test d�but, milieu, fin
		exceptionOuPas = false;
        try {
			this.uneAg.removeCompte(this.numInexistant);
		} catch (ABCompteInexistantException e) {
			exceptionOuPas = true;
		}
        TestCase.assertTrue("PROBLEME removeCompte() : on peut enlever un compte inexistant ...",
                exceptionOuPas);
        
		exceptionOuPas = false;
        try {
			this.uneAg.removeCompte(this.numC1);
		} catch (ABCompteInexistantException e) {
			exceptionOuPas = true;
		}
        TestCase.assertFalse("PROBLEME removeCompte() : on ne peut pas enlever un compte existant : "+this.numC1,
        		exceptionOuPas);

		exceptionOuPas = false;
        try {
			this.uneAg.removeCompte(this.numC2);
		} catch (ABCompteInexistantException e) {
			exceptionOuPas = true;
		}
        TestCase.assertFalse("PROBLEME removeCompte() : on ne peut pas enlever un compte existant : "+this.numC2,
        		exceptionOuPas);
        
		exceptionOuPas = false;
        try {
			this.uneAg.removeCompte(this.numC3);
		} catch (ABCompteInexistantException e) {
			exceptionOuPas = true;
		}
        TestCase.assertFalse("PROBLEME removeCompte() : on ne peut pas enlever un compte existant : "+this.numC2,
        		exceptionOuPas);

		exceptionOuPas = false;
        try {
			this.uneAg.removeCompte(this.numInexistant);
		} catch (ABCompteInexistantException e) {
			exceptionOuPas = true;
		}
        TestCase.assertTrue("PROBLEME removeCompte() : on peut enlever un compte inexistant ...",
                exceptionOuPas);
    }

    public void testRemoveCompte_3 () throws ABCompteNullException, ABCompteDejaExistantException {
    	boolean exceptionOuPas;
    	
		this.initTests();

        /* Test remove comptes sur AgenceBancaire apr�s des ajouts et des retraits de comptes
         * Tests de retraits de compte apr�s une s�rie d'ajouts et de retraits
         */
		
        this.uneAg.addCompte(this.c1);
        this.ajoutsComptes(this.uneAg);
        this.uneAg.addCompte(this.c2);
        this.ajoutsComptes(this.uneAg);
        this.uneAg.addCompte(this.c3);
        
        this.retraitsComptes(this.uneAg);
        
        // Test d�but, milieu, fin
		exceptionOuPas = false;
        try {
			this.uneAg.removeCompte(this.numInexistant);
		} catch (ABCompteInexistantException e) {
			exceptionOuPas = true;
		}
        
        TestCase.assertTrue("PROBLEME removeCompte() : on peut enlever un compte inexistant ...",
                exceptionOuPas);
        
		exceptionOuPas = false;
        try {
			this.uneAg.removeCompte(this.numC1);
		} catch (ABCompteInexistantException e) {
			exceptionOuPas = true;
		}
        
        TestCase.assertFalse("PROBLEME removeCompte() : on ne peut pas enlever un compte existant : "+this.numC1,
        		exceptionOuPas);

		exceptionOuPas = false;
        try {
			this.uneAg.removeCompte(this.numC2);
		} catch (ABCompteInexistantException e) {
			exceptionOuPas = true;
		}
        
        TestCase.assertFalse("PROBLEME removeCompte() : on ne peut pas enlever un compte existant : "+this.numC2,
        		exceptionOuPas);
        
		exceptionOuPas = false;
        try {
			this.uneAg.removeCompte(this.numC3);
		} catch (ABCompteInexistantException e) {
			exceptionOuPas = true;
		}
        
        TestCase.assertFalse("PROBLEME removeCompte() : on ne peut pas enlever un compte existant : "+this.numC2,
        		exceptionOuPas);

		exceptionOuPas = false;
        try {
			this.uneAg.removeCompte(this.numInexistant);
		} catch (ABCompteInexistantException e) {
			exceptionOuPas = true;
		}
        
        TestCase.assertTrue("PROBLEME removeCompte() : on peut enlever un compte inexistant ...",
                exceptionOuPas);
    }
    
    public void testRemoveCompte_4 () throws ABCompteNullException, ABCompteDejaExistantException {
    	boolean exceptionOuPas;
    	
		this.initTests();

    	/* Test remove comptes sur AgenceBancaire apr�s des ajouts et retrait de tous les comptes (AgenceBancaire "vide")
    	 * Tests de retraits de compte apr�s une s�rie d'ajouts et de retraits de tous les comptes
    	 * donc sur une agence vide (0 comptes).
    	 */
		
        this.uneAg.addCompte(this.c1);
        this.ajoutsComptes(this.uneAg);
        this.uneAg.addCompte(this.c2);
        this.ajoutsComptes(this.uneAg);
        this.uneAg.addCompte(this.c3);

        this.retraitsTousLesComptes(this.uneAg);
        
        try {
	        this.uneAg.removeCompte(numC1);
	        this.uneAg.removeCompte(numC2);
	        this.uneAg.removeCompte(numC3);
		} catch (ABCompteInexistantException e) {} 
        
		exceptionOuPas = false;
        try {
			this.uneAg.removeCompte(this.numInexistant);
		} catch (ABCompteInexistantException e) {
			exceptionOuPas = true;
		}
        
        TestCase.assertTrue("PROBLEME removeCompte() : on peut enlever un compte inexistant ...",
                exceptionOuPas);
    }
   
    public void testRemoveCompte_5 () throws ABCompteNullException, ABCompteDejaExistantException {
		this.initTests();

    	String nomAvant;
    	String locAvant;
    	
    	/* Teste le nom et la localisation de l'agence sur removeCompte()
    	 * Test de nom et localisation apr�s des op�rations de retraits apr�s plusieurs op�rations ajouts/retraits.
    	 */
    	
        // Test sur AgenceBancaire apr�s des ajouts de comptes
       
    	this.uneAg.addCompte(this.c1);
    	this.ajoutsComptes(this.uneAg);
        this.uneAg.addCompte(this.c2);
        this.ajoutsComptes(this.uneAg);
        this.uneAg.addCompte(this.c3);

        nomAvant = this.uneAg.getNomAgence();
        locAvant = this.uneAg.getLocAgence();
        
        try {
			this.uneAg.removeCompte(this.numInexistant);
		} catch (ABCompteInexistantException e) {}
        
        TestCase.assertEquals("PROBLEME removeCompte () : modifie le nom de l'AgenceBancaire  ...",
                nomAvant, this.uneAg.getNomAgence());
        TestCase.assertEquals("PROBLEME removeCompte () : modifie la localisation de l'AgenceBancaire  ...",
                locAvant, this.uneAg.getLocAgence());
        
        nomAvant = this.uneAg.getNomAgence();
        locAvant = this.uneAg.getLocAgence();
 
        try {
			this.uneAg.removeCompte(this.numC1);
		} catch (ABCompteInexistantException e) {}

        TestCase.assertEquals("PROBLEME removeCompte () : modifie le nom de l'AgenceBancaire  ...",
                nomAvant, this.uneAg.getNomAgence());
        TestCase.assertEquals("PROBLEME removeCompte () : modifie la localisation de l'AgenceBancaire  ...",
                locAvant, this.uneAg.getLocAgence());

        nomAvant = this.uneAg.getNomAgence();
        locAvant = this.uneAg.getLocAgence();
        
        try {
			this.uneAg.removeCompte(this.numC3);
		} catch (ABCompteInexistantException e) {}
        
        TestCase.assertEquals("PROBLEME removeCompte () : modifie le nom de l'AgenceBancaire  ...",
                nomAvant, this.uneAg.getNomAgence());
        TestCase.assertEquals("PROBLEME removeCompte () : modifie la localisation de l'AgenceBancaire  ...",
                locAvant, this.uneAg.getLocAgence());

        nomAvant = this.uneAg.getNomAgence();
        locAvant = this.uneAg.getLocAgence();
        
        try {
			this.uneAg.removeCompte(this.numC2);
		} catch (ABCompteInexistantException e) {}
        
        TestCase.assertEquals("PROBLEME removeCompte () : modifie le nom de l'AgenceBancaire  ...",
                nomAvant, this.uneAg.getNomAgence());
        TestCase.assertEquals("PROBLEME removeCompte () : modifie la localisation de l'AgenceBancaire  ...",
                locAvant, this.uneAg.getLocAgence());
    }
    
    public void testGetNbComptes ()  {
    	int nbCptesAvant;
    	
    	this.initTests();
    	
    	/* Test getNbComptes()
    	 * Test de la valeur retourn�e dans plusieurs �tats de l'agence
    	 */
    	
    	// Test sur AgenceBancaire "vide"
    	
    	TestCase.assertEquals("PROBLEME getNbComptes () : mauvais nombre de comptes au d�part ...",
                0, this.uneAg.getNbComptes());
    	
    	try {
			this.uneAg.addCompte(this.c1);
		} catch (ABCompteNullException | ABCompteDejaExistantException e) {}
        
    	TestCase.assertEquals("PROBLEME getNbComptes () : mauvais nombre de comptes ...",
                1, this.uneAg.getNbComptes());

    	try {
			this.uneAg.addCompte(this.c1);
		} catch (ABCompteNullException | ABCompteDejaExistantException e) {}
        
    	TestCase.assertEquals("PROBLEME getNbComptes () : mauvais nombre de comptes ...",
                1, this.uneAg.getNbComptes());
    	
    	// Test sur AgenceBancaire "remplie"
    	this.ajoutsComptes(this.uneAg);

        nbCptesAvant = this.uneAg.getNbComptes();
        try {
			this.uneAg.addCompte(this.c2);
		} catch (ABCompteNullException | ABCompteDejaExistantException e) {}
        
        TestCase.assertEquals("PROBLEME getNbComptes () : mauvais nombre de comptes ...",
                nbCptesAvant + 1, this.uneAg.getNbComptes());
        
        nbCptesAvant = this.uneAg.getNbComptes();
        try {
			this.uneAg.addCompte(this.c2);
		} catch (ABCompteNullException | ABCompteDejaExistantException e) {}
        
        TestCase.assertEquals("PROBLEME getNbComptes () : mauvais nombre de comptes ...",
                nbCptesAvant, this.uneAg.getNbComptes());
        
        // Test sur AgenceBancaire "remplie" et apr�s retraits
        
        this.ajoutsComptes(this.uneAg);
        this.retraitsComptes(this.uneAg);

        nbCptesAvant = this.uneAg.getNbComptes();
        try {
			this.uneAg.addCompte(this.c3);
		} catch (ABCompteNullException | ABCompteDejaExistantException e) {}
        
        TestCase.assertEquals("PROBLEME getNbComptes () : mauvais nombre de comptes ...",
                nbCptesAvant + 1, this.uneAg.getNbComptes());
        
        nbCptesAvant = this.uneAg.getNbComptes();
        try {
			this.uneAg.addCompte(this.c3);
		} catch (ABCompteNullException | ABCompteDejaExistantException e) {}
        
        TestCase.assertEquals("PROBLEME getNbComptes () : mauvais nombre de comptes ...",
                nbCptesAvant, this.uneAg.getNbComptes());

        // Test sur AgenceBancaire "remplie" et apr�s retraits
        
        nbCptesAvant = this.uneAg.getNbComptes();
        try {
			this.uneAg.removeCompte(this.numC3);
		} catch (ABCompteInexistantException e) {}
        
        TestCase.assertEquals("PROBLEME getNbComptes () : mauvais nombre de comptes ...",
                nbCptesAvant - 1, this.uneAg.getNbComptes());

        nbCptesAvant = this.uneAg.getNbComptes();
        try {
			this.uneAg.removeCompte(this.numC3);
		} catch (ABCompteInexistantException e) {}
        
        TestCase.assertEquals("PROBLEME getNbComptes () : mauvais nombre de comptes ...",
                nbCptesAvant, this.uneAg.getNbComptes());
        
        nbCptesAvant = this.uneAg.getNbComptes();
        try {
			this.uneAg.removeCompte(this.numC1);
		} catch (ABCompteInexistantException e) {}
        
        TestCase.assertEquals("PROBLEME getNbComptes () : mauvais nombre de comptes ...",
                nbCptesAvant - 1, this.uneAg.getNbComptes());

        nbCptesAvant = this.uneAg.getNbComptes();
        try {
			this.uneAg.removeCompte(this.numC2);
		} catch (ABCompteInexistantException e) {}
        
        TestCase.assertEquals("PROBLEME getNbComptes () : mauvais nombre de comptes ...",
                nbCptesAvant - 1, this.uneAg.getNbComptes());
        
        this.retraitsTousLesComptes(this.uneAg);
        
        TestCase.assertEquals("PROBLEME getNbComptes () : mauvais nombre de comptes sur une AgenceBancaire 'vid�e' ...",
                0, this.uneAg.getNbComptes());

    }

	public void testGetCompte () throws ABCompteNullException, ABCompteDejaExistantException, ABCompteInexistantException {
		this.initTests();

		/* Test getCompte()
		 * Test de la valeur retourn�e dans plusieurs �tats de l'agence
		 */
		
        TestCase.assertNull("PROBLEME getCompte () : trouve un compte absent ...",
                this.uneAg.getCompte(this.numInexistant));
    	
    	this.uneAg.addCompte(this.c1);
        
    	TestCase.assertNull("PROBLEME getCompte () : trouve un compte absent ...",
                this.uneAg.getCompte(this.numInexistant));
        TestCase.assertNotNull("PROBLEME getCompte () : ne trouve pas un compte pr�sent : "+this.numC1,
                this.uneAg.getCompte(this.numC1));
        TestCase.assertSame("PROBLEME getCompte () : ne trouve pas le m�me objet compte pr�sent : "+this.numC1,
                this.c1, this.uneAg.getCompte(this.numC1));

    	this.ajoutsComptes(this.uneAg);
        this.uneAg.addCompte(this.c2);
        
        TestCase.assertNull("PROBLEME getCompte () : trouve un compte absent ...",
                this.uneAg.getCompte(this.numInexistant));
        TestCase.assertNotNull("PROBLEME getCompte () : ne trouve pas un compte pr�sent : "+this.numC1,
                this.uneAg.getCompte(this.numC1));
        TestCase.assertSame("PROBLEME getCompte () : ne trouve pas le m�me objet compte pr�sent : "+this.numC1,
                this.c1, this.uneAg.getCompte(this.numC1));
        TestCase.assertNotNull("PROBLEME getCompte () : ne trouve pas un compte pr�sent : "+this.numC2,
                this.uneAg.getCompte(this.numC2));
        TestCase.assertSame("PROBLEME getCompte () : ne trouve pas le m�me objet compte pr�sent : "+this.numC2,
                this.c2, this.uneAg.getCompte(this.numC2));
        
        this.ajoutsComptes(this.uneAg);
        this.uneAg.addCompte(this.c3);

        TestCase.assertNull("PROBLEME getCompte () : trouve un compte absent ...",
                this.uneAg.getCompte(this.numInexistant));
        TestCase.assertNotNull("PROBLEME getCompte () : ne trouve pas un compte pr�sent : "+this.numC1,
                this.uneAg.getCompte(this.numC1));
        TestCase.assertSame("PROBLEME getCompte () : ne trouve pas le m�me objet compte pr�sent : "+this.numC1,
                this.c1, this.uneAg.getCompte(this.numC1));
        TestCase.assertNotNull("PROBLEME getCompte () : ne trouve pas un compte pr�sent : "+this.numC2,
                this.uneAg.getCompte(this.numC2));
        TestCase.assertSame("PROBLEME getCompte () : ne trouve pas le m�me objet compte pr�sent : "+this.numC2,
                this.c2, this.uneAg.getCompte(this.numC2));
        TestCase.assertNotNull("PROBLEME getCompte () : ne trouve pas un compte pr�sent : "+this.numC3,
                this.uneAg.getCompte(this.numC3));
        TestCase.assertSame("PROBLEME getCompte () : ne trouve pas le m�me objet compte pr�sent : "+this.numC3,
                this.c3, this.uneAg.getCompte(this.numC3));
        
        this.retraitsComptes(this.uneAg);

        TestCase.assertNull("PROBLEME getCompte () : trouve un compte absent ...",
                this.uneAg.getCompte(this.numInexistant));
        TestCase.assertNotNull("PROBLEME getCompte () : ne trouve pas un compte pr�sent : "+this.numC1,
                this.uneAg.getCompte(this.numC1));
        TestCase.assertSame("PROBLEME getCompte () : ne trouve pas le m�me objet compte pr�sent : "+this.numC1,
                this.c1, this.uneAg.getCompte(this.numC1));
        TestCase.assertNotNull("PROBLEME getCompte () : ne trouve pas un compte pr�sent : "+this.numC2,
                this.uneAg.getCompte(this.numC2));
        TestCase.assertSame("PROBLEME getCompte () : ne trouve pas le m�me objet compte pr�sent : "+this.numC2,
                this.c2, this.uneAg.getCompte(this.numC2));
        TestCase.assertNotNull("PROBLEME getCompte () : ne trouve pas un compte pr�sent : "+this.numC3,
                this.uneAg.getCompte(this.numC3));
        TestCase.assertSame("PROBLEME getCompte () : ne trouve pas le m�me objet compte pr�sent : "+this.numC3,
                this.c3, this.uneAg.getCompte(this.numC3));
        
        this.uneAg.removeCompte(this.numC3);

        TestCase.assertNull("PROBLEME getCompte () : trouve un compte absent ...",
                this.uneAg.getCompte(this.numInexistant));
        TestCase.assertNotNull("PROBLEME getCompte () : ne trouve pas un compte pr�sent : "+this.numC1,
                this.uneAg.getCompte(this.numC1));
        TestCase.assertSame("PROBLEME getCompte () : ne trouve pas le m�me objet compte pr�sent : "+this.numC1,
                this.c1, this.uneAg.getCompte(this.numC1));
        TestCase.assertNotNull("PROBLEME getCompte () : ne trouve pas un compte pr�sent : "+this.numC2,
                this.uneAg.getCompte(this.numC2));
        TestCase.assertSame("PROBLEME getCompte () : ne trouve pas le m�me objet compte pr�sent : "+this.numC2,
                this.c2, this.uneAg.getCompte(this.numC2));  
        TestCase.assertNull("PROBLEME getCompte () : trouve un compte absent ...",
                this.uneAg.getCompte(this.numC3));
       
        this.uneAg.removeCompte(this.numC1);

        TestCase.assertNull("PROBLEME getCompte () : trouve un compte absent ...",
                this.uneAg.getCompte(this.numInexistant));
        TestCase.assertNull("PROBLEME getCompte () : trouve un compte absent ...",
                this.uneAg.getCompte(this.numC1));
        TestCase.assertNotNull("PROBLEME getCompte () : ne trouve pas un compte pr�sent : "+this.numC2,
                this.uneAg.getCompte(this.numC2));
        TestCase.assertSame("PROBLEME getCompte () : ne trouve pas le m�me objet compte pr�sent : "+this.numC2,
                this.c2, this.uneAg.getCompte(this.numC2)); 
        TestCase.assertNull("PROBLEME getCompte () : trouve un compte absent ...",
                this.uneAg.getCompte(this.numC3));
        
        this.uneAg.removeCompte(this.numC2);
 
        TestCase.assertNull("PROBLEME getCompte () : trouve un compte absent ...",
                this.uneAg.getCompte(this.numInexistant));
        TestCase.assertNull("PROBLEME getCompte () : trouve un compte absent ...",
                this.uneAg.getCompte(this.numC1));
        TestCase.assertNull("PROBLEME getCompte () : trouve un compte absent ...",
                this.uneAg.getCompte(this.numC2));
        TestCase.assertNull("PROBLEME getCompte () : trouve un compte absent ...",
                this.uneAg.getCompte(this.numC3));
        
        this.retraitsTousLesComptes(this.uneAg);
        
        TestCase.assertNull("PROBLEME getCompte () : trouve un compte absent ...",
                this.uneAg.getCompte(this.numInexistant));
        TestCase.assertNull("PROBLEME getCompte () : trouve un compte absent ...",
                this.uneAg.getCompte(this.numC1));
        TestCase.assertNull("PROBLEME getCompte () : trouve un compte absent ...",
                this.uneAg.getCompte(this.numC2));
        TestCase.assertNull("PROBLEME getCompte () : trouve un compte absent ...",
                this.uneAg.getCompte(this.numC3));
    }  
    
    public void testGetComptesDe () throws ABCompteNullException, ABCompteDejaExistantException, ABCompteInexistantException {
    	Compte [] resAppel;
    	
		this.initTests();

		/* Test getCompteDe()
		 * Test de la valeur retourn�e dans plusieurs �tats de l'agence
		 */
		
        TestCase.assertEquals("PROBLEME getComptesDe () : trouve des comptes d'un propri�taire inexistant ...",
                0, this.uneAg.getComptesDe(this.propInexistant).length);
    	
    	this.uneAg.addCompte(this.c1TestProp);
        
        TestCase.assertEquals("PROBLEME getComptesDe () : trouve des comptes d'un propri�taire inexistant ...",
                0, this.uneAg.getComptesDe(this.propInexistant).length);
        resAppel = this.uneAg.getComptesDe(this.propTprop);
        TestCase.assertEquals("PROBLEME getComptesDe () : n'a pas trouve des comptes existants pour un propri�taire : "+this.propTprop,
                1, resAppel.length);
        TestCase.assertSame("PROBLEME getComptesDe () : n'a pas trouve un objet compte existant pour un propri�taire : "+this.propTprop,
        		this.c1TestProp, resAppel[0]);
    	
    	this.ajoutsComptes(this.uneAg);
        this.uneAg.addCompte(this.c2TestProp);
        
        TestCase.assertEquals("PROBLEME getComptesDe () : trouve des comptes d'un propri�taire inexistant ...",
                0, this.uneAg.getComptesDe(this.propInexistant).length);
        resAppel = this.uneAg.getComptesDe(this.propTprop);
        TestCase.assertEquals("PROBLEME getComptesDe () : n'a pas trouve des comptes existants pour un propri�taire : "+this.propTprop,
                2, resAppel.length);
        
        for (Compte cTrouve : resAppel)
        	if ((cTrouve != this.c1TestProp) && (cTrouve != this.c2TestProp))
        		TestCase.fail("PROBLEME getComptesDe () : n'a pas trouve un objet compte existant pour un propri�taire : "+this.propTprop);
        
        this.ajoutsComptes(this.uneAg);
        this.uneAg.addCompte(this.c3TestProp);

        TestCase.assertEquals("PROBLEME getComptesDe () : trouve des comptes d'un propri�taire inexistant ...",
                0, this.uneAg.getComptesDe(this.propInexistant).length);
        resAppel = this.uneAg.getComptesDe(this.propTprop);
        TestCase.assertEquals("PROBLEME getComptesDe () : n'a pas trouve des comptes existants pour un propri�taire : "+this.propTprop,
                3, resAppel.length);
        for (Compte cTrouve : resAppel)
        	if ((cTrouve != this.c1TestProp) && (cTrouve != this.c2TestProp) && (cTrouve != this.c3TestProp))
        		TestCase.fail("PROBLEME getComptesDe () : n'a pas trouve un objet compte existant pour un propri�taire : "+this.propTprop);
        
        this.retraitsComptes(this.uneAg);

        TestCase.assertEquals("PROBLEME getComptesDe () : trouve des comptes d'un propri�taire inexistant ...",
                0, this.uneAg.getComptesDe(this.propInexistant).length);
        resAppel = this.uneAg.getComptesDe(this.propTprop);
        TestCase.assertEquals("PROBLEME getComptesDe () : n'a pas trouve des comptes existants pour un propri�taire : "+this.propTprop,
                3, resAppel.length);
        for (Compte cTrouve : resAppel)
        	if ((cTrouve != this.c1TestProp) && (cTrouve != this.c2TestProp) && (cTrouve != this.c3TestProp))
        		TestCase.fail("PROBLEME getComptesDe () : n'a pas trouve un objet compte existant pour un propri�taire : "+this.propTprop);

        this.uneAg.removeCompte(this.numTC2prop);

        TestCase.assertEquals("PROBLEME getComptesDe () : trouve des comptes d'un propri�taire inexistant ...",
                0, this.uneAg.getComptesDe(this.propInexistant).length);
        resAppel = this.uneAg.getComptesDe(this.propTprop);
        TestCase.assertEquals("PROBLEME getComptesDe () : n'a pas trouve des comptes existants pour un propri�taire : "+this.propTprop,
                2, resAppel.length);
        for (Compte cTrouve : resAppel)
        	if ((cTrouve != this.c1TestProp) && (cTrouve != this.c3TestProp))
        		TestCase.fail("PROBLEME getComptesDe () : n'a pas trouve un objet compte existant pour un propri�taire : "+this.propTprop);

        this.uneAg.removeCompte(this.numTC1prop);

        TestCase.assertEquals("PROBLEME getComptesDe () : trouve des comptes d'un propri�taire inexistant ...",
                0, this.uneAg.getComptesDe(this.propInexistant).length);
        resAppel = this.uneAg.getComptesDe(this.propTprop);
        TestCase.assertEquals("PROBLEME getComptesDe () : n'a pas trouve des comptes existants pour un propri�taire : "+this.propTprop,
                1, resAppel.length);
        TestCase.assertSame("PROBLEME getComptesDe () : n'a pas trouve un objet compte existant pour un propri�taire : "+this.propTprop,
        		this.c3TestProp, resAppel[0]); 
        
        this.uneAg.removeCompte(this.numTC3prop);

        TestCase.assertEquals("PROBLEME getComptesDe () : trouve des comptes d'un propri�taire inexistant ...",
                0, this.uneAg.getComptesDe(this.propInexistant).length);
        TestCase.assertEquals("PROBLEME getComptesDe () : trouve des comptes d'un propri�taire inexistant ...",
                0, this.uneAg.getComptesDe(this.propTprop).length);
        
        this.retraitsTousLesComptes(this.uneAg);
  
        TestCase.assertEquals("PROBLEME getComptesDe () : trouve des comptes d'un propri�taire inexistant ...",
                0, this.uneAg.getComptesDe(this.propInexistant).length);
        TestCase.assertEquals("PROBLEME getComptesDe () : trouve des comptes d'un propri�taire inexistant ...",
                0, this.uneAg.getComptesDe(this.propTprop).length);
    }
    
    public void testRemoveCompte_6 () throws ABCompteNullException, ABCompteDejaExistantException {
        this.initTests();
        
        /* Test suppression en debut
         */
        
        // Test sur AgenceBancaire après des ajouts de comptes
    
        this.uneAg.addCompte(this.c1);
        this.uneAg.addCompte(this.c2);
        this.uneAg.addCompte(this.c3);

        try {
            this.uneAg.removeCompte(this.c1.getNumCompte());
            this.uneAg.removeCompte(this.c2.getNumCompte());
            this.uneAg.removeCompte(this.c3.getNumCompte());
        } catch (ABCompteInexistantException e) {}
        
        TestCase.assertEquals("PROBLEME removeCompte () : mauvais effacement  ...",
                0, this.uneAg.getNbComptes());
    }
    
    public void testRemoveCompte_7 () throws ABCompteNullException, ABCompteDejaExistantException {
        this.initTests();
        
        /* Test suppression en debut
         */
        
        // Test sur AgenceBancaire après des ajouts de comptes
    
        this.uneAg.addCompte(this.c1);
        this.uneAg.addCompte(this.c2);
        this.uneAg.addCompte(this.c3);

        try {
            this.uneAg.removeCompte(this.c3.getNumCompte());
            this.uneAg.removeCompte(this.c2.getNumCompte());
            this.uneAg.removeCompte(this.c1.getNumCompte());
        } catch (ABCompteInexistantException e) {}
        
        TestCase.assertEquals("PROBLEME removeCompte () : mauvais effacement  ...",
                0, this.uneAg.getNbComptes());
    }
    
    public static void main(String[] arg) {
        TestSuite suite = new TestSuite("Tests complets");
        suite.addTestSuite(TestAgenceBancaire.class);
        junit.textui.TestRunner.run(suite);
    }
}
