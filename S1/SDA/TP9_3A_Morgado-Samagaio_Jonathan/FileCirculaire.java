
/**
 * Décrivez votre classe FileCirculaire ici.
 *
 * @author (votre nom)
 * @version (un numéro de version ou une date)
 */
public class FileCirculaire
{
    String[] tabElements;
    int indice_enf, indice_def;
    boolean estVide;
    
    FileCirculaire(int pfNbElt)
    {
        this.tabElements = new String[pfNbElt];
        this.indice_enf = this.indice_def = 0;
        this.estVide = true;
    }
}
