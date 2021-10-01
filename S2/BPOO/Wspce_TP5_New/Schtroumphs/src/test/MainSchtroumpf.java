package test;

import lesschtroumpfs.Schtroumpf;

public class MainSchtroumpf {

	public static void main (String[] argv) {
		Schtroumpf gro;
		gro = new Schtroumpf("grognon", 135);
		
		gro.sePresenter();
		gro.chanter();
		
		gro.allerTravailler();
		
		gro.sePresenter();
		gro.chanter();
		
		gro.manger(10);
		
		gro.sePresenter();
		gro.chanter();
		
		gro.anniversaire();
		
		gro.sePresenter();
		gro.chanter();
	}

}
