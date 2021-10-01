
/**
 * Indiquer le ou les numeros de TP et d'exercice.
 *
 * @author (votre nom)
 */
import java.util.Scanner;
public class JourSuivant
{
    /**
     * Fait saisir une date à l'utilisateur
     *
     * @param pfDate OUT : un tableau de trois cases représentant une
     * date. 1ere case : jour, 2nde case : mois, 3eme case : annee
     *
     */
    public static void saisieDate(int[] pfDate) {
        if (pfDate.length != 3) {
            System.out.print("Le tableau représentant la date a une taille inattendue : ");
            System.out.println(pfDate.length + " case(s) au lieu de 3 !");
        }
        Scanner clavier = new Scanner(System.in);
        System.out.println("Saisissez un jour");
        pfDate[0] = clavier.nextInt();
        System.out.println("Saisissez un mois");
        pfDate[1] = clavier.nextInt();
        System.out.println("Saisissez une année");
        pfDate[2] = clavier.nextInt();
    }
    /**
     *  @param annee une année
     *  @return vrai si l'année est bissextile, faux sinon
     */
    public static boolean estBissextile(int annee) 
    {
        //Verifie si l'annee est un multiple de 4 mais pas de 100 ou un multiple de 400.
        return ((annee % 4 == 0 && annee % 100 != 0) || annee % 400 == 0);
    }
    /**
     *  Détermine le nombre de jours dans un mois d'une année donnée
     *  @param mois
     *      mois
     *  @param année
     *      année
     *  @return le nombre de jours dans le mois
     */
    public static int nbJours(int mois, int annee) 
    {
        //On verifie en premeir si l'annee est bissextile
        int[] moisPrem = {4,6,9,11};
        boolean moisPremB = false;
        for (int i = 0; i < moisPrem.length; i++)
        {
            if (mois == moisPrem[i])
            {
                moisPremB = true;
            }
        }
        if (mois == 2)
        {
            if (estBissextile(annee))
            {
                return 29;
            }
            else
            {
                return 28;
            }
        }
        else if (moisPremB)
        {
            return 30;
        }
        else
        {
            return 31;
        }
    }
    /**
     * Calcul la validité d'une date
     *
     * @param pfDate IN : date initiale
     * @return true si et seulement si pfDate est valide
     *
     */
    public static boolean dateValide(int[] pfDate) {
        if (pfDate.length != 3) {
            System.out.print("Un tableau représentant une date a une taille inattendue : ");
            System.out.println(pfDate + " case(s) au lieu de 3 !");
        }
        if (pfDate[2] > 1582)
        {
            if (pfDate[1] >= 1 && pfDate[1] <= 12)
            {
                if (pfDate[0] >= 1 && pfDate[0] <= nbJours(pfDate[1], pfDate[2]))
                {
                    return true;
                }
            }
        }
        return false;
    }

    /**
     * Calcul du jour suivant
     *
     * @param pfDateJourCourant IN : date initiale
     * @param pfDateJourSuivant OUT : date du jour suivant
     *
     */
    public static void jourSuivant(int[] pfDateJourCourant, int[] pfDateJourSuivant) {
        if (pfDateJourCourant.length != 3 || pfDateJourSuivant.length != 3) {
            System.out.print("Un tableau représentant une date a une taille inattendue : ");
            System.out.println(pfDateJourCourant.length + " ou " + pfDateJourSuivant.length
                + " case(s) au lieu de 3 !");
        }
        pfDateJourSuivant[0] = pfDateJourCourant[0]+1;
        pfDateJourSuivant[1] = pfDateJourCourant[1];
        pfDateJourSuivant[2] = pfDateJourCourant[2];
        if (pfDateJourSuivant[0] > nbJours(pfDateJourSuivant[1],pfDateJourSuivant[2]))
        {
            pfDateJourSuivant[0] = 1;
            pfDateJourSuivant[1]++;
            if (pfDateJourSuivant[1] > 12)
            {
                pfDateJourSuivant[1] = 1;
                pfDateJourSuivant[2]++;
            }
        }
    }
    /**
     * Calcul du surlendemain
     * 
     * @param dateJourCourant IN : Date initiale
     * @param dateSurlendemain OUT : date du surlendemain
     * 
     */
    public static void surlendemain(int[] dateJourCourant, int[] dateSurelendemain)
    {
        int[] dateIntermediaire = new int[3];
        jourSuivant(dateJourCourant, dateIntermediaire);
        jourSuivant(dateIntermediaire, dateSurelendemain);
    }
    /**
     * Calcul de la date dans n jours
     * 
     * @param dateJourCourant IN : date initiale
     * @param dateNLendemain OUT : date dans n jours
     * @param n IN : nombre de jours a passer
     * 
     */
    public static void nLendemain(int[] dateJourCourant, int[] dateNLendemain, int n)
    {
        dateNLendemain[0] = dateJourCourant[0]+n;
        dateNLendemain[1] = dateJourCourant[1];
        dateNLendemain[2] = dateJourCourant[2];
        while (dateNLendemain[0] > nbJours(dateNLendemain[1], dateNLendemain[2]))
        {
            dateNLendemain[0] -= nbJours(dateNLendemain[1], dateNLendemain[2]);
            dateNLendemain[1]++;
            if (dateNLendemain[1] > 12)
            {
                dateNLendemain[1] = 1;
                dateNLendemain[2]++;
            }
        }
    }
    public static void principale() {
        /* Déclaration des variables */
        Scanner clavier = new Scanner(System.in);
        int[] date = new int[3] ;
        int[] dateJourSuivant = new int[3];
        int[] dateSurlendemain = new int[3];
        int[] dateNLendemain = new int[3];
        boolean dateValide ;
        int nJours;

        /* -- Etape 1 -- */
        /* Saisie d'une date */
        saisieDate(date);
        /* Saisie du nombre de jours a passer */
        System.out.println("Saisissez le nombrede jours a passer");
        nJours = clavier.nextInt();

        /* -- Etape 2 -- */
        /* Vérification de la date saisie */
        dateValide = dateValide(date);

        /* -- Etape 3 -- */
        if (dateValide) 
        {
            /* Calcul du jour suivant */
            jourSuivant(date,dateJourSuivant);
            /* Affichage du jour suivant */
            System.out.println("Le jour suivant est : " + dateJourSuivant[0] + "/" + dateJourSuivant[1] + "/" + dateJourSuivant[2]); 
            /* Calcul du surlendemain */
            surlendemain(date, dateSurlendemain);
            /* Affichage du surlendemain */
            System.out.println("La date du surlendemain est : " + dateSurlendemain[0] + "/" + dateSurlendemain[1] + "/" + dateSurlendemain[2]);
            /* Calcul du nLendemain */
            nLendemain(date, dateNLendemain, nJours);
            /* Affichage du nLendemain) */
            System.out.println("La date du nLendemain est : " + dateNLendemain[0] + "/" + dateNLendemain[1] + "/" + dateNLendemain[2]);    
        } 
        else 
        {
            System.out.println("La date du "
                + date[0] + "/" + date[1] + "/" + date[2]
                + " n'est pas une date valide.");
        }
    }
    /**
     * Calcul la date d'anniversaire commune pour n dates
     */
    public static void BarycentreDAnniversaire()
    {
        Scanner clavier = new Scanner(System.in);
        System.out.println("Saisissez le nombrede dates a rentrer");
        int n = clavier.nextInt();
        int[][] dateNPersonnes = new int[n][3];
        int[] dateBaryAnniv = new int[3];
        int sommeMois, sommeJours;
        sommeMois = sommeJours = 0;
        double moyMois, moyJours;
        for (int i = 0; i < dateNPersonnes.length; i++)
        {
            System.out.println("Date " + i);
            saisieDate(dateNPersonnes[i]);
            sommeMois += dateNPersonnes[i][1];
            sommeJours += dateNPersonnes[i][2];
        }
        moyMois = sommeMois / dateNPersonnes.length;
        moyJours = sommeJours / dateNPersonnes.length;
        dateBaryAnniv[0] = (int) (moyJours);
        dateBaryAnniv[1] = (int) (moyMois);
        dateBaryAnniv[2] = dateNPersonnes[0][2];
        System.out.println("La date d'anniversaire est : " + dateBaryAnniv[0] + "/" + dateBaryAnniv[1] + "/" + dateBaryAnniv[2]);
    }
}

