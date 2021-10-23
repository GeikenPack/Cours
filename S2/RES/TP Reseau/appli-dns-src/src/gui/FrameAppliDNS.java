package gui;

import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.awt.GridLayout;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.IOException;
import java.net.InetAddress;

import javax.swing.BorderFactory;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;

import protocol.DNSQuery;


/**
 * Fenetre principale de l'application cliente DNS.
 */
@SuppressWarnings("serial")
public class FrameAppliDNS extends JFrame {
	
	private JTextField champIP = new JTextField("8.8.8.8", 12);

	private JTextField champNom = new JTextField("", 30);
	private JButton boutonResoudre = new JButton("Résoudre");

	private JTextArea zoneResultats = new JTextArea(15, 50);


	public FrameAppliDNS() {
		super("Client DNS de Jonathan Morgado-Samagaio (3A)");
		this.setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);
		this.addWindowListener(new WindowAdapter() {
		    public void windowClosing(WindowEvent event) {
		    	FrameAppliDNS.this.dispose();
		        System.exit(0);
		    }
			public void windowOpened(WindowEvent event) {
				champNom.requestFocusInWindow();
			}
		});

		boutonResoudre.addActionListener(e -> actionResoudre());

		JPanel contentPane = new JPanel();
		JPanel haut = new JPanel();
		JPanel hautMilieu = new JPanel();
		JPanel hautHaut = new JPanel();
		JScrollPane milieu = new JScrollPane(zoneResultats);

		this.setContentPane(contentPane);
		contentPane.setLayout(new BorderLayout());
		contentPane.add(haut, BorderLayout.NORTH);
		contentPane.add(milieu, BorderLayout.CENTER);
		contentPane.setBorder(BorderFactory.createEmptyBorder(5, 5, 5, 5));

		haut.setLayout(new GridLayout(2, 1));
		haut.add(hautHaut);
		haut.add(hautMilieu);

		hautHaut.setLayout(new FlowLayout());
		hautHaut.add(new JLabel("Adresse IP"));
		hautHaut.add(champIP);
		hautHaut.setBorder(BorderFactory.createTitledBorder("Serveur DNS"));

		hautMilieu.setLayout(new FlowLayout());
		hautMilieu.add(new JLabel("Nom"));
		hautMilieu.add(champNom);
		hautMilieu.add(boutonResoudre);
		hautMilieu.setBorder(BorderFactory.createTitledBorder("Requête"));
		
		zoneResultats.setEditable(false);
		zoneResultats.setBackground(contentPane.getBackground());
		milieu.setBorder(BorderFactory.createTitledBorder("Résultats"));

		this.getRootPane().setDefaultButton(boutonResoudre);

		this.pack();
	}


	private void actionResoudre() 
	{
		if (verifChamps())
		{
			zoneResultats.append("Résolution de nom " + champNom.getText().trim() + " auprès du serveur DNS " + champIP.getText().trim() + "\n");
			DNSQuery quer = new DNSQuery(champNom.getText().trim());
			try {
				InetAddress ip = quer.resolveA(InetAddress.getByName(champIP.getText().trim())).ipResp();
				zoneResultats.append(ip.toString() + "\n");
			} catch (IOException e) {e.printStackTrace();};
		}
	}


	private boolean verifChamps() 
	{
		return !champNom.getText().isEmpty();
	}
}