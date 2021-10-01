
/**
 * Indiquer le ou les numeros de TP et d'exercice.
 *
 * @author (votre nom)
 */
import java.util.Scanner;
public class Mention
{
    //Module (fonction) permettant de retourner une valeur comprise entre pfBorneInf et pfBorneSup
    public static double saisieC(double pfBorneInf, double pfBorneSup){
        double valeurC;
        Scanner clavier = new Scanner(System.in) ;
        System.out.println("Donnez une valeur comprise entre "+pfBorneInf+" et "+pfBorneSup+ "?");
        valeurC=clavier.nextDouble();
        while (valeurC<pfBorneInf || valeurC>pfBorneSup){
            System.out.println("Erreur ! Donnez une valeur comprise entre "+pfBorneInf+" et "+pfBorneSup+ "?");
            valeurC=clavier.nextDouble();
        }
        return valeurC;
    }

    // note1 = 12, note2 = 13 note3 = 14, moyenne = 13, ecran : "Mention obtenue : assez bien"
    // note1 = 8, note2 = 4, note3 = 8, moyenne = 6,6, ecran : "Mention obtenue : collé"
    public static void calcul() {
        // Declaration des variables
        double note1, note2, note3;
        double somme, moyenne;
        String mention;

        // Saisie des 3 notes
        System.out.println("Donnez la note 1");
        note1 = saisieC(0,20);
        System.out.println("Donnez la note 2");
        note2 = saisieC(0,20);
        System.out.println("Donnez la note 3");
        note3 = saisieC(0,20);


        // Calcul de la somme et de la moyenne
        somme = note1 + note2 + note3;
        moyenne = somme / 3;
        if (moyenne >= 16)
        {
            mention = "Très bien";
        }
        else if (moyenne >= 14)
        {
            mention = "Bien";
        }
        else if (moyenne >= 12)
        {
            mention = "Assez bien";
        }
        else if (moyenne >= 10)
        {
            mention = "Passable";
        }
        else 
        {
            mention = "Collé";
        }


        //Affichage
        System.out.println("La moyenne des 3 notes est : "+ moyenne);
        System.out.println("Mention obtenue : " + mention + " !");

    }
 
}

