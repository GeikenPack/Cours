
/**
 * Décrivez votre classe AlgoTableaux ici.
 *
 * @author (votre nom)
 * @version (un numéro de version ou une date)
 */
import java.util.Scanner;
public class AlgoTableaux
{
    /**
     * Demande à l'utilisateur de saisir un entier, jusqu'à ce que
     * l'entier saisi soit entre les deux bornes en paramètres.
     *
     * @param pfBorneInf IN : borne inférieure
     * @param pfBorneSup IN : borne supérieure
     *
     * @return un entier entre pfBorneInf et pfBorneSup, compris
     */
    public static int saisieIntC (int pfBorneInf, int pfBorneSup){
        int valeur;
        Scanner clavier = new Scanner(System.in) ;
        System.out.println("Donnez une valeur comprise entre "+pfBorneInf+" et "+pfBorneSup+ "?");
        valeur = clavier.nextInt();
        while (valeur<pfBorneInf || valeur>pfBorneSup){
            System.out.println("Erreur ! Donnez une valeur comprise entre "+pfBorneInf+" et "+pfBorneSup+ "?");
            valeur = clavier.nextInt();
        }
        return valeur;
    }

    /**
     * Demande à l'utilisateur :
     *   1. de saisir le nombre de cases qu'il souhaite remplir, et
     *      répète l'opération, jusqu'à ce que ce nombre soit
     *      acceptable
     *   2. de remplir les cases une à une.
     *
     * @param pfTab OUT : tableau à remplir
     *
     * @return le nombre de cases remplies dans le tableau
     */
    public static int saisirTableau (int[] pfTab){
        int nbEl = saisieIntC(-100,100);
        for (int i = 0; i < nbEl; i++)
        {
            System.out.println("Saisissez la valeur " + i+1);
            pfTab[i] = saisieIntC(-100,100);
        }
        System.out.println("J'avais " + pfTab.length
            + " cases disponibles, et j'en ai rempli "
            + nbEl);
        return nbEl ;
    }

    /**
     * Affiche le tableau en paramètre.
     *
     * @param pfTab IN : tableau
     * @param pfNbEl IN : nombre de cases remplies dans le tableau
     *
     */
    public static void afficherTableau(int[] pfTab, int pfNbEl) {
        String ligne = "";
        for (int i = 0; i < pfNbEl; i++)
        {
            ligne += pfTab[i];
            ligne += " ";
        }
        System.out.println(ligne);
        // System.out.println("==============================");
    }

    /**
     * Inverse les valeurs du tableau en paramètre
     * 
     * @param pfTab OUT : tableau
     * @param pfNbE1 IN : nombre de cases remplies dans le tableau
     */
    public static void inverserTableau(int[] pfTab, int pfNbE1)
    {
        int temp;
        for (int i = 0, j = pfNbE1-1; i<pfNbE1/2; i++, j--)
        {
            temp = pfTab[i];
            pfTab[i] = pfTab[j];
            pfTab[j] = temp;
        }
    }

    /**
     * Supprime les doublons du tableau en entrée
     * 
     * @param pfTab OUT : tableau
     * @param pfNbE1 : nombre de cases remplis dans le tableau
     * 
     * @return nombre de case remplis du nouveau tableau
     */
    public static int eliminerDoublons(int[] pfTab, int pfNbE1)
    {
        for (int i = 0; i < pfNbE1; i++)
        {
            for (int j = i+1; j < pfNbE1; j++)
            {
                if (pfTab[i] == pfTab[j])
                {
                    for (int k = j; k < pfNbE1; k++)
                    {
                        pfTab[k] = pfTab[k+1];
                    }
                    j--;
                    pfNbE1--;
                }
            }
        }
        return pfNbE1;
    }

    /**
     * Stocke les indices des occurences du maximum
     *
     * @param pfTab    IN  : un tableau de valeurs entières
     * @param pfNbEl   IN  : le nombre de valeurs
     * @param pfIndice OUT : le tableau des indices
     *
     * @return le nombre d'occurrences du max
     */
    public static int indicesMax(int[] pfTab, int pfNbE1, int[] pfIndices)
    {
        int max = pfTab[0];
        int nbOccur = 0;
        int indiceActuel = 1;
        for (int i = 1; i < pfNbE1; i++)
        {
            if (pfTab[i] > max)
            {
                max = pfTab[i];
                nbOccur = 0;
                for (int j = 0; j < indiceActuel; j++)
                {
                    pfIndices[j] = 0;
                }
                indiceActuel = 0;
            }
            if (pfTab[i] == max)
            {
                pfIndices[indiceActuel] = i;
                nbOccur++;
                indiceActuel++;
            }
        }
        return nbOccur;
    }

    /**
     * 
     * @param pfTabVal IN : tableau de valeurs entières
     * @param pfNbE1 IN : nombre de cases remplis du tableau
     */
    public static double moyenneNegative(int[] pfTabVal, int pfNbE1) throws Exception
    {
        double somme = 0;
        int nbVal = 0;
        for (int i = 0; i < pfNbE1; i++)
        {
            if (pfTabVal[i] < 0)
            {
                somme += pfTabVal[i];
                nbVal++;
            }
            if (nbVal ==0)
            {
                throw new Exception("Aucune valeur négative dans le tableau");
            }
        }
        return somme / nbVal;
    }

    /**
     * Donne la valeur minimal d'un tableau
     * 
     * @param pfTabVal : tableau de valeurs entières
     * @param pfNbE1 : nombre de cases remplis du tableau
     */
    public static int min(int[] pfTabVal, int pfNbE1) throws Exception
    {
        if (pfNbE1 == 0)
        {
            throw new Exception("Aucune valeur dans le tableau");
        }
        int min = pfTabVal[0];
        for (int i = 0; i < pfNbE1; i++)
        {
            if (min > pfTabVal[i])
            {
                min = pfTabVal[i];
            }
        }
        return min;
    }

    /**
     * Donne la valeur max d'un tableau
     * 
     * @param pfTabVal : tableau de valeurs entières
     * @param pfNbE1 : nombre de cases remplis du tableau
     */
    public static int max(int[] pfTabVal, int pfNbE1) throws Exception
    {
        if (pfNbE1 == 0)
        {
            throw new Exception("Aucune valeur dans le tableau");
        }
        int max = pfTabVal[0];
        for (int i = 0; i < pfNbE1; i++)
        {
            if (max > pfTabVal[i])
            {
                max = pfTabVal[i];
            }
        }
        return max;
    }

    public static void principale() {
        /* Declaration des variables */
        int nbVal ; //nombre de valeurs a traiter
        int tab[]  ; // tableau permettant de stocker les valeurs
        int nbOccurrences;

        tab = new int[100] ;
        int[] indices = new int[10];
        // Ajouter les appels aux algorithmes :
        //   - à saisirTableau
        nbVal = saisirTableau(tab);
        //   - puis à afficherTableau
        afficherTableau(tab, nbVal);
        //   - puis à indiceMax
        nbOccurrences = indicesMax(tab, nbVal, indices);
        System.out.println("Le maximum apparait " + nbOccurrences + " fois aux indices : ");
        afficherTableau(indices, nbOccurrences);
        //   - puis à inverserTableau
        System.out.println("Tableau inverse");
        inverserTableau(tab, nbVal);
        afficherTableau(tab, nbVal);
        //   - puis à eliminerDoublons
        System.out.println("Tableau sans doublons");
        nbVal = eliminerDoublons(tab, nbVal);
        afficherTableau(tab, nbVal);
        // Moyenne de valeurs négatives
        System.out.println("Moyenne des valeurs négatives :");
        try
        {
            System.out.println(moyenneNegative(tab, nbVal));
        }
        catch (Exception e) {System.out.println("[CRASH "+e+"] ");};
        System.out.println("Min et Max du tableau");
        try
        {
            System.out.println("Min : "+ min(tab,nbVal) + " Max : " + max(tab,nbVal));
        }
        catch (Exception e) {System.out.println("[CRASH : "+e+"] ");};
    }
}