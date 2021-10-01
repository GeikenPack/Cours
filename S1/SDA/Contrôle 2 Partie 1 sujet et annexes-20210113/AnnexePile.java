/**
 * Décrivez votre classe Pile ici.
 *
 * @author (votre nom)
 * @version (un numéro de version ou une date)
 */
public class Pile
{


    public String elements[]  ;
    public int indiceSommet ;

    /** Constructeur sans parametre.
     *  Crée une pile vide de max 100 elements
     */
    Pile(){
        this.elements = new String[100];
        this.indiceSommet = -1 ;
    }
  
    /** Constructeur.
     * Crée une pile vide de max pfTaille elements
     * @param pfTaille IN taille max de la pile
     **/
    Pile(int pfTaille){
	this.elements = new String[pfTaille] ;
	this.indiceSommet = -1 ;
    }
} // fin class


