
/**
 * Décrivez votre classe FileIndividu ici.
 *
 * @author (votre nom)
 * @version (un numéro de version ou une date)
 */
public class FileIndividu
{
    Individu[] tabElements;
    int indice_enf, indice_def;
    boolean estVide;
    
    FileIndividu(int pfNbElt)
    {
        this.tabElements = new Individu[pfNbElt];
        this.indice_enf = this.indice_def = 0;
        this.estVide = true;
    }
}
