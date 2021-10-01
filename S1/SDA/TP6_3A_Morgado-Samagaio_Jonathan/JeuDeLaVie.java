
/**
 * Décrivez votre classe JeuDeLaVie ici.
 *
 * @author (votre nom)
 * @version (un numéro de version ou une date)
 */
public class JeuDeLaVie
{
    int nbL, nbC;
    MatriceEntier grille;
    MatriceEntier grilleSuivante;
    int generation;
    String[] histoire;
    
    JeuDeLaVie() throws Exception
    {
        throw new Exception("Des paramètres sont attendus");
    }
    
    JeuDeLaVie(int pfNbL, int pfNbC)throws Exception
    {
        if (pfNbL <= 0 || pfNbC <=0)
        {
            throw new Exception("Paramètre fournis incorrectes");
        }
        this.nbL = pfNbL;
        this.nbC = pfNbC;
        try
        {
            grille = new MatriceEntier(nbL+2, nbC+2);
            grilleSuivante = new MatriceEntier(nbL+2, nbC+2);
        }
        catch (Exception e) {System.out.println("[CRASH :" + e + "]");};
        this.generation = 0;
        this.histoire = new String[10];
    }
}
