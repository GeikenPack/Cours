
/**
 * Décrivez votre classe Equivalence ici.
 *
 * @author (votre nom)
 * @version (un numéro de version ou une date)
 */
public class Equivalence
{
    /**
     * @return une valeur initiale
     */
    public static int init() 
    {
        return 10 ;
    }

    /**
     * Un test sur un compteur
     * @param compteur sur lequel effectuer le test
     * @return la valeur booléenne d'une condition sur le compteur
     */
    public static boolean test(int compteur) {
        return (compteur > 0) ;
    }

    /**
     * Mise à jour du compteur
     * @param compteur à mettre à jour
     * @return la prochaine valeur du compteur
     */
    public static int maj(int compteur) {
        return compteur - 1 ;
    }

    /**
     * Compte à rebours, puis fait boum
     *
     */
    public static void compteAReboursWhile() {

        int cpt ;

        cpt = init() ;
        while (test(cpt)) { // équivalent à test(cpt) == true
            System.out.print(cpt + " ") ;

            cpt = maj(cpt) ;
        }
        System.out.println("BOUM") ;

    }

    public static void compteARebourFor()
    {
        for (int cpt = init(); test(cpt); cpt = maj(cpt))
        {
            System.out.print(cpt + " ");
        }
        System.out.print("BOUM");
    }
}

