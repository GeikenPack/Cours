package application;


/**
 *  Interface pour un objet qui peut s'afficher à l'écran
 *
 */

public interface Displayable {
	
	/** 
	 * Methode d'affichage d'un objet Displayable.
	 * 
	 * On attend des objets "Displayable" que l'appel de cette méthode affiche à 
	 * l'écran les valeurs des attributs de l'objet (ou au moins une partie d'entre eux).
	 * Pas d'entrée (si ce n'est this, le receveur). Pas de sortie attendue.
	*/
	
	void displayObject();

}
