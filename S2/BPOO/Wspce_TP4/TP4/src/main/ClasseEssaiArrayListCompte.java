package main;

import java.util.ArrayList;
import java.util.Scanner;
import tps.banque.Compte;

public class ClasseEssaiArrayListCompte {

        public static Compte[] tabDeComptesTests = 
        {
                new Compte ("01010101", "Lepoisson-Benoit"),
                new Compte ("02020202", "Tabaniol-Alphonse"),
                new Compte ("03030303", "Aidelaine-Gilles"),
                new Compte ("04040404", "Sanfraper-Andr�"),
                new Compte ("05050505", "Tabaniol-Alphonse"),
                new Compte ("06060606", "Bondeparme-Jean"),
                new Compte ("07070707", "Sailair-Jacques"),
                new Compte ("08080808", "Saidimanche-Damien"),
                new Compte ("09090909", "Tabaniol-Alphonse")
       	};


        /**
         * Recherche les comptes du propri�taire pfNomProprietaire
         * dans la liste de comptes pfALComptes.
         * @param pfNomProprietaire     Propri�taire recherch�
         * @param pfALComptes   Liste dans laquelle les comptes sont recherch�s
         * @return      Liste des compte de pALComptes ayant pour propri�taire pNomProprietaire. Liste vide si aucun compte trouv�.
         */
        /**
         * @param pfNomProprietaire
         * @param pfALComptes
         * @return
         */
        /**
         * @param pfNomProprietaire
         * @param pfALComptes
         * @return
         */
        public static ArrayList<Compte> getComptesDe (String pfNomProprietaire, ArrayList<Compte> pfALComptes) 
        {
                // A FAIRE ICI :
        		ArrayList<Compte> resultat = new ArrayList<Compte>();
        		for (int i = 0; i < pfALComptes.size(); i++)
        		{
        			if( pfALComptes.get(i).getProprietaire().equals(pfNomProprietaire))
        			{
        				resultat.add(pfALComptes.get(i));
        			}
        		}
                return resultat;  // A modifier
        }

        public static void main(String[] args) 
        {
                int i, taille;
                ArrayList<Compte> listeComptes;
                ArrayList<Compte> resultatsProprietaire;
                String nomProp;
                Scanner lect = new Scanner(System.in);

                listeComptes = new ArrayList<Compte>();

                for(i = 0; i < ClasseEssaiArrayListCompte.tabDeComptesTests.length; i++) 
                {
                        listeComptes.add(ClasseEssaiArrayListCompte.tabDeComptesTests[i]);
                }

                System.out.println("Les comptes existants");
                taille = listeComptes.size();
                System.out.println("  " + taille + " comptes");
                for (i=0; i<taille; i++) 
                {
                        System.out.print("  ");
                        listeComptes.get(i).afficher();
                }
                while (true) 
                {
                        System.out.print("Nom de propri�taire -> ");
                        nomProp = lect.next();

                        System.out.println("Ses comptes : ");
                        resultatsProprietaire = ClasseEssaiArrayListCompte.getComptesDe(nomProp, listeComptes);
                        taille = resultatsProprietaire.size();
                        System.out.println("  " + taille + " comptes");
                        for (i=0; i<taille; i++) 
                        {
                                System.out.print("  ");
                                resultatsProprietaire.get(i).afficher();
                                // ou bien System.out.println("  " + resultatsProprietaire.get(i));
                        }
                }
        }
}