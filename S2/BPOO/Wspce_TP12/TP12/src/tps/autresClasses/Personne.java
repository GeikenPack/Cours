package tps.autresClasses;

public class Personne  {
		// Attributs 
		private  String nom;
		private  int age;

	// Constructeurs
	public  Personne () {
		this ("", 0);
	}
	
	public  Personne (String pfNom) {
		this (pfNom, 0);
	}
	
	public  Personne (String pfNom, int pfAge) {
		this.nom = pfNom;
		this.age = pfAge;
	}
   
		// Méthodes
		public  String getNom () { return this.nom; }
		public  int getAge ()   { return this.age; }
		public  void setNom (String pfNouvNom) { this.nom = pfNouvNom; }
		public  void setAge (int pfNouvAge)  { this.age = pfNouvAge; }
	
				
} // Fin Classe Personne
