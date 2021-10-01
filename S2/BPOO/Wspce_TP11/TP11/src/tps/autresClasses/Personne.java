package tps.autresClasses;

import application.Displayable;

public class Personne implements Displayable {
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
	
	public void afficher()
	{
		System.out.println("Nom : " + this.nom + " Age : " + this.age);
	}
	
	public void displayObject()
	{
		this.afficher();
	}
				
} // Fin Classe Personne
