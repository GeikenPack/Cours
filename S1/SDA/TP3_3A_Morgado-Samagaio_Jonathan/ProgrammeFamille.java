/**
 * Décrivez votre classe LibrairieTri ici.
 *
 * @author (votre nom)
 * @version (un numéro de version ou une date)
 */
import java.io.*;
public class ProgrammeFamille {

    public static void principale() {

        /*------------------------------------------------------*/
        /* Plan pour la fonction principale :                   */
        /*                                                      */
        /*  0.  Déclarations des tableaux de noms et prénoms    */
        /*  1.  Affichage des tableaux                          */
        /*  2.  Création de la famille SW                       */
        /*  3.  Création et ajouts des Personne dans la Famille */
        /*  4.  Affichage de la Famille                         */
        /*  5.  Tri de la Famille                               */
        /*  6.  Affichage de la Famille                         */
        /*  7.0 Ajustement des champs de luke, padme et anakin  */
        /*  7.1 Ajout des naissances et unions                  */
        /*  8.  Affichage des champs d'une personne             */
        /*  9.  Affichage du graphe au format texte             */
        /* 10.  Sauvegarde dans un fichier                      */
        /*                                                      */
        /*------------------------------------------------------*/

        String tabNom[] = {
                "AMIDALA",
                "SKYWALKER",
                "CORDE",
                "ORGANA",
                "SKYWALKER",
                "SKYWALKER",
                "SKYWALKER",
                "SKYWALKER",
                "SKYWALKER",
                "SOLO",
                "SOLO",
                "JADE",
                "SOLO",
                "SOLO",
                "SKYWALKER"
            };

        String tabPrenom[] = {
                "Padme",
                "Cade",
                "Morrigan",
                "Leia",
                "Anakin",
                "Ben",
                "Kol",
                "Luke",
                "Nat",
                "Anakin",
                "Han",
                "Mara",
                "Jacen",
                "Jaina",
                "Shmi"
            };
        //Création des Personnes
        Personne luke = new Personne("Luke","SKYWALKER", "");
        Personne padme = new Personne("Padmé","AMIDALA", "");
        Personne anakin = new Personne("Anakin","SKYWALKER", "");
        Personne morrigan = new Personne("Morrigan","CORDE", "");
        Personne mara = new Personne("Mara","JADE", "");
        Personne leia = new Personne("Leia","ORGANA", "");
        Personne ben = new Personne("Ben","SKYWALKER", "");
        Personne cade = new Personne("Cade","SKYWALKER", "");
        Personne kol = new Personne("Kol","SKYWALKER", "");
        Personne nat = new Personne("Nat","SKYWALKER", "");
        Personne shmi = new Personne("Shmi","SKYWALKER", "");
        Personne anakins = new Personne("Anakin","SOLO", "");
        Personne han = new Personne("Han","SOLO", "");
        Personne jacen = new Personne("Jacen","SOLO", "");
        Personne jaina = new Personne("Jaina","SOLO", "");

        //Création de la famille et ajout des personnes
        Famille skywalker = new Famille();
        try
        {
            ajoutPersonne(skywalker, padme);
            ajoutPersonne(skywalker, cade);
            ajoutPersonne(skywalker, morrigan);
            ajoutPersonne(skywalker, leia);
            ajoutPersonne(skywalker, anakin);
            ajoutPersonne(skywalker, ben);
            ajoutPersonne(skywalker, kol);
            ajoutPersonne(skywalker, luke);
            ajoutPersonne(skywalker, nat);
            ajoutPersonne(skywalker, anakins);
            ajoutPersonne(skywalker, han);
            ajoutPersonne(skywalker, mara);
            ajoutPersonne(skywalker, jacen);
            ajoutPersonne(skywalker, jaina);
            ajoutPersonne(skywalker, shmi);
        }
        catch (Exception e) {System.out.println("[CRASH : " + e + "]");};
        //Ajout des liens entre les différentes personnes
        mariage(padme, anakin);
        mariage(morrigan, kol);
        mariage(leia,han);
        mariage(luke,mara);
        naissance(anakin,shmi,null);
        naissance(luke,padme,anakin);
        naissance(leia,padme,anakin);
        naissance(ben,mara,luke);
        naissance(jacen,leia,han);
        naissance(jaina,leia,han);
        naissance(anakins,leia,han);
        naissance(nat,null,ben);
        naissance(kol,null,ben);
        naissance(cade,morrigan,kol);
        //Affichage des membres de la famille
        afficherFamille(skywalker);

        String chaine = famille2dot(skywalker, "Famille Skywalker");
        System.out.println(chaine);
        saveTo(chaine, "sw.dot");
    }

    /** Ajoute pfPersonne à la famille pfFamille
     *
     * @param pfFamille IN/OUT : la famille
     * @param pfPersonne IN : le membre à ajouter
     *
     * @throws Exception si plus de place dans la famille
     */
    public static void ajoutPersonne(Famille pfFamille, Personne pfPersonne) throws Exception {
        if(pfFamille.membres.length < pfFamille.nbMembres + 1) {
            throw new Exception("Plus de place dans la famille !") ;
        }
        pfFamille.membres[pfFamille.nbMembres] = pfPersonne ;
        pfFamille.nbMembres ++ ;
    }

    /** Affiche la famille pfFamille.
     *
     * @param pfFamille IN : la famille
     */
    public static void afficherFamille(Famille pfFamille)
    {
        System.out.println("Les 15 membres de la famille Skywalker sont :");
        for (int i = 0;i < pfFamille.nbMembres; i++)
        {
            System.out.println(toString(pfFamille.membres[i]));
        }
    }

    /**
     * Trie par ordre alphabétique croissant une famille suivant leur nom et leur prénom
     * @param pfFamille IN/OUT : famille a trié
     */
    public static void trierFamille(Famille pfFamille)
    {
        for (int i = 0; i < pfFamille.nbMembres; i++)
        {
            for (int j = i + 1; j < pfFamille.nbMembres; j++)
            {
                if (pfFamille.membres[i].nom.compareTo(pfFamille.membres[j].nom) > 0 || pfFamille.membres[i].nom.compareTo(pfFamille.membres[j].nom) == 0 && pfFamille.membres[i].prenom.compareTo(pfFamille.membres[j].prenom) > 0)
                {
                    Personne temp = pfFamille.membres[i];
                    pfFamille.membres[i] = pfFamille.membres[j];
                    pfFamille.membres[j] = temp;
                }        
            }
        }
    }

    /** Marie des personnes.
     *
     * @param pfPersonne1 IN/OUT : première personne mariée
     * @param pfPersonne2 IN/OUT : seconde personne mariée
     */
    public static void mariage(Personne pfPersonne1, Personne pfPersonne2)
    {
        pfPersonne1.conjoint = pfPersonne2;
        pfPersonne2.conjoint = pfPersonne1;
    }

    /** Indique que pfMere et pfPere ont eu un enfant pfEnfant.
     *
     * @param pfEnfant IN/OUT : enfant de pfMere et pfPere
     * @param pfMere IN : mère de pfEnfant
     * @param pfPere IN : père de pfEnfant
     */
    public static void naissance(Personne pfEnfant, Personne pfMere, Personne pfPere)
    {
        pfEnfant.pere = pfPere;
        pfEnfant.mere = pfMere;
    }

    /**
     * Retourne un chaine de caractère formaté décrivant tous les champs  d'une personne
     * @param pfPersonne IN
     * 
     * @return chaine formaté
     */
    public static String toString(Personne pfPersonne)
    {
        String chaine = "========================\n";
        chaine += "Prenom : " + pfPersonne.prenom + "\n";
        chaine += "Nom : " + pfPersonne.nom + "\n";
        chaine += "Mere : " + pfPersonne.mere + "\n";
        chaine += "Pere : " + pfPersonne.pere + "\n";
        chaine += "Conjoint : " + pfPersonne.conjoint + "\n";
        return chaine;
    }

    public static boolean contient(Famille pfTab, Personne pfCherche)
    {
        for (int i = 0; i < pfTab.nbMembres; i++)
        {
            if (pfCherche == pfTab.membres[i])
            {
                return true;
            }
        }
        return false;
    }

    /**
     * Retourne une chaine de caractere formaté décrivant les liens de parenté d'une personne
     * @param pfPersonne IN : personne
     * 
     * @return chaine formaté
     */
    public static String personne2dot(Personne pfPersonne, Famille conjoinTraite)
    {
        String chaine = "";
        if (pfPersonne.mere != null)
        {
            chaine += "\"" + pfPersonne.prenom + " " + pfPersonne.nom + "\" -> \"" + pfPersonne.mere.prenom + " " + pfPersonne.mere.nom +"\"\n"; 
        }
        if (pfPersonne.pere != null)
        {
            chaine += "\"" + pfPersonne.prenom + " " + pfPersonne.nom + "\" -> \"" + pfPersonne.pere.prenom + " " + pfPersonne.pere.nom +"\"\n";
        }
        if (pfPersonne.conjoint != null)
        {
            if (!contient(conjoinTraite,pfPersonne))
            {
                chaine += "\"" + pfPersonne.prenom + " " + pfPersonne.nom + "\" -> \"" + pfPersonne.conjoint.prenom + " " + pfPersonne.conjoint.nom + "\" [dir=both color=\"red\"]\n";
                conjoinTraite.membres[conjoinTraite.nbMembres] = pfPersonne.conjoint;
                conjoinTraite.nbMembres++;
            }
        }
        return chaine;
    }

    /**
     * Retourne une chaine formaté préparant l'affichage graphique des liens
     * @param pfFamille IN : famille a formaté
     * @param pfLabel In : label de la famille
     * 
     * @return chaine de caractere formaté
     */
    public static String famille2dot(Famille pfFamille, String pfLabel)
    {
        Famille conjoinTraite = new Famille();
        String chaine = "digraph G {\nsubgraph cluster {\nlabel = \"";
        chaine += pfLabel + "\";\n";
        for (int i = 0; i < pfFamille.nbMembres; i++)
        {
            chaine += personne2dot(pfFamille.membres[i], conjoinTraite);
        }
        chaine += "}}";
        return chaine;
    }

    /**
     * Sauvegarde la chaine dans un fichier de nom pfNomFichier
     * @param pfChaine IN : chaine a enregistrer
     * @param pfNomFichier IN : nom du fichier dans lequel enregistrer la chaine
     */
    public static void saveTo(String pfChaine, String pfNomFichier)
    {
        try
        {
            PrintStream out = new PrintStream(pfNomFichier);
            out.print(pfChaine);
            out.close();
        }
        catch (Exception e) {System.out.println("[CRASH : " + e + "]");};
    }
}