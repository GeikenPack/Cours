
/**
 * Indiquer le ou les numeros de TP et d'exercice.
 *
 * @author (votre nom)
 */
public class Boucles
{
    public static void points()
    {
        int compteur = 10;
        System.out.print("DEBUT");
        
        while (compteur >=0)
        {
            System.out.print('.');
            compteur -=1;
        }
        System.out.print("FIN");
    }
    public static void boum()
    {
        int compteur = 10;
        while (compteur >=0)
        {
            System.out.print(compteur+ " ");
            compteur -= 1;
        }
        System.out.print("BOUM");
    }
    public static void boumPair()
    {
        int compteur = 10;
        while (compteur >= 0)
        {
            if (compteur % 2 == 0)
            {
                System.out.print(compteur + " ");
            }
            compteur -=1;
        }
        System.out.print("BOUM");
    }
    public static void stringConcat()
    {
      String message ;
        message = "IUT 2018-2019";
        System.out.println(message);

        message = "I" ;
        message = message + "U" ; // 1
        message = message + "T" ; // 1
        message = message + " " ; // 1
        message = message + "2018" ; // 1
        message = message + "-" ; // 1
        message = message + "2019" ;  // 1
        System.out.println(message);

        message = "I" + "U" + "T" + " " + "2018" + "-" + "2019";  // 1
        System.out.println(message);

        message = "I" + "U" + "T" ; // 1
        message = message + " 2018-2019" ;  // 1
        System.out.println(message);
        
        message = "I" + "U" + "T" + " " + 2018 + "-" + 2019 ;  // 1 2
        System.out.println(message);

        int annee1, annee2 ;
        annee1 = 2018 ; annee2 = 2019 ;
        message = "I" + "U" + "T" + " " + annee1 + "-" + 2019;  // 1 2
        System.out.println(message);

        message = "I" + "U" + "T" + " " + annee1 + "-" + annee2;  // 1 2
        System.out.println(message);
        
        double reel = 2018.2019 ;
        message = "I" + "U" + "T" + " " + reel ;  // 1 2
        System.out.println(message);
    }
    public static void boumPropre()
    {
        int compteur = 10;
        String message = "";
        while (compteur >= 0)
        {
            message += compteur;
            message += " ";
            compteur -= 1;
        }
        message += "BOUM";
        System.out.print(message);
    }
    
}

