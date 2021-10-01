
/**
 * Décrivez votre classe Test ici.
 *
 * @author (votre nom)
 * @version (un numéro de version ou une date)
 */
public class Test
{
    public static void transP()
    {
        int[][] tabVal = {{1,2,3,10},
                          {4,5,6,11},
                          {7,8,9,12},
                          {13,14,15}};
        int[][] transpTabVal = new int[4][3];
        String ligne = "";
        for (int i = 0; i < tabVal.length; i++)
        {
            for (int j = 0; j < tabVal[i].length; j++)
            {
                transpTabVal[i][j] = tabVal[tabVal.length-1-j][i];
            }
        }
        for (int i = 0; i < transpTabVal.length; i++)
        {
            for (int j = 0; j < transpTabVal[i].length; j++)
            {
                ligne += transpTabVal[i][j];
            }
            ligne += "\n";
        }
        System.out.println(ligne);
    }
}
