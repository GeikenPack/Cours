import java.util.Calendar;
/**
 * Décrivez votre classe ProgrammeMystere ici.
 *
 * @author (votre nom)
 * @version (un numéro de version ou une date)
 */
public class ProgrammeMystere
{
    public static void main(String arguments[]) {
        // création d'un nouvel enregistrement
        Mystere var;   /* 1 */
        var = new Mystere();  /* 2 */
        var.chaine = "des machines";
        var.entier = -16;
        // affichage du contenu de ses champs
        System.out.println("var.chaine = "+var.chaine);
        System.out.println("var.entier = "+var.entier);
        /*
        Personne per = new Personne();
        per.prenom = "Thelma";
        per.anneeDeNaissance = 1995;
        int anneeAct = Calendar.getInstance().get(Calendar.YEAR);
        per.age = anneeAct - per.anneeDeNaissance;
        */
        // création d'un nouvel enregistrement
        Mystere var1;
        var1 = new Mystere(); //   nouvelle variable var1 prendra ici la valeur nommée this dans le constructeur

        // affiche la valeur des champs de var1
        System.out.println("Chaine : " + var1.chaine + " entier : " + var1.entier);

        // création d'un nouvel enregistrement
        Mystere var2;
        var2 = new Mystere("Claire");

        // affiche la valeur des champs de var2
        // à vous
        System.out.println("Chaine : " + var2.chaine + " entier : " + var2.entier);
        // création d'un nouvel enregistrement
        Mystere var3;
        var3 = new Mystere(2);

        // affiche la valeur des champs de var3
        // à vous
        System.out.println("Chaine : " + var3.chaine + " entier : " + var3.entier);
        // création d'un nouvel enregistrement
        Mystere var4 ;
        var4 = new Mystere("Laure",36);

        // affiche la valeur des champs de var4
        // à vous
        System.out.println("Chaine : " + var4.chaine + " entier : " + var4.entier);
        
        Personne per2 = new Personne("Eric", 1980);
    }
}
