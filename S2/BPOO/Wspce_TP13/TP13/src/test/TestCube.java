package test;

import junit.framework.TestCase;
import junit.framework.TestSuite;

import figure_V4_Q7.*;

public class TestCube extends TestCase {

	public void testConstructeurParDefaut() {
		
		int xDeTest, yDeTest;
		int coteDeTest;
		double surfaceDeTest, volumeDeTest, surfaceHauteurDeTest, diagonaleDeTest;
		Cube c;
		
		// Initialisations
		
		xDeTest = 0;
		yDeTest = 0;
		coteDeTest = 0;
		
		// Situation testée
		
		c = new Cube ();
		// autres instructions éventuelles
		
		// Calcul des résultats attendus
		// Les autres variables ne changent pas
		
		surfaceDeTest = 0;
		volumeDeTest = 0;
		surfaceHauteurDeTest = 0;
		diagonaleDeTest = 0;

		// Assertions : les "vrais tests" (toute la méthode forme un seul test (arrêt première assertion fausse))
		
		TestCase.assertEquals("Echec test X", xDeTest, c.getOrigineX());
		TestCase.assertEquals("Echec test Y", yDeTest, c.getOrigineY());
		TestCase.assertEquals("Echec test coté", coteDeTest, c.getCote());
		TestCase.assertEquals("Echec test hauteur", coteDeTest, c.getHauteur());
		TestCase.assertEquals("Echec test surface", surfaceDeTest, c.surface());
		TestCase.assertEquals("Echec test volume", volumeDeTest, c.volume());
		TestCase.assertEquals("Echec test surfaceHauteur", surfaceHauteurDeTest, c.surfaceSurLaHauteur());
		TestCase.assertEquals("Echec test Diagonale", diagonaleDeTest, c.diagonaleCube());
		
		TestCase.assertEquals("Echec test largeur", coteDeTest, c.getLargeur());
		TestCase.assertEquals("Echec test longueur", coteDeTest, c.getLongueur());
	}	
	
	public void testConstructeurParam()
	{
		//Déclarations des variables de test
		int xDeTest, yDeTest;
		int coteDeTest;
		double surfaceDeTest, volumeDeTest, surfaceHauteurDeTest, diagonaleDeTest;
		Cube c;
		
		//Initialisation 
		xDeTest = 50;
		yDeTest = 10;
		coteDeTest = 5;
		
		//Situation testée
		c = new Cube(50,10,5);
		
		//Calculs
		surfaceDeTest = 6 * coteDeTest * coteDeTest;
		volumeDeTest = coteDeTest * coteDeTest * coteDeTest;
		surfaceHauteurDeTest = 4 * coteDeTest * coteDeTest;
		diagonaleDeTest = coteDeTest * Math.sqrt(3);
		
		//Assertions
		TestCase.assertEquals("Echec test X", xDeTest, c.getOrigineX());
		TestCase.assertEquals("Echec test Y", yDeTest, c.getOrigineY());
		TestCase.assertEquals("Echec test cote", coteDeTest, c.getCote());
		TestCase.assertEquals("Echec test hauteur", coteDeTest, c.getHauteur());
		TestCase.assertEquals("Echec test surface", surfaceDeTest, c.surface());
		TestCase.assertEquals("Echec test volume", volumeDeTest, c.volume());
		TestCase.assertEquals("Echec test surfaceHauteur", surfaceHauteurDeTest, c.surfaceSurLaHauteur());
		TestCase.assertEquals("Echec test Diagonale", diagonaleDeTest, c.diagonaleCube());
		
		TestCase.assertEquals("Echec test Longueur", coteDeTest, c.getLongueur());
		TestCase.assertEquals("Echec test largeur", coteDeTest, c.getLargeur());
	}
	
	public void testSetOrigineX()
	{
		//Déclarations des variables de test
		int xDeTest, yDeTest;
		int coteDeTest;
		double surfaceDeTest, volumeDeTest, surfaceHauteurDeTest, diagonaleDeTest;
		Cube c;
		
		//Initialisation 
		xDeTest = 50;
		yDeTest = 10;
		coteDeTest = 5;
		
		//Situation testée
		c = new Cube(50,10,5);
		
		//Calculs
		surfaceDeTest = 6 * coteDeTest * coteDeTest;
		volumeDeTest = coteDeTest * coteDeTest * coteDeTest;
		surfaceHauteurDeTest = 4 * coteDeTest * coteDeTest;
		diagonaleDeTest = coteDeTest * Math.sqrt(3);
		
		//Assertions
		TestCase.assertEquals("Echec test X", xDeTest, c.getOrigineX());
		TestCase.assertEquals("Echec test Y", yDeTest, c.getOrigineY());
		TestCase.assertEquals("Echec test cote", coteDeTest, c.getCote());
		TestCase.assertEquals("Echec test hauteur", coteDeTest, c.getHauteur());
		TestCase.assertEquals("Echec test surface", surfaceDeTest, c.surface());
		TestCase.assertEquals("Echec test volume", volumeDeTest, c.volume());
		TestCase.assertEquals("Echec test surfaceHauteur", surfaceHauteurDeTest, c.surfaceSurLaHauteur());
		TestCase.assertEquals("Echec test Diagonale", diagonaleDeTest, c.diagonaleCube());
		
		TestCase.assertEquals("Echec test Longueur", coteDeTest, c.getLongueur());
		TestCase.assertEquals("Echec test largeur", coteDeTest, c.getLargeur());
		
		//Cas a traiter
		xDeTest = 100;
		c.setOrigineX(100);
		TestCase.assertEquals("Echech de setOrigineX", xDeTest, c.getOrigineX());
	}
	
	public void testSetOrigineY()
	{
		//Déclarations des variables de test
		int xDeTest, yDeTest;
		int coteDeTest;
		double surfaceDeTest, volumeDeTest, surfaceHauteurDeTest, diagonaleDeTest;
		Cube c;
		
		//Initialisation 
		xDeTest = 50;
		yDeTest = 10;
		coteDeTest = 5;
		
		//Situation testée
		c = new Cube(50,10,5);
		
		//Calculs
		surfaceDeTest = 6 * coteDeTest * coteDeTest;
		volumeDeTest = coteDeTest * coteDeTest * coteDeTest;
		surfaceHauteurDeTest = 4 * coteDeTest * coteDeTest;
		diagonaleDeTest = coteDeTest * Math.sqrt(3);
		
		//Assertions
		TestCase.assertEquals("Echec test X", xDeTest, c.getOrigineX());
		TestCase.assertEquals("Echec test Y", yDeTest, c.getOrigineY());
		TestCase.assertEquals("Echec test cote", coteDeTest, c.getCote());
		TestCase.assertEquals("Echec test hauteur", coteDeTest, c.getHauteur());
		TestCase.assertEquals("Echec test surface", surfaceDeTest, c.surface());
		TestCase.assertEquals("Echec test volume", volumeDeTest, c.volume());
		TestCase.assertEquals("Echec test surfaceHauteur", surfaceHauteurDeTest, c.surfaceSurLaHauteur());
		TestCase.assertEquals("Echec test Diagonale", diagonaleDeTest, c.diagonaleCube());
		
		TestCase.assertEquals("Echec test Longueur", coteDeTest, c.getLongueur());
		TestCase.assertEquals("Echec test largeur", coteDeTest, c.getLargeur());
		
		//Cas a traiter
		yDeTest = 60;
		c.setOrigineY(60);
		TestCase.assertEquals("Echech de setOrigineY", yDeTest, c.getOrigineY());
	}
	
	public void testSetCote()
	{
		//Déclarations des variables de test
		int xDeTest, yDeTest;
		int coteDeTest;
		double surfaceDeTest, volumeDeTest, surfaceHauteurDeTest, diagonaleDeTest;
		Cube c;
		
		//Initialisation 
		xDeTest = 50;
		yDeTest = 10;
		coteDeTest = 5;
		
		//Situation testée
		c = new Cube(50,10,5);
		
		//Calculs
		surfaceDeTest = 6 * coteDeTest * coteDeTest;
		volumeDeTest = coteDeTest * coteDeTest * coteDeTest;
		surfaceHauteurDeTest = 4 * coteDeTest * coteDeTest;
		diagonaleDeTest = coteDeTest * Math.sqrt(3);
		
		//Assertions
		TestCase.assertEquals("Echec test X", xDeTest, c.getOrigineX());
		TestCase.assertEquals("Echec test Y", yDeTest, c.getOrigineY());
		TestCase.assertEquals("Echec test cote", coteDeTest, c.getCote());
		TestCase.assertEquals("Echec test hauteur", coteDeTest, c.getHauteur());
		TestCase.assertEquals("Echec test surface", surfaceDeTest, c.surface());
		TestCase.assertEquals("Echec test volume", volumeDeTest, c.volume());
		TestCase.assertEquals("Echec test surfaceHauteur", surfaceHauteurDeTest, c.surfaceSurLaHauteur());
		TestCase.assertEquals("Echec test Diagonale", diagonaleDeTest, c.diagonaleCube());
		
		TestCase.assertEquals("Echec test Longueur", coteDeTest, c.getLongueur());
		TestCase.assertEquals("Echec test largeur", coteDeTest, c.getLargeur());
		
		//Cas a traiter
		coteDeTest = 20;
		c.setCote(20);
		TestCase.assertEquals("Echech de setCote", coteDeTest, c.getCote());
	}
	
	public void testseSetLargeur()
	{
		//Déclarations des variables de test
		int xDeTest, yDeTest;
		int coteDeTest;
		double surfaceDeTest, volumeDeTest, surfaceHauteurDeTest, diagonaleDeTest;
		Cube c;
		
		//Initialisation 
		xDeTest = 50;
		yDeTest = 10;
		coteDeTest = 5;
		
		//Situation testée
		c = new Cube(50,10,5);
		
		//Calculs
		surfaceDeTest = 6 * coteDeTest * coteDeTest;
		volumeDeTest = coteDeTest * coteDeTest * coteDeTest;
		surfaceHauteurDeTest = 4 * coteDeTest * coteDeTest;
		diagonaleDeTest = coteDeTest * Math.sqrt(3);
		
		//Assertions
		TestCase.assertEquals("Echec test X", xDeTest, c.getOrigineX());
		TestCase.assertEquals("Echec test Y", yDeTest, c.getOrigineY());
		TestCase.assertEquals("Echec test cote", coteDeTest, c.getCote());
		TestCase.assertEquals("Echec test hauteur", coteDeTest, c.getHauteur());
		TestCase.assertEquals("Echec test surface", surfaceDeTest, c.surface());
		TestCase.assertEquals("Echec test volume", volumeDeTest, c.volume());
		TestCase.assertEquals("Echec test surfaceHauteur", surfaceHauteurDeTest, c.surfaceSurLaHauteur());
		TestCase.assertEquals("Echec test Diagonale", diagonaleDeTest, c.diagonaleCube());
		
		TestCase.assertEquals("Echec test Longueur", coteDeTest, c.getLongueur());
		TestCase.assertEquals("Echec test largeur", coteDeTest, c.getLargeur());
		
		//Cas a traiter
		coteDeTest = 30;
		c.setLargeur(30);
		TestCase.assertEquals("Echec de setLargeur", coteDeTest, c.getLargeur());
	}
	
	public void testSetLongueur()
	{
		//Déclarations des variables de test
		int xDeTest, yDeTest;
		int coteDeTest;
		double surfaceDeTest, volumeDeTest, surfaceHauteurDeTest, diagonaleDeTest;
		Cube c;
		
		//Initialisation 
		xDeTest = 50;
		yDeTest = 10;
		coteDeTest = 5;
		
		//Situation testée
		c = new Cube(50,10,5);
		
		//Calculs
		surfaceDeTest = 6 * coteDeTest * coteDeTest;
		volumeDeTest = coteDeTest * coteDeTest * coteDeTest;
		surfaceHauteurDeTest = 4 * coteDeTest * coteDeTest;
		diagonaleDeTest = coteDeTest * Math.sqrt(3);
		
		//Assertions
		TestCase.assertEquals("Echec test X", xDeTest, c.getOrigineX());
		TestCase.assertEquals("Echec test Y", yDeTest, c.getOrigineY());
		TestCase.assertEquals("Echec test cote", coteDeTest, c.getCote());
		TestCase.assertEquals("Echec test hauteur", coteDeTest, c.getHauteur());
		TestCase.assertEquals("Echec test surface", surfaceDeTest, c.surface());
		TestCase.assertEquals("Echec test volume", volumeDeTest, c.volume());
		TestCase.assertEquals("Echec test surfaceHauteur", surfaceHauteurDeTest, c.surfaceSurLaHauteur());
		TestCase.assertEquals("Echec test Diagonale", diagonaleDeTest, c.diagonaleCube());
		
		TestCase.assertEquals("Echec test Longueur", coteDeTest, c.getLongueur());
		TestCase.assertEquals("Echec test largeur", coteDeTest, c.getLargeur());
		
		//Cas a traiter
		coteDeTest = 80;
		c.setLongueur(80);
		TestCase.assertEquals("Echech de setLongueur", coteDeTest, c.getLongueur());
	}
	
	public void testsetHauteur()
	{
		//Déclarations des variables de test
		int xDeTest, yDeTest;
		int coteDeTest;
		double surfaceDeTest, volumeDeTest, surfaceHauteurDeTest, diagonaleDeTest;
		Cube c;
		
		//Initialisation 
		xDeTest = 50;
		yDeTest = 10;
		coteDeTest = 5;
		
		//Situation testée
		c = new Cube(50,10,5);
		
		//Calculs
		surfaceDeTest = 6 * coteDeTest * coteDeTest;
		volumeDeTest = coteDeTest * coteDeTest * coteDeTest;
		surfaceHauteurDeTest = 4 * coteDeTest * coteDeTest;
		diagonaleDeTest = coteDeTest * Math.sqrt(3);
		
		//Assertions
		TestCase.assertEquals("Echec test X", xDeTest, c.getOrigineX());
		TestCase.assertEquals("Echec test Y", yDeTest, c.getOrigineY());
		TestCase.assertEquals("Echec test cote", coteDeTest, c.getCote());
		TestCase.assertEquals("Echec test hauteur", coteDeTest, c.getHauteur());
		TestCase.assertEquals("Echec test surface", surfaceDeTest, c.surface());
		TestCase.assertEquals("Echec test volume", volumeDeTest, c.volume());
		TestCase.assertEquals("Echec test surfaceHauteur", surfaceHauteurDeTest, c.surfaceSurLaHauteur());
		TestCase.assertEquals("Echec test Diagonale", diagonaleDeTest, c.diagonaleCube());
		
		TestCase.assertEquals("Echec test Longueur", coteDeTest, c.getLongueur());
		TestCase.assertEquals("Echec test largeur", coteDeTest, c.getLargeur());
		
		//Cas a traiter
		coteDeTest = 70;
		c.setHauteur(70);
		TestCase.assertEquals("Echech de setHauteur", coteDeTest, c.getHauteur());
	}
	
	public static void main(String[] argv) {
		TestSuite suite = new TestSuite("Tests complets");
		suite.addTestSuite(TestCube.class);
		junit.textui.TestRunner.run(suite);
	}
}
