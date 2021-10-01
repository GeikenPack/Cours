
/**
 * Décrivez votre classe Personne ici.
 *
 * @author (votre nom)
 * @version (un numéro de version ou une date)
 */
public class Personne
{
    String nom, prenom;
    String force;
    Personne pere, mere, conjoint;
    
    Personne()
    {
        nom = prenom = "inconnu";
    }
    
    Personne(String pfNom, String pfPrenom, String pfForce)
    {
        this.nom = pfNom;
        this.prenom = pfPrenom;
        this.force = pfForce;
    }
}
