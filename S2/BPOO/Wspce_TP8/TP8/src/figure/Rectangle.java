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
	1) La classe Rectangle h�rite de la classe FormeGraphique. On le remarque par le mot cl� extends
	2) Les attributs d�finis dans Rectangle sont : largeur et longueur.
	3) Cette classe poss�de deux constructeurs.
	4) Cette classe poss�de deux accesseurs.
	5) Cette classe poss�de deux transformateurs.
	6) La m�thode setLongueur() est une nouvelle m�thode.
	7) La m�thode surface() n'est pas une nouvelle m�thode.
	8) La m�thode afficher() n'est pas une nouvelle m�thode.
	9) La m�thode volume() existe pour les ectangles. Elle renverra 0.
	10) La m�thode afficher donne les coordonn�es du Rectangle, sa largeur et sa longueur :
		Forme graphique : abscisse 245 ordonn�e 189
		Rectangle : hauteur : 20 largeur : 50
	11) super.afficher() appelle la m�thode afficher de la classe parent, donc de FormeGraphique.
	12) La ligne super(pfX, pfY) appelle le constructeur de la classe parent, donc de FormeGraphique.
	13) Le constructeur Rectangle() appelle le constructeur FormeGraphique()
	14) Interface :
		Non h�rit�es : getLargeur()
					   getLongueur()
					   setLargeur()
					   setLongueur()
		Red�finies : surface()
					 afficher()
		Non red�finies : getOrigineX()
						 getOrigineY()
						 setOrigineX()
						 setOrigineY()
						 volume()
		Constructeurs : Rectangle()
						Rectangle(int pfX, int pfY, int pfLarg, int pfLong)
	15) 
*/