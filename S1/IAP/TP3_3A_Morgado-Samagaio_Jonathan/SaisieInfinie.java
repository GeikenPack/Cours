
/**
 * Indiquer le ou les numeros de TP et d'exercice.
 *
 * @author (votre nom)
 */
import java.util.Scanner;
public class SaisieInfinie
{
    public static void versLInfini()
    {
        //Déclaration des variables
        Scanner clavier = new Scanner(System.in);
        int saisie;
        String message = "Entrer un nombre entier ?";
        int compteur;
        //Traitements
        compteur = 10;
        while (compteur > 0)
        {
            System.out.println(message);
            saisie = clavier.nextInt();
        }
        
        // Affichages
        System.out.println("Vous ne verrez jamais ce OUPS");
    }
    public static void boucleInfini1()
    {
        //Déclaration des variables
        Scanner clavier = new Scanner(System.in);
        int saisie;
        String message = "Entrer un nombre entier ?";
        int compteur;
        //Traitements
        compteur = 10;
        while (compteur > 0)
        {
            System.out.println(message);
            saisie = clavier.nextInt();
            compteur -= 1;
        }
        // Affichages
        System.out.println("Vous ne verrez jamais ce OUPS");
    }
    public static void boucleInfini2()
    {
        //Déclaration des variables
        Scanner clavier = new Scanner(System.in);
        int saisie;
        String message = "Entrer un nombre entier ?";
        int compteur;
        //Traitements
        compteur = 10;
        while (compteur > 0)
        {
            System.out.println(message);
            saisie = clavier.nextInt();
            compteur -= 1;
        }
        // Affichages
        System.out.println("Vous ne verrez jamais ce OUPS");
    }
    public static void boucleInfini3()
    {
        //Déclaration des variables
        Scanner clavier = new Scanner(System.in);
        int saisie;
        String message = "Entrer un nombre entier ?";
        int compteur;
        //Traitements
        compteur = 0 ;
        while ( compteur < 11 ){
                System.out.println(message);
                saisie = clavier.nextInt() ;
                compteur += 1;
        }
        // Affichages
        System.out.println("Vous ne verrez jamais ce OUPS");
    }
}

