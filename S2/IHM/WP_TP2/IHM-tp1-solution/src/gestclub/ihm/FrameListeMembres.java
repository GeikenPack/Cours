package gestclub.ihm;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;

import javax.swing.DefaultListModel;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JList;
import javax.swing.JPanel;
import javax.swing.ListSelectionModel;

import gestclub.donnees.Membre;

@SuppressWarnings("serial")
public class FrameListeMembres extends JFrame implements ActionListener
{
	private DefaultListModel<Membre> listModelMembre = new DefaultListModel<Membre>();
	private JList<Membre> listeMembre         = new JList<Membre>(listModelMembre);
	//private JScrollPane scroll                = new JScrollPane(listeMembre);
	private JButton butModifier               = new JButton();
	private JButton butAjouter                = new JButton();
	
	static final String ACTION_MODIFIER = "Modifier";
	static final String ACTION_AJOUTER = "Ajouter";
	
	ArrayList<Membre> alListeMembre;
	
	public FrameListeMembres()
	{
		//Construction de la fenetre
		super("Liste de membres");
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		butModifier.setText(ACTION_MODIFIER);
		butAjouter.setText(ACTION_AJOUTER);
		
		JPanel grandSud = new JPanel();
		grandSud.setLayout(new FlowLayout());
		grandSud.add(butModifier);
		grandSud.add(butAjouter);
		
		this.listeMembre.setBackground(Color.CYAN);
		//this.scroll.add(listeMembre);
		
		this.listeMembre.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		
		this.add(listeMembre, BorderLayout.CENTER);
		this.add(grandSud,    BorderLayout.SOUTH);
		
		this.butModifier.addActionListener(this);
		this.butAjouter.addActionListener(this);
		
		this.pack();
	}
	
	public FrameListeMembres(ArrayList<Membre> listeMembres)
	{
		this();
		this.alListeMembre = new ArrayList<Membre>(listeMembres);
		for (Membre el : alListeMembre)
			listModelMembre.addElement(el);
	}
	
	public void setListeMembre(ArrayList<Membre> listeMembres)
	{
		this.alListeMembre = new ArrayList<Membre>(listeMembres);
		for (Membre el : alListeMembre)
			if (!this.listModelMembre.contains(el))
				this.listModelMembre.addElement(el);
	}

	@Override
	public void actionPerformed(ActionEvent e) 
	{
		if (e.getSource() == this .butModifier)
			gestionModifier();
		else if (e.getSource() == this.butAjouter)
			gestionAjouter();
	}
	
	private void gestionModifier()
	{
		if (listeMembre.isSelectionEmpty())
			System.out.println("Vous devez selectionner un membre pour pouvoir le modifier");
		else
		{
			Membre mb = listeMembre.getSelectedValue();
			String chaine = "OK : Nous allons modifier ";
			if (mb.sexeMasculin)
				chaine += "MONSIEUR ";
			else
				chaine += "MADAME ";
			chaine += mb.prenom + " " + mb.nom;
			System.out.println(chaine);
		}
	}
	
	private void gestionAjouter()
	{
		this.alListeMembre.add(new Membre("Nouveau", "Mambre", "", true));
		setListeMembre(this.alListeMembre);
	}
}
