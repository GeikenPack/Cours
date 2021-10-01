package figure_V4_Q7;


public class Cercle extends FormeGraphique {
	private double rayon;
	
	public Cercle() {
		super();
		this.rayon = 0;
	}
	public Cercle (int pfX, int pfY, double pfRayon) {
		super(pfX, pfY);
		this.rayon = pfRayon;
	}
	public double getRayon() {
		return rayon;
	}
	public void setRayon(double pfRayon) {
		this.rayon = pfRayon;
	}
	public double surface() {
		return Math.PI * this.rayon * this.rayon;
	}
	public void afficher() { 
		super.afficher();
		System.out.println("Cercle : rayon " + this.rayon);
	}
}
