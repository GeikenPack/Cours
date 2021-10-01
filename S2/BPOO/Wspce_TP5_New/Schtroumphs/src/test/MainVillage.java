package test;

import lesschtroumpfs.Village;

public class MainVillage {

	public static void main (String[] argv) {
		String[] nomsSchtroumpfs = {
		        "Grand Schtroumpf", "Schtroumpf courant (et pas ordinaire)", "Schtroumpf ordinaire (et pas courant)", "Schtroumpf moralisateur à lunettes",
		        "Schtroumpf boudeur", "Schtroumpf volant", "Schtroumpf étonné", "Schtroumpf acrobate", "Schtroumpf paresseux"
		};
		
		Village vil;
		vil = new Village("test", 100, nomsSchtroumpfs);
		vil.solstice_d_ete();
		
		vil.chefDuVillage().sePresenter();
		vil.envoyerAuTravail();
		vil.schtroumpfsHeureux();
		
		vil.envoyerCueillirSalsepareille();
		vil.dinerTousEnsemble();
		vil.solstice_d_ete();
	}

}
