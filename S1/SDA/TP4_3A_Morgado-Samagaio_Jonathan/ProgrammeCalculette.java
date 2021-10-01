
/**
 * Décrivez votre classe ProgrammeCalculette ici.
 *
 * @author (votre nom)
 * @version (un numéro de version ou une date)
 */
public class ProgrammeCalculette
{
    public static void main(String[] args) {
        for (int i=0; i<args.length; i++) {
            System.out.print(args[i] + " ");
        }
        System.out.println();
    }

    /**
     * Creer une nouvelle pile vide
     * 
     * @return Pile: la pile vide
     */
    public static Pile creerPile()
    {
        Pile p = new Pile();
        return p;
    }

    /**
     * Renvoie True si la pile est vide et False si elle ne l'est pas
     * @param pfP IN : Pile
     * 
     * @return boolean 
     */
    public static boolean estVide(Pile pfP)
    {
        if (pfP.indiceSommet < 0)
        {
            return true;
        }
        return false;
    }

    /**
     * Renvoie True si la pile est pleine et False si elle ne l'est pas
     * 
     * @param pfP IN : Pile a tester
     * @return boolean
     */
    public static boolean pilePlein(Pile pfP)
    {
        if (pfP.indiceSommet == pfP.elements.length-1)
        {
            return true;
        }
        return false;
    }

    /**
     * Ajoute un élément dans la pile
     * 
     * @param pfP IN/OUT : Pile a modifié
     * @param pfVal IN : Valeur a ajouter
     */
    public static void empiler(Pile pfP, int pfVal)
    {
        pfP.elements[pfP.indiceSommet+1] = pfVal;
        pfP.indiceSommet++;
    }

    /**
     * Enleve un élément de la pile
     * 
     * @param pfP IN/OUT : Pile a modifier
     * @throw Exception si estVide(pfP) est vraie
     */
    public static void depiler(Pile pfP) throws Exception
    {
        if (estVide(pfP))
        {
            throw new Exception("La pile n'est pas vide, rien a depiler");
        }
        pfP.elements[pfP.indiceSommet] = -1;
        pfP.indiceSommet--;
    }

    /**
     * Renvoie le dernier élément de la pile
     * 
     * @param pfP IN : Pile
     * @return String dernier element de la pile
     * @throw Exception Si estVide(pfP) est vrai
     */
    public static int sommet(Pile pfP) throws Exception
    {
        if (estVide(pfP))
        {
            throw new Exception("La liste est vide, il n'y a donc pas de sommet");
        }
        return pfP.elements[pfP.indiceSommet];
    }

    /**
     * retourne l'etat de la pile sous la forme de chaine de caractere
     * 
     * @param pfP IN : Pile a tester
     * @return String : Etat de la pile
     */
    public static String toString(Pile pfP)
    {
        String etat = "|vide";
        for (int i = 0; i <= pfP.indiceSommet; i++)
        {
            System.out.println(etat);
            if (pfP.elements[i] == -1)
            {
                etat = "vide" + etat;
            }
            else
            {
                etat = pfP.elements[i] + etat;
            }
            etat = "|" + etat;
        }
        return etat;
    }

    /**
     * retourne le nombre d'elements courants de la pile
     * 
     * @param pfP IN : Pile a tester
     * @return int : nombre d'elements
     */
    public static int nbElements(Pile pfP)
    {
        return pfP.indiceSommet+1;
    }

    public static boolean estInt(String s)
    {
        try
        {
            Integer.parseInt(s);
            return true;
        }
        catch (NumberFormatException NBR) {return false;}
    }

    public static int chercherOperandes(String EPF)
    {
        Pile p = new Pile(100);
        String[] tabOperateur = {"+","-","*","/"};
        int resultat = 0;
        for (int i = 0; i < EPF.length(); i++)
        {            
            if (estInt(EPF.substring(i,i+1)))
            {
                empiler(p, Integer.parseInt(EPF.substring(i,i+1)));   
            }
            else if (!Character.isWhitespace(EPF.charAt(i)))
            {
                try
                {
                    int pVal = sommet(p);
                    depiler(p);
                    int dVal = sommet(p);
                    depiler(p);
                    switch(EPF.substring(i,i+1))
                    {
                        case "+":
                        resultat = pVal + dVal;
                        break;
                        case "-":
                        resultat = pVal - dVal;
                        break;
                        case "*":
                        resultat = pVal * dVal;
                        break;
                        case "/":
                        resultat = pVal / dVal;
                        break;
                    }
                    empiler(p,resultat);
                }
                catch (Exception e) {System.out.println("[CRASH : " + e + "]");};

            }
        }
        try
        {
            return sommet(p);
        }
        catch (Exception e) {System.out.println(e);};
        return 0;
    }
}
