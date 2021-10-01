//compte.h
#ifndef CPT_H
#define CPT_H

#define kLGCHAINE (25+1)
#define KNBDEVISE (4)



typedef struct {
    double soldeCompte;
    int indiceDevise;
} Compte;


/* Affiche la liste des devises */
void affichageListeDevises();


    /**
     * permet de saisir les champs d"un éléments de type TCompte
     *
     * @return  le compte
     */


Compte saisieCompte ();

    /**
     * permet de saisir les pNbC éléments d'un tableau pTabC (à une entrée) de TCompte
     *
     * @param  pfNbC IN   le nombre de comptes
     * @param  pfTabC OUT   le tableau des comptes
     */

 
void saisieTab (int pfNbC, Compte pfTabC[]);

    /**
     *  permet de retourner un compte de devise « Euro » correspondant à la conversion du solde du compte pc en euro                                       
     *
     * @param  pfc IN  le compte initial
     * @return le nouveau compte
     */
Compte changeEnEuros (Compte pfc) ;

/* Pour aller plus loin
 si vous avez bien compris comment éviter des recopies de compte proposer une seconde version des sous programmes*/

#endif