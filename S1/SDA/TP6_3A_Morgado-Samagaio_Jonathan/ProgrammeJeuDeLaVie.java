
/**
 * Décrivez votre classe ProgrammeJeuDeLaVie ici.
 *
 * @author (votre nom)
 * @version (un numéro de version ou une date)
 */
public class ProgrammeJeuDeLaVie
{
    /**
     * Créer un jeu de la vie avec pfNbL lignes et pfNbC colonnes
     * 
     * @param pfNbL IN: nombre de lignes
     * @param pfNbC IN: nombre de colonnes
     * @return JeuDeLaVie: Jeu de la vie creer
     * @throws Exception si pfNbL <= 0 ou pfNbC <= 0
     */
    public static JeuDeLaVie JeuDeLaVie(int pfNbL, int pfNbC) throws Exception
    {
        if (pfNbL <= 0 || pfNbC <= 0)
        {
            throw new Exception("Paramètres fournis incorrectes");
        }
        JeuDeLaVie jeu = new JeuDeLaVie(pfNbL, pfNbC);
        for (int i = 0; i < jeu.nbL; i++)
        {
            for (int j = 0; j < jeu.nbC; j++)
            {
                jeu.grille.tabMat[i][j] = 0;
                jeu.grilleSuivante.tabMat[i][j] = 0;
            }
        }
        return jeu;
    }

    /**
     * Retourne l'etat de la case pfL,pfC
     * 
     * @param jeu IN : Jeu de la vie a utiliser
     * @param pfL : Ligne avec la case a verifier
     * @param pfC IN: Colonne avec la case a vérifier
     * @return boolean : Etat de la case
     * @throws Exception si ((jeu.nbL + 2) > i >= 0 ) ET ( (jeu.nbC + 2) > j >= 0 )
     */
    public static boolean estVivant(JeuDeLaVie jeu, int pfL, int pfC) throws Exception
    {
        if (pfL >= jeu.nbL+2 || pfL < 0 || pfC >= jeu.nbC + 2 || pfC < 0)
        {
            throw new Exception("Paramètres incorrectes : estVivant");
        }
        return (jeu.grille.tabMat[pfL][pfC] == 1);
    }

    /**
     * Retourne le nombre de voisin vivant d'une case
     * 
     * @param jeu IN : Jeu de la vie a parcourir
     * @param pfL IN : Ligne de l'élément a vérifier
     * @param pfC IN : Colonne de l'élément a vérifier
     * @return entier: Nombre de voisin vivants
     * @throws Exception si (jeu.nbL >= i > 0 ) ET ( jeu.nbC >= j > 0 )
     */
    public static int getNbVoisinVivants(JeuDeLaVie jeu, int pfL, int pfC) throws Exception
    {
        if (pfL > jeu.nbL || pfL <= 0 || pfC > jeu.nbC || pfC <= 0)
        {
            throw new Exception("Paramètres incorrectes : getNbVoisinVivant");
        }
        int somme = 0;
        for (int i = pfL-1; i <= pfL + 1; i++)
        {
            for (int j = pfC-1; j <= pfC + 1; j++)
            {
                if (estVivant(jeu,i,j))
                {
                    somme++;
                }
            }
        }
        return somme;
    }

    /**
     * Retourne l'etat d'une case pour la prochaine génération
     * 
     * @param jeu IN : jeu de la vie a parcourir
     * @param pfL IN : Ligne de l'élément à vérifier
     * @param pfC IN : Ligne de l'élément à vérifier
     * @return boolean: Etat de la case pour la prochaine génération
     * @throws Exception si ( jeu.nbL >= i > 0 ) ET ( jeu.nbC >= j > 0 )
     */
    public static boolean seraVivante(JeuDeLaVie jeu, int pfL, int pfC)throws Exception
    {
        if (pfL > jeu.nbL || pfL <= 0 || pfC > jeu.nbC || pfC <= 0)
        {
            throw new Exception("Paramètres incorrectes : seraVivante");
        }
        int nbVoiViv = getNbVoisinVivants(jeu,pfL,pfC);
        if (estVivant(jeu, pfL, pfC))
        {
            //System.out.println(getNbVoisinVivants(jeu,pfL,pfC));
            return (nbVoiViv-1 == 2 || nbVoiViv-1 == 3);
        }
        else
        {
            return (nbVoiViv == 3);
        }
    }

    /**
     * Creer la génération suivante
     * 
     * @param jeu IN/OUT : Jeu de la vie a modifier
     */
    public static void generationSuivante(JeuDeLaVie jeu)
    {
        for (int i = 1; i < jeu.nbL+1; i++)
        {
            for (int j = 1; j < jeu.nbC+1; j++)
            {
                try
                {
                    if (seraVivante(jeu,i,j))
                    {
                        jeu.grilleSuivante.tabMat[i][j] = 1;
                    }
                    else
                    {
                        jeu.grilleSuivante.tabMat[i][j] = 0;
                    }
                }
                catch (Exception e) {System.out.println("[CRASH : " + e + "]");};
            }
        }
        jeu.grille.tabMat = jeu.grilleSuivante.tabMat.clone();
        jeu.generation++;
        jeu.histoire[jeu.generation] = ProgrammeMatriceEntier.toString(jeu.grille);
    }

    public static boolean grilleConnue(JeuDeLaVie jeu)
    {
        for (int i = 0; i < jeu.generation; i++)
        {
            if (jeu.histoire[jeu.generation] == jeu.histoire[i])
            {
                return true;
            }
        }
        return false;
    }

    public static void main(String args[])
    {
        try
        {
            JeuDeLaVie jeu = JeuDeLaVie(5,5);
            ProgrammeMatriceEntier.setElement(jeu.grille,3,3,1);
            ProgrammeMatriceEntier.setElement(jeu.grille,3,4,1);
            ProgrammeMatriceEntier.setElement(jeu.grille,3,5,1);
            ProgrammeMatriceEntier.setElement(jeu.grille,4,2,1);
            ProgrammeMatriceEntier.setElement(jeu.grille,4,3,1);
            ProgrammeMatriceEntier.setElement(jeu.grille,4,4,1);
            while (!grilleConnue(jeu))
            {
                System.out.println("Generation " + jeu.generation + "\n" + ProgrammeMatriceEntier.toString(jeu.grille));
                generationSuivante(jeu);
            }
        }
        catch (Exception e) {System.out.println("[CRASH : " + e + "]");};
    }
}
