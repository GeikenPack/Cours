import java.util.Calendar;
/**
 * Décrivez votre classe Personne ici.
 *
 * @author (votre nom)
 * @version (un numéro de version ou une date)
 */
public class Personne
{
    String prenom;
    int anneeDeNaissance;
    int age;

    Personne(String pfPrenom, int pfAnneeNaissance)
    {
        this.prenom = pfPrenom;
        this.anneeDeNaissance = pfAnneeNaissance;
        this.age = Calendar.getInstance().get(Calendar.YEAR) - this.anneeDeNaissance;
    }
}
