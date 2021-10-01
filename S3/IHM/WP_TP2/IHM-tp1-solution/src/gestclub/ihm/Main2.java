package gestclub.ihm;

import java.util.HashSet;
import java.util.Set;

import gestclub.donnees.Membre;
import gestclub.donnees.Sports;

public class Main2 {

	public static void main(String[] args) {
		
		Set<Sports> sportsMembre = new HashSet<Sports>();
		sportsMembre.add(Sports.Natation);
		sportsMembre.add(Sports.Randonnee);
		sportsMembre.add(Sports.Petanque);

		Membre membre = new Membre("Pelleau", "Fabrice", "26 route du chemin\n31000 Toulouse", true, sportsMembre);
		
		FrameSaisieMembre fenetre = new FrameSaisieMembre(membre);
		
		fenetre.setVisible( true );
	}

}
