package main;

public class Class_B extends Class_A {
    public void afficher () {
            super.afficher();
            System.out.println("Afficher : Class B");
            System.out.print("     ");
            super.afficher_AUTRE();  // ICI
    }
    
    public void afficher_AUTRE()
    {
    	System.out.println("Afficher_AUTRE : Class B");
    }
}
