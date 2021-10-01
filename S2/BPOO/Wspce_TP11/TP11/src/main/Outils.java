package main;

import application.Displayable;
import application.GraphicallyDisplayable;

public class Outils {  

	/* On voudrait pouvoir passer en param�tre pour pfD
	 *	autant un Compte qu'une Voiture ...
	 *	... ou qu'un autre objet ult�rieurement (Personne, Banque, ...) ...
	 */
		 
	public static void testAffichage (Displayable  pfD) 	{
		pfD.displayObject();
	}
	
	public static void testAffichageTableau(Displayable[] pfC)
	{
		for (int i = 0; i < pfC.length; i++)
		{
			pfC[i].displayObject();
		}
	}
	
	public static void testAffichageGraphique(GraphicallyDisplayable pfGd)
	{
		pfGd.graphicallyDisplayObject();
	}
	
	//3.1.2 : Impossible de trouver un type regroupant les deux classe et contenant une m�thode afficher.
	
	//3.2.2 : En mettant le parametre en Displayable et en changeant le afficher en displayObject, la classe se compile.
	
	//3.2.4 : On obtient une erreur nous disant d'impl�menter la m�thode displayObject.
	
	//3.2.6 : En mettant en comentaire le Outils.testAffichage (v), le main s'ex�cute et nous obtenons bien le r�sultat attendus.
	
	//3.3.2 : Le main s'ex�cute sans probl�mes et nous obtenons le bon r�sultat. Avoir mis la classe v�hicule impl�mentant Siplayable a permis de la psser en parametre de la fonction test affichage
	
	//3.2.1(2) : Impossible d'appeler ces deux m�thodes car elles ne font pas partit de Displayable.
	
	//3.4.2 : Pour les formes graphiques, nous avons juste besoin que la classe parentes FormeGraphique impl�mente Displayable et qu'on lui ajoute une m�thode displayObject et toutes les classes filles en h�riterai.
	
	//3.4.3 : Nous n'avons pas besoin d'�crire du code dans les classes. Il faut jsute cr�er deux variables dans le main et appeler testAffichage avec.
}
