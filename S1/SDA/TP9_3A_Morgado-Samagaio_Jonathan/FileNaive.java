
/**
 * Décrivez votre classe FileNaive ici.
 *
 * @author (votre nom)
 * @version (un numéro de version ou une date)
 */
public class FileNaive
{
    String[] tabElements;
    int indice_enf, indice_def;
    
    FileNaive(int pfNbElt)
    {
        this.tabElements = new String[pfNbElt];
        this.indice_enf = this.indice_def = 0;
    }
}
