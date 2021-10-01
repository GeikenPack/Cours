
/**
 * Indiquer le ou les numeros de TP et d'exercice.
 *
 * @author (votre nom)
 */
import java.util.Scanner;
public class DatesEtCompagnie
{
    /**
     *  @param annee une année
     *  @return vrai si l'année est bissextile, faux sinon
     */
    public static boolean estBissextile(int annee) 
    {
        //Verifie si l'annee est un multiple de 4 mais pas de 100 ou un multiple de 400.
        if((annee % 4 == 0 && annee % 100 != 0) || annee % 400 == 0)
        {
            return true;
        }
        return false ;
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
        else if (mois == 2 || mois == 4 || mois == 6 ||  mois == 9 || mois == 11)
        {
            return 30;
        }
        else
        {
            return 31;
        }
    }
    public static void saisieCalculAffichageValidite() 
    {
    /**************/
    /* E1: Saisie */
    /**************/
    int jour, mois, annee;
    jour = saisieEntier();
    mois = saisieEntier();
    annee = saisieEntier();

    /****************/
    /* E2: Validité */
    /****************/
    boolean dateValide;
    dateValide = estValide(jour, mois, annee);

    /*****************/
    /* E3: Affichage */
    /*****************/
    if (dateValide)
    {
        System.out.println("La date saisie est valide");
    }
    else
    {
        System.out.println("La date saisie n'est pas valide");
    }
    }   


    /**
     *  Détermine si une date est valide
     *  @param jour
     *      jour de la date
     *  @param mois
     *      mois de la date
     *  @param année
     *      année de la date
     *  @return vrai si la date est valide, faux sinon
     */
    public static boolean estValide(int jour, int mois, int annee) 
    {
        // Pour l'instant, on fait simplement en sorte que la classe compile.
        // cette fonction ne détermine pas encore la validité
        int nbJours;
        if (annee > 1582)
        {
            if (mois >= 1 && mois <= 12)
            {
                nbJours = nbJours(mois, annee);
                if (jour >= 1 && jour <= nbJours)
                {
                    return true;
                }
            }
        }
        return false;
    }
    

    /**
     * Fonction aidant a saisir un entier.
     * A priori, pas besoin de la modifier
     * @return entier saisi par l'utilisateur
     */
    public static int saisieEntier() 
    {
        System.out.println("Saisir un entier");
        Scanner clavier = new Scanner(System.in) ;
        int nombreSaisi = clavier.nextInt() ;
        return nombreSaisi ;
    }
    /**
     * Foncion calculant la moyenne d'une année terrestre
     * @return moyenne de jours dans une annee terrestres
     */
    public static double moyenneAnneeTerrestre()
    {
        //Une année prend un jour tous les 4 ans et en perd 3 tous les 400 ans
        double moyenne;
        moyenne = 365.0+1.0/4.0-3.0/400.0;
        return moyenne;
    }
    /**
     * Détermine l'âge de VOTRE_NOM à une date donnée.
     */
    public static int ageDeJonathan(int jour, int mois, int annee)
    {
        int jourNaissance, moisNaissance, anneeNaissance;
        int age;
        /* Initialisation de votre date de naissance */
        age = 0;
        jourNaissance = 11;
        moisNaissance = 8;
        anneeNaissance = 2002;
        /* Calcul de votre âge à la date indiquée */
        if (estValide(jour, mois, annee))
        {
            age = annee - anneeNaissance;
            if (mois < moisNaissance || (mois == moisNaissance && jour < jourNaissance))
            {
                age -= 1;
            }
        }
        return age;
    }
}

