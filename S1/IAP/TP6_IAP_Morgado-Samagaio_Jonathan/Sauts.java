
/**
 * Décrivez votre classe Sauts ici.
 *
 * @author (votre nom)
 * @version (un numéro de version ou une date)
 */
import java.util.Scanner;
public class Sauts
{
    /** Retourne une valeur entière saisie au clavier comprise entre
    deux valeurs
     * @param min la valeur minimale
     * @param max la valeur maximale
     * @return valeur entière comprise entre min et max (inclus)
     */
    public static int saisieIntMinMax(int min, int max){
        int saisie = min - 1 ;
        Scanner clavier = new Scanner(System.in) ;
        while (saisie < min || saisie > max){
            System.out.println("Donnez une valeur comprise entre " + min + " et " + max + " :") ;
            saisie = clavier.nextInt() ;
        }
        return saisie;
    }

    /** Retourne une valeur entière saisie au clavier au moins égale à min
     * @param min la valeur minimale
     * @return valeur entière au moins égale à min
     */
    public static int saisieIntMin(int min){
        int saisie = min - 1 ;
        Scanner clavier = new Scanner(System.in) ;
        System.out.println("Donnez une valeur au moins égale à " + min + " :") ;
        saisie = clavier.nextInt() ;
        while (saisie < min){
            System.out.println("Erreur, donnez une valeur au moins égale à " + min + " :") ;
            saisie = clavier.nextInt() ;
        }
        return saisie ;
    }

    public static String saisieString()
    {
        String saisie = "";
        Scanner clavier = new Scanner(System.in);
        saisie = clavier.nextLine();
        return saisie;
    }

    /** Retourne une valeur réelle saisie au clavier au moins egale à min
     * @param min la valeur minimale
     * @return valeur réelle au moins égale à min
     */
    public static double saisieDoubleMin(double min){
        double saisie = min - 1 ;
        Scanner clavier = new Scanner(System.in) ;
        while (saisie < min){
            System.out.println("Donnez une valeur au moins égale à " + min + " :") ;
            saisie = clavier.nextDouble() ;
        }
        return saisie ;
    }

    /** Saisit nbSaisies réels positifs ou nuls au clavier et les stocke dans le tableau tab
     * @param nbSaisies nombre de réels à saisir
     * @param tab le tableau où stocker les saisies
     */
    public static void saisieTabD (int nbSaisies, double tab[]) {
        Scanner clavier = new Scanner(System.in) ;
        for (int i = 0 ; i < nbSaisies ; i++) {
            System.out.println("Valeur n°" + (i+1) + " :") ;
            tab[i] = saisieDoubleMin(0) ;
        }
    }

    /** Calcule et retourne la moyenne des sauts
     * @param nbSauts le nombre de sauts
     * @param tab le tableau contenant les sauts
     * @return la moyenne des sauts
     */
    public static double moyenneSauts(int nbSauts, double tab[]) {
        double somme, moyenne;
        somme = 0;
        for (int i = 0; i < nbSauts; i++)
        {
            somme += tab[i];
        }
        if (nbSauts != 0)
        {
            moyenne = somme / nbSauts;
        }
        else 
        {
            moyenne = 0;
        }
        return moyenne;
    }

    public static double meilleurSaut(double[] tab)
    {
        double mSaut = tab[0];
        for (int i = 0; i < tab.length; i++)
        {
            if (mSaut < tab[i])
            {
                mSaut = tab[i];
            }
        } 
        return mSaut;
    }

    public static double pireSaut(double[] tab)
    {
        double pSaut = tab[0];
        for (int i = 0; i < tab.length; i++)
        {
            if (pSaut > tab[i])
            {
                pSaut = tab[i];
            }
        }
        return pSaut;
    }

    /** Programme principal :
     *  - saisit tous les sauts
     *  - calcule et affiche la moyenne des sauts
     *  - calcule et affiche le meilleur saut
     *  - calcule et affiche le pire saut
     */
    public static void principale() {
        double[] sauts;
        int nbSauts;
        double moyenne;
        double mSaut, pSaut;
        /* --- Saisie des sauts --- */
        nbSauts = saisieIntMinMax(0,15);
        sauts = new double[nbSauts];
        saisieTabD(nbSauts,sauts);
        /* --- Moyenne des sauts --- */
        moyenne = moyenneSauts(nbSauts, sauts);
        if(moyenne != 0)
        {
            System.out.println("La moyenne des sauts est : " + moyenne);
            /* --- Meilleur saut --- */
            mSaut = meilleurSaut(sauts);
            System.out.println("Le meilleur saut est : " + mSaut);
            /* --- Pire saut --- */
            pSaut = pireSaut(sauts);
            System.out.println("Le pire saut est : " + pSaut);
        }
        else
        {
            System.out.println("Aucun saut saisie");
        }
    }

    public static void enchere()
    {
        int[] enchere = new int[6];
        enchere[0] = saisieIntMin(0);
        for (int i = 1; i < enchere.length; i++)
        {
            enchere[i] = saisieIntMin(enchere[i-1]);
        }
        for (int i = 0; i < enchere.length; i++)
        {
            System.out.println("Enchere n°" + i+1 + ": " + enchere[i]);
        }
    }

    public static void enchere2()
    {
        int[] enchere = new int[6];
        enchere[0] = saisieIntMin(0);
        int somme = enchere[0];
        for (int i = 1; i < enchere.length; i++)
        {
            enchere[i] = saisieIntMin(somme);
            somme += enchere[i];
        }
        for (int i = 0; i < enchere.length; i++)
        {
            System.out.println("Enchere n°" + (i+1) + ": " + enchere[i]);
        }
    }

    public static void enchere3()
    {
        int[] enchere = new int[6];
        enchere[0] = saisieIntMin(0);
        int somme = enchere[0];
        int choix, iFin;
        iFin = enchere.length;
        for (int i = 1; i < enchere.length; i++)
        {
            System.out.println("Voulez-vous continuer? (1 (oui) ou 0(non)");
            choix = saisieIntMinMax(0,1);
            System.out.print(choix);
            if (choix == 1)
            {
                enchere[i] = saisieIntMin(somme);
                somme += enchere[i];
            }
            else if (choix == 0)
            {
                iFin = i;
                i = enchere.length;
            }
        }
        for (int i = 0; i < iFin; i++)
        {
            System.out.println("Enchere n°" + (i+1) + ": " + enchere[i]);
        }  
    }

}
