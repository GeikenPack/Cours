
/**
 * Décrivez votre classe CrashHueBoum ici.
 *
 * @author (votre nom)
 * @version (un numéro de version ou une date)
 */
public class CrashHueBoum
{
    public static void boucleBoumOuPas() {
        // Traitements et affichage
        try {
            int compteur = 10 ;
            while (compteur >= 0 ){
                System.out.print(compteur * compteur / compteur);
                System.out.print(' ');

                compteur = compteur - 1 ;
            } 
        } catch (Exception e) {e.printStackTrace();};
        System.out.println("BOUM");
        System.out.println("Qu'il serait bon d'arriver ici ...");
    }

    public static void tabBoumOuPas() {
        // Traitements et affichages
        try {
            int tabChiffres[] = {10,9,8,7,6,5,4,3,2,1} ;

            int indice = 0 ;
            while (indice <= 10 ){
                System.out.print(tabChiffres[indice]);
                System.out.print(' ');
                indice = indice + 1 ;
            }
        } catch (Exception e){e.printStackTrace();};
        System.out.println("BOUM");
    }
}
