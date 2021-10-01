
/**
 * Décrivez votre classe ProgrammeMatriceEntier ici.
 *
 * @author (votre nom)
 * @version (un numéro de version ou une date)
 */
public class ProgrammeMatriceEntier
{
    /**
     * Creer une MatriceEntier avec pfNbL lignes et pfNbC colonnes
     * 
     * @param pfNbL IN: nombre de lignes
     * @param pfNbC IN : nombre de colonnes
     * 
     * @return MatriceEntier
     */
    public static MatriceEntier creerMatrice(int pfNbL,int pfNbC)throws Exception
    {
        if (pfNbL <=0 || pfNbC <=0)
        {
            throw new Exception("Le nombre de lignes et de colonnes dot etre positif");
        }
        return new MatriceEntier(pfNbL,pfNbC);
    }

    /**
     * Retourne le nombre de lignes d'une matrice pfMat
     * 
     * @param pfMat IN : MatriceEntier
     * @return entier: nombre de colonnes
     */
    public static int getNbLignes(MatriceEntier pfMat)
    {
        return pfMat.nbL;
    }

    /**
     * Retourne le nombre de colonnes d'une matrice pfMat
     * 
     * @param pfMat IN : MatriceEntier
     * @return entier : nombre de colonnes
     */
    public static int getNbColonnes(MatriceEntier pfMat)
    {
        return pfMat.nbC;
    }

    /**
     * Retourne l'element de pfMat a la ligne pfL et la colonne pfC
     * 
     * @param pfMat IN : MatriceEntier a chercher
     * @param pfL IN : Ligne de l'element rechercher
     * @param pfC IN: Colonne de l'élément rechercher
     * @return int : Element rechercher
     * @throws Exception si 0 > pfL OU pfL > getNbLigne(pfMat) ou 0 > pfC ou pfC  getNbColonnes(pfMat)
     */
    public static int getElement(MatriceEntier pfMat, int pfL, int pfC) throws Exception
    {
        if (pfL < 0 || pfL > getNbLignes(pfMat) || pfC < 0 || pfC > getNbColonnes(pfMat))
        {
            throw new Exception("Les parametres dournis sont incorectes");
        }
        return pfMat.tabMat[pfL-1][pfC-1];
    }

    /**
     * Retourne la somme des element de la ligne pfL d'une matrice
     * 
     * @param pfMat IN: MatriceEntier a parcourir
     * @param pfL IN : Ligne de la matrice a additionné
     * @return entier : Somme des éléments de la ligne pfL de la matrice
     * @trhows Exception si pfL < 0 ou pfL > getNbLignes(pfMat)
     */
    public static int somLigne(MatriceEntier pfMat, int pfL)throws Exception
    {
        if (pfL < 0 || pfL > getNbLignes(pfMat))
        {
            throw new Exception("Ligne fournis incorrecte");
        }
        int somme = 0;
        for (int i = 0; i < pfMat.nbC; i++)
        {
            somme += pfMat.tabMat[pfL-1][i];
        }
        return somme;
    }

    /**
     * Retourne la somme d'une colonne pfC d'une matrice
     * 
     * @param pfMat IN: MatriceEntier a parcourir
     * @param pfC IN : Colonne a additionné
     * @return entier: somme des elements de la colonne pfC
     * @throws Exception si pfC < 0 ou pfC > getNbColonnes(pfMat)
     */
    public static int somColonne(MatriceEntier pfMat, int pfC)throws Exception
    {
        if (pfC < 0 || pfC > getNbColonnes(pfMat))
        {
            throw new Exception("Colonne fournis incorrecte");
        }
        int somme = 0;
        for (int i = 0; i < pfMat.nbL; i++)
        {
            somme += pfMat.tabMat[i][pfC-1];
        }
        return somme;
    }

    /**
     * Retourne vrai si la matrice est carrée
     * 
     * @param pfMat IN: MatriceEntier a verifier
     * @return boolean : Etat de la matrice
     */
    public static boolean estCarree(MatriceEntier pfMat)
    {
        return (pfMat.nbL == pfMat.nbC);
    }

    /** recherche si la matrice est diagonale
     * @param pfMat IN la matrice
     * @return vrai si la matrice est diagonale et faux sinon
     * @throws Exception si la matrice n'est pas carrée
     **/
    public static boolean estDiagonale(MatriceEntier pfMat)throws Exception
    {
        if (!estCarree(pfMat))
        {
            throw new Exception("La matrice fournis n'est pas carrée");
        }
        for (int i = 0; i < pfMat.nbL; i++)
        {
            for (int j = 0; j < pfMat.nbC; j++)
            {
                if (i != j && pfMat.tabMat[i][j] != 0)
                {
                    return false;
                }
            }
        }
        return true;
    }

    /**
     * met l'élément pfEl dans l'emplacement pfL,pfC de la matrice pfMAt
     * 
     * @param pfMat: IN/OUT : Matrice a modifier
     * @param pfL IN: Ligne ou placer l'élément
     * @param pfC IN: colonnes ou placer l'élément
     * @param pfEl IN: element a placer
     * throws exception si 0 > pfL OU pfL > getNbLigne(pfMat) ou 0 > pfC ou pfC  getNbColonnes(pfMat)
     */
    public static void setElement(MatriceEntier pfMat, int pfL, int pfC, int pfEl)throws Exception
    {
        if (pfL < 0 || pfL > getNbLignes(pfMat) || pfC < 0 || pfC > getNbColonnes(pfMat))
        {
            throw new Exception("Les parametres dournis sont incorectes");
        }
        pfMat.tabMat[pfL-1][pfC-1] = pfEl;
    }

    /** affecte tous les éléments de la diagonale avec la valeur donnée
     * @param pfMat IN/OUT la matrice
     * @param pfVal IN la valeur
     * @throws Exception si la matrice n'est pas carrée
     **/
    public static void setPremiereDiagonale(MatriceEntier pfMat, int pfVal) throws Exception { 
        if (! estCarree(pfMat) ) { 
            throw new Exception("Erreur: matrice non carree"); 
        }
        for (int i=0;i < getNbLignes(pfMat); i++) 
        { 
            pfMat.tabMat[i][i] = pfVal;
        }
    }

    /** affecte tous les éléments de la seconde diagonale avec la valeur donnée
     * @param pfMat IN/OUT la matrice
     * @param pfVal IN la valeur
     * @throws Exception si la matrice n'est pas carrée
     **/
    public static void setSecondeDiagonale(MatriceEntier pfMat, int pfVal) throws Exception { 
        if (! estCarree(pfMat) ) { 
            throw new Exception("Erreur: matrice non carrée"); 
        }
        for (int i=0;i < getNbLignes(pfMat); i++) 
        { 
            pfMat.tabMat[i][getNbLignes(pfMat)-1-i] = pfVal;
        }
    }

    /**
     * multiplie chaque valeur de la matrice par un nombre
     * @param pfMat IN/OUT la matrice
     * @param Val IN la valeur
     **/
    public static void mulMatNombre(MatriceEntier pfMat, int Val){
        for (int i = 0; i < getNbLignes(pfMat); i++) {
            for (int j = 0; j < getNbColonnes(pfMat); j++) {
                pfMat.tabMat[i][j] = pfMat.tabMat[i][j] * Val;
            }
        }
    }
    
    /**
     * Retourne une chaine formaté d'une matrice pfMat
     * 
     * @param pfMat IN: MatriceEntier a formater
     * @return String: chaine formaté
     */
    public static String toString(MatriceEntier pfMat)
    {
        String ln = System.getProperty("line.separator");
        String chaine = "";
        for (int i = 0; i < pfMat.nbL; i++)
        {
            for (int j = 0; j < pfMat.nbC; j++)
            {
                chaine += pfMat.tabMat[i][j] + " ";
            }
            chaine += ln;
        }
        return chaine;
    }
    
    /**
     * Retourne une chaine formaté d'une matrice pfMat au format HTML
     * 
     * @param pfMAt IN: MatriceEntier a formater
     * @return String: chaine formaté au format HTML
     */
    public static String toHTML(MatriceEntier pfMat)
    {
        String ln = System.getProperty("line.separator");
        String chaine = "<table border=\"1\">" + ln;
        for (int i = 0; i < pfMat.nbL; i++)
        {
            chaine += "<tr>";
            for (int j = 0; j < pfMat.nbC; j++)
            {
                chaine += "<td>" + pfMat.tabMat[i][j] + "</td>";
            }
            chaine += "</tr>" + ln;
        }
        chaine += "</table>" + ln;
        return chaine;
    }
}
