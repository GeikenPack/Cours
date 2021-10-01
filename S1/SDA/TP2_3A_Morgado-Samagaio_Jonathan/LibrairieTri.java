
/**
 * Décrivez votre classe LibrairieTri ici.
 *
 * @author (votre nom)
 * @version (un numéro de version ou une date)
 */
import java.util.Scanner;
import java.io.*;
import java.util.*;
import java.text.*;
public class LibrairieTri
{
    /**
     * Lit au clavier un réel et le retourne
     * 
     * @return réel saisie par l'utilisateur
     */
    public static double saisieReel()
    {
        Scanner clavier = new Scanner(System.in);
        System.out.println("Saisissez une valeur :");
        double resultat = clavier.nextDouble();
        return resultat;
    }

    public static TNP creerTNPTest() 
    {
        TNP tab = new TNP(7) ;
        tab.lesElements[0] = 1.0 ;
        tab.lesElements[1] = 0.5 ;
        tab.lesElements[2] = 3.0 ;
        tab.lesElements[3] = 8.0 ;
        tab.lesElements[4] = 5.0 ;
        tab.lesElements[5] = 7.3 ;
        tab.lesElements[6] = 5.2 ;
        tab.nbElt = 5 ;
        return tab;
    }

    /**
     *  Lit au clavier pfNbElements réels et les place dans le TNP pfTabR
     *
     * @param pfNbElements IN : le nombre de valeurs à faire saisir à l'utilisateur
     * @param pfTabR OUT : le tableau des valeurs réelles
     *
     * Préconditions pfNbElements > 0
     */
    public static void saisieTableau(int pfNbElements, TNP pfTabR) throws Excption
    {
        if (pfNbElements <= 0)
        {
            throw new Exception("Nombre d'élément a saisir incorrecte");
        }
        for (int i = 0; i < pfNbElements; i++)
        {
            pfTabR.lesElements[i] = saisieReel();
        }
        pfTabR.nbElt += pfNbElements;
    }

    /**
     *  Affiche à l'écran les valeurs significatives du TNP pfTabR
     *
     * @param pfTabR IN : le tableau non plein
     *
     */
    public static void afficherTableau(TNP pfTabR)
    {
        for (int i = 0; i < pfTabR.nbElt; i++)
        {
            System.out.println("Valeur " + (i+1) + " = " + pfTabR.lesElements[i]);
        }
    }

    /**
     *  permet de déterminer le rang de la valeur maximum des éléments du tableau
     * non plein de réels pfTabR compris entre les indices pfDeb et pfFin
     *
     * @param pfTabR IN : le tableau non plein des valeurs réelles
     * @param pfDeb IN : indice de début de sous-tableau
     * @param pfFin IN : indice de fin de sous-tableau
     *
     * @return l’indice du maximum dans le sous-tableau délimité par pfDeb et pfFin (compris)
     *
     * Préconditions : 0 <= pfDeb <= pfFin < pfTabR.nbElt
     */
    public static int maxST(int pfDeb, int pfFin, TNP pfTabR) throws Exception
    {
        int rangMax = pfDeb;
        if (pfDeb <0 || pfFin < pfDeb || pfTabR.nbElt < pfFin)
        {
            throw new Exception("Préconditions non remplis"); 
        }
        else
        {
            for (int i = pfDeb+1; i <= pfFin; i++)
            {
                if (pfTabR.lesElements[rangMax] < pfTabR.lesElements[i])
                {
                    rangMax = i;
                }
            }
        }
        return rangMax;
    }

    /**
     * Tri un tableau de réel par le maximum
     * 
     *@param pfTabR IN/OUT tableau non plein de réel
     */
    public static void triMax(TNP pfTabR)
    {
        for (int i = pfTabR.nbElt-1; i >= 0; i--)
        {
            double temp = pfTabR.lesElements[i];
            try
            {
                pfTabR.lesElements[i] = pfTabR.lesElements[maxST(0,i,pfTabR)];
                pfTabR.lesElements[maxST(0,i,pfTabR)] = temp;
            }
            catch (Exception e) {System.out.println("[CRASH : " + e + "]");};
        }
    }

    /**
     * Enregistre les pfNbElements réels du tableau non plein pfTabR dans le fichier
     * de nom pfNomFichier
     *
     * @param pfTabR IN : un tableau non plein de valeurs réelles
     * @param pfNomFichier IN : le nom du fichier cible
     *
     */
    public static void sauverTableau(TNP pfTabR, String pfNomFichier)
    {
        try {
            PrintStream out = new PrintStream(pfNomFichier + ".txt");
            NumberFormat fr = NumberFormat.getInstance(Locale.FRENCH);
            for (int i = 0; i < pfTabR.nbElt; i++)
            {
                out.println(fr.format(pfTabR.lesElements[i]));
            }
            out.close();
        }
        catch (Exception e) {System.out.println("[CRASH " + e + "]");}
    }

    /**
     * Lit pfNbElements réels dans le fichier de nom pfNomFichier et les place
     * dans le tableau non plein pfTabR
     *
     * @param pfTabR OUT : un tableau non plein de valeurs réelles
     * @param pfNbElements IN : le nombre de valeurs
     * @param pfNomFichier IN : le nom du fichier cible
     *
     * Préconditions : Fichier déjà existant
     */
    public static void chargerTableau(TNP pfTabR, int pfNbElements, String pfNomFichier)
    {
        try
        {
            Scanner lecteur = new Scanner(new File(pfNomFichier + ".txt"));
            for (int i = 0; i < pfNbElements; i++)
            {
                double valeur = lecteur.nextDouble();
                pfTabR.lesElements[i] = valeur;
            }
            pfTabR.nbElt = pfNbElements;
        }
        catch (Exception e) {System.out.println("[CRASH " + e + "]");};
    }

    /**
     * Met les valeurs pair et impaire d'un tableau pfTab dans les tableau respectif pair et impair
     * 
     * @param IN pfTab : tableau de réel 
     * @param OUT pair : tableau des nombres pair
     * @param OUT impair : tableau des nombres impair
     */
    public static void chercherPairImpair(TNP pfTab, TNP pair, TNP impair)
    {
        int iPair, iImpair;
        iPair = iImpair = 0;
        for (int i = 0; i < pfTab.nbElt; i++)
        {
            if (pfTab.lesElements[i] % 2 == 0)
            {
                pair.lesElements[iPair] = pfTab.lesElements[i];
                iPair++;
            }
            else
            {
                impair.lesElements[iImpair] = pfTab.lesElements[i];
                iImpair++;
            }
        }
        pair.nbElt = iPair;
        impair.nbElt = iImpair+1;
    }

    public static void triPairImpair(TNP pfTab)
    {
        TNP pair = new TNP(100);
        TNP impair = new TNP(100);
        chercherPairImpair(pfTab, pair, impair);
        triMax(pair);
        triMax(impair);
        for (int i = 0; i < pair.nbElt; i++)
        {
            pfTab.lesElements[i] = pair.lesElements[i];
        }
        for (int i = 0, j = pfTab.nbElt; i < impair.nbElt; i++, j--)
        {
            pfTab.lesElements[j] = impair.lesElements[i];
        }
    }
    public static void principale()
    {
        TNP tab = creerTNPTest();
        try
        {
            saisieTableau(100,tab);
        }
        catch (Exception e){System.out.println("[CRASH : " + e + "]");};
        //triMax(tab);
        //afficherTableau(tab);
        //sauverTableau(tab,"test");
        TNP tab = new TNP(100);
        chargerTableau(tab,5,"test");
        triPairImpair(tab);
        afficherTableau(tab);
    }
}
