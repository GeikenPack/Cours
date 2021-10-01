
/**
 * Décrivez votre classe ProgrammePile ici.
 *
 * @author (votre nom)
 * @version (un numéro de version ou une date)
 */
public class ProgrammePile
{
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
    public static void empiler(Pile pfP, String pfVal)
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
        pfP.elements[pfP.indiceSommet] = "";
        pfP.indiceSommet--;
    }
    
    /**
     * Renvoie le dernier élément de la pile
     * 
     * @param pfP IN : Pile
     * @return String dernier element de la pile
     * @throw Exception Si estVide(pfP) est vrai
     */
    public static String sommet(Pile pfP) throws Exception
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
            if (pfP.elements[i] == null)
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
}
