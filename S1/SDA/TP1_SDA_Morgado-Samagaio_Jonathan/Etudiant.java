
/**
 * Décrivez votre classe Etudiant ici.
 *
 * @author (votre nom)
 * @version (un numéro de version ou une date)
 */
public class Etudiant
{
    String nom, prenom;
    String ine;
    Adresse adr;
    char promo;
    
    Etudiant()
    {
        this.nom = this.prenom = this.ine =  "";
        adr = new Adresse();
        this.promo = '0';
    }
    
    Etudiant(String pfNom, String pfPrenom, String pfIne, char pfPromo, Adresse pfAdr)
    {
        this.prenom = pfPrenom;
        this.nom = pfNom;
        this.ine = pfIne;
        this.adr = pfAdr;
        this.promo = pfPromo;
    }
}
