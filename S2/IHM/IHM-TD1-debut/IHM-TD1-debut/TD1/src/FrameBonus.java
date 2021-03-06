
import java.awt.GridLayout;

import javax.swing.*;

public class FrameBonus extends JFrame
{
	public FrameBonus()
	{
		//Paramétrage de la fenetre
		super("Fiche de contact");
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		this.setSize(this.getPreferredSize());
		this.setLayout(new GridLayout(5,2));
		
		//Déclarations des composants
		JLabel labTitre, labNom, labPrenom, labAdresse, labNotes;
		JTextField textNom, textPrenom, textAdresse1, textAdresse2, textAdresse3;
		JComboBox liTitre;
		JPanel panTitre, panNom, panPrenom, panAdresse, panTextAdresse,  panNotes;
		
		//Initialisations des labels
		labTitre = new JLabel("Titre :");
		labNom = new JLabel("Nom :");
		labPrenom = new JLabel("Prenom :");
		labAdresse = new JLabel("Adresse :");
		labNotes = new JLabel("Notes :");
		panTitre = new JPanel();
		panNom = new JPanel();
		panPrenom = new JPanel();
		panAdresse = new JPanel();
		panTextAdresse = new JPanel();
		panNotes = new JPanel();
		
		//Initialisation des zones de texte
		textNom = new JTextField(20);
		textPrenom = new JTextField(20);
		textAdresse1 = new JTextField(20);
		textAdresse2 = new JTextField(20);
		textAdresse3 = new JTextField(20);
		
		//Initialisation de la ComboBox
		String[] data = {"Mr", "Mme"};
		liTitre = new JComboBox<>(data);
		
		//Ajout des éléments aux panels
		panTitre.add(labTitre);
		panTitre.add(liTitre);
		
		panNom.add(labNom);
		panNom.add(textNom);
		
		panPrenom.add(labPrenom);
		panPrenom.add(textPrenom);
		
		panAdresse.add(labAdresse);
		panTextAdresse.add(textAdresse1);
		panTextAdresse.add(textAdresse2);
		panTextAdresse.add(textAdresse3);
		panTextAdresse.setLayout(new GridLayout(3,1));
		panAdresse.add(panTextAdresse);
		
		panNotes.add(labNotes);
		
		//Ajout des panels a la fenetre
		this.add(panTitre);
		this.add(panNom);
		this.add(panPrenom);
		this.add(panAdresse);
		this.add(panNotes);
	}
}
