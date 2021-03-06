package gestclub.ihm;

import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.awt.GridLayout;
import javax.swing.BorderFactory;
import javax.swing.ButtonGroup;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.border.BevelBorder;
import gestclub.donnees.Membre;
import gestclub.donnees.Sports;

public class FrameSaisieMembre extends JFrame
{
	
	//Déclaration des variables
	JPanel grandCentre, grandEst, grandSud;
	JPanel petitNord, petitCentre, petitSud;
	JButton butOk, butAnnul;
	JLabel labNom, labPrenom, labAdresse, labSexe;
	JTextField textNom, textPrenom;
	JTextArea areaAdresse;
	JRadioButton radH, radF;
	ButtonGroup radGr;
	
	public FrameSaisieMembre()
	{
		//Construction de la fenetre
		super("Saisie membres");
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		JPanel contentPane = new JPanel();
		contentPane.setLayout(new BorderLayout());;
		this.setContentPane(contentPane);
		
		
		
		//Initialisation des variables
		grandCentre = new JPanel();
		grandCentre.setLayout(new BorderLayout());
		grandCentre.setBorder(BorderFactory.createBevelBorder(BevelBorder.LOWERED));
		petitNord = new JPanel();
		petitNord.setLayout(new GridLayout(5, 1));
		petitSud = new JPanel();
		petitSud.setLayout(new FlowLayout());
		petitCentre = new JPanel();
		petitCentre.setLayout(new BorderLayout());
		
		grandEst = new JPanel();
		grandEst.setLayout(new GridLayout(Sports.NOMBRE, 1));
		grandEst.setBorder(BorderFactory.createLineBorder(getForeground()));
		
		grandSud = new JPanel();
		grandSud.setLayout(new FlowLayout());
		
		butOk = new JButton("OK");
		butAnnul = new JButton("Annuler");
		butOk.setSize(butAnnul.getPreferredSize());
		
		labNom = new JLabel("Nom");
		labPrenom = new JLabel("Prenom");
		labAdresse = new JLabel("Adresse");
		labSexe = new JLabel("Sexe :");
		
		textNom = new JTextField();
		textPrenom = new JTextField();
		
		areaAdresse = new JTextArea();
		
		radH = new JRadioButton("Homme");
		radF = new JRadioButton("Femme");
		radGr = new ButtonGroup();
		radGr.add(radH);
		radGr.add(radF);
		
		//Ajout des éléments aux pannels
		grandSud.add(butOk);
		grandSud.add(butAnnul);
		
		petitNord.add(labNom);
		petitNord.add(textNom);
		petitNord.add(labPrenom);
		petitNord.add(textPrenom);
		petitNord.add(labAdresse);
		
		petitCentre.add(areaAdresse);
		
		petitSud.add(labSexe);
		petitSud.add(radH);
		petitSud.add(radF);
		
		for (int i = 0; i < Sports.NOMBRE; i++)
		{
			grandEst.add(new JCheckBox(Sports.values()[i].toString()));
		}
		
		//Ajout des pannels intermediaire
		grandCentre.add(petitNord, BorderLayout.NORTH);
		grandCentre.add(petitCentre, BorderLayout.CENTER);
		grandCentre.add(petitSud, BorderLayout.SOUTH);
		
		//Ajout des panels a la fenetre
		this.add(grandSud, BorderLayout.SOUTH);
		this.add(grandEst, BorderLayout.EAST);
		this.add(grandCentre, BorderLayout.CENTER);
		petitNord.se
		this.pack();
	}
	
	FrameSaisieMembre(Membre membre)
	{
		this();
		setMembre(membre);
	}
	
	public void setMembre(Membre membre)
	{
		textNom.setText(membre.nom);
		textPrenom.setText(membre.prenom);
		areaAdresse.setText(membre.adresse);
		if (membre.sexeMasculin)
			radH.setSelected(true);
		else
			radF.setSelected(true);
	}
}
