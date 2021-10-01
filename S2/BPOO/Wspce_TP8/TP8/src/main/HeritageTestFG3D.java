package main;

import figure.*;

public class HeritageTestFG3D {
	public static void main(String[] args) {
		// Compléter les test ici.
		
		// Exemple de test FormeGraphique
		
		FormeGraphique fgUn;
		FormeGraphique fgDeux;
		
		fgUn = new FormeGraphique();
		System.out.println("Test FormeGraphique 1");
		fgUn.afficher();
		fgUn.setOrigineX(550);
		fgUn.setOrigineY(660);
		fgUn.afficher();
		System.out.println("X : " + fgUn.getOrigineX());
		System.out.println("Y : " + fgUn.getOrigineY());
		System.out.println("Surface : " + fgUn.surface());
		System.out.println("Volume : " + fgUn.volume());
				
		fgDeux = new FormeGraphique(100, 200);		
		System.out.println("Test FormeGraphique 2");
		fgDeux.afficher();
		fgDeux.setOrigineX(550);
		fgDeux.setOrigineY(660);
		fgDeux.afficher();
		System.out.println("X : " + fgDeux.getOrigineX());
		System.out.println("Y : " + fgDeux.getOrigineY());
		System.out.println("Surface : " + fgDeux.surface());
		System.out.println("Volume : " + fgDeux.volume());

		//15) Test de la classe rectangle
		//Déclaration et initialisation des variables.
		Rectangle rectUn, rectDeux;
		rectUn = new Rectangle();
		rectDeux = new Rectangle(500,200,20,50);
		
		//Test rectUn
		rectUn.afficher();
		rectUn.setLargeur(30);
		rectUn.setLongueur(60);
		rectUn.setOrigineX(550);
		rectUn.setOrigineY(250);
		rectUn.afficher();
		System.out.println("rectUn : Largeur : " + rectUn.getLargeur() + " Longueur : "+ rectUn.getLongueur());
		System.out.println("rectUn : origineX : " + rectUn.getOrigineX() + " origineYY : " + rectUn.getOrigineY());
		
		System.out.println("==========================");
		
		//Test rectDeux
		rectDeux.afficher();
		rectDeux.setLargeur(30);
		rectDeux.setLongueur(60);
		rectDeux.setOrigineX(550);
		rectDeux.setOrigineY(250);
		rectDeux.afficher();
		System.out.println("rectUn : Largeur : " + rectDeux.getLargeur() + " Longueur : "+ rectDeux.getLongueur());
		System.out.println("rectUn : origineX : " + rectDeux.getOrigineX() + " origineYY : " + rectDeux.getOrigineY());
		
		//test Cercle
		//Délaration et initialisatin des variables :
		Cercle cerUn, cerDeux;
		cerUn = new Cercle();
		cerDeux = new Cercle(100, 50, 10);
		
		System.out.println("==========================");
		
		//test cerUn
		cerUn.afficher();
		cerUn.setRayon(15);
		cerUn.setOrigineX(110);
		cerUn.setOrigineY(60);
		cerUn.afficher();
		System.out.println("cerUn : rayon : " + cerUn.getRayon());
		System.out.println("cerUn : origineX : " + cerUn.getOrigineX() + " OrigineY : " + cerUn.getOrigineY());
		
		//Test cerDeux
		cerDeux.afficher();
		cerDeux.setRayon(150);
		cerDeux.setOrigineX(210);
		cerDeux.setOrigineY(160);
		cerDeux.afficher();
		System.out.println("cerDeux : rayon : " + cerDeux.getRayon());
		System.out.println("cerDeux : origineX : " + cerDeux.getOrigineX() + " OrigineY : " + cerDeux.getOrigineY());
		
		System.out.println("==========================");
		
		//Test Cylindre
		//Déclaration et initialisation des variables :
		Cylindre cylUn, cylDeux;
		cylUn = new Cylindre();
		cylDeux = new Cylindre(100, 50, 10, 5);
		
		//test cylUn
		cylUn.afficher();
		cylUn.setHauteur(10);
		cylUn.setRayon(15);
		cylUn.afficher();
		System.out.println("cerUn : hauteur : " + cylUn.getHauteur());
		System.out.println("cerUn : rayon : " + cylUn.getRayon());
		
		//Test cylDeux
		cylDeux.afficher();
		cylDeux.setHauteur(50);
		cylDeux.setRayon(10);
		cylDeux.afficher();
		System.out.println("cerDeux : hauteur : " + cylDeux.getHauteur());
		System.out.println("cerDeux : rayon : " + cylDeux.getRayon());
		
		System.out.println("==========================");
		
		//Test Sphere
		//Déclaration et initialisation des variables
		Sphere spUn, spDeux;
		spUn = new Sphere();
		spDeux = new Sphere(100, 50, 10);
		
		//Test spUn
		spUn.afficher();
		spUn.setRayon(15);
		spUn.afficher();
		System.out.println("spUn : rayon :" + spUn.getRayon());
		
		//Test spDeux
		spDeux.afficher();
		spDeux.setRayon(15);
		spDeux.afficher();
		System.out.println("spdeux : rayon :" + spDeux.getRayon());
		
		System.out.println("==========================");
		
		//Test Carre
		//Declaration et initialisation des variables
		Carre carUn, carDeux;
		carUn = new Carre();
		carDeux = new Carre(100,50,20);
		
		//test carUn
		carUn.afficher();
		carUn.setCote(5);
		carUn.setLargeur(10);
		carUn.setLongueur(10);
		carUn.afficher();
		System.out.println("carUn : Cote  : " + carUn.getCote());
		System.out.println("carUn : largeur : " + carUn.getLargeur() + " longueur : " + carUn.getLongueur());
		
		//test carDeux
		carDeux.afficher();
		carDeux.setCote(5);
		carDeux.setLargeur(200);
		carDeux.setLongueur(200);
		carDeux.afficher();
		System.out.println("carDeux : Cote  : " + carDeux.getCote());
		System.out.println("cardeux : largeur : " + carDeux.getLargeur() + " longueur : " + carDeux.getLongueur());
		
		System.out.println("==========================");
		
		//test fournis carTrois
		Carre carreTrois;
		carreTrois = new Carre (1, 1, 10);
		carreTrois.afficher();
		System.out.println("Surface : " + carreTrois.surface()); // Surface :100.0
		carreTrois.setLargeur(20);
		carreTrois.afficher();
		System.out.println("Surface : " + carreTrois.surface()); // Surface : 400.0
		carreTrois.setLongueur(30);
		carreTrois.afficher();
		System.out.println("Surface : " + carreTrois.surface()); // Surface : 900.0
		
		carreTrois.setCote(40);
		carreTrois.afficher();
		System.out.println("Surface : " + carreTrois.surface()); // Surface : 1600.0
		
		System.out.println("==========================");
		
		//5.1
		FormeGraphique tabFormes[];

		tabFormes = new FormeGraphique [12];

		tabFormes[0] = fgUn; // variable référençant la première FormeGraphique créée
		tabFormes[1] = fgDeux; // variable référençant la deuxième FormeGraphique créée
		tabFormes[2] = rectUn; // variable référençant le premier Rectangle créé
		tabFormes[3] = rectDeux; // variable référençant le deuxième Rectangle créé
		tabFormes[4] = carUn; // variable référençant le premier Carré créé
		tabFormes[5] = carDeux; // variable référençant le deuxieme Carré créé
		tabFormes[6] = cerUn; // variable référençant le premier Cercle créé
		tabFormes[7] = cerDeux; // variable référençant le deuxième Cercle créé
		tabFormes[8] = cylUn; // variable référençant le premier Cylindre créé
		tabFormes[9] = cylDeux; // variable référençant le deuxieme Cylindre créé
		tabFormes[10] = spUn; // variable référençant la premiere Sphere créé
		tabFormes[11] = spDeux; // variable référençant la deuxieme Sphere créé
		
		for(int i = 0; i < tabFormes.length; i++)
		{
			System.out.println("Indice courant : " + i);
			System.out.println(tabFormes[i].surface());
			System.out.println(tabFormes[i].volume());
			tabFormes[i].afficher();
			//On obtient donc les valeurs des champs de chaques objet créer.
			System.out.println(System.identityHashCode(tabFormes[i]));
			System.out.println(tabFormes[i].getClass());
			//Nous obtenons en plus la référence de l'objet et son type.
			//Tous ces objets ont en commun la classe parente FormeGraphique
		}
		
		
	 }
}
