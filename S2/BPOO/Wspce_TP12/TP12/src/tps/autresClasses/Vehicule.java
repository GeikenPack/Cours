package tps.autresClasses;

public class Vehicule  {
	// Attributs :
	
	private String immatriculation;
	private int puissance ;
	private int distParcourue ;
	private double consommation ;

	// Constructeurs
	
	public Vehicule () {
		this ("",0); // Appel de Vehicule (String pImmat, int pPuiss)
	}

	public Vehicule (String pfImmat, int pfPuiss) {
		super (); // Optionnel car Implicite
				// Mais "ne mange pas de pain..."
		this.immatriculation = pfImmat;
		this.puissance = pfPuiss;
		this.distParcourue = 0;
		this.consommation = 0;
	}

	// Observateurs
	
	public String getImmat () {
		return this.immatriculation ;
	}
	
	public int getPuissance () {
		return this.puissance ;
	}
	
	public int getKilometrage () {
		return this.distParcourue ;
	}
	
	public double coutTotal () {
		return this.distParcourue * this.consommation / 100;
	}
		
	public double coutSuppl () {
		return 0;
	}

	// Modifieurs

	public void rouler (int pfKm) {
		this.distParcourue = this.distParcourue + pfKm;
	}
		
	public void setConso (double pfConso) {
		this.consommation = pfConso;
	}

	public void setPuissance (int pfPuiss) {
		this.puissance = pfPuiss;
	}
	
	public void setImmat (String pfImmat) {
		this.immatriculation = pfImmat;
	}

	// Special TP

	public void afficher () {
		System.out.println (
			  "Imm "   + this.immatriculation + " "
		    + "Puis "  + this.puissance + " "
			+ "Km "    + this.distParcourue + " "
			+ "Conso " + this.consommation);
	}
}
