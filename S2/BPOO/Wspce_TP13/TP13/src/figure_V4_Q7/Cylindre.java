package figure_V4_Q7;



public class Cylindre extends Cercle {

	private double hauteur;
	
	public Cylindre() {
		super();
		this.hauteur = 0;
	}
	public Cylindre(int pfX, int pfY, double pfRayon, double pfHauteur) {
		super(pfX, pfY, pfRayon);
		this.hauteur = pfHauteur;
	}

	public double getHauteur() {
		return hauteur;
	}

	public void setHauteur (double pfHauteur) {
		hauteur = pfHauteur;
	}

	public double surface() {
//		return 2 * Math.PI * this.getRayon() * this.hauteur
//				+ 2 * Math.PI * this.getRayon() * this.getRayon();
		return 2 * Math.PI * this.getRayon() * this.hauteur
				+ 2 * super.surface();
	}

	public double volume() {
//		return Math.PI * this.getRayon() * this.getRayon() * this.hauteur;
		return super.surface() * this.hauteur;
	}
	
	public void afficher() { 
		super.afficher();
		System.out.println("Cylindre : hauteur " + this.hauteur);
	}
}