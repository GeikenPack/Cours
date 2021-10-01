package figure;

public class FormeGraphique {
	private int origine_x ;
	private int origine_y ;
	
	public FormeGraphique() {
		this.origine_x = 0 ;
		this.origine_y = 0 ;
	}
	public FormeGraphique(int pfX, int pfY) {
		this.origine_x = pfX ;
		this.origine_y = pfY ;
	}
	public int getOrigineX() {
		return this.origine_x ;
	}
	public int getOrigineY() {
		return this.origine_y ;
	}
	public void setOrigineX(int pfX) {
		this.origine_x = pfX ;
	}
	public void setOrigineY(int pfY) {
		this.origine_y = pfY ;
	}
	public double surface() { // aussi appelé aire pour les figures planes
		return 0; 
	}
	public double volume() { 
		return 0; 
	}
	public void afficher() { 
		System.out.println("Forme graphique : abscisse " 
			+ this.origine_x 
			+ " ordonnée " 
			+ this.origine_y);
	}
}