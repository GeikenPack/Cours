
/**
 * Décrivez votre classe CrashSousAlgo ici.
 *
 * @author (votre nom)
 * @version (un numéro de version ou une date)
 */
public class CrashSousAlgo
{
    // Une fonction qui à l'occasion peut émettre une exception
    public static int maFonction1() throws Exception {  // 1
        if (Math.random() > 0.5) {
            throw new Exception("maFonction1 a eu une defaillance (desole)"); // 2
        }
        return 99; // 3
    } // fin maFonction
    // Une fonction qui lève une exception ou une erreur
    public static void maFonction3() throws ArrayIndexOutOfBoundsException, Error {  // 1
        if (Math.random() > 0.5) {
            throw new ArrayIndexOutOfBoundsException("maFonction3 divise par 0 (desole)");
        } else {
            throw new Error("maFonction3 a rencontre une erreur (desole)");
        }  // 2
    } // fin maFonction3 3
    public static void main() {
        try {
            int resultat = maFonction1() ;
        }
        catch (Exception e){ System.out.println("[CRASH "+e+"] "); } // 4
        finally {
            System.out.println("On passera quoi qu'il arrive ici ...");
        }

        System.out.println("Qu'il serait bon d'arriver ici ...");
        try {
            maFonction3() ;
        }
        catch (Exception e){ System.out.println("[CRASH "+e+"] "); }
        catch (Error e){ System.out.println("[CRASH "+e+"] "); }
        try {
            int resultat = maFonction1() ;
        }
        catch (Exception e){ e.printStackTrace(); System.exit(111); }
        finally {
            System.out.println("Passera-t-on quoi qu'il arrive ici ...");
        }
    } // fin main

}
