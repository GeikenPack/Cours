package gestclub.donnees;
import java.util.HashSet;
import java.util.Set;


public class Membre {

	public String      nom;
	public String      prenom;
	public String      adresse;
    public Boolean     sexeMasculin;
    public Set<Sports> sportsChoisis;

    public Membre(String nom, String prenom, String adresse, Boolean sexeMasculin) {
    	this.nom           = nom;
    	this.prenom        = prenom;
    	this.adresse       = adresse;
    	this.sexeMasculin  = sexeMasculin;
    	this.sportsChoisis = new HashSet<Sports>();
    }
    public Membre(String nom, String prenom, String adresse, Boolean sexeMasculin, Set<Sports> sportsChoisis) {
    	this.nom           = nom;
    	this.prenom        = prenom;
    	this.adresse       = adresse;
    	this.sexeMasculin  = sexeMasculin;
    	this.sportsChoisis = sportsChoisis;
    }
    
    public String toString()
    {
    	String tmp;
    	if (sportsChoisis.isEmpty())
    		tmp = "ne pratique pas de sport";
    	else if (sportsChoisis.size() == 1)
    		tmp = "pratique un sport";
    	else
    		tmp = "Pratique " + sportsChoisis.size() + " sports";
    	
    	return this.nom + " " + this.prenom + " " + tmp;
    }
}
