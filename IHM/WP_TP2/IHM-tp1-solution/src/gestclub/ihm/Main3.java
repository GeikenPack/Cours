package gestclub.ihm;

import java.util.ArrayList;

import gestclub.donnees.Membre;

public class Main3 
{
	public static void main(String[] args) 
	{
		ArrayList<Membre> al;
		al = new ArrayList<Membre>();
		Membre mb1 = new Membre("nomTest1", "prenomTest1", "AdresseTest1", true);
		Membre mb2 = new Membre("nomTest2", "prenomTest2", "AdresseTest2", true);
		Membre mb3 = new Membre("nomTest3", "prenomTest3", "AdresseTest3", true);
		al.add(mb1);
		al.add(mb2);
		al.add(mb3);
		FrameListeMembres frame = new FrameListeMembres(al);
		
		
		
		//frame.setListeMembre(al);
		
		frame.setVisible(true);
		
	}

}
