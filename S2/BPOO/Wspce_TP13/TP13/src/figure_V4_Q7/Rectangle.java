package figure_V4_Q7;



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