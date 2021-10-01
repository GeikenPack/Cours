
/**
 * Décrivez votre classe FizzBuzz ici.
 *
 * @author (votre nom)
 * @version (un numéro de version ou une date)
 */
import java.util.Scanner;
public class FizzBuzz
{
    public static int saisieEntier() 
    {
        Scanner clavier = new Scanner(System.in) ;
        int nombreSaisi = clavier.nextInt() ;
        return nombreSaisi ;
    }
    public static int selectionLongSuite()
    {
        int entierASaisir;
        for (int i = 0; i<3; i++)
        {
            System.out.println("Entrez un nombre entier comprs entre 1 et 10");
            entierASaisir = saisieEntier();
            if (entierASaisir >=1 && entierASaisir <=100)
            {
                return entierASaisir;
            }
        }
        System.out.println("3 saisies invalides : arret du programme");
        return -1;
    }
    public static String genererSuiteFizzBuzz(int nbMax)
    {
        String suite = "";
        for (int i = 1; i <= nbMax; i++)
        {
            if (i%5==0 && i%3==0)
            {
                suite += "FizzBuzz ";
            }
            else if (i%5 == 0)
            {
                suite += "Buzz ";
            }
            else if (i%3 == 0)
            {
                suite += "Fizz ";
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
        int nbMax = selectionLongSuite();
        
        if (nbMax >=1)
        {
            suiteFizzBuzz = genererSuiteFizzBuzz(nbMax);
            System.out.print(suiteFizzBuzz);
        }
    }
}
