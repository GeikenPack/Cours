//compte.c
#include "compte.h"
#include <stdio.h>
#include <stdlib.h>
   char devise[KNBDEVISE][kLGCHAINE] ={"Euro", "Livre", "Dollar", "Yen"};
   float tauxChange[KNBDEVISE] ={1.0, 1.2125 , 0.73791, 0.007083};


/* Affiche la liste des devises */
void affichageListeDevises(){
  int i;
   for(i=0;i< KNBDEVISE;i++)
		    printf("choix %d pour %s\n",i ,  devise[i]);
	  
}

Compte saisieCompte () {
    Compte unCompte;
    int i;
	  int choix;
	  scanf("%lf",&(unCompte.soldeCompte));//pas de controle

	  affichageListeDevises();
    
    scanf("%d",&choix);
    //vérification que le choix est valide
	  while (choix<0 || choix >= KNBDEVISE){
		  affichageListeDevises();
		  scanf("%d",&choix);
	  }

	  unCompte.indiceDevise=choix;

	return unCompte;
}



void saisieTab (int pfNbC, Compte pfTabC[]){
    int i;
    for (i=0;i<pfNbC; i++)
        pfTabC[i] = saisieCompte ();

}


Compte changeEnEuros (Compte pfC){
     Compte unCompte;

  // décommenter le code suivant pour comprendre ce qui se passe  
  /* 
            //affichage de l'adresse de  unCompte
            printf("adresse de pfC %p\n", & pfC);
            //taille de unCompte dans la pile
            printf("taille de pfC %ld\n", sizeof(pfC));
            //affichage de l'adresse de  unCompte
            printf("adresse de unCompte %p\n", & unCompte);
            //taille de unCompte dans la pile 16 octets
            printf("taille de unCompte %ld\n", sizeof(unCompte));
    */

    //traitement
    unCompte.indiceDevise = 0;
    unCompte.soldeCompte = pfC.soldeCompte*tauxChange[pfC.indiceDevise];
    return unCompte;
}




