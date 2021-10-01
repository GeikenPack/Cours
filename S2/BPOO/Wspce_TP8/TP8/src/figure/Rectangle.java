package figure;


public class Rectangle extends FormeGraphique {
	private int largeur ;
	private int longueur ;

	public Rectangle() {
		super();
		this.largeur = 0 ;
		this.longueur = 0 ;
	}
	public Rectangle(int pfX, int pfY, int pfLarg, int pfLong) {
		super(pfX, pfY);
		this.largeur = pfLarg ;
		this.longueur = pfLong ;
	}
	
	public int getLargeur() {
		return this.largeur ;
	}
	public int getLongueur() {
		return this.longueur ;
	}
	public void setLargeur(int pfLargeur) {
		this.largeur = pfLargeur;
	}
	public void setLongueur(int pfLongueur) {
		this.longueur = pfLongueur;
	}
	public double surface() {
		return this.longueur * this.largeur ;
	}
	public void afficher() {
		super.afficher();
		System.out.println("Rectangle : hauteur " + this.longueur + " largeur " + this.largeur);
	}
}
/*
3.2)
	1) La classe Rectangle hérite de la classe FormeGraphique. On le remarque par le mot clé extends
	2) Les attributs définis dans Rectangle sont : largeur et longueur.
	3) Cette classe possède deux constructeurs.
	4) Cette classe possède deux accesseurs.
	5) Cette classe possède deux transformateurs.
	6) La méthode setLongueur() est une nouvelle méthode.
	7) La méthode surface() n'est pas une nouvelle méthode.
	8) La méthode afficher() n'est pas une nouvelle méthode.
	9) La méthode volume() existe pour les ectangles. Elle renverra 0.
	10) La méthode afficher donne les coordonnées du Rectangle, sa largeur et sa longueur :
		Forme graphique : abscisse 245 ordonnée 189
		Rectangle : hauteur : 20 largeur : 50
	11) super.afficher() appelle la méthode afficher de la classe parent, donc de FormeGraphique.
	12) La ligne super(pfX, pfY) appelle le constructeur de la classe parent, donc de FormeGraphique.
	13) Le constructeur Rectangle() appelle le constructeur FormeGraphique()
	14) Interface :
		Non héritées : getLargeur()
					   getLongueur()
					   setLargeur()
					   setLongueur()
		Redéfinies : surface()
					 afficher()
		Non redéfinies : getOrigineX()
						 getOrigineY()
						 setOrigineX()
						 setOrigineY()
						 volume()
		Constructeurs : Rectangle()
						Rectangle(int pfX, int pfY, int pfLarg, int pfLong)
	15) 
*/