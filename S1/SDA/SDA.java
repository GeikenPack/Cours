public class Matrice
{
    static int[][] mat;
    static int nbCols, nbLignes;

    Matrice(int pfNbCols, int pfNbLignes) throws Exception
    {
        if (pfNbCols <=0 || pfNbLignes <= 0)
        {
            throw new Exception("Taille de matrice invalide");
        }
        this.nbCols = pfNbCols;
        this.nbLignes = pfNbLignes;
        this.mat = new int[nbLignes][nbCols];

        for (int i = 0; i < nbLignes; i++)
        {
            for (int j = 0; j < nbCols; j++)
            {
                mat[i][j] = 0; 
            }
        }
    }

    public static int getNbLignes()
    {
        return nbLignes;
    }

    public static int getNbColonnes()
    {
        return nbCols;
    }

    public static int getElement(int i, int j) throws Exception
    {
        if (i < 0 || i > getNbLignes() || j < 0 || j > getNbColonnes())
        {
            throw new Exception("Les indices fournis sont incorrectes");
        }
        return mat[i][j];
    }

    public static int somLigne(int i) throws Exception
    {
        int somme = 0;
        if (i < 0 || i >= getNbLignes())
        {
            throw new Exception("L'indice fournit est incorrecte");
        }
        for (int j = 0; j < getNbColonnes(); j++)
        {
            somme += mat[i][j];
        }
        return somme;
    }

    public static int somColonne(int j) throws Exception
    {
        int somme = 0;
        if (j < 0 || j > getNbColonnes())
        {
            throw new Exception("L'indice fournit est incorrecte");
        }
        for (int i = 0; j < getNbLignes(); i++)
        {
            somme += mat[i][j];
        }
        return somme;
    }

    public static boolean estCarree()
    {
        if (nbCols == nbLignes)
        {
            return true;
        }
        return false;
    }

    public static boolean estDiagonal() throws Exception
    {
        if (!estCarree())
        {
            throw new Exception("Pour être diagonale, la matrice doit être carré");
        }
        for (int i = 0; i < getNbLignes(); i++)
        {
            for (int j = 0; j < getNbColonnes(); j++)
            {
                if (i != j && getElement(i,j) != 0)
                {
                    return false;
                }
            }
        }
        return true;
    }

    public static void setElement(int i, int j, int val) throws Exception
    {
        if (i < 0 || i > getNbLignes() || j < 0 || j > getNbColonnes())
        {
            throw new Exception("Les indices fournis sont incorrectes");
        }
        mat[i][j] = val;
    }

    public static void setPremiereDiagonale(int val) throws Exception
    {
        if (!estCarree())
        {
            throw new Exception("Pour être diagonale, la matrice doit être carré");
        }
        int j;
        j = 0;
        for (int i = 0; i < getNbLignes(); i++)
        {
            mat[i][j] = val;
            j++;
        }
    }

    public static void setDeuxiemeDiagonale(int val) throws Exception
    {
        if (!estCarree())
        {
            throw new Exception("Pour être diagonale, la matrice doit être carré");
        }
        int i;
        i = getNbLignes();
        for (int j = 0; i < getNbColonnes(); j++)
        {
            mat[i][j] = val;
            i--;
        }
    }

    public static Matrice mulMatNombre(int val)
    {
        try
        {
            Matrice newMat = new Matrice(getNbColonnes(), getNbLignes());

            for (int i = 0; i < newMat.getNbLignes(); i++)
            {
                for (int j = 0; j < newMat.getNbColonnes(); j++)
                {
                    newMat.mat[i][j] = mat[i][j] * val;
                }
            }
            return newMat;
        }
        catch (Exception e) {System.out.println("[CRASH : " + e + "]");};
        return null;
    }
}