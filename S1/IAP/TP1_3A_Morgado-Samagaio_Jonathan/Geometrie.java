
/**
 * Indiquer le ou les numeros de TP et d'exercice.
 *
 * @author (votre nom)
 */
public class Geometrie
{
    /**
     * @param diametre
     *      Le diametre du disque (nombre positif).
     * @return la surface du disque
     */
    public static double surfaceDisque(double diametre)
    {
        //Initialisation des variables
        double pi, rayon, surface;
        //Estimation de pi
        pi = 3.1416;
        //Calcul du rayon avec le diametre
        rayon = diametre/2;
        //Calcul de la surface du disque
        surface = pi*rayon*rayon;
        return surface;
    }
    /**
     * @param longueur
     *      La longueur du rectangle (nombre positif).
     * @param largeur
     *      La largeur du rectangle (nombre positif, inférieur ou égal à la longueur).
     * @return la surface du rectangle
     */
    public static double surfaceRectangle(double longueur, double largeur)
    {
        //Calcul de la surface d'un rectangle
        double surface = longueur * largeur;
        return surface;
    }
    /**
     * @param cote
     *      La longueur d'un cote du carré (nombre positif).
     * @return la surface du carré
     */
    public static double surfaceCarre(double cote)
    {
        double surface;
        surface = surfaceRectangle(cote, cote);
        return surface;
    }
    /**
     * Surface du gazon, en m2. Toutes les données sont en m.
     * Terrain, maison, appenti et piscine s'organisent comme vu en TD.
     */
    public static double surfaceGazon(double longueurTerrain, double largeurTerrain, double diametrePiscine, double longueurMaison, double largeurMaison, double longueurAppenti)
    {
        //Initialisation des variables
        double surfaceGazon;
        double surfaceMaison, surfaceAppenti, surfacePiscine, surfaceBattis, surfaceTerrain;
        //Calcul des surfaces battis
        surfaceMaison = surfaceRectangle(longueurMaison, largeurMaison);
        surfaceAppenti = largeurMaison * longueurAppenti / 2;
        surfacePiscine = surfaceDisque(diametrePiscine);
        surfaceBattis = surfaceMaison + surfacePiscine + surfaceAppenti;
        //Calcul de la surface du terrain
        surfaceTerrain = surfaceRectangle(longueurTerrain, largeurTerrain);
        //Calcul de la surface a tondre
        surfaceGazon = surfaceTerrain - surfaceBattis;
        return surfaceGazon;
    }
    /**
     * Affiche les informations sur la tonte du gazon. Toutes les données sont en m.
     */
    public static void informationTonte(double longueurTerrain, double largeurTerrain, double diametrePiscine, double longueurMaison, double largeurMaison, double longueurAppenti)
    {
        //Declaraton des variables
        double vitesse, dureeTonte, surfaceTonte;
        //String dureeTonteString;
        //double heure, minutes;
        vitesse = 100;
        surfaceTonte = surfaceGazon(longueurTerrain, largeurTerrain, diametrePiscine, longueurMaison, largeurMaison, longueurAppenti);
        //Calcul de la durée
        dureeTonte = surfaceTonte / vitesse;
        //Affichage
        //dureeTonteString = Double.toString(dureeTonte);
        //heure = Double.parseDouble(dureeTonteString.substring(0,1));
        //minutes = transformerHeureMinutes(dureeTonte);
        System.out.println("Il faut "+ dureeTonte + "h pour tondre "+ surfaceTonte+ "m2 de terrain");
    }
    /**
     *@param grandAxe
     *      Taille du grand axe
     *@param petitAxe
     *      Taille du petit axe
     * @return
     *      surface du disque
     */
    public static double surfaceOval(double grandAxe, double petitAxe)
    {
        //Initialisation des variables
        double pi, demiGrandAxe, demiPetitAxe, surfaceOval;
        pi = 3.1416;
        demiGrandAxe = grandAxe/2;
        demiPetitAxe = petitAxe/2;
        //Calcul de la surface
        surfaceOval = pi * demiGrandAxe * demiPetitAxe;
        return surfaceOval;
    }
    /**
     * @param temps
     *      temps donnée en heure
     * @return
     *      temps en minute
     */
    public static double transformerHeureMinutes(double temps)
    {
        //Initialisation des variables
        String tempsMinutes, tempsString;
        double tempsMinutesDouble, minutes;
        //Calcul du temps en minutes
        tempsString = Double.toString(temps);
        tempsMinutes = tempsString.substring(2, tempsString.length()); 
        tempsMinutesDouble = Double.parseDouble(tempsMinutes);
        minutes = tempsMinutesDouble * 60 / 100;
        return minutes;
    }
}

