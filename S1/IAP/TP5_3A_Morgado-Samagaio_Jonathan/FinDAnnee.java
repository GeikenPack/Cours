
/**
 * Décrivez votre classe FinDAnnee ici.
 *
 * @author (votre nom)
 * @version (un numéro de version ou une date)
 */
import java.util.Scanner;
public class FinDAnnee
{
    public static int saisieEntier() 
    {
        Scanner clavier = new Scanner(System.in) ;
        int nombreSaisi = clavier.nextInt() ;
        return nombreSaisi ;
    }
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
    public static String nomMois(int mois)
    {
        switch(mois)
        {
            case 1:
                return "Janvier";
            case 2:
                return "Fevrier";
            case 3:
                return "Mars";
            case 4:
                return "Avril";
            case 5:
                return "Mai";
            case 6:
                return "Juin";
            case 7:
                return "Juillet";
            case 8:
                return "Aout";
            case 9:
                return "Septembre";
            case 10:
                return "Octobre";
            case 11:
                return "Novembre";
            case 12:
                return "Decembre";
            default:
                return "Mauvais mois";
        }
    }
    public static void joursFinAnnee()
    {
        int mois, annee;
        mois = saisieControlee("Saisir un mois",1,12,3);
        annee = saisieControlee("Saisir une année",1582, 9999999, 3);
        if (estValide(1,mois,annee))
        {
            for (int i = mois; i <=12; i++)
            {
                System.out.println(nomMois(i) + " " + annee + ", " + nbJours(i, annee) + " jours");
            }        
        }
        else
        {
            System.out.println("Cette date n'est pas valide");
        }
    }
    
    public static void saisieControleeI()
    {
        int entierASaisir;
        boolean tropEssais = true;
        for (int i = 0; i<5; i++)
        {
            System.out.println("Entrez un nombre entier comprs entre 1 et 10");
            entierASaisir = saisieEntier();
            if (entierASaisir >=1 && entierASaisir <=10)
            {
                System.out.println("Vous avez correctement saisie : " + entierASaisir);
                tropEssais = false;
                break;
            }
        }
        if(tropEssais)
        {
            System.out.println("5 saisies invalides : arret du programme.");
        }
    }
    public static int saisieControlee(String description, int min, int max, int essais)
    {
        int entierASaisir;
        boolean tropEssais = true;
        for (int i = essais; i>0; i--)
        {
            System.out.println(description + " (entre " + min + " et " + max + ") " + i + " essais restants");
            entierASaisir = saisieEntier();
            if (entierASaisir >=min && entierASaisir <=max)
            {
                return entierASaisir;
            }
        }
        if (tropEssais)
        {
            System.out.println(essais + " saisies invalides : arret du programme.");
            System.exit(1);
        }
        return 0;
    }
}
