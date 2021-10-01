package application;


/**
 *  Interface pour un objet qui peut s'afficher � l'�cran
 *
 */

public interface Displayable {
	
	/** 
	 * Methode d'affichage d'un objet Displayable.
	 * 
	 * On attend des objets "Displayable" que l'appel de cette m�thode affiche � 
	 * l'�cran les valeurs des attributs de l'objet (ou au moins une partie d'entre eux).
	 * Pas d'entr�e (si ce n'est this, le receveur). Pas de sortie attendue.
	*/
	
	void displayObject();

}
