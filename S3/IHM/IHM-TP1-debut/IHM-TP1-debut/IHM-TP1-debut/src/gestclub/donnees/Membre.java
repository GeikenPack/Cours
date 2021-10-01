package gestclub.donnees;

import java.util.HashSet;
import java.util.Set;

public class Membre 
{
	public String nom, prenom, adresse;
	public boolean sexeMasculin;
	public Set<Sports> sportsChoisis;
	
	public Membre(String nom, String prenom, String adresse, Boolean sexeMasculin)
	{
		this.nom = nom;
		this.prenom = prenom;
		this.adresse = adresse;
		this.sexeMasculin = sexeMasculin;
		this.sportsChoisis = new HashSet<Sports>();
	}
	
	public Membre(String nom, String prenom, String adresse, boolean sexeMasculin, Set<Sports> sportsChoisis)
	{
		this.nom = nom;
		this.prenom = prenom;
		this.adresse = adresse;
		this.sexeMasculin = sexeMasculin;
		this.sportsChoisis = sportsChoisis;
	}
}
