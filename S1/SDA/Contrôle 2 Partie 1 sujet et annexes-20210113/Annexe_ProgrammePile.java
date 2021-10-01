import java.util.Scanner;


public class ProgrammePile {

    /** permet de tirer au sort un mot parmi ceux d'un dictionnaire
     * @param pfDico IN un dictionnaire de mots
     * @return un mot
     **/
    public static String tirage(Dico pfDico) {
        int tirage = (int) (Math.random() * pfDico.dico.length);
        return pfDico.dico[tirage] ;
    }
   

    /** permet de tester si la pile est vide
     * @param pfPile IN la pile
     * @return true si la pile est vide et false sinon
     **/
    public static boolean estVide(Pile pfPile) {
        return (pfPile.indiceSommet == -1) ;
    }
    
    /** empile un element dans la pile
     * @param pfPile IN/OUT la pile
     * @param pfElement IN l'element a empiler
     * @throws Exception si pile Pleine
     **/
    public static void empiler(Pile pfPile, String pfElement) throws Exception {
        if (pfPile.indiceSommet >= pfPile.elements.length - 1) {
            throw new Exception("Erreur: Pile pleine") ;
        }
        pfPile.indiceSommet = pfPile.indiceSommet + 1 ;
        pfPile.elements[pfPile.indiceSommet] = pfElement ;
    }
    
    
    /** depile un element de la pile
     * @param pfPile IN/OUT la pile
     * @throws Exception estVide(pfPile)
     **/
    public static void depiler(Pile pfPile) throws Exception {
        if (estVide(pfPile)) {
            throw new Exception("Erreur: Pile vide") ;
        }
        pfPile.indiceSommet = pfPile.indiceSommet - 1 ;
    }
     
    /** acceder au sommet de lapile
     * @param pfPile IN la pile
     * @return le sommet de la pile s'il existe
     * @throws Exception estVide(pfPile)
     **/
    public static String sommet(Pile pfPile) throws Exception {
        if (estVide(pfPile)) {
            throw new Exception("Erreur: Pile vide") ;
        }
        return pfPile.elements[pfPile.indiceSommet];
    }
    
    /* Operations supplémentaires */
    /** convertit la pile en chaine de caracteres
     * @param pfPile IN la pile
     * @return la chaine de caractere comportant les elements de la pile
     **/
    public static String toString(Pile pfPile) {
        String resultat = "|vide" ;
        for (int indice = 0 ;
             indice <= pfPile.indiceSommet ;
             indice = indice + 1) {
            resultat = "|" + pfPile.elements[indice] + resultat ;
        }
        return resultat;
    }

    /** donne le nombre d'element de la pile
     * @param pfPile IN la pile
     * @return le nombre d'element de la pile
     **/
    public static int nbElements(Pile pfPile) {
        return (pfPile.indiceSommet + 1) ;
    } 
 
    
    public static void main(String[] args) {
        Pile pile = new Pile(5) ;
        String mot = tirage(new Dico()) ;
        Scanner lecteur = new Scanner(System.in) ;
        //compléter
    } // fin main 
} // fin class
