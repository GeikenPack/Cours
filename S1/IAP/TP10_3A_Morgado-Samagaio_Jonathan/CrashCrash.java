
/**
 * Décrivez votre classe CrashCrash ici.
 *
 * @author (votre nom)
 * @version (un numéro de version ou une date)
 */
public class CrashCrash
{
    public static void main() {
        ///////////////////////////
        try {
            int[] chiffres = {} ;   // un tableau vide
            System.out.print(chiffres[0]); // OUPS
        }
        catch (Exception e){ System.out.println("[CRASH BORNE "+e+"] "); }  // 1
        ///////////////////////////
        try {
            System.out.print(1/0); // OUPS
        }
        catch (Exception e){ System.out.println("[CRASH DIV "+e+"] "); }  // // 1
        ///////////////////////////
        try {
            Class.forName("UnProgrammeQuiNExistePas"); // OUPS
        }
        catch (Exception e){ System.out.println("[CRASH Exception "+e+"] "); }  // 1
        ///////////////////////////
        try {
            Integer[] tropGrandTableau=new Integer[1000000000]; // OUPS
        }
        catch (Error e){
            System.out.println("[CRASH Error "+e+"] ");
        } // 2
        ///////////////////////////
        System.out.println();
        System.out.println("Vous pariez sur quelle exception ou erreur ? ...");
        try {
            double hasard = Math.random();
            if (hasard > 0.75) {
                System.out.print(1/0);
            } else if (hasard > 0.5) {
                int[] chiffres = {} ;   // un tableau vide
                System.out.print(chiffres[0]);
            } else if (hasard > 0.25){
                Integer[] tropGrandTableau=new Integer[1000000000];
            } else if (hasard > 0.0){
                Class.forName("UnProgrammeQuiNExistePas");
            }
        } // une erreur ou une exception sera levée à l'exécution
        catch (ArrayIndexOutOfBoundsException e){
            System.out.println("[CRASH BORNE "+e+"] ");
        } // 1 2
        catch (ArithmeticException e){
            System.out.println("[CRASH DIV "+e+"] ");
        } // 3 2
        catch (Exception e){ // 4
            System.out.println("[CRASH Exception "+e+"] ");
        }
        catch (Error e){ System.out.println("[CRASH Error "+e+"] "); } // 5 6
        System.out.println("Qu'il serait bon d'arriver ici ...");
    }
}
