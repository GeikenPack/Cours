
/**
 * Décrivez votre classe Individu ici.
 *
 * @author (votre nom)
 * @version (un numéro de version ou une date)
 */
public class Individu
{
    public String nom ;
    public Individu premier_parent ;
    public Individu second_parent ;

    public Individu(String pfNom) {
        this.nom = pfNom ;
    }

    public Individu(String pfNom, Individu pfp1, Individu pfp2) {
        this.nom = pfNom ;
        this.premier_parent = pfp1 ;
        this.second_parent = pfp2 ;
    }
}
