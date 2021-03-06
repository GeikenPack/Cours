package gestclub.ihm;
import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.HashSet;
import java.util.Set;

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

@SuppressWarnings("serial")
public class FrameSaisieMembre extends JFrame implements ActionListener
{
	
	private JRadioButton radioHomme         = new JRadioButton("Homme");
	private JRadioButton radioFemme         = new JRadioButton("Femme");
	private JTextField   txtNom             = new JTextField(10);
	private JTextField   txtPrenom          = new JTextField(10);
	private JTextArea    txtAdresse         = new JTextArea(5, 10);
	private JCheckBox[]  casesACocherSports = new JCheckBox[Sports.NOMBRE];
	private JButton      butOK              = new JButton("OK");
	private JButton      butAnnuler         = new JButton("Annuler");

    public FrameSaisieMembre(Membre membre) 
    {
    	this();
    	this.setMembre( membre );
    }
    
    public FrameSaisieMembre() 
    {
        super("Saisie membre");
        
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        JPanel contentPane = new JPanel();
        
        JPanel grandCentre = new JPanel();
        JPanel grandEst    = new JPanel();
        JPanel grandSud    = new JPanel();
        
        contentPane.setLayout(new BorderLayout());
        contentPane.add(grandCentre, BorderLayout.CENTER);
        contentPane.add(grandEst,    BorderLayout.EAST);
        contentPane.add(grandSud,    BorderLayout.SOUTH);

        this.setContentPane(contentPane);

        JPanel petitNord   = new JPanel();
        JPanel petitCentre = new JPanel();
        JPanel petitSud    = new JPanel();
        
        grandCentre.setLayout(new BorderLayout());
        grandCentre.add(petitNord,   BorderLayout.NORTH);
        grandCentre.add(petitCentre, BorderLayout.CENTER);
        grandCentre.add(petitSud,    BorderLayout.SOUTH);
        
        grandEst.setLayout(   new GridLayout(9,1));
        grandSud.setLayout(   new FlowLayout());
        petitNord.setLayout(  new GridLayout(4,1));
        petitCentre.setLayout(new BorderLayout());
        petitSud.setLayout(   new FlowLayout());

        contentPane.setBorder( BorderFactory.createEmptyBorder(5, 5, 5, 5) );
        grandCentre.setBorder(
        		BorderFactory.createCompoundBorder(
        				BorderFactory.createBevelBorder( BevelBorder.LOWERED  ),
        				BorderFactory.createEmptyBorder(5, 5, 5, 5) )
        		 );
        grandEst.setBorder(    BorderFactory.createTitledBorder("Sports") );

        txtAdresse.setBorder( txtNom.getBorder() );

        
        petitNord.add(new JLabel("Nom"));
        petitNord.add(txtNom);
        petitNord.add(new JLabel("Pr???nom"));
        petitNord.add(txtPrenom);
        
        petitCentre.add(new JLabel("Adresse"),BorderLayout.NORTH);
        petitCentre.add(txtAdresse,BorderLayout.CENTER);
        
        petitSud.add(new JLabel("Sexe"));
        petitSud.add(radioHomme);
        petitSud.add(radioFemme);

        ButtonGroup grp = new ButtonGroup();
        grp.add(radioHomme);
        grp.add(radioFemme);
        
    	for (int i = 0; i < Sports.NOMBRE; i++) {
    	    casesACocherSports[i] = new JCheckBox(Sports.values()[i].toString());
    	    grandEst.add( casesACocherSports[i] );
    	}

        grandSud.add(butOK);
        grandSud.add(butAnnuler);
        butOK.setPreferredSize( butAnnuler.getPreferredSize() );
        
		butOK.addActionListener(this);
		butAnnuler.addActionListener(this);
        
        
        this.pack();
    }
    
    public void setMembre( Membre membre ) 
    {
    	txtNom.setText(membre.nom);
    	txtPrenom.setText(membre.prenom);
    	txtAdresse.setText(membre.adresse);
    	radioHomme.setSelected(membre.sexeMasculin);
    	radioFemme.setSelected( ! membre.sexeMasculin);
    	for (int i = 0; i < Sports.NOMBRE; i++) {
    		if ( membre.sportsChoisis.contains( Sports.values()[i] ) ) {
        		this.casesACocherSports[i].setSelected( true );
    		} else {
        		this.casesACocherSports[i].setSelected( false );
    		}
    	}
    }
    
    @Override
	public void actionPerformed(ActionEvent e) 
    {
    	if (e.getSource() == this.butOK)
    		gestionOK();
    	else if (e.getSource() == this.butAnnuler)
    		gestionAnnuler();
	}
    
    private void gestionAnnuler()
    {
    	//Ferme la fenetre
    	this.dispose();
    }
    
    private void gestionOK()
    {
    	if (isSaisieCorrecte())
    	{
    		//Chercher sports choisis
    		Set<Sports> sportsC = new HashSet<Sports>();
    		for (int i = 0; i < casesACocherSports.length; i++)
    			if (casesACocherSports[i].isSelected())
    				sportsC.add(Sports.valueOf(casesACocherSports[i].getText()));
    		
    		//Chercher sexe
    		boolean isHomme;
    		if (radioHomme.isSelected())
    			isHomme = true;
    		else
    			isHomme = false;
    		
    		//Cr??ation du membre et affichage
    		Membre mb = new Membre(txtNom.getText(), txtPrenom.getText(), txtAdresse.getText(), isHomme,  sportsC);
    		System.out.println(mb.toString());
    	}
    }
    
    private boolean isSaisieCorrecte()
    {
    	String nom = txtNom.getText();
    	String prenom = txtPrenom.getText();
    	String adresse = txtAdresse.getText();
    	boolean correct = true;
    	//V??rifie la validit?? des diff??rents champs
    	//Texte pr??sent
    	if (nom.isEmpty())
    	{
    		System.out.println("Champs Nom vide"); 
    		correct = false;
    	}
    	if (prenom.isEmpty())
    	{
    		System.out.println("Champs Prenom vide"); 
    		correct = false;
    	}
    	if (adresse.isEmpty())
    	{
    		System.out.println("Champs Adresse vide"); 
    		correct = false;
    	}
    	
    	//Sexe choisis
    	if (!radioHomme.isSelected() && !radioFemme.isSelected())
    	{
    		System.out.println("Aucun sexe choisis"); 
    		correct = false;
    	}
    	
    	//Validit?? du nom
    	if (nom.length() <= 2 || nom.endsWith(" ") || nom.startsWith(" "))
    	{
    		System.out.println("Nom invalide. Le nom doit posseder plus de deux lettres et ne doit pas commencer ou finir par un espace"); 
    		correct = false;
    	}
    	
    	//Validit?? du pr??nom
    	if (prenom.length() <= 2 || prenom.endsWith(" ") || prenom.startsWith(" "))
    	{
    		System.out.println("Pr??nom invalide. Le pr??nom doit posseder plus de deux lettres et ne doit pas commencer ou finir par un espace"); 
    		correct = false;
    	}
    	return correct;
    }
    
} 