
/**
 * Décrivez votre classe Adresse ici.
 *
 * @author (votre nom)
 * @version (un numéro de version ou une date)
 */
public class Adresse
{
    int numRue;
    String nomRue;
    String codePostal;
    String ville;
    
    Adresse()
    {
        this.numRue = 1;
        this.nomRue = this.ville = this.codePostal = "";
    }
    
    Adresse(int pfNumRue, String pfNomRue, String pfCodePostal, String pfVille)
    {
        this.numRue = pfNumRue;
        this.nomRue = pfNomRue;
        this.codePostal = pfCodePostal;
        this.ville = pfVille;
    }
}
