package gestclub.ihm;

import gestclub.donnees.Membre;
import gestclub.donnees.Sports;

public class Main {

	public static void main(String[] args) {
		System.out.println("Mon programme fonctionne !");
		System.out.println("J'utilise le JDK : "+System.getProperty("java.version"));

		FrameSaisieMembre frame = new FrameSaisieMembre(new Membre("Test", "testi", "123456", true));
		frame.setSize(frame.getPreferredSize());
		frame.setVisible(true);
		System.out.println(Sports.values()[0].toString());
	}

}
