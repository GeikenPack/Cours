
/**
 * Indiquer le ou les numeros de TP et d'exercice.
 *
 * @author (votre nom)
 */
public class MatriceEcran
{
    /**
     *
     * @return une chaîne de caractères représentant une matrice
     */
    public static String genererStringMatrice(int largeur, int hauteur) {
        //Declaration des variables
        int compteurLigne;
        String matrice;
        //Traitement
        matrice = "";
        compteurLigne = hauteur;
        while (compteurLigne > 0)
        {
            matrice += genererStringLigne(largeur);
            compteurLigne -= 1;
        }
        return matrice;
    }

    /**
     *
     * @return une chaîne de caractères représentant une ligne de la matrice
     */
    public static String genererStringLigne(int largeur) {
        //Declaration des variables
        int compteurColonne;
        String ligne;
        //Traitement
        ligne = "";
        compteurColonne = largeur;
        while (compteurColonne > 0)
        {
            ligne += '*';
            compteurColonne -=1;
        }
        ligne += "\n";
        return ligne;
    }

    /**
     *
     * Affiche une matrice à l'écran
     */
    public static void printMatrice(int largeur, int hauteur) {
        String maMatrice ;

        // Calcul de la chaîne de caractères représentant la matrice
        maMatrice = genererStringMatrice(largeur, hauteur);
        // Affichage de la matrice
        System.out.println(maMatrice);
    }
    //Partie 2 Matrice
    public static String genereStringLigneBordure(int largeur)
    {
        //Declaration des variables
        int compteurColonne;
        String ligne;
        //Traitement
        ligne = "*";
        compteurColonne = largeur - 2;
        while (compteurColonne > 0)
        {
            ligne += "O";
            compteurColonne -= 1;
        }
        ligne += "*\n";
        return ligne;
    }
    public static String genererStringMatriceBordure(int largeur,int hauteur)
    {
        //Declaration des variables
        int compteurLigne;
        String matrice;
        //Traitement
        matrice = genererStringLigne(largeur);
        compteurLigne = hauteur;
        while (compteurLigne > 0)
        {
            matrice += genereStringLigneBordure(largeur);
            compteurLigne -= 1;
        }
        matrice += genererStringLigne(largeur);
        return matrice;
    }
    public static void printMatriceBordure(int largeur, int hauteur)
    {
        String maMatrice;
        
        maMatrice = genererStringMatriceBordure(largeur, hauteur);
        
        System.out.print(maMatrice);
    }
    public static String star()
    {
        return "*";
    }
    public static String right()
    {
        return " ";
    }
    public static String next()
    {
        return "\n";
    }
    /**
     * @param n
     *          nombre d'étoiles a dessiné
     * @return
     *          String d'étoiles
     */
    public static String n_star(int n)
    {
        String etoiles = "";
        int i = 1;
        while (i<=n)
        {
            etoiles += "*";
            i++;
        }
        return etoiles;
    }
    public static String n_right(int n)
    {
        String right = "";
        int i = 0;
        while (i<n)
        {
            right += " ";
            i++;
        }
        return right;
    }
    /**
     * @param
     *      h: hauteur du sapin
     */
    public static void genererSapinPlein(int h)
    {
        int i = 0;
        int espaceActuel, espaceNecessaire;
        int etoileActuel, etoileNecessaire;
        String sapin = "";
        while (i < h)
        {
            etoileNecessaire = 1 + 2*i;
            espaceNecessaire = (1 + 2*h)/2 -1 -i;
            sapin += n_right(espaceNecessaire);
            sapin += n_star(etoileNecessaire);
            sapin += next();
            i++;
        }
        System.out.print(sapin);
    }
    public static void genererSapinVide1(int h)
    {
        int i = 0;
        int espaceActuel, espaceNecessaire;
        int etoileNecessaire;
        String sapin = "";
        while (i<h)
        {
            etoileNecessaire = 1 + 2*i;
            espaceNecessaire = (1 + 2*h)/2 -1 - i;
            if (i == 0)
            {
                sapin += n_right(espaceNecessaire);
                sapin += n_star(1);
                sapin += next();
            }
            else if (i == h-1)
            {
                sapin += n_right(espaceNecessaire);
                sapin += n_star(etoileNecessaire);
                sapin += next();
            }
            else
            {
                sapin += n_right(espaceNecessaire);
                sapin += n_star(1);
                sapin += n_right(etoileNecessaire-2);
                sapin += n_star(1);
                sapin += next();
            }
            i++;
        }
        System.out.print(sapin);
    }
    public static void genererSapinVide2(int h)
    {
        int li = 1;
        String sapin = "";
        while (li <= h)
        {
            int col = 1;
            while (col < h*2)
            {
                if (li+ col == h+1 || col - li == h-1 || li == h)
                {
                    sapin += n_star(1);
                }
                else
                {
                    sapin += n_right(1);
                }
                col ++;
            }
            sapin += next();
            li ++;
        }
        System.out.print(sapin);
    }
    public static void genererSapinCouche(int h)
    {
        int i = 0;
        String sapin = "";
        while (i<h*2)
        {
            if(i<=h)
            {
                sapin += n_star(i); 
                sapin += next();
            }
            else
            {
                sapin += n_star(h*2-i); 
                sapin += next();
            }
            i++;
        }
        System.out.print(sapin);
    }
}

