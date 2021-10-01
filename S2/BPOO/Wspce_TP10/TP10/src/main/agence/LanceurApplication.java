package main.agence;

import tps.banque.AgenceBancaire;

public class LanceurApplication {
	
	public static void main (String[] argv) {
		
		AgenceBancaire uneAg = new AgenceBancaire("Caisse Ep", "Pibrac");
		
		ClasseApplicationAgenceBancaire caab = new ClasseApplicationAgenceBancaire(uneAg);
		
		caab.runApplication();
	}
	
}
