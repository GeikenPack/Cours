
/**
 * Décrivez votre classe MatriceEntier ici.
 *
 * @author (votre nom)
 * @version (un numéro de version ou une date)
 */
public class MatriceEntier
{
    int nbL, nbC;
    int[][] tabMat;
    
    MatriceEntier() throws Exception
    {
        throw new Exception("Aucun parametres fournis");
    }
    
    MatriceEntier(int pfNbLignes, int pfNbColonnes) throws Exception
    {
        if (pfNbLignes <=0 || pfNbColonnes <=0)
        {
            throw new Exception("Le nombre de lignes et de colonnes dot etre positif");
        }
        this.nbL = pfNbLignes;
        this.nbC = pfNbColonnes;
        this.tabMat = new int[nbL][nbC];
    }
}
