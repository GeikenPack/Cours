
/**
 * Décrivez votre classe IndividuOperations ici.
 *
 * @author (votre nom)
 * @version (un numéro de version ou une date)
 */
public class IndividuOperations
{
    public static void afficherAncetres(Individu pfIndividu) 
    {
        FileIndividu f = new FileIndividu(100);
        try
        {
            FileIndividuOperations.enfiler(f,pfIndividu);
        }
        catch (Exception e) {System.out.println(e);};
        ajouterArbre(f,pfIndividu);

        for (int i = f.indice_def; i < f.indice_enf; i++)
        {
            System.out.println(f.tabElements[i].nom);
        }
    }

    public static void ajouterArbre(FileIndividu pfFile,Individu pfIndividu)
    {
        try
        {
            if (pfIndividu.premier_parent != null)
            {
                FileIndividuOperations.enfiler(pfFile, pfIndividu.premier_parent);
                ajouterArbre(pfFile, pfIndividu.premier_parent);
            }
            if (pfIndividu.second_parent != null)
            {
                FileIndividuOperations.enfiler(pfFile, pfIndividu.second_parent);
                ajouterArbre(pfFile, pfIndividu.second_parent);
            }
        }
        catch(Exception e) {System.out.println(e);};
    }

    public static void main(String[] args) 
    {
        Individu gmp = new Individu("Grand-mere paternelle");
        Individu gmm = new Individu("Grand-mere maternelle");
        Individu gpm = new Individu("Grand-pere maternel");
        Individu gpp = new Individu("Grand-pere paternel");
        Individu p = new Individu("Pere", gmp, gpp);
        Individu m = new Individu("Mere", gmm, gpm);
        Individu e = new Individu("Dernier", m, p) ;
        afficherAncetres(e);
    }
}
