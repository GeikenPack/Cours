
/**
 * Décrivez votre classe FileNaiveOperations ici.
 *
 * @author (votre nom)
 * @version (un numéro de version ou une date)
 */
public class FileNaiveOperations
{
    /**
     * Créer une file naive de taille pfNbElt
     * 
     * @param pfNbElt IN : nombre d'éléments max de la file
     * @return FileNaive : File créer
     */
    public static FileNaive creerFile(int pfNbElt)
    {
        return new FileNaive(pfNbElt);
    }
    
    /**
     * Retourne true si la file est pleine et false si elle ne l'est pas
     * @param pfFile IN : File à verifier
     * @return boolean : Etat de la file
     */
    public static boolean estPleine(FileNaive pfFile)
    {
        return (pfFile.tabElements.length == pfFile.indice_enf);
    }
    
    /**
     * Retourne true si la file est vide et false si elle ne l'est pas
     * 
     * @param pfFile IN : File a verifier
     * @return boolean : Etat de la file
     */
    public static boolean estVide(FileNaive pfFile)
    {
        return (pfFile.indice_enf == 0);
    }
    
    /**
     * Enfile un élément pfElt dans une FileNaive pfFile
     * 
     * @param pfElt IN : Element a enfiler
     * @param pfFile IN/OUT : File a modifier
     * @throw Exception si pfFile est pleine
     */
    public static void enfiler(FileNaive pfFile, String pfElt) throws Exception
    {
        if (estPleine(pfFile))
        {
            throw new Exception("La file est pleine");
        }
        pfFile.tabElements[pfFile.indice_enf] = pfElt;
        pfFile.indice_enf++;
    }
    
    /**
     * Defile un élément de la FileNaive pfFile
     * 
     * @param pfFile : IN/OUT : File a modifier
     * @throw Exception si pfFile est vide
     */
    public static void defiler(FileNaive pfFile) throws Exception
    {
        if (estVide(pfFile))
        {
            throw new Exception("La file est vide");
        }
        pfFile.indice_def++;
    }
    
    /**
     * Renvoie le prochain élément de la FileNaive pfFile
     * 
     * @param pfFile IN : File a utiliser
     * @return String : Element de la file
     * @trow Exception si pfFile est vide
     */
    public static String prochainElement(FileNaive pfFile) throws Exception
    {
        if (estVide(pfFile))
        {
            throw new Exception("La file est vide");
        }
        return pfFile.tabElements[pfFile.indice_def];
    }
    
    public static void main()
    {
        FileNaive f = creerFile(3);
        try
        {
            enfiler(f,"A");
            enfiler(f,"B");
            enfiler(f,"C");
            defiler(f);
            defiler(f);
            defiler(f);
        }
        catch (Exception e){System.out.println("[CRASH : " + e + "]");};
    }
}
