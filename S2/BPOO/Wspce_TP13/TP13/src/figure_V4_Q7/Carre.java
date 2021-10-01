package figure_V4_Q7;


public class Carre extends Rectangle {

	public Carre() {
		super();
	}
	public Carre(int pfX, int pfY, int pfCote) {
		super(pfX, pfY, pfCote, pfCote);
	}
	public int getCote () {
		return this.getLongueur();
	}
	
	public void setCote (int pfCote) {
		super.setLargeur(pfCote);
		super.setLongueur(pfCote);
	}
	
	public void setLargeur(int pfLargeur) {
		this.setCote(pfLargeur);
	}
	
	public void setLongueur(int pfLongueur) {
		this.setCote(pfLongueur);
	}
	
	public void afficher() {
		super.afficher();
		System.out.println("Carré : coté "+this.getLongueur());
	}
}