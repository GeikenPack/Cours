
/**
 * Indiquer le ou les numeros de TP et d'exercice.
 *
 * @author (votre nom)
 */

public class Graphique
{
    /**
     *
     * @param numLigne le numéro de la ligne dans la console
     * @return le numéro de la colonne où on doit imprimer une étoile
     *
     **/
    public static int getNumColonneEtoile(int numLigne) 
    {
        return 0 ;
    }

    /**
     *
     * @param numLigne le numéro de la ligne dans le repère de la console
     * @return l'ordonnée correspondante dans le repère initial
     *
     **/
    public static double ordonneeInitiale(int numLigne) 
    {
        double ordonneeInitiale;
        ordonneeInitiale = (numLigne-7.5)/-7.5;
        return ordonneeInitiale;
    }

    /**
     *
     * @param ordonnee une ordonnee dans le repère initial
     * @return l'abscisse du point de la courbe dans le repère initial
     *
     **/
    public static double getAbscisseInitiale(double ordonnee) 
    {
        return Math.asin(ordonnee);
    }

    /**
     *
     * @param abscisse une abscisse dans le repère initial
     * @return le numéro de colonne correspondant dans le repère de la console
     *
     **/
    public static int numColonne(double abscisse) 
    {
        int numColonne;
        numColonne = math.round(abscisse-1.571)/(-0.209);
        return numColonne;
    }


    /**
     *  Devrait afficher la fonction sinus.
     *
     **/
    public static void display() 
    {
        System.out.println("Tiens, voilà une étoile : *");
    }
}

