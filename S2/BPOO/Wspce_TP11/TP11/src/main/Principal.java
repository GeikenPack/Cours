package main;

import tps.autresClasses.Personne;
import tps.autresClasses.Vehicule;
import tps.banque.Compte;
import tps.banque.CompteSecurise;



public class Principal { 
	public static void main (String [] argv ) {
		/* On voudrait pouvoir passer en paramètre
		 *	à la méthode Outils.testAffichage ()
		 *	autant un Compte qu'une Voiture ...
		 */
		 
		CompteSecurise c;

		c = new CompteSecurise("0808", "Dupont");
		
		Outils.testAffichage(c);

		Vehicule  v;
		
		v = new Vehicule("0808", 2000);

		 Outils.testAffichage (v);
		 
		 Personne p;
		 p = new Personne("Jean", 38);
		 Outils.testAffichage(p);
		 
		// A continuer ...
		 Compte [] tabComptes;
		 tabComptes = new Compte [5];
			for (int i=0; i<tabComptes.length; i++)
				tabComptes[i] = new Compte ("No "+i, "Prop "+i);
			Outils.testAffichageTableau(tabComptes);
			Vehicule [] tabVehicules ;
			tabVehicules = new Vehicule [5];
			for (int i=0; i<tabVehicules.length; i++)
				tabVehicules[i] = new Vehicule ("Immat "+i, i);
			Outils.testAffichageTableau(tabVehicules);
			Personne [] tabPersonnes;
			tabPersonnes = new Personne [5];
			for (int i=0; i<tabPersonnes.length; i++)
				tabPersonnes[i] = new Personne ("Nom "+i, i*10);
			Outils.testAffichageTableau(tabPersonnes);
			
			Outils.testAffichageGraphique(c);
			Outils.testAffichageGraphique(v);
		// Pour tableaux cf commentaire ci-dessous ...
	}
}

/*
 *A utiliser lorsque de besoin :
		int  i;
		Compte [] tabComptes;
		Vehicule [] tabVehicules ;
		tabComptes = new Compte [5];
		for (i=0; i<tabComptes.length; i++)
			tabComptes[i] = new Compte ("No "+i, "Prop "+i);
		tabVehicules = new Vehicule [5];
		for (i=0; i<tabVehicules.length; i++)
			tabVehicules[i] = new Vehicule ("Immat "+i, i);
		
		Personne [] tabPersonnes;
		tabPersonnes = new Personne [5];
		for (i=0; i<tabPersonnes.length; i++)
			tabPersonnes[i] = new Personne ("Nom "+i, i*10);
*/