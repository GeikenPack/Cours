
/**
 * Décrivez votre classe FileCirculaireOperations ici.
 *
 * @author (votre nom)
 * @version (un numéro de version ou une date)
 */
public class FileCirculaireOperations
{
    /**
     * Créer une file circulaire de taille pfNbElt
     * 
     * @param pfNbElt IN : nombre d'éléments max de la file
     * @return FileCirculaire : File créer
     */
    public static FileCirculaire creerFile(int pfNbElt)
    {
        return new FileCirculaire(pfNbElt);
    }

    /**
     * Retourne true si la file est pleine et false si elle ne l'est pas
     * @param pfFile IN : File à verifier
     * @return boolean : Etat de la file
     */
    public static boolean estPleine(FileCirculaire pfFile)
    {
        return (pfFile.indice_enf%pfFile.tabElements.length == pfFile.indice_def%pfFile.tabElements.length && !pfFile.estVide);
    }

    /**
     * Retourne true si la file est vide et false si elle ne l'est pas
     * 
     * @param pfFile IN : File a verifier
     * @return boolean : Etat de la file
     */
    public static boolean estVide(FileCirculaire pfFile)
    {
        return pfFile.estVide;
    }

    /**
     * Enfile un élément pfElt dans une FileCirculaire pfFile
     * 
     * @param pfElt IN : Element a enfiler
     * @param pfFile IN/OUT : File a modifier
     * @throw Exception si pfFile est pleine
     */
    public static void enfiler(FileCirculaire pfFile, String pfElt)throws Exception
    {
        if (estPleine(pfFile))
        {
            throw new Exception("La file est pleine");
        }
        pfFile.tabElements[pfFile.indice_enf%pfFile.tabElements.length] = pfElt;
        pfFile.indice_enf++;
        pfFile.estVide = false;
    }
    
    /**
     * Defile un élément de la FileCirculaire pfFile
     * 
     * @param pfFile : IN/OUT : File a modifier
     * @throw Exception si pfFile est vide
     */
    public static void defiler(FileCirculaire pfFile) throws Exception
    {
        if (estVide(pfFile))
        {
            throw new Exception("La file est vide");
        }
        pfFile.indice_def++;
        if (pfFile.indice_def%pfFile.tabElements.length == pfFile.indice_enf%pfFile.tabElements.length)
        {
            pfFile.estVide = true;
        }
    }
    public static void afficherFile(FileCirculaire pfFile)
    {
        for (int i = 0; i < pfFile.tabElements.length; i++)
        {
            System.out.println(pfFile.tabElements[i]);
        }
    }
    public static void main()
    {
        FileCirculaire f = creerFile(3);
        try
        {
            enfiler(f,"A");
            defiler(f);
            defiler(f);
        }
        catch (Exception e) {System.out.println("[CRASH : "+ e + "]");};
    }
}
