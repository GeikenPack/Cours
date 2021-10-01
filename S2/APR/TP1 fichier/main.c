#include <stdio.h>
#include <stdlib.h>
#include "compte.h"



int main(){



  Compte tabc []=
    {{500.25, 1}, {129.3, 2},    {130.67, 3 }, {12.8, 1},    {200.3, 2},    {700.67, 3 }};
  int i;
  
  
   //TODO afficher le tableau


  // pour comprendre
        //affichage de l'adresse  pfTabC pas m�me adresse
        printf("Main : adresse de tabc %p\n", tabc);
        //taille de pfTabC dans la pile 96 ici
        printf("Main : taille de tabc %ld\n", sizeof(tabc));


  for(i=0;i<6;i++){
     //TODO transformer tous les comptes en euros

    // pour comprendre
                //affichage de l'adresse  pfTabC
              printf("Main : adresse du compte %p\n", &tabc[i]);
              //taille de pfTabC dans la pile
              printf("Main : taille du compte %ld\n", sizeof(tabc[i]));
  }
   
   
     //TODO afficher le tableau


  // system("pause");
   return 0;
}