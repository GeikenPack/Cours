
/**
 * Décrivez votre classe FizzBuzzPlus ici.
 *
 * @author (votre nom)
 * @version (un numéro de version ou une date)
 */
import java.util.Scanner;
public class FizzBuzzPlus
{
    public static int saisieEntier() 
    {
        Scanner clavier = new Scanner(System.in) ;
        int nombreSaisi = clavier.nextInt() ;
        return nombreSaisi ;
    }
    public static String saisieChaine()
    {
        Scanner clavier = new Scanner(System.in);
        String chaineSaisie = clavier.nextLine();
        return chaineSaisie;
    }
    public static int selectionLongSuite(String description)
    {
        int entierASaisir;
        for (int i = 0; i<3; i++)
        {
            System.out.println(description);
            entierASaisir = saisieEntier();
            if (entierASaisir >=1 && entierASaisir <=100)
            {
                return entierASaisir;
            }
        }
        System.out.println("3 saisies invalides : arret du programme");
        return -1;
    }
    public static String genererSuiteFizzBuzz(int nbMax, int nbPremAnnonce, String premAnnonce, int nbSecAnnonce, String secAnnonce)
    {
        String suite = "";
        for (int i = 1; i <= nbMax; i++)
        {
            if (i%nbSecAnnonce==0 && i%nbPremAnnonce==0)
            {
                suite += premAnnonce+secAnnonce + " ";
            }
            else if (i%nbSecAnnonce == 0)
            {
                suite += secAnnonce + " ";
            }
            else if (i%nbPremAnnonce == 0)
            {
                suite += premAnnonce + " ";
            }
            else 
            {
                suite += i + " ";
            }
        }
        return suite;
    }
    public static void maitre()
    {
        String suiteFizzBuzz;
        System.out.println("Saisir un nombre ... ? (Exemple : 3)");
        int nbPremAnnonce = saisieEntier();
        System.out.println("Saisisser son annonce associé ? (Exemple : Buzz)");
        String premAnnonce = saisieChaine();
        System.out.println("Saisir un nombre ... ?");
        int nbSecAnnonce = saisieEntier();
        System.out.println("Et son annonce associé?");
        String secAnnonce = saisieChaine();
        int nbMax = selectionLongSuite("Nombre d'annonces " + premAnnonce + secAnnonce + "a afficher ? (entre 1 et 100)");
        if (nbMax >=1)
        {
            suiteFizzBuzz = genererSuiteFizzBuzz(nbMax,nbPremAnnonce, premAnnonce, nbSecAnnonce, secAnnonce);
            System.out.print(suiteFizzBuzz);
        }
    }
}
