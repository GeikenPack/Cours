
/**
 * Décrivez votre classe TriDicho ici.
 *
 * @author (votre nom)
 * @version (un numéro de version ou une date)
 */
public class TriDicho
{
    /**
     * Permet d'insérer un élément dans un tnp de telle manière à ce que l'ordre décroissant soit respecté
     * @param pfTab IN/OUT Le dit tnp
     * @param nbAjout IN : l'élément à insérer
     * 
     * @throws si tableau plein
     **/
    public static void inserer1(TNPReel pfTab, double nbAjout) throws Exception
    {
        if (pfTab.nbElt+1 > pfTab.lesElements.length)
        {
            throw new Exception("Le TNP est plein");
        }

        if (pfTab.lesElements[pfTab.nbElt-1] >= nbAjout)
        {
            pfTab.lesElements[pfTab.nbElt] = nbAjout;
        }
        else
        {
            int i = pfTab.nbElt - 2;
            while (pfTab.lesElements[i] < nbAjout)
            {
                pfTab.lesElements[i+1] = pfTab.lesElements[i];
                i--;
            }
            pfTab.lesElements[i] = nbAjout;
        }
        pfTab.nbElt++;
    }

    public static void inserer2(TNPReel pfTab, double nbAjout) throws Exception
    {
        if (pfTab.nbElt+1 > pfTab.lesElements.length)
        {
            throw new Exception("Le TNP est plein");
        }

        boolean place = false;
        int a, b;
        a = 0;
        b = pfTab.nbElt-1;
        int c = 0;
        while (!place)
        {
            c = a+b/2;
            if (pfTab.lesElements[c] > nbAjout && pfTab.lesElements[c+1] < nbAjout)
            {
                place = true;
            }
            else if (pfTab.lesElements[c] > nbAjout)
            {
                a = c;
            }
            else if (pfTab.lesElements[c] < nbAjout)
            {
                    b = c;
                }
            }
            for (int i = pfTab.nbElt-1; i > c+1; i--)
            {
                pfTab.lesElements[i] = pfTab.lesElements[i-1];
            }
            pfTab.lesElements[c+1] = nbAjout;

        pfTab.nbElt++;
    }

    public static void principal()
    {
        TNPReel tab = new TNPReel();
        tab.lesElements[0] = 20;
        tab.lesElements[1] = 15;
        tab.lesElements[2] = 10;
        tab.lesElements[3] = 5;
        tab.lesElements[4] = 2;
        tab.nbElt = 5;
        try
        {
            inserer2(tab, 19);
        }
        catch (Exception e) {System.out.println("Crash : " + e);}
        for (int i = 0; i < tab.nbElt; i++)
        {
            System.out.println(tab.lesElements[i]);
        }

    }
}
